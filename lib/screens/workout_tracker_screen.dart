import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import '../core/constants.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_controls.dart';
import '../widgets/bottom_navigation.dart';

class WorkoutTrackerScreen extends StatefulWidget {
  const WorkoutTrackerScreen({super.key});
  
  @override
  State<WorkoutTrackerScreen> createState() => _WorkoutTrackerScreenState();
}

class _WorkoutTrackerScreenState extends State<WorkoutTrackerScreen> {
  int _currentIndex = 1;
  int _selectedSegment = 0;
  
  final List<String> _segments = ['Training', 'Measurements', 'Pictures'];
  
  void _onNavTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
    
    switch (index) {
      case 0:
        Navigator.pushReplacementNamed(context, '/home');
        break;
      case 2:
        Navigator.pushReplacementNamed(context, '/meals');
        break;
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: AppColors.textPrimary),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Workout Tracker',
          style: AppTextStyles.titleLarge,
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.more_horiz, color: AppColors.textPrimary),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  // Weekly activity chart
                  Container(
                    color: AppColors.lightBlue.withOpacity(0.3),
                    padding: const EdgeInsets.all(AppSpacing.lg),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        // Y-axis labels
                        SizedBox(
                          height: 200,
                          child: LineChart(
                            LineChartData(
                              gridData: FlGridData(
                                show: true,
                                drawVerticalLine: false,
                                horizontalInterval: 20,
                                getDrawingHorizontalLine: (value) {
                                  return FlLine(
                                    color: Colors.white.withOpacity(0.3),
                                    strokeWidth: 1,
                                  );
                                },
                              ),
                              titlesData: FlTitlesData(
                                leftTitles: const AxisTitles(
                                  sideTitles: SideTitles(showTitles: false),
                                ),
                                rightTitles: AxisTitles(
                                  sideTitles: SideTitles(
                                    showTitles: true,
                                    interval: 20,
                                    reservedSize: 40,
                                    getTitlesWidget: (value, meta) {
                                      return Text(
                                        '${value.toInt()}%',
                                        style: AppTextStyles.caption.copyWith(
                                          color: AppColors.textSecondary,
                                        ),
                                      );
                                    },
                                  ),
                                ),
                                topTitles: const AxisTitles(
                                  sideTitles: SideTitles(showTitles: false),
                                ),
                                bottomTitles: AxisTitles(
                                  sideTitles: SideTitles(
                                    showTitles: true,
                                    reservedSize: 30,
                                    getTitlesWidget: (value, meta) {
                                      const days = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];
                                      if (value.toInt() >= 0 && value.toInt() < days.length) {
                                        return Padding(
                                          padding: const EdgeInsets.only(top: 8.0),
                                          child: Text(
                                            days[value.toInt()],
                                            style: AppTextStyles.caption,
                                          ),
                                        );
                                      }
                                      return const Text('');
                                    },
                                  ),
                                ),
                              ),
                              borderData: FlBorderData(show: false),
                              minX: 0,
                              maxX: 6,
                              minY: 0,
                              maxY: 100,
                              lineBarsData: [
                                // First wave
                                LineChartBarData(
                                  spots: const [
                                    FlSpot(0, 45),
                                    FlSpot(1, 75),
                                    FlSpot(2, 55),
                                    FlSpot(3, 80),
                                    FlSpot(4, 60),
                                    FlSpot(5, 70),
                                    FlSpot(6, 50),
                                  ],
                                  isCurved: true,
                                  color: Colors.white.withOpacity(0.7),
                                  barWidth: 3,
                                  isStrokeCapRound: true,
                                  dotData: const FlDotData(show: false),
                                  belowBarData: BarAreaData(show: false),
                                ),
                                // Second wave
                                LineChartBarData(
                                  spots: const [
                                    FlSpot(0, 60),
                                    FlSpot(1, 50),
                                    FlSpot(2, 70),
                                    FlSpot(3, 55),
                                    FlSpot(4, 75),
                                    FlSpot(5, 60),
                                    FlSpot(6, 65),
                                  ],
                                  isCurved: true,
                                  color: Colors.white.withOpacity(0.5),
                                  barWidth: 3,
                                  isStrokeCapRound: true,
                                  dotData: const FlDotData(show: false),
                                  belowBarData: BarAreaData(show: false),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  
                  // Content section
                  Padding(
                    padding: const EdgeInsets.all(AppSpacing.lg),
                    child: Column(
                      children: [
                        // Segmented control
                        SegmentedControl(
                          segments: _segments,
                          selectedIndex: _selectedSegment,
                          onSegmentTapped: (index) {
                            setState(() {
                              _selectedSegment = index;
                            });
                          },
                        ),
                        
                        const SizedBox(height: AppSpacing.xl),
                        
                        // Training content
                        if (_selectedSegment == 0) ...[
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'What Do You Want to Train',
                              style: AppTextStyles.titleLarge,
                            ),
                          ),
                          
                          const SizedBox(height: AppSpacing.lg),
                          
                          // Fullbody workout card
                          Container(
                            padding: const EdgeInsets.all(AppSpacing.lg),
                            decoration: BoxDecoration(
                              color: AppColors.grey100,
                              borderRadius: BorderRadius.circular(AppBorderRadius.large),
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Fullbody Workout',
                                        style: AppTextStyles.titleLarge,
                                      ),
                                      const SizedBox(height: AppSpacing.xs),
                                      Text(
                                        '11 Exercises | 32mins',
                                        style: AppTextStyles.bodyMedium,
                                      ),
                                      const SizedBox(height: AppSpacing.md),
                                      CustomButton(
                                        text: 'Start Now',
                                        onPressed: () {},
                                        backgroundColor: AppColors.grey200,
                                        textColor: AppColors.textPrimary,
                                        height: 40,
                                        width: 120,
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(width: AppSpacing.md),
                                Container(
                                  width: 80,
                                  height: 80,
                                  decoration: BoxDecoration(
                                    color: AppColors.primaryBlue.withOpacity(0.1),
                                    borderRadius: BorderRadius.circular(AppBorderRadius.medium),
                                  ),
                                  child: Center(
                                    child: Icon(
                                      Icons.fitness_center_rounded,
                                      size: 40,
                                      color: AppColors.primaryBlue,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          
                          const SizedBox(height: AppSpacing.xl),
                          
                          // Promotional section
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'No Pressure, But Do This',
                              style: AppTextStyles.titleLarge,
                            ),
                          ),
                          
                          const SizedBox(height: AppSpacing.md),
                          
                          // Promotional banner
                          Container(
                            height: 180,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(AppBorderRadius.large),
                              image: const DecorationImage(
                                image: NetworkImage(
                                  'https://images.unsplash.com/photo-1534438327276-14e5300c3a48',
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(AppBorderRadius.large),
                                gradient: LinearGradient(
                                  colors: [
                                    Colors.black.withOpacity(0.6),
                                    Colors.transparent,
                                  ],
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                ),
                              ),
                              padding: const EdgeInsets.all(AppSpacing.lg),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'WORK',
                                    style: TextStyle(
                                      fontSize: 48,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      height: 0.9,
                                    ),
                                  ),
                                  Text(
                                    'OUT',
                                    style: TextStyle(
                                      fontSize: 48,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      height: 0.9,
                                    ),
                                  ),
                                  const SizedBox(height: AppSpacing.xs),
                                  Text(
                                    'OK BYE.',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                        
                        // Placeholder for other segments
                        if (_selectedSegment == 1)
                          Center(
                            child: Padding(
                              padding: const EdgeInsets.all(AppSpacing.xl),
                              child: Text(
                                'Measurements view coming soon',
                                style: AppTextStyles.bodyLarge,
                              ),
                            ),
                          ),
                          
                        if (_selectedSegment == 2)
                          Center(
                            child: Padding(
                              padding: const EdgeInsets.all(AppSpacing.xl),
                              child: Text(
                                'Pictures view coming soon',
                                style: AppTextStyles.bodyLarge,
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
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
    );
  }
}
