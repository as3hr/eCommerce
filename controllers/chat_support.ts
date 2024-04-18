import { Server, Socket } from "socket.io";
import { DefaultEventsMap } from "socket.io/dist/typed-events";
import { IChat, chatModel } from "../models/chat";
import { IMessage, messageModel } from "../models/message";
import { HttpError, sendPushNotification, userModel } from "../internal";
import mongoose from "mongoose";
import { Request } from "express";
export interface ISocket extends Socket {
    userId?: mongoose.Schema.Types.ObjectId;
}

export const chatSupport = (io: Server<DefaultEventsMap, DefaultEventsMap, DefaultEventsMap, any>) => {
    
    io.use((socket: ISocket, next) => {
        const req = socket.request as Request;
        if (!req.session.user) {
            return next(HttpError.invalidTokens());
        }
        const userId = req.session.user;
        socket.userId = userId;
        next();
    });
  
    io.on('connection' , (socket: ISocket) => {
        console.log(`A user connected!`);

        socket.on('error', (error) => {
            console.error('Socket.io error:', error);
        });

        socket.on('adminJoinRoom', async (data: IChat) => {
            const user = await userModel.findOne({_id: data.user, isAdmin: true});
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

        socket.on('userJoinRoom', async (data: IChat) => {
            const user = await userModel.findOne({_id: data.user, isAdmin: false});
            if(!user){
                //cannot join room
                // user does not exist
                console.log('user does not exist!');
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

        socket.on('sendUserMessage', async (data: IMessage) => {
            const chat = await chatModel.findOne({ user: socket.userId, closed: false });
            if(chat){
                const message = await messageModel.create(data);
                io.to(data.chatId.toString()).emit("newUserMessage", message.toJSON());
                console.log('Message sent successfully!');
            }
        });

        socket.on('sendAdminMessage',async (data: IMessage) => {
            const user = await userModel.findOne({_id: socket.userId, isAdmin: false});
            if(!user){
                //cannot join room
                throw HttpError.unAuthorized();
            }
            const chat = await chatModel.findOne({ _id: data.chatId, closed: false });
            if(chat){
                const message = await messageModel.create(data);
                io.to(data.chatId.toString()).emit("newAdminMessage", message.toJSON());
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
      
          socket.on("leaveRoomAdmin", (data: IMessage) => {
            socket.leave(data.chatId.toString());
          });
      
          socket.on("disconnect", () => {
            console.log("A user disconnected: ", socket.userId);
          });

    });
}