import 'package:flutter/material.dart';
import 'screens/onboarding_screen.dart';
import 'screens/home_screen.dart';
import 'screens/meal_planner_screen.dart';
import 'screens/workout_tracker_screen.dart';

void main() {
  runApp(const FitnessNutritionApp());
}

class FitnessNutritionApp extends StatelessWidget {
  const FitnessNutritionApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fitness & Nutrition',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'SF Pro Display', // iOS-like font
        scaffoldBackgroundColor: const Color(0xFFF8F9FA),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF6DB5D4),
          primary: const Color(0xFF6DB5D4),
          secondary: const Color(0xFFD8476E),
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const OnboardingScreen(),
        '/home': (context) => const HomeScreen(),
        '/meals': (context) => const MealPlannerScreen(),
        '/workout': (context) => const WorkoutTrackerScreen(),
      },
    );
  }
}
