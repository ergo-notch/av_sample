# AV Sample Flutter App

![Flutter](https://img.shields.io/badge/Flutter-3.0-blue.svg)

A **Flutter application** built with **Clean Architecture** principles and **BLoC** state management. The project is designed to be scalable, testable, and maintainable.

---
![Screenshot_1732648493](https://github.com/user-attachments/assets/0f1020de-da82-4289-b08b-851a437b5da7)



## Table of Contents

1. [Overview](#overview)
2. [Repository](#repository)
3. [Architecture](#architecture)
4. [Features](#features)
5. [Getting Started](#getting-started)
6. [Folder Structure](#folder-structure)
7. [Dependencies](#dependencies)
8. [Running Tests](#running-tests)
9. [Contributing](#contributing)
10. [License](#license)

---

## Overview

This app demonstrates the integration of **Clean Architecture** and **BLoC** pattern to provide:

- Modular design for features.
- Separation of concerns.
- Robust state management.
- Easy-to-understand structure for developers.

---

## Repository

The source code is hosted on GitHub:

[https://github.com/ergo-notch/av_sample](https://github.com/ergo-notch/av_sample)

---

## Architecture

The app follows the **Clean Architecture** layered approach:

1. **Presentation Layer**:
   - Handles UI and user interaction.
   - Uses Flutter widgets and BLoC for state management.
2. **Domain Layer**:
   - Contains business logic.
   - Independent of any specific framework or external libraries.
3. **Data Layer**:
   - Manages external data sources (API, database, etc.).
   - Converts raw data into domain models.

---

## Features

- **State Management**: Powered by `flutter_bloc`.
- **Dependency Injection**: Achieved using `get_it`.
- **Error Handling**: Centralized error management.
- **Modularity**: Each feature is isolated for better scalability.
- **Testing**: Comprehensive unit, widget, and integration tests.

---

## Getting Started

### Prerequisites

- Flutter 3.0 or higher.
- A working Dart environment.

### Steps

1. Clone the repository:
   ```bash
   git clone https://github.com/ergo-notch/av_sample.git
   cd av_sample
   ```
2. Fetch dependencies:
   ```bash
   flutter pub get
   ```
3. Run the app:
   ```bash
   flutter run
   ```

---

## Folder Structure

```
lib/
├── core/
│   ├── errors/              # Error handling classes
│   ├── usecases/            # Generic use case classes
│   ├── utils/               # Utility helpers
    ├── di/                  # Dependency injection setup

├── features/
│   └── feature_name/        # Specific feature module
│       ├── data/
│       │   ├── datasources/ # External data sources (e.g., APIs)
│       │   ├── models/      # Data transfer objects
│       │   ├── repositories # Abstract repositories
        ├── di/              # Dependency injection setup
│       ├── domain/
            ├── datasources/ # External data sources (e.g., APIs) inplementation
│       │   ├── entities/    # Core business models
│       │   ├── repositories # Repository implementations
│       │   ├── usecases/    # Business logic use cases
│       ├── presentation/
│           ├── bloc/        # State management (Bloc, Events, States)
│           ├── pages/       # Screens and views
│           ├── widgets/     # Reusable UI components
├── main.dart                # Entry point
```

---

## Dependencies

- [`flutter_bloc`](https://pub.dev/packages/flutter_bloc): State management.
- [`get_it`](https://pub.dev/packages/get_it): Dependency injection.
- [`equatable`](https://pub.dev/packages/equatable): Equality for Dart objects.
- [`mockito`](https://pub.dev/packages/mockito): Mocking framework for testing.

Install dependencies with:

```bash
flutter pub get
```

---

## Running Tests

Run the following command to execute tests:

```bash
flutter test
```

Ensure all layers (domain, data, presentation) are covered in your tests.

---

## Contributing

Contributions are welcome! Here's how you can help:

1. Fork the repository.
2. Create a new branch for your feature: `git checkout -b feature-name`.
3. Commit your changes: `git commit -m "Add new feature"`.
4. Push to your branch: `git push origin feature-name`.
5. Open a Pull Request.

---

## License

This project is licensed under the [MIT License](LICENSE).

For questions or suggestions, please contact the repository owner via GitHub.
