import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../services/learning_provider.dart';
import '../../models/models.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;

  bool _showAnswer = false;
  bool _answered = false;
  bool _isCorrect = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _fadeAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    );
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<LearningProvider>(
      builder: (context, provider, child) {
        final quiz = provider.currentQuiz;

        if (quiz == null || quiz.isComplete) {
          return _buildQuizCompleteScreen(provider);
        }

        final currentWord = quiz.currentWord;
        if (currentWord == null) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        return Scaffold(
          appBar: AppBar(
            title: Text('Question ${quiz.currentQuestionIndex + 1}/${quiz.totalQuestions}'),
            leading: IconButton(
              icon: const Icon(Icons.close),
              onPressed: () => _confirmExit(context, provider),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              children: [
                // Progress Bar
                LinearProgressIndicator(
                  value: (quiz.currentQuestionIndex + 1) / quiz.totalQuestions,
                  backgroundColor: Colors.grey[200],
                  valueColor: const AlwaysStoppedAnimation<Color>(AppTheme.primaryColor),
                ),
                const SizedBox(height: 32),

                // Question Card
                Expanded(
                  child: FadeTransition(
                    opacity: _fadeAnimation,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Category Badge
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                          decoration: BoxDecoration(
                            color: _getCategoryColor(currentWord.category).withOpacity(0.1),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                currentWord.categoryIcon,
                                size: 14,
                                color: _getCategoryColor(currentWord.category),
                              ),
                              const SizedBox(width: 4),
                              Text(
                                currentWord.category,
                                style: GoogleFonts.inter(
                                  fontSize: 12,
                                  color: _getCategoryColor(currentWord.category),
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 24),

                        // Question
                        Text(
                          'What is the Indonesian meaning of:',
                          style: GoogleFonts.inter(
                            fontSize: 16,
                            color: Colors.grey[600],
                          ),
                        ),
                        const SizedBox(height: 16),

                        // Word
                        Text(
                          currentWord.english,
                          style: GoogleFonts.inter(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        if (currentWord.pronunciation.isNotEmpty) ...[
                          const SizedBox(height: 8),
                          Text(
                            currentWord.pronunciation,
                            style: GoogleFonts.inter(
                              fontSize: 16,
                              color: Colors.grey[500],
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        ],
                        const SizedBox(height: 32),

                        // Answer Section
                        if (_showAnswer) ...[
                          Container(
                            padding: const EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              color: _isCorrect
                                  ? Colors.green.withOpacity(0.1)
                                  : Colors.red.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(
                                color: _isCorrect ? Colors.green : Colors.red,
                                width: 2,
                              ),
                            ),
                            child: Column(
                              children: [
                                Icon(
                                  _isCorrect ? Icons.check_circle : Icons.error,
                                  color: _isCorrect ? Colors.green : Colors.red,
                                  size: 48,
                                ),
                                const SizedBox(height: 12),
                                Text(
                                  _isCorrect ? 'Correct! 🎉' : 'Not quite',
                                  style: GoogleFonts.inter(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: _isCorrect ? Colors.green : Colors.red,
                                  ),
                                ),
                                const SizedBox(height: 16),
                                Text(
                                  currentWord.indonesian,
                                  style: GoogleFonts.inter(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                if (currentWord.exampleSentence != null) ...[
                                  const SizedBox(height: 16),
                                  Container(
                                    padding: const EdgeInsets.all(12),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Column(
                                      children: [
                                        Text(
                                          currentWord.exampleSentence!,
                                          style: GoogleFonts.inter(fontSize: 14),
                                          textAlign: TextAlign.center,
                                        ),
                                        const SizedBox(height: 4),
                                        Text(
                                          currentWord.exampleSentenceIndonesian!,
                                          style: GoogleFonts.inter(
                                            fontSize: 13,
                                            color: Colors.grey[600],
                                            fontStyle: FontStyle.italic,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ],
                            ),
                          ),
                        ] else ...[
                          // Answer Options (if multiple choice) or Show Answer button
                          ElevatedButton(
                            onPressed: () {
                              setState(() => _showAnswer = true);
                            },
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                            ),
                            child: Text(
                              'Show Answer',
                              style: GoogleFonts.inter(fontSize: 16),
                            ),
                          ),
                        ],
                      ],
                    ),
                  ),
                ),

                // Action Buttons
                if (_showAnswer && !_answered) ...[
                  const SizedBox(height: 24),
                  Row(
                    children: [
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () {
                            setState(() {
                              _isCorrect = false;
                              _answered = true;
                            });
                            provider.submitQuizAnswer(currentWord.id, false);
                            _nextQuestion();
                          },
                          style: OutlinedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            side: const BorderSide(color: Colors.red),
                          ),
                          child: Text(
                            'I didn\'t know it',
                            style: GoogleFonts.inter(
                              fontSize: 14,
                              color: Colors.red,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              _isCorrect = true;
                              _answered = true;
                            });
                            provider.submitQuizAnswer(currentWord.id, true);
                            _nextQuestion();
                          },
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            backgroundColor: Colors.green,
                          ),
                          child: Text(
                            'I knew it!',
                            style: GoogleFonts.inter(
                              fontSize: 14,
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ] else if (_answered) ...[
                  const SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: _nextQuestion,
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 16),
                    ),
                    child: Text(
                      quiz.currentQuestionIndex >= quiz.totalQuestions - 1
                          ? 'See Results'
                          : 'Next Question',
                      style: GoogleFonts.inter(fontSize: 16),
                    ),
                  ),
                ],
              ],
            ),
          ),
        );
      },
    );
  }

  void _nextQuestion() {
    setState(() {
      _showAnswer = false;
      _answered = false;
      _isCorrect = false;
    });
    _animationController.reset();
    _animationController.forward();
  }

  Widget _buildQuizCompleteScreen(LearningProvider provider) {
    final quiz = provider.currentQuiz;
    final score = quiz?.scorePercentage ?? 0;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                score >= 80 ? Icons.celebration : Icons.school,
                size: 80,
                color: score >= 80 ? Colors.amber : AppTheme.primaryColor,
              ),
              const SizedBox(height: 24),
              Text(
                score >= 80 ? 'Great Job!' : 'Keep Practicing!',
                style: GoogleFonts.inter(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'You scored ${quiz?.correctAnswers} out of ${quiz?.totalQuestions}',
                style: GoogleFonts.inter(
                  fontSize: 16,
                  color: Colors.grey[600],
                ),
              ),
              const SizedBox(height: 32),
              SizedBox(
                width: 200,
                height: 200,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    SizedBox(
                      width: 200,
                      height: 200,
                      child: CircularProgressIndicator(
                        value: score / 100,
                        strokeWidth: 12,
                        backgroundColor: Colors.grey[200],
                        valueColor: AlwaysStoppedAnimation<Color>(
                          score >= 80 ? Colors.green : AppTheme.primaryColor,
                        ),
                      ),
                    ),
                    Text(
                      '${score.toInt()}%',
                      style: GoogleFonts.inter(
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 48),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {
                        provider.endQuiz();
                        Navigator.pop(context);
                      },
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                      ),
                      child: const Text('Back to Home'),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        provider.startQuiz(QuizType.vocabulary, count: 10);
                        setState(() {
                          _showAnswer = false;
                          _answered = false;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                      ),
                      child: const Text('Practice Again'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _confirmExit(BuildContext context, LearningProvider provider) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Exit Quiz?'),
        content: const Text('Your progress will be lost.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              provider.endQuiz();
              Navigator.pop(context); // Close dialog
              Navigator.pop(context); // Close quiz screen
            },
            child: const Text('Exit', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }

  Color _getCategoryColor(String category) {
    switch (category) {
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
        return AppTheme.primaryColor;
    }
  }
}
