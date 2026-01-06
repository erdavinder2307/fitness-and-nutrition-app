import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import '../core/constants.dart';
import '../widgets/custom_button.dart';
import '../widgets/bottom_navigation.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  
  void _onNavTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
    
    // Navigate to different screens
    switch (index) {
      case 1:
        Navigator.pushNamed(context, '/workout');
        break;
      case 2:
        Navigator.pushNamed(context, '/meals');
        break;
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(AppSpacing.lg),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Header with notification
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Welcome Back,',
                              style: AppTextStyles.bodyMedium,
                            ),
                            const SizedBox(height: 4),
                            Text(
                              'Imke Van Houtven',
                              style: AppTextStyles.headlineLarge,
                            ),
                          ],
                        ),
                        Container(
                          padding: const EdgeInsets.all(AppSpacing.sm),
                          decoration: BoxDecoration(
                            color: AppColors.grey100,
                            borderRadius: BorderRadius.circular(AppBorderRadius.medium),
                          ),
                          child: const Icon(
                            Icons.notifications_outlined,
                            color: AppColors.textSecondary,
                          ),
                        ),
                      ],
                    ),
                    
                    const SizedBox(height: AppSpacing.xl),
                    
                    // BMI Card
                    GradientCard(
                      gradientColors: const [
                        AppColors.gradientBlueStart,
                        AppColors.gradientBlueEnd,
                      ],
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'BMI (Body Mass Index)',
                                  style: AppTextStyles.titleLarge.copyWith(
                                    color: Colors.white,
                                  ),
                                ),
                                const SizedBox(height: AppSpacing.xs),
                                Text(
                                  'You have a normal weight',
                                  style: AppTextStyles.bodyMedium.copyWith(
                                    color: Colors.white.withOpacity(0.9),
                                  ),
                                ),
                                const SizedBox(height: AppSpacing.lg),
                                CustomButton(
                                  text: 'View More',
                                  onPressed: () {},
                                  backgroundColor: AppColors.primaryPink,
                                  height: 40,
                                  width: 140,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: AppSpacing.md),
                          SizedBox(
                            width: 100,
                            height: 100,
                            child: Stack(
                              children: [
                                SizedBox(
                                  width: 100,
                                  height: 100,
                                  child: CircularProgressIndicator(
                                    value: 0.201,
                                    strokeWidth: 12,
                                    backgroundColor: Colors.white.withOpacity(0.3),
                                    valueColor: const AlwaysStoppedAnimation<Color>(
                                      AppColors.primaryPink,
                                    ),
                                  ),
                                ),
                                Center(
                                  child: Text(
                                    '20.1',
                                    style: AppTextStyles.headlineMedium.copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    
                    const SizedBox(height: AppSpacing.lg),
                    
                    // Today Target
                    CustomCard(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Today Target',
                            style: AppTextStyles.titleLarge,
                          ),
                          CustomButton(
                            text: 'Check',
                            onPressed: () {},
                            backgroundColor: AppColors.primaryBlue,
                            height: 36,
                            width: 100,
                          ),
                        ],
                      ),
                    ),
                    
                    const SizedBox(height: AppSpacing.lg),
                    
                    // Activity Status
                    Text(
                      'Activity Status',
                      style: AppTextStyles.headlineMedium,
                    ),
                    
                    const SizedBox(height: AppSpacing.md),
                    
                    // Heart Rate Card
                    CustomCard(
                      backgroundColor: AppColors.grey100,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Heart Rate',
                                style: AppTextStyles.titleLarge,
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: AppSpacing.md,
                                  vertical: AppSpacing.xs,
                                ),
                                decoration: BoxDecoration(
                                  color: AppColors.primaryPink,
                                  borderRadius: BorderRadius.circular(AppBorderRadius.xl),
                                ),
                                child: Text(
                                  '21 mins ago',
                                  style: AppTextStyles.caption.copyWith(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: AppSpacing.xs),
                          Text(
                            '78 BPM',
                            style: AppTextStyles.displayMedium.copyWith(
                              color: AppColors.primaryBlue,
                            ),
                          ),
                          const SizedBox(height: AppSpacing.md),
                          SizedBox(
                            height: 100,
                            child: LineChart(
                              LineChartData(
                                gridData: const FlGridData(show: false),
                                titlesData: const FlTitlesData(show: false),
                                borderData: FlBorderData(show: false),
                                minX: 0,
                                maxX: 6,
                                minY: 0,
                                maxY: 100,
                                lineBarsData: [
                                  LineChartBarData(
                                    spots: const [
                                      FlSpot(0, 60),
                                      FlSpot(1, 45),
                                      FlSpot(2, 65),
                                      FlSpot(3, 55),
                                      FlSpot(4, 40),
                                      FlSpot(5, 85),
                                      FlSpot(6, 50),
                                    ],
                                    isCurved: true,
                                    color: AppColors.chartLine1,
                                    barWidth: 3,
                                    isStrokeCapRound: true,
                                    dotData: FlDotData(
                                      show: true,
                                      getDotPainter: (spot, percent, barData, index) {
                                        if (index == 5) {
                                          return FlDotCirclePainter(
                                            radius: 6,
                                            color: AppColors.primaryPink,
                                            strokeWidth: 2,
                                            strokeColor: Colors.white,
                                          );
                                        }
                                        return FlDotCirclePainter(
                                          radius: 0,
                                          color: Colors.transparent,
                                        );
                                      },
                                    ),
                                    belowBarData: BarAreaData(
                                      show: true,
                                      color: AppColors.chartLine1.withOpacity(0.2),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    
                    const SizedBox(height: AppSpacing.lg),
                    
                    // Water Intake and Sleep cards
                    Row(
                      children: [
                        // Water Intake
                        Expanded(
                          child: CustomCard(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.all(AppSpacing.sm),
                                      decoration: BoxDecoration(
                                        color: AppColors.primaryBlue.withOpacity(0.1),
                                        borderRadius: BorderRadius.circular(AppBorderRadius.small),
                                      ),
                                      child: const Icon(
                                        Icons.water_drop_outlined,
                                        color: AppColors.primaryBlue,
                                        size: 20,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: AppSpacing.sm),
                                Text(
                                  'Water Intake',
                                  style: AppTextStyles.titleMedium,
                                ),
                                const SizedBox(height: AppSpacing.xs),
                                Text(
                                  '4 Liters',
                                  style: AppTextStyles.headlineMedium.copyWith(
                                    color: AppColors.primaryBlue,
                                  ),
                                ),
                                const SizedBox(height: AppSpacing.sm),
                                Text(
                                  'Real time\nupdates',
                                  style: AppTextStyles.bodySmall,
                                ),
                                const SizedBox(height: AppSpacing.xs),
                                _buildWaterTimeline(),
                              ],
                            ),
                          ),
                        ),
                        
                        const SizedBox(width: AppSpacing.md),
                        
                        // Sleep
                        Expanded(
                          child: CustomCard(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.all(AppSpacing.sm),
                                      decoration: BoxDecoration(
                                        color: AppColors.primaryPink.withOpacity(0.1),
                                        borderRadius: BorderRadius.circular(AppBorderRadius.small),
                                      ),
                                      child: const Icon(
                                        Icons.bedtime_outlined,
                                        color: AppColors.primaryPink,
                                        size: 20,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: AppSpacing.sm),
                                Text(
                                  'Sleep',
                                  style: AppTextStyles.titleMedium,
                                ),
                                const SizedBox(height: AppSpacing.xs),
                                Text(
                                  '8h 20m',
                                  style: AppTextStyles.headlineMedium.copyWith(
                                    color: AppColors.primaryPink,
                                  ),
                                ),
                                const SizedBox(height: AppSpacing.lg),
                                SizedBox(
                                  height: 50,
                                  child: CustomPaint(
                                    painter: _WavePainter(),
                                    size: const Size(double.infinity, 50),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    
                    const SizedBox(height: AppSpacing.xl),
                  ],
                ),
              ),
            ),
            CustomBottomNavigationBar(
              currentIndex: _currentIndex,
              onTap: _onNavTapped,
            ),
          ],
        ),
      ),
    );
  }
  
  Widget _buildWaterTimeline() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildTimelineItem('6am - 8am', '600ml', AppColors.primaryPink),
        const SizedBox(height: AppSpacing.xs),
        _buildTimelineItem('9am - 11am', '500ml', AppColors.primaryPink.withOpacity(0.3)),
      ],
    );
  }
  
  Widget _buildTimelineItem(String time, String amount, Color color) {
    return Row(
      children: [
        Column(
          children: [
            Container(
              width: 8,
              height: 8,
              decoration: BoxDecoration(
                color: color,
                shape: BoxShape.circle,
              ),
            ),
            if (amount != '500ml')
              Container(
                width: 2,
                height: 20,
                color: color.withOpacity(0.3),
              ),
          ],
        ),
        const SizedBox(width: AppSpacing.sm),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              time,
              style: AppTextStyles.caption,
            ),
            Text(
              amount,
              style: AppTextStyles.bodySmall.copyWith(
                color: color,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _WavePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint1 = Paint()
      ..color = AppColors.primaryBlue.withOpacity(0.3)
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;
      
    final paint2 = Paint()
      ..color = AppColors.primaryPink.withOpacity(0.3)
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;
    
    final path1 = Path();
    final path2 = Path();
    
    // First wave
    path1.moveTo(0, size.height * 0.5);
    for (double i = 0; i < size.width; i++) {
      path1.lineTo(
        i,
        size.height * 0.5 + 15 * Math.sin((i / size.width) * 4 * Math.pi),
      );
    }
    
    // Second wave
    path2.moveTo(0, size.height * 0.5);
    for (double i = 0; i < size.width; i++) {
      path2.lineTo(
        i,
        size.height * 0.5 + 15 * Math.cos((i / size.width) * 4 * Math.pi),
      );
    }
    
    canvas.drawPath(path1, paint1);
    canvas.drawPath(path2, paint2);
  }
  
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

// Helper class for math functions
class Math {
  static double sin(double radians) => radians.sin();
  static double cos(double radians) => radians.cos();
  static const double pi = 3.14159265359;
}

extension on double {
  double sin() => this - (this * this * this) / 6 + (this * this * this * this * this) / 120;
  double cos() => 1 - (this * this) / 2 + (this * this * this * this) / 24;
}
