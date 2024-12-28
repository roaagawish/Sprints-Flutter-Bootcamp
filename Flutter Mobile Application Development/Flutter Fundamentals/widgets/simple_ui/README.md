# simple_ui

# My First Flutter Project

This is a simple Flutter project that displays two images (one from the local assets and the other from a network URL) along with a text description. The app uses a custom font (`Suwannaphum`) and a blue theme color.

## Features

- Displays two images: one from the local assets and one from a network URL.
- Custom theme using `ColorScheme` and a custom font (`Suwannaphum`).
- Centered title in the app bar.
- Layout the screen with columns and rows and containers.
- Text below the images with custom styling.

## Installation

To run this project locally, follow the steps below:

### Prerequisites

- Install [Flutter](https://flutter.dev/docs/get-started/install) on your system.
- Install an IDE (VS Code, Android Studio, etc.) with Flutter and Dart plugins.

### Clone the repository

```bash
git clone https://github.com/your-username/my-first-flutter-project.git
cd my-first-flutter-project

Install dependencies
Run the following command to get the project dependencies:
flutter pub get

Run the app
Connect a device or start an emulator, then run the app with:
flutter run

### File Structure

my-first-flutter-project/
├── assets/
│   └── dart-logo-for-shares.png  # Local asset image
├── lib/
│   ├── home.dart                # Home screen widget
│   └── main.dart                # Main entry point of the app
├── pubspec.yaml                 # Flutter configuration file
├── README.md                    # Project documentation
└── ...
Customizations
You can replace the image in assets/dart-logo-for-shares.png with your own asset image.
The network image URL in the Image.network widget can be replaced with any valid image URL.
To change the theme or font, modify the theme section in the main.dart file.
