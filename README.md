# **Flutter + Dart Backend Application**

This project includes a Dart backend that connects to Google Firestore using the Firestore REST API and a Flutter frontend that communicates with the backend to display user data. The goal is to provide a full-stack application where the Dart backend serves as an API and the Flutter app interacts with it for displaying user data.

---

## **Features**

### **Dart Backend:**
- Connects to Google Firestore using OAuth 2.0 authentication.
- Fetches user data from Firestore using REST API.
- Implements token generation for API authentication.

### **Flutter Frontend:**
- Displays user data (name, email, avatar) in a list format.
- Built using `ListView.builder` to show a scrollable list of users.
- Displays user information, such as first name, last name, and email.

---

## **Technologies Used**

### **Dart (Backend):**
- Firestore REST API
- OAuth 2.0 authentication for Firebase
- JSON handling for parsing responses

### **Flutter (Frontend):**
- Dart programming language for building UI
- `ListView.builder` to create the list of users
- `FutureBuilder` for handling asynchronous data fetching

---
