import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../services/learning_provider.dart';
import '../../models/models.dart';
import '../../utils/app_theme.dart';
import 'widgets/vocabulary_card.dart';
import 'widgets/vocabulary_filter.dart';
import '../quiz/quiz_screen.dart';

class VocabularyScreen extends StatefulWidget {
  const VocabularyScreen({super.key});

  @override
  State<VocabularyScreen> createState() => _VocabularyScreenState();
}

class _VocabularyScreenState extends State<VocabularyScreen> {
  String _searchQuery = '';
  String _selectedFilter = 'all';

  @override
  Widget build(BuildContext context) {
    return Consumer<LearningProvider>(
      builder: (context, provider, child) {
        var vocabulary = provider.filteredVocabulary;

        // Apply search filter
        if (_searchQuery.isNotEmpty) {
          vocabulary = vocabulary
              .where((v) =>
                  v.english.toLowerCase().contains(_searchQuery.toLowerCase()) ||
                  v.indonesian.toLowerCase().contains(_searchQuery.toLowerCase()))
              .toList();
        }

        // Apply category filter
        if (_selectedFilter != 'all') {
          vocabulary = vocabulary.where((v) => v.category == _selectedFilter).toList();
        }

        return Scaffold(
          appBar: AppBar(
            title: Text(
              'Vocabulary',
              style: GoogleFonts.inter(fontWeight: FontWeight.bold),
            ),
            actions: [
              IconButton(
                icon: const Icon(Icons.filter_list),
                onPressed: () => _showFilterSheet(context),
                tooltip: 'Filter',
              ),
            ],
          ),
          body: Column(
            children: [
              // Search Bar
              Padding(
                padding: const EdgeInsets.all(16),
                child: TextField(
                  onChanged: (value) => setState(() => _searchQuery = value),
                  decoration: InputDecoration(
                    hintText: 'Search words...',
                    hintStyle: GoogleFonts.inter(color: Colors.grey[400]),
                    prefixIcon: const Icon(Icons.search),
                    suffixIcon: _searchQuery.isNotEmpty
                        ? IconButton(
                            icon: const Icon(Icons.clear),
                            onPressed: () => setState(() => _searchQuery = ''),
                          )
                        : null,
                  ),
                ),
              ),

              // Filter Chips
              VocabularyFilter(
                selectedFilter: _selectedFilter,
                onFilterSelected: (filter) => setState(() => _selectedFilter = filter),
              ),

              // Vocabulary List
              Expanded(
                child: vocabulary.isEmpty
                    ? _buildEmptyState()
                    : ListView.builder(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        itemCount: vocabulary.length,
                        itemBuilder: (context, index) {
                          final word = vocabulary[index];
                          return VocabularyCard(
                            word: word,
                            onTap: () => _showWordDetails(context, word),
                            onQuiz: () => _startWordQuiz(context, provider, word),
                          );
                        },
                      ),
              ),
            ],
          ),
          floatingActionButton: FloatingActionButton.extended(
            onPressed: () => _startVocabularyQuiz(context, provider),
            icon: const Icon(Icons.play_arrow),
            label: const Text('Practice'),
          ),
        );
      },
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.search_off, size: 64, color: Colors.grey[300]),
          const SizedBox(height: 16),
          Text(
            'No words found',
            style: GoogleFonts.inter(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Colors.grey[600],
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Try adjusting your search or filters',
            style: GoogleFonts.inter(
              fontSize: 14,
              color: Colors.grey[500],
            ),
          ),
        ],
      ),
    );
  }

  void _showFilterSheet(BuildContext context) {
    final categories = VocabularyCategory.allCategories;
    showModalBottomSheet(
      context: context,
      builder: (context) => Container(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Filter by Category',
              style: GoogleFonts.inter(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                FilterChip(
                  label: const Text('All'),
                  selected: _selectedFilter == 'all',
                  onSelected: (selected) {
                    setState(() => _selectedFilter = 'all');
                    Navigator.pop(context);
                  },
                ),
                ...categories.map((cat) => FilterChip(
                  label: Text(cat.name),
                  selected: _selectedFilter == cat.id,
                  onSelected: (selected) {
                    setState(() => _selectedFilter = cat.id);
                    Navigator.pop(context);
                  },
                  avatar: Icon(cat.icon, size: 18, color: cat.color),
                )),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _showWordDetails(BuildContext context, VocabularyWord word) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => Container(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: word.categoryIcon == Icons.web
                        ? Colors.blue.withOpacity(0.1)
                        : Colors.green.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(word.categoryIcon, color: AppTheme.primaryColor),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        word.english,
                        style: GoogleFonts.inter(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        word.pronunciation,
                        style: GoogleFonts.inter(
                          fontSize: 14,
                          color: Colors.grey[600],
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: word.masteryColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    word.masteryLevel.label,
                    style: GoogleFonts.inter(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: word.masteryColor,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Indonesian',
                    style: GoogleFonts.inter(
                      fontSize: 12,
                      color: Colors.grey[600],
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    word.indonesian,
                    style: GoogleFonts.inter(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            if (word.exampleSentence != null) ...[
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppTheme.primaryColor.withOpacity(0.05),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: AppTheme.primaryColor.withOpacity(0.2)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Example',
                      style: GoogleFonts.inter(
                        fontSize: 12,
                        color: AppTheme.primaryColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      word.exampleSentence!,
                      style: GoogleFonts.inter(fontSize: 15),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      word.exampleSentenceIndonesian!,
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        color: Colors.grey[600],
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ],
                ),
              ),
            ],
            if (word.synonyms.isNotEmpty) ...[
              const SizedBox(height: 16),
              Text(
                'Synonyms',
                style: GoogleFonts.inter(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey[600],
                ),
              ),
              const SizedBox(height: 8),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: word.synonyms.map((s) => Chip(
                  label: Text(s),
                  padding: EdgeInsets.zero,
                )).toList(),
              ),
            ],
            const SizedBox(height: 24),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.close),
                    label: const Text('Close'),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {
                      Navigator.pop(context);
                      _startWordQuiz(context, context.read<LearningProvider>(), word);
                    },
                    icon: const Icon(Icons.play_arrow),
                    label: const Text('Practice'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _startWordQuiz(BuildContext context, LearningProvider provider, VocabularyWord word) {
    provider.startQuiz(QuizType.vocabulary, wordIds: [word.id]);
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => const QuizScreen()),
    );
  }

  void _startVocabularyQuiz(BuildContext context, LearningProvider provider) {
    provider.startQuiz(QuizType.vocabulary, count: 10);
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const QuizScreen()),
    );
  }
}
