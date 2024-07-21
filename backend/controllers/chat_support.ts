import { Server } from "socket.io";
import { DefaultEventsMap } from "socket.io/dist/typed-events";
import { chatModel } from "../models/chat";
import { messageModel } from "../models/message";
import { HttpError, sendPushNotification, userModel } from "../internal";

export const chatSupport = (io: Server<DefaultEventsMap, DefaultEventsMap, DefaultEventsMap, any>) => {
    
    io.on('connection' , (socket) => {

        socket.on('error', (error) => {
            console.error('Socket.io error:', error);
        });

        socket.on('adminJoinRoom', async (data) => {
            const user = await userModel.findOne({_id: data.userId, isAdmin: true});
            if(!user){
                throw HttpError.unAuthorized();
            }
            const chat = await chatModel.findOne({ _id: data.chatId, closed: false});
            if(!chat){
                throw HttpError.notFound('Chat');
            }
            if(chat){
                socket.join(chat._id.toString());
                console.log('Admin Joined room successfully!');
            }
        });

        socket.on('userJoinRoom', async (data) => {
            const user = await userModel.findOne({ _id: data.userId, isAdmin: false});
            if(!user){
                throw HttpError.notFound('User');
            }
            const chat = await chatModel.findOne({ _id: data.chatId, user: data.userId, closed: false});
            if(!chat){
                throw HttpError.notFound('Chat');
            }
            if(chat){
                socket.join(chat._id.toString());
                console.log('User Joined room successfully!');
            }
        });

        socket.on('sendUserMessage', async (data) => {
            const chat = await chatModel.findOne({ _id: data.chatId, user: data.userId, closed: false });
            if(chat){
                const message = await messageModel.create(data);
                io.to(data.chatId.toString()).emit("newUserMessage", message.toJSON());
                console.log('User Message sent successfully!');
            }
        });

        socket.on('sendAdminMessage',async (data) => {
            const user = await userModel.findOne({ _id: data.userId, isAdmin: true});
            if(!user){
                throw HttpError.notFound('User');
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
                console.log('Admin Message sent successfully!');
            }
        });
 
        socket.on("leaveRoomUser", async (data) => {
            const chat = await chatModel.findOne({ user: data.userId, closed: false });
            if (!chat) {
              throw HttpError.notFound('Chat not found!');
            }
            socket.leave(chat._id);
        });
      
        socket.on("leaveRoomAdmin", (data) => {
            socket.leave(data.chatId.toString());
        });
      
        socket.on("disconnect", (_) => {
            console.log("A user disconnected");
        });

    });
}