import mongoose, { Document, Schema } from "mongoose";

export interface IChat extends Document{
    user: mongoose.Schema.Types.ObjectId,
    closed: boolean,
    adminLatSeen: Date,
    userLastSeen: Date, 
}

const chatSchema = new Schema<IChat>({
    user: {
        type: mongoose.Schema.Types.ObjectId,
        cast: 'Invalid user type',
        ref: 'users'
    },
    closed: {
        type: Boolean,
        cast: 'Invalid closed type',
        default: false
    },
    userLastSeen: {
        type: Date,
        cast: 'Invalid userLastSeen Type',
    },
    adminLatSeen: {
        type: Date,
        cast: 'Invalid adminLastSeen Type',
    },
});


export const chatModel = mongoose.model<IChat>('chats', chatSchema);