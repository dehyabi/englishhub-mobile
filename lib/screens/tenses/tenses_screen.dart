import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../models/tense_model.dart';

class TensesScreen extends StatelessWidget {
  const TensesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final tenses = TensesData.allTenses;

    // Group by time
    final presentTenses = tenses.where((t) => t.time == TenseTime.present).toList();
    final pastTenses = tenses.where((t) => t.time == TenseTime.past).toList();
    final futureTenses = tenses.where((t) => t.time == TenseTime.future).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Tenses',
          style: GoogleFonts.inter(fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _TenseSection(
            title: 'Present Tenses',
            indonesianTitle: 'Masa Kini',
            icon: Icons.today,
            color: Colors.blue,
            tenses: presentTenses,
          ),
          const SizedBox(height: 24),
          _TenseSection(
            title: 'Past Tenses',
            indonesianTitle: 'Masa Lalu',
            icon: Icons.history,
            color: Colors.orange,
            tenses: pastTenses,
          ),
          const SizedBox(height: 24),
          _TenseSection(
            title: 'Future Tenses',
            indonesianTitle: 'Masa Depan',
            icon: Icons.arrow_forward,
            color: Colors.green,
            tenses: futureTenses,
          ),
        ],
      ),
    );
  }
}

class _TenseSection extends StatelessWidget {
  final String title;
  final String indonesianTitle;
  final IconData icon;
  final Color color;
  final List<Tense> tenses;

  const _TenseSection({
    required this.title,
    required this.indonesianTitle,
    required this.icon,
    required this.color,
    required this.tenses,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: color.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(icon, color: color, size: 20),
            ),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.inter(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  indonesianTitle,
                  style: GoogleFonts.inter(
                    fontSize: 12,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 12),
        ...tenses.map((tense) => _TenseCard(tense: tense)),
      ],
    );
  }
}

class _TenseCard extends StatelessWidget {
  final Tense tense;

  const _TenseCard({required this.tense});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      child: InkWell(
        onTap: () => _showTenseDetails(context),
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: tense.color.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Icon(
                      _getAspectIcon(tense.aspect),
                      color: tense.color,
                      size: 20,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          tense.name,
                          style: GoogleFonts.inter(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          tense.indonesianName,
                          style: GoogleFonts.inter(
                            fontSize: 13,
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey[400]),
                ],
              ),
              const SizedBox(height: 12),
              Text(
                tense.formula,
                style: GoogleFonts.inter(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  IconData _getAspectIcon(TenseAspect aspect) {
    switch (aspect) {
      case TenseAspect.simple:
        return Icons.check_circle_outline;
      case TenseAspect.continuous:
        return Icons.trending_up;
      case TenseAspect.perfect:
        return Icons.check_circle;
      case TenseAspect.perfectContinuous:
        return Icons.trending_flat;
    }
  }

  void _showTenseDetails(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => _TenseDetailSheet(tense: tense),
    );
  }
}

class _TenseDetailSheet extends StatelessWidget {
  final Tense tense;

  const _TenseDetailSheet({required this.tense});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * 0.85,
      ),
      child: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          // Header
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: tense.color.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(Icons.school, color: tense.color, size: 28),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      tense.name,
                      style: GoogleFonts.inter(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      tense.indonesianName,
                      style: GoogleFonts.inter(
                        fontSize: 15,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),

          // Usage
          _InfoSection(
            title: 'Usage / Penggunaan',
            content: tense.usage,
            indonesianContent: tense.indonesianUsage,
            icon: Icons.info_outline,
          ),
          const SizedBox(height: 16),

          // Formula
          _InfoSection(
            title: 'Formula',
            content: tense.formula,
            indonesianContent: tense.indonesianFormula,
            icon: Icons.calculate,
            isFormula: true,
          ),
          const SizedBox(height: 16),

          // Signal Words
          if (tense.signalWords.isNotEmpty) ...[
            _InfoSection(
              title: 'Signal Words / Kata Kunci',
              content: tense.signalWords.join(', '),
              indonesianContent: tense.indonesianSignalWords.join(', '),
              icon: Icons.flag,
            ),
            const SizedBox(height: 16),
          ],

          // Examples
          Text(
            'Examples / Contoh',
            style: GoogleFonts.inter(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          ...tense.examples.map((example) => _ExampleCard(example: example)),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}

class _InfoSection extends StatelessWidget {
  final String title;
  final String content;
  final String? indonesianContent;
  final IconData icon;
  final bool isFormula;

  const _InfoSection({
    required this.title,
    required this.content,
    this.indonesianContent,
    required this.icon,
    this.isFormula = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(icon, size: 16, color: Colors.grey[600]),
            const SizedBox(width: 8),
            Text(
              title,
              style: GoogleFonts.inter(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Colors.grey[600],
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
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
                content,
                style: GoogleFonts.inter(
                  fontSize: 15,
                  fontWeight: isFormula ? FontWeight.w600 : FontWeight.normal,
                ),
              ),
              if (indonesianContent != null) ...[
                const SizedBox(height: 8),
                Text(
                  indonesianContent!,
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    color: Colors.grey[600],
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ],
            ],
          ),
        ),
      ],
    );
  }
}

class _ExampleCard extends StatelessWidget {
  final TenseExample example;

  const _ExampleCard({required this.example});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: example.isQuestion
            ? Colors.blue[50]
            : example.isNegative
                ? Colors.red[50]
                : Colors.grey[100],
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: example.isQuestion
              ? Colors.blue[200]!
              : example.isNegative
                  ? Colors.red[200]!
                  : Colors.transparent,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (example.isQuestion || example.isNegative) ...[
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
              decoration: BoxDecoration(
                color: example.isQuestion ? Colors.blue[100] : Colors.red[100],
                borderRadius: BorderRadius.circular(4),
              ),
              child: Text(
                example.isQuestion ? 'Question' : 'Negative',
                style: GoogleFonts.inter(
                  fontSize: 10,
                  fontWeight: FontWeight.w600,
                  color: example.isQuestion ? Colors.blue[800] : Colors.red[800],
                ),
              ),
            ),
            const SizedBox(height: 8),
          ],
          Text(
            example.english,
            style: GoogleFonts.inter(
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            example.indonesian,
            style: GoogleFonts.inter(
              fontSize: 13,
              color: Colors.grey[600],
              fontStyle: FontStyle.italic,
            ),
          ),
        ],
      ),
    );
  }
}
