# Fitness & Nutrition App

A modern iOS-style fitness and nutrition tracking mobile app built with Flutter. This is a UI-only implementation showcasing clean architecture and reusable components.

## Features

### Screens
1. **Onboarding Screen** - Motivational welcome screen with avatar and CTA
2. **Home Dashboard** - BMI tracking, activity status, heart rate monitoring, water intake, and sleep tracking
3. **Meal Planner** - Weekly nutrition charts, meal schedules, and today's meal list
4. **Workout Tracker** - Weekly activity tracking, workout programs, and progress monitoring

### Key Components
- Clean, modern iOS-first design
- Interactive charts using fl_chart
- Reusable custom widgets (buttons, cards, navigation)
- Smooth navigation between screens
- Responsive layout for iPhone 14/15

## Tech Stack
- Flutter 3.x
- fl_chart ^0.66.0 for data visualization
- Material 3 with iOS-inspired design

## Project Structure
```
lib/
├── main.dart                    # App entry point
├── core/
│   └── constants.dart          # Colors, text styles, spacing
├── screens/
│   ├── onboarding_screen.dart
│   ├── home_screen.dart
│   ├── meal_planner_screen.dart
│   └── workout_tracker_screen.dart
└── widgets/
    ├── custom_button.dart       # Buttons and cards
    ├── bottom_navigation.dart   # Navigation bar
    └── custom_controls.dart     # Dropdowns and segmented controls
```

## Getting Started

### Prerequisites
- Flutter SDK (3.0.0 or higher)
- Dart SDK
- iOS Simulator or Android Emulator

### Installation

1. Clone the repository
2. Navigate to the project directory
3. Install dependencies:
```bash
flutter pub get
```

4. Run the app:
```bash
flutter run
```

## Design Notes

- Uses static/mock data only - no backend integration
- All components are StatelessWidget where possible
- iOS-inspired design with Cupertino elements
- Gradient cards and smooth animations
- Custom color palette with primary blue and pink accents

## Usage

The app starts with the onboarding screen. Tap the circular button to navigate to the home dashboard. Use the bottom navigation bar to switch between:
- Home (Dashboard)
- Workout Tracker
- Meal Planner
- Weather (placeholder)
- Profile (placeholder)

## Customization

Colors and styles can be modified in `lib/core/constants.dart`:
- `AppColors` - Define color palette
- `AppTextStyles` - Typography styles
- `AppSpacing` - Consistent spacing values
- `AppBorderRadius` - Border radius values

## License

This is a UI demonstration project for educational purposes.
