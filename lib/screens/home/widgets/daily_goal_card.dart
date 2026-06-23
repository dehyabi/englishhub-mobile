import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import '../../../utils/app_theme.dart';

class DailyGoalCard extends StatelessWidget {
  final Map<String, dynamic> stats;

  const DailyGoalCard({super.key, required this.stats});

  @override
  Widget build(BuildContext context) {
    final percentage = stats['percentage'] as double;
    final wordsReviewed = stats['wordsReviewed'] as int;
    final dailyGoal = stats['dailyGoal'] as int;

    return Card(
      elevation: 2,
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              AppTheme.primaryColor,
              AppTheme.primaryLight,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Daily Goal',
                        style: GoogleFonts.inter(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Target: $dailyGoal words/day',
                        style: GoogleFonts.inter(
                          fontSize: 12,
                          color: Colors.white70,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      '$wordsReviewed/$dailyGoal',
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              LinearPercentIndicator(
                percent: percentage / 100,
                lineHeight: 8,
                backgroundColor: Colors.white.withOpacity(0.3),
                progressColor: Colors.white,
                barRadius: const Radius.circular(4),
                padding: EdgeInsets.zero,
              ),
              const SizedBox(height: 12),
              if (percentage >= 100)
                Row(
                  children: [
                    Icon(Icons.celebration, color: Colors.amber[300], size: 20),
                    const SizedBox(width: 8),
                    Text(
                      'Goal completed! Great job! 🎉',
                      style: GoogleFonts.inter(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ],
                )
              else
                Text(
                  '${dailyGoal - wordsReviewed} more words to reach your goal',
                  style: GoogleFonts.inter(
                    fontSize: 13,
                    color: Colors.white.withOpacity(0.9),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
