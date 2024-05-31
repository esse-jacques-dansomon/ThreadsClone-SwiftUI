# Threads Clone-SwiftUI

## Overview
This project is a clone of Threads, built using SwiftUI for iOS. It demonstrates modern SwiftUI practices and architecture, with Firebase handling the backend for authentication, data storage, and real-time updates.

## Features
- User authentication with Firebase
- Creating and viewing threads
- Posting and viewing comments
- User profile management
- Real-time updates

## Screenshots

<div style="display: flex; flex-direction: row; gap: 10px; flex-wrap: wrap;">
  <img src="docs/1.png" alt="Screen 1" width="20%" />
  <img src="docs/2.png" alt="Screen 2" width="20%" />
  <img src="docs/3.png" alt="Screen 3" width="20%" />
  <img src="docs/4.png" alt="Screen 4" width="20%" />
  <img src="docs/5.png" alt="Screen 5" width="20%" />
  <img src="docs/6.png" alt="Screen 6" width="20%" />
</div>

## Demo

<div style="display: flex; flex-direction: row; gap: 10px; flex-wrap: wrap;">
  <img src="docs/demo-1.gif" alt="demo 1" width="33%" />
  <img src="docs/demo-2.gif" alt="demo 2" width="33%" />
</div>

## Requirements
- iOS 14.0+
- Xcode 12.0+
- Swift 5.3+
- Firebase SDK

## Installation
1. Clone the repository:
   ```sh
   git clone https://github.com/esse-jacques-dansomon/ThreadsClone-SwiftUI.git
   ```
2. Open the project in Xcode:
   ```sh
   cd ThreadsClone-SwiftUI
   open ThreadsAppClone.xcodeproj
   ```
3. Install dependencies using CocoaPods:
   ```sh
   pod install
   ```
4. Configure Firebase:
   - Download your `GoogleService-Info.plist` file from Firebase Console and add it to the project.
5. Build and run the project using Xcode.

## Architecture

### App
- Main entry point of the application
- Handles app lifecycle events

### Core
- Views
- Business logic and data management
- Network requests, data persistence, and app state

### Services
- Firebase services for authentication, data storage, and real-time updates

### Extensions
- SwiftUI View extensions
- Utility extensions for better code readability

### Utils
- Helper functions and constants

## Contributing
1. Fork the repository.
2. Create a new branch:
   ```sh
   git checkout -b feature-branch
   ```
3. Make your changes.
4. Commit your changes:
   ```sh
   git commit -m "Feature description"
   ```
5. Push to the branch:
   ```sh
   git push origin feature-branch
   ```
6. Open a pull request.

## License
This project is licensed under the MIT License.

## Contact
For any questions or suggestions, please open an issue on the repository.

## Acknowledgments
- Inspired by Threads
- Built using SwiftUI and Firebase

For more details, visit the [repository](https://github.com/esse-jacques-dansomon/ThreadsClone-SwiftUI).
