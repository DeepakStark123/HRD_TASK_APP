# HrdTaskApp

A Flutter application showcasing data fetching, local storage, and dynamic data display capabilities.

## Project Overview
This project demonstrates a simple task application that fetches data from a public API, stores it locally using SQLite, and displays the data in a user-friendly list format. The app prioritizes offline access by displaying cached data when the device is not connected to the internet. It is designed to highlight clean architecture, efficient data handling, and seamless UI interaction.

## Features

- **Data Fetching from API**: Fetches posts from the JSONPlaceholder API.
- **Offline Support**: Automatically displays cached data when there is no internet connection.
- **Local Storage**: Uses SQLite for efficient local data storage and retrieval.
- **User-Friendly UI**: Displays a list of posts, showing the title and body of each post.
- **Connectivity Check**: Integrates internet connectivity checks using the `connectivity_plus` package.
- **Modular Code Structure**: Clean and maintainable code with well-organized folders for services, state management, and utilities.

## How to Run

Follow these steps to set up and run the project:

1. **Clean the Project:**

   ```bash
   flutter clean
   ```

2. **Get Dependencies:**

   ```bash
   flutter pub get
   ```

3. **Run the Application:**

   ```bash
   flutter run
   ```

4. **Build for Production (Optional):**

   ```bash
   flutter build apk
   ```


## API Used
- **JSONPlaceholder API**: [https://jsonplaceholder.typicode.com/posts](https://jsonplaceholder.typicode.com/posts)

## Main Packages

- **`flutter_bloc`**: For state management.
- **`sqflite`**: For SQLite database operations.
- **`connectivity_plus`**: For internet connectivity checks.
