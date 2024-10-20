NodeNote

NodeNote is a simple and efficient iOS notes application designed to store and manage notes. The app features a Node.js backend, uses MongoDB as the database, and supports full CRUD operations with Alamofire integration for seamless API communication.

Features

Create, Read, Update, and Delete (CRUD) operations for notes
Express.js and Node.js as the backend
MongoDB for efficient data storage
Alamofire integration for API communication
Postman for API testing
Tech Stack

Frontend
Xcode: For building the native iOS app.
Swift: For writing the iOS app.
Alamofire: For handling HTTP requests and CRUD operations on notes.
Backend
Node.js: For building the backend server.
Express.js: For handling HTTP requests and defining API routes.
Mongoose: For MongoDB object modeling.
MongoDB: As the database for storing notes.
Tools
Postman: Used for API testing.
Installation

Backend Setup
1. Clone the repository:
git clone https://github.com/preetendali1/nodenote.git
2. Navigate to the backend directory:
cd backend
3. Install dependencies:
npm install
4. Ensure MongoDB is installed and running locally. You can install MongoDB here.
Start the backend server:
node app.js
5. The backend server should now be running at http://localhost:8081.

1. Fetch All Notes
URL: GET /fetch
Response: List of notes stored in the MongoDB database.
2. Add a New Note
URL: POST /form
Headers:
title: The title of the note.
note: The content of the note.
date: The creation date.
3. Update a Note
URL: POST /update
Headers:
id: The ID of the note.
title: Updated title.
note: Updated content.
date: Updated date.
4. Delete a Note
URL: POST /delete
Headers:
id: The ID of the note to be deleted.
How It Works

The iOS app communicates with the Node.js backend through HTTP requests using Alamofire.
The backend server processes these requests, interacts with the MongoDB database, and returns the appropriate responses.
Screenshots

Future Improvements

Add user authentication with JWT tokens.
Implement search functionality for notes.
Add push notifications for reminders.
Contributing

Contributions are welcome! Feel free to open a pull request or raise an issue.

License

This project is licensed under the MIT License.
