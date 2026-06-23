import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../models/models.dart';
import '../../../utils/app_theme.dart';

class VocabularyCard extends StatelessWidget {
  final VocabularyWord word;
  final VoidCallback onTap;
  final VoidCallback onQuiz;

  const VocabularyCard({
    super.key,
    required this.word,
    required this.onTap,
    required this.onQuiz,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              // Category Icon
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: _getCategoryColor().withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  word.categoryIcon,
                  color: _getCategoryColor(),
                  size: 24,
                ),
              ),
              const SizedBox(width: 16),

              // Word Info
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          word.english,
                          style: GoogleFonts.inter(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(width: 8),
                        if (word.pronunciation.isNotEmpty)
                          Text(
                            word.pronunciation,
                            style: GoogleFonts.inter(
                              fontSize: 12,
                              color: Colors.grey[500],
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(
                      word.indonesian,
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              ),

              // Mastery Indicator
              Column(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: word.masteryColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      word.masteryLevel.label,
                      style: GoogleFonts.inter(
                        fontSize: 10,
                        fontWeight: FontWeight.w600,
                        color: word.masteryColor,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.repeat,
                        size: 12,
                        color: Colors.grey[400],
                      ),
                      const SizedBox(width: 4),
                      Text(
                        '${word.reviewCount}',
                        style: GoogleFonts.inter(
                          fontSize: 10,
                          color: Colors.grey[500],
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              const SizedBox(width: 12),

              // Practice Button
              IconButton(
                onPressed: onQuiz,
                icon: const Icon(Icons.play_arrow),
                style: IconButton.styleFrom(
                  backgroundColor: AppTheme.primaryColor,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.all(8),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Color _getCategoryColor() {
    switch (word.category) {
      case 'frontend':
        return Colors.blue;
      case 'backend':
        return Colors.green;
      case 'ai':
        return Colors.purple;
      case 'devops':
        return Colors.orange;
      case 'database':
        return Colors.teal;
      case 'api':
        return Colors.indigo;
      case 'daily':
        return Colors.pink;
      case 'business':
        return Colors.amber;
      default:
        return Colors.grey;
    }
  }
}
