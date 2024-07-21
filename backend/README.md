# E-commerce Backend

This is the backend for my full stack e-commerce project, built using Node.js, Expressjs and MongoDB.

## Features
- Stripe payment logic
- Product images stored in AWS S3 bucket
- Firebase-admin for push notifications
- Real-time chat using socket.io
- API development for multiple modules
- Admin user authentication and authorization
- Proper code structure
- Express sessions
- MongoDB database
- Cron jobs for order status checks
- Seeder file for database management
- Pagination, filtering, and sorting

## Installation
1. Clone the repository:
   ```bash
   git clone https://github.com/as3hr/E-commerce-Backend
2. Navigate to the project directory:
   ```bash
   cd E-Commerce-Backend
3. Install Dependencies:
   ```bash
   npm install
4. Set up environment variables:
   - Create a .env file in the root directory and add necessary environment variables (you can refer to the .env.example file given in the project).
     
5. Set up a mongodb Database
   - Create a database and add the connection string to the .env file.
   
6. Start the Server:
   ```bash
   npm run dev

## Add and Remove Sample Data
- To add the data run the following command in your project root directory:
   ```bash
   ts-node seeder.ts --start
- To remove the data run the following command in your project root directory:
   ```bash
   ts-node seeder.ts --delete