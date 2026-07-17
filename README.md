# Excelerate Learning Platform

## Description

Excelerate is a Flutter learning platform where learners can discover programs and monitor their learning. It will also provide administrators with tools to manage learners, programs, and announcements.

## Week 2 Deliverables

- Login Screen
- Home Screen
- Program Listing Screen
- Program Details Screen
- Working navigation
- README screenshots
- Clear Git history
- Optional demo video

## Project Structure

```text
lib/
├── constants/
│   └── theme.dart
├── routes/
│   └── app_routes.dart
├── screens/
│   ├── login_screen.dart
│   ├── home_screen.dart
│   ├── program_listing_screen.dart
│   └── program_details_screen.dart
├── widgets/
│   └── README.md
├── models/
├── services/
└── main.dart
```

## Navigation Flow

Login → Home → Program Listing → Program Details

## Named Routes

- `/login`
- `/home`
- `/programs`
- `/details`

When the Program model is available, navigate from the program listing to program details with this contract:

```dart
Navigator.pushNamed(
  context,
  AppRoutes.details,
  arguments: program,
);
```

The Program Details screen will retrieve the selected program from `ModalRoute.of(context)!.settings.arguments`.

## How to Run

```shell
flutter pub get
flutter run
```

## Team Responsibilities

- Lords Chilled Life — Team Lead, PDF compilation and submission
- Iqra Shahzadi — Login Screen
- Bilal Feroz Khan — Project setup, ThemeData, routes, GitHub integration and README
- Ibrahim Salman — Home Screen
- Faith Wahome — Program Listing Screen and Program model
- Pranshu Namdeo — Program Details Screen, branding and shared component design

## Screenshots

- Login Screen — To be added
- Home Screen — To be added
- Program Listing Screen — To be added
- Program Details Screen — To be added

## Branch Workflow

- `setup/shared-components`
- `feature/login-screen`
- `feature/home-screen`
- `feature/program-listing`
- `feature/program-details`

Each team member should:

1. Pull the latest `main` branch.
2. Create or switch to their assigned branch.
3. Build only their assigned screen.
4. Commit with a meaningful message.
5. Push the branch.
6. Open a pull request into `main`.
