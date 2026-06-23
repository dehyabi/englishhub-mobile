import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../models/sentence_model.dart';

class SentenceScreen extends StatelessWidget {
  const SentenceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = SentenceCategory.allCategories;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Sentences',
          style: GoogleFonts.inter(fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final category = categories[index];
          return _SentenceCategoryCard(category: category);
        },
      ),
    );
  }
}

class _SentenceCategoryCard extends StatelessWidget {
  final SentenceCategory category;

  const _SentenceCategoryCard({required this.category});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        contentPadding: const EdgeInsets.all(16),
        leading: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.blue.withOpacity(0.1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: const Icon(Icons.format_quote, color: Colors.blue),
        ),
        title: Text(
          category.name,
          style: GoogleFonts.inter(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 4),
            Text(
              category.indonesianName,
              style: GoogleFonts.inter(
                fontSize: 13,
                color: Colors.grey[600],
              ),
            ),
            const SizedBox(height: 8),
            Text(
              category.description,
              style: GoogleFonts.inter(
                fontSize: 12,
                color: Colors.grey[500],
              ),
            ),
          ],
        ),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: () => _navigateToCategory(context),
      ),
    );
  }

  void _navigateToCategory(BuildContext context) {
    // Navigate to sentence list for this category
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Coming soon: ${category.name} sentences')),
    );
  }
}
