## Code Challenge – Task Board App

A Flutter task board application that allows users to manage boards and tasks locally using a structured, scalable architecture.

___

🚀 How to Build and Run the Project

1️⃣ Prerequisites

Make sure you have installed:
•	Flutter SDK (latest stable)
•	Dart SDK
•	Android Studio / VS Code
•	Android Emulator or iOS Simulator (or physical device)

Check installation:

```dart
flutter --version
```



2️⃣ Clone the Repository

```
git clone https://github.com/danfordChris/code_challenge.git

cd code_challenge
```


3️⃣ Install Dependencies

```
flutter pub get
```



4️⃣ Generate Localization Files (if needed)

If localization files need regeneration:

```
flutter gen-l10n
```

5️⃣ Run the Application

flutter run

For a specific device:

```
flutter devices
flutter run -d <device-id>
```




6️⃣ Run Tests

```
flutter test
```
___

🏗 Architecture Decisions

This project follows a feature-based clean modular architecture.

Folder Structure Overview

```
lib/
├── core/              # App-wide utilities, theme, constants
├── dao/               # Data access layer (SQLite operations)
├── features/          # Feature-based UI organization
├── models/            # Data models
├── repositories/      # Repository abstraction layer
├── services/          # App services (DB, localization, session)
├── shared/            # Reusable UI components & controllers
└── root/  
            # Entry-level screens (e.g., Splash)
```




🧠 State Management Approach

Chosen Approach: Controller-Based (ChangeNotifier Pattern)

The app uses a controller-driven architecture (e.g., settings_controller.dart, feature controllers inside features/.../controller).

Why this approach?
•	✅ Lightweight and easy to scale
•	✅ Clear separation of UI and business logic
•	✅ Good balance between simplicity and maintainability
•	✅ Avoids overengineering for a medium-sized project
•	✅ Works well with repository + DAO structure

The UI listens to controllers, and controllers interact with repositories, which in turn communicate with DAOs and services.

Data Flow

```
UI → Controller → Repository → DAO → Database
```
This keeps responsibilities clean and testable.

___

💾 Data Storage
•	Local persistence via a database layer (database_manager.dart)
•	DAO layer handles raw database operations
•	Repository layer abstracts data access for features

This ensures:
•	Decoupling between UI and data source
•	Easy future migration to remote APIs if needed

___

🌍 Localization
•	Uses Flutter’s gen-l10n
•	ARB-based translation system
•	Currently configured for English
•	Easily extendable for additional languages

___

🎨 Theming
•	Centralized in core/theme
•	Custom color palette
•	App-wide typography and fonts
•	Easily scalable for dark/light mode enhancements

___

⚖️ Known Limitations / Trade-offs
1.	Local-Only Data
•	No remote sync or backend integration.
•	Data is stored only on-device.
2.	Basic Error Handling
•	Error states could be expanded with more robust user feedback.
3.	Scalability Consideration
•	ChangeNotifier-based approach is suitable for medium-scale apps.
•	For larger systems, Riverpod/Bloc could provide more predictable state handling.
4.	Testing Coverage
•	Minimal test coverage included.
•	Controllers and repositories could be further unit-tested.
5.	Single Locale
•	Currently English-only.

___

⏱ Approximate Time Spent

Task	Time
Project Setup & Architecture	~1.5 hours
Database + DAO Implementation	~2 hours
Repository Layer	~1 hour
UI Implementation	~3 hours
Theming & Styling	~1 hour
Localization Setup	~0.5 hour
Testing & Refinements	~1 hour

Total: ~10 hours
___

📌 Future Improvements
•	Add remote backend sync
•	Implement full dark mode
•	Improve test coverage
•	Add drag-and-drop task reordering
•	Implement more advanced filtering and sorting
•	Improve accessibility support

___

👨‍💻 Author

Developed as part of a Flutter technical challenge.
