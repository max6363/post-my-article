# PostMyArticle iOS App

PostMyArticle is an iOS application built using Swift and the VIPER architecture, focusing on clean code, modularity, and maintainability. This app enables users to easily create, manage, and publish articles.

## Features

- **Create Articles:** Write and publish articles directly from your iOS device.
- **Edit and Delete Articles:** Manage your existing articles conveniently.
- **Secure Authentication:** Provides a secure login and registration process.
- **Offline Support:** Access and manage your articles even without internet connectivity.

## Architecture

The application is developed using the VIPER architecture, promoting clear separation of concerns and scalability:

- **View**: Manages UI and user interactions.
- **Interactor**: Handles business logic and data operations.
- **Presenter**: Acts as a mediator between View and Interactor.
- **Entity**: Defines data models.
- **Router**: Handles navigation and screen transitions.

VIPER ensures that the app adheres to SOLID principles, fostering a modular and easily testable codebase.

## Getting Started

Follow these steps to run the project locally:

### Clone the Repository

```bash
git clone https://github.com/max6363/post-my-article.git
```

### Install Dependencies

Navigate into the project directory and install dependencies using CocoaPods:

```bash
cd post-my-article
pod install
```

### Open in Xcode

Open `PostMyArticle-WS.xcworkspace` with Xcode:

```bash
open PostMyArticle-WS.xcworkspace
```

### Run the Application

Build and run the app using `Cmd + R` in Xcode.

## Dependencies

- **Alamofire**: Network requests handling.
- **Realm**: Efficient local data storage.
- **SnapKit**: Simplified AutoLayout constraints.

## Contributing

Your contributions are welcome! Please fork the repository and submit pull requests.

## License

This project is licensed under the MIT License. See [LICENSE](LICENSE) for more details.

