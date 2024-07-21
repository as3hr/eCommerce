import mongoose, { Document, Schema } from "mongoose";

export interface IMessage extends Document{
    chatId: mongoose.Schema.Types.ObjectId,
    image: string,
    text: string,
    date: Date,
    isUser: boolean,
    read: boolean,
}

const messageSchema = new Schema<IMessage>({
    chatId: {
        type: mongoose.Schema.Types.ObjectId,
        cast: 'Invalid chatId type',
        ref: 'users'
    },
    image: {
        type: String,
        cast: 'Invalid image type',
    },
    text: {
        type: String,
        cast: 'Invalid text Type',
    },
    date: {
        type: Date,
        cast: 'Invalid date Type',
    },
    read: {
        type: Boolean,
        cast: 'Invalid read Type',
        default: false,
    },
    isUser: {
        type: Boolean,
        cast: 'Invalid isUser Type',
    }
});


export const messageModel = mongoose.model<IMessage>('messages', messageSchema);