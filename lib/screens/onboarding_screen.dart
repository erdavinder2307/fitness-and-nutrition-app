import 'package:flutter/material.dart';
import '../core/constants.dart';
import '../widgets/custom_button.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              AppColors.lightBlue,
              AppColors.softBlueBackground,
            ],
          ),
        ),
        child: SafeArea(
          child: Stack(
            children: [
              // Main content
              Column(
                children: [
                  const Spacer(flex: 2),
                  
                  // Avatar illustration placeholder
                  Container(
                    width: 280,
                    height: 280,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.softBlueBackground.withOpacity(0.5),
                      border: Border.all(
                        color: Colors.white.withOpacity(0.3),
                        width: 2,
                      ),
                    ),
                    child: Center(
                      child: Icon(
                        Icons.fitness_center_rounded,
                        size: 120,
                        color: AppColors.textPrimary.withOpacity(0.3),
                      ),
                    ),
                  ),
                  
                  const Spacer(flex: 1),
                  
                  // White card container
                  Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(AppBorderRadius.xl),
                        topRight: Radius.circular(AppBorderRadius.xl),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(AppSpacing.xl),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          // Title
                          Text(
                            'Crush Your Goal',
                            style: AppTextStyles.displayMedium,
                            textAlign: TextAlign.center,
                          ),
                          
                          const SizedBox(height: AppSpacing.lg),
                          
                          // Body text
                          Text(
                            'Not sure where to start? No stress. We\'ll help you figure it out — then chase it down, one workout at a time. No fluff. Just progress. OK BYE 💥',
                            style: AppTextStyles.bodyLarge.copyWith(
                              height: 1.6,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          
                          const SizedBox(height: AppSpacing.xxl),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              
              // Floating action button
              Positioned(
                right: AppSpacing.xl,
                bottom: AppSpacing.xl,
                child: CircularButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/home');
                  },
                  size: 70,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
