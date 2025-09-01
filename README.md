# Lavender

Lavender is a Flutter application designed to provide a platform for users to connect with certified specialists for personal and confidential consultations. The app fosters a supportive community and focuses on user well-being, starting with a seamless and localized onboarding experience.

## ✨ Key Features

*   **Multi-language Support**: Fully localized for both Arabic (`ar`) and English (`en`) using the `easy_localization` package. Users can select their preferred language upon first launch.
*   **Interactive Onboarding**: A guided, three-step onboarding process introduces new users to the app's value propositions.
*   **State-aware Onboarding**: Utilizes `Hive` for local storage to ensure the onboarding screens are shown only once to each user.
*   **Responsive UI**: Built with `flutter_screenutil` to ensure a consistent and adaptive user interface across various screen sizes and densities.
*   **Custom Widgets**: Features a range of custom UI components, including a unique circular progress indicator, custom buttons, and themed widgets.
*   **Scalable Architecture**: Organized using a feature-first directory structure, promoting maintainability and scalability.
*   **State Management**: Employs `flutter_bloc` (specifically `Cubit`) for a predictable and robust state management solution.
*   **Custom Routing**: Manages navigation through a centralized `AppRouter` for clear and organized app flow.

## 🛠️ Tech Stack & Architecture

This project is built with a modern and scalable architecture, leveraging the following technologies and libraries:

*   **Framework**: Flutter
*   **State Management**: `flutter_bloc` / `Cubit`
*   **Localization**: `easy_localization`
*   **Local Storage**: `hive` / `hive_flutter`
*   **Routing**: Custom `AppRouter` for named routes.
*   **Responsive UI**: `flutter_screenutil`
*   **Vector Graphics**: `flutter_svg` for crisp and scalable icons and images.
*   **Code Structure**: The codebase is organized into two main directories:
    -   `lib/core`: Contains shared application-wide logic, including routing, theming (colors, styles, spacing), helpers, and common widgets.
    -   `lib/features`: Each distinct feature of the app (e.g., `splash`, `onbording`, `home`) is encapsulated in its own module, containing its own presentation, data, and domain layers.

## 🚀 Getting Started

Follow these instructions to get the project up and running on your local machine.

### Prerequisites

Ensure you have the Flutter SDK installed on your system. For more information, see the [official Flutter documentation](https://flutter.dev/docs/get-started/install).

### Installation & Setup

1.  **Clone the repository:**
    ```sh
    git clone https://github.com/hebakhalif/lavender.git
    ```

2.  **Navigate to the project directory:**
    ```sh
    cd lavender
    ```

3.  **Install dependencies:**
    ```sh
    flutter pub get
    ```

### Running the Application

To run the app on a connected device or emulator, use the following command:

```sh
flutter run
```

## 📂 Project Structure

The project follows a clean, feature-driven directory structure to keep the codebase organized and maintainable.

```
lib/
├── core/
│   ├── helpers/         # Utility functions and extensions
│   ├── routing/         # App router and route definitions
│   ├── themes/          # App-wide colors, styles, and spacing
│   └── widget/          # Shared custom widgets
│
├── features/
│   ├── home/            # Home screen feature
│   ├── onbording/       # Onboarding flow feature
│   │   ├── data/
│   │   │   ├── datasources/
│   │   │   └── models/
│   │   └── presentation/
│   │       ├── cubit/
│   │       ├── screens/
│   │       └── widgets/
│   └── splash/          # Splash and language selection feature
│       └── presenation/
│           ├── cubit/
│           └── screens/
│
├── lavender.dart        # Root MaterialApp widget
└── main.dart            # Application entry point
