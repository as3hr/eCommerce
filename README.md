# E-commerce Project

This is a comprehensive full-stack e-commerce application that includes a mobile app, an admin panel, and a backend. Each module is in its respective directory within this repository. The project is designed to provide a seamless shopping experience for users and efficient management capabilities for administrators.

## Modules
1. **Mobile App** (`mobile_app/`)
2. **Admin Panel** (`admin_panel/`)
3. **Backend** (`backend/`)

## Structure
- `backend/`: Contains the backend server built using Node.js, Express.js, and MongoDB.
- `admin_panel/`: Contains the admin panel built using Flutter.
- `mobile_app/`: Contains the mobile application built using Flutter.

## Features

### General Features
- Full e-commerce functionality including product listings, user authentication, and payment processing.
- Real-time chat support and push notifications.
- Admin management features including product, order, and user management.
- User-friendly UI with dark mode and light mode.

### Mobile App Features
- API integrations from the backend.
- Push notifications using Firebase.
- Real-time chat support with admin using socket.io.
- Add to cart functionality.
- Stripe payment integration.
- Routes management.
- GetX state management.
- User profile update feature.
- Wishlist and favorites management.
- User-friendly UI.
- Addresses, cards, checkout, and many more features.
- Pagination and filtering in API calls.
- Clean and understandable code.

### Admin Panel Features
- Go Router for routing.
- Real-time chat support for communication with all users via socket.io.
- Graphs and calculations for orders and products at the landing page.
- Add, delete, and manage products with images.
- GetX state management.
- CRUD operations for users, products, orders, stocks, invoices, and admin profile management.
- Clean and understandable code.

### Backend Features
- Stripe payment logic.
- Product images stored in AWS S3 bucket.
- Firebase-admin for push notifications.
- Real-time chat using socket.io.
- API development for multiple modules.
- Admin user authentication and authorization.
- Proper code structure.
- Express sessions.
- MongoDB database.
- Cron jobs for order status checks.
- Seeder file for database management.
- Pagination, filtering, and sorting.