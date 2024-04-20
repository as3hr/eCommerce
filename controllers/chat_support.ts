import { Server, Socket } from "socket.io";
import { DefaultEventsMap } from "socket.io/dist/typed-events";
import { IChat, chatModel } from "../models/chat";
import { IMessage, messageModel } from "../models/message";
import { HttpError, sendPushNotification, userModel } from "../internal";
import { client } from "../config/db_config";
import mongoose from "mongoose";

export interface ISocket extends Socket {
    userId?: mongoose.Schema.Types.ObjectId;
}

export const chatSupport = (io: Server<DefaultEventsMap, DefaultEventsMap, DefaultEventsMap, any>) => {
    
    io.use(async (socket: ISocket, next) => {
        const value = await client.get('user-session');
        if(!value){
            throw HttpError.unAuthorized();
        }
        socket.userId = JSON.parse(value);
        next();
    });
  
    io.on('connection' , (socket: ISocket) => {
        console.log(`A user connected!`);

        socket.on('error', (error) => {
            console.error('Socket.io error:', error);
        });

        socket.on('adminJoinRoom', async (data) => {
            const chatJson: IChat = JSON.parse(data);
            const user = await userModel.findOne({_id: chatJson.user, isAdmin: true});
            if(!user){
                //cannot join room
                throw HttpError.unAuthorized();
            }
            const chat = await chatModel.findOne({ user: socket.userId, closed: false});
            if(!chat){
                // chat does not exist
                // throw error
            }
            if(chat){
                socket.join(chat._id.toString());
                console.log('Joined room successfully!');
            }
        });

        socket.on('userJoinRoom', async (data) => {
            const chatJson: IChat = JSON.parse(data);
            const user = await userModel.findOne({_id: chatJson.user, isAdmin: false});
            if(!user){
                //cannot join room
                // user does not exist
                console.log('user does not exist!');
            }
            const chat = await chatModel.findOne({ user: socket.userId, closed: false});
            if(!chat){
                // chat does not exist
                // throw error
                console.log('no chat found!')
            }
            if(chat){
                socket.join(chat._id.toString());
                console.log('Joined room successfully!');
            }
        });

        socket.on('sendUserMessage', async (data) => {
            const messageJson: IMessage = JSON.parse(data);
            const chat = await chatModel.findOne({ user: socket.userId, closed: false });
            if(chat){
                const message = await messageModel.create(messageJson);
                io.to(messageJson.chatId.toString()).emit("newUserMessage", message.toJSON());
                console.log('Message sent successfully!');
            }
        });

        socket.on('sendAdminMessage',async (data) => {
            const messageJson: IMessage = JSON.parse(data);
            const user = await userModel.findOne({_id: socket.userId, isAdmin: false});
            if(!user){
                //cannot join room
                throw HttpError.unAuthorized();
            }
            const chat = await chatModel.findOne({ _id: messageJson.chatId, closed: false });
            if(chat){
                const message = await messageModel.create(messageJson);
                io.to(messageJson.chatId.toString()).emit("newAdminMessage", message.toJSON());
                sendPushNotification(
                    `${user.firstName}`, 
                    `${message.text}`,  
                     chat.user,
                     null,
                );
                console.log('Message sent successfully!');
            }
        });
 
        socket.on("leaveRoomUser", async (_) => {
            const chat = await chatModel.findOne({ user: socket.userId, closed: false });
            if (!chat) {
              throw HttpError.notFound('Chat not found!');
            }
            socket.leave(chat._id);
          });
      
          socket.on("leaveRoomAdmin", (data) => {
            const messageJson: IMessage = JSON.parse(data);
            socket.leave(messageJson.chatId.toString());
          });
      
          socket.on("disconnect", (_) => {
            console.log("A user disconnected: ", socket.userId);
          });

    });
}