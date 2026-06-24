import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../services/learning_provider.dart';
import '../../models/models.dart';
import '../vocabulary/vocabulary_screen.dart';
import '../sentences/sentence_screen.dart';
import '../conversation/conversation_screen.dart';
import '../tenses/tenses_screen.dart';
import '../quiz/quiz_screen.dart';
import 'widgets/category_card.dart';
import 'widgets/stats_card.dart';
import 'widgets/daily_goal_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const HomeContent(),
    const VocabularyScreen(),
    const SentenceScreen(),
    const ConversationScreen(),
    const TensesScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: (index) => setState(() => _selectedIndex = index),
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.book_outlined),
            selectedIcon: Icon(Icons.book),
            label: 'Vocab',
          ),
          NavigationDestination(
            icon: Icon(Icons.format_quote_outlined),
            selectedIcon: Icon(Icons.format_quote),
            label: 'Sentences',
          ),
          NavigationDestination(
            icon: Icon(Icons.people_outlined),
            selectedIcon: Icon(Icons.people),
            label: 'Talk',
          ),
          NavigationDestination(
            icon: Icon(Icons.schedule_outlined),
            selectedIcon: Icon(Icons.schedule),
            label: 'Tenses',
          ),
        ],
      ),
    );
  }
}

class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<LearningProvider>(
      builder: (context, provider, child) {
        if (provider.isLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        return CustomScrollView(
          slivers: [
            // App Bar
            SliverAppBar(
              floating: true,
              title: Text(
                'EnglishHub',
                style: GoogleFonts.inter(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              actions: [
                IconButton(
                  icon: const Icon(Icons.quiz),
                  onPressed: () => _startQuickQuiz(context, provider),
                  tooltip: 'Quick Quiz',
                ),
                IconButton(
                  icon: const Icon(Icons.notifications_outlined),
                  onPressed: () {},
                  tooltip: 'Notifications',
                ),
              ],
            ),

            // Content
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Daily Goal Card
                    DailyGoalCard(stats: provider.dailyStats),
                    const SizedBox(height: 16),

                    // Stats Row
                    Row(
                      children: [
                        Expanded(
                          child: StatsCard(
                            title: 'Words Learned',
                            value: provider.vocabulary
                                .where((v) => v.masteryLevel != MasteryLevel.newbie)
                                .length
                                .toString(),
                            icon: Icons.school,
                            color: Colors.blue,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: StatsCard(
                            title: 'Level',
                            value: provider.userProgress?.level.toString() ?? '1',
                            icon: Icons.star,
                            color: Colors.amber,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: StatsCard(
                            title: 'Streak',
                            value: '${provider.userProgress?.streak ?? 0}🔥',
                            icon: Icons.local_fire_department,
                            color: Colors.orange,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),

                    // Continue Learning Section
                    Text(
                      'Continue Learning',
                      style: GoogleFonts.inter(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 12),

                    // Category Grid
                    GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 1.1,
                        crossAxisSpacing: 12,
                        mainAxisSpacing: 12,
                      ),
                      itemCount: provider.categoryStats.length,
                      itemBuilder: (context, index) {
                        final stat = provider.categoryStats[index];
                        return CategoryCard(
                          category: stat['category'] as VocabularyCategory,
                          total: stat['total'] as int,
                          learned: stat['learned'] as int,
                          percentage: stat['percentage'] as double,
                          onTap: () {
                            provider.setSelectedCategory(stat['category']!.id);
                            // Navigate to vocabulary with filter
                          },
                        );
                      },
                    ),
                    const SizedBox(height: 24),

                    // Quick Actions
                    Text(
                      'Quick Practice',
                      style: GoogleFonts.inter(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        Expanded(
                          child: _QuickActionCard(
                            icon: Icons.play_arrow,
                            label: 'Review',
                            color: Colors.green,
                            onTap: () => _startReviewSession(context, provider),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: _QuickActionCard(
                            icon: Icons.auto_awesome,
                            label: 'New Words',
                            color: Colors.purple,
                            onTap: () => _startNewWordsSession(context, provider),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  void _startQuickQuiz(BuildContext context, LearningProvider provider) {
    provider.startQuiz(QuizType.mixed, count: 5);
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const QuizScreen()),
    );
  }

  void _startReviewSession(BuildContext context, LearningProvider provider) {
    final dueWords = provider.wordsDueForReview;
    if (dueWords.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('No words due for review! 🎉')),
      );
      return;
    }
    provider.startQuiz(
      QuizType.vocabulary,
      wordIds: dueWords.map((w) => w.id).toList(),
    );
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const QuizScreen()),
    );
  }

  void _startNewWordsSession(BuildContext context, LearningProvider provider) {
    final newWords = provider.vocabulary
        .where((v) => v.masteryLevel == MasteryLevel.newbie)
        .take(5)
        .toList();
    if (newWords.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('You\'ve learned all words! 🎉')),
      );
      return;
    }
    provider.startQuiz(
      QuizType.vocabulary,
      wordIds: newWords.map((w) => w.id).toList(),
    );
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const QuizScreen()),
    );
  }
}

class _QuickActionCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;
  final VoidCallback onTap;

  const _QuickActionCard({
    required this.icon,
    required this.label,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: color.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(icon, color: color, size: 28),
              ),
              const SizedBox(height: 8),
              Text(
                label,
                style: GoogleFonts.inter(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
