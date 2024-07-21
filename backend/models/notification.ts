import mongoose, { Schema, Document } from "mongoose";

export interface INotification extends Document{
    title?: string;
    description?: string;
    date: Date;
}

const notificationSchema = new Schema<INotification>({
    title: {
        type: String,
        cast: "title type must be of string"
    },
    description: {
        type: String,
        cast: "description type must be of string"
    },
    date: {
        type: Date,
        cast: "Date type must be of Date"
    },
});

const notificationModel = mongoose.model<INotification>('notifications',notificationSchema);

export { notificationModel };