import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../models/conversation_model.dart';
import '../../services/conversation_data.dart';

class ConversationScreen extends StatelessWidget {
  const ConversationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = ConversationCategory.allCategories;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Conversations',
          style: GoogleFonts.inter(fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final category = categories[index];
          final conversations = ConversationData.getByCategory(category.id);

          return _ConversationCategoryCard(
            category: category,
            conversationCount: conversations.length,
            onTap: () => _navigateToConversations(context, category),
          );
        },
      ),
    );
  }

  void _navigateToConversations(BuildContext context, ConversationCategory category) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => ConversationListScreen(category: category),
      ),
    );
  }
}

class _ConversationCategoryCard extends StatelessWidget {
  final ConversationCategory category;
  final int conversationCount;
  final VoidCallback onTap;

  const _ConversationCategoryCard({
    required this.category,
    required this.conversationCount,
    required this.onTap,
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
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: _getCategoryColor(category.id).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  _getCategoryIcon(category.id),
                  color: _getCategoryColor(category.id),
                  size: 24,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      category.name,
                      style: GoogleFonts.inter(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      category.indonesianName,
                      style: GoogleFonts.inter(
                        fontSize: 13,
                        color: Colors.grey[600],
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Icon(Icons.play_circle_outline, size: 14, color: Colors.grey[500]),
                        const SizedBox(width: 4),
                        Text(
                          '$conversationCount conversations',
                          style: GoogleFonts.inter(
                            fontSize: 12,
                            color: Colors.grey[500],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const Icon(Icons.arrow_forward_ios, size: 16),
            ],
          ),
        ),
      ),
    );
  }

  IconData _getCategoryIcon(String categoryId) {
    switch (categoryId) {
      case 'daily_standup':
        return Icons.daily_routine;
      case 'code_review':
        return Icons.code;
      case 'team_meeting':
        return Icons.people;
      case 'client_call':
        return Icons.phone;
      case 'technical_interview':
        return Icons.engineering;
      case 'pair_programming':
        return Icons.people_outline;
      case 'bug_discussion':
        return Icons.bug_report;
      case 'ai_project':
        return Icons.psychology;
      case 'casual_chat':
        return Icons.chat;
      default:
        return Icons.chat_bubble_outline;
    }
  }

  Color _getCategoryColor(String categoryId) {
    switch (categoryId) {
      case 'daily_standup':
        return Colors.blue;
      case 'code_review':
        return Colors.green;
      case 'team_meeting':
        return Colors.purple;
      case 'client_call':
        return Colors.orange;
      case 'technical_interview':
        return Colors.red;
      case 'pair_programming':
        return Colors.teal;
      case 'bug_discussion':
        return Colors.amber;
      case 'ai_project':
        return Colors.pink;
      case 'casual_chat':
        return Colors.indigo;
      default:
        return Colors.blue;
    }
  }
}

class ConversationListScreen extends StatelessWidget {
  final ConversationCategory category;

  const ConversationListScreen({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    final conversations = ConversationData.getByCategory(category.id);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          category.name,
          style: GoogleFonts.inter(fontWeight: FontWeight.bold),
        ),
      ),
      body: conversations.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.construction, size: 64, color: Colors.grey[300]),
                  const SizedBox(height: 16),
                  Text(
                    'Coming Soon',
                    style: GoogleFonts.inter(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey[600],
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Conversations for this category are being prepared',
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      color: Colors.grey[500],
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: conversations.length,
              itemBuilder: (context, index) {
                final conv = conversations[index];
                return _ConversationCard(conversation: conv);
              },
            ),
    );
  }
}

class _ConversationCard extends StatelessWidget {
  final Conversation conversation;

  const _ConversationCard({required this.conversation});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: InkWell(
        onTap: () => _startConversation(context),
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      conversation.title,
                      style: GoogleFonts.inter(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  _DifficultyBadge(difficulty: conversation.difficulty),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                conversation.description,
                style: GoogleFonts.inter(
                  fontSize: 13,
                  color: Colors.grey[600],
                ),
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Icon(Icons.access_time, size: 14, color: Colors.grey[400]),
                  const SizedBox(width: 4),
                  Text(
                    '${conversation.duration}s',
                    style: GoogleFonts.inter(
                      fontSize: 12,
                      color: Colors.grey[500],
                    ),
                  ),
                  const SizedBox(width: 16),
                  Icon(Icons.people, size: 14, color: Colors.grey[400]),
                  const SizedBox(width: 4),
                  Text(
                    '${conversation.scenario.participants.length} participants',
                    style: GoogleFonts.inter(
                      fontSize: 12,
                      color: Colors.grey[500],
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

  void _startConversation(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => ConversationDetailScreen(conversation: conversation),
      ),
    );
  }
}

class _DifficultyBadge extends StatelessWidget {
  final DifficultyLevel difficulty;

  const _DifficultyBadge({required this.difficulty});

  @override
  Widget build(BuildContext context) {
    final color = _getDifficultyColor(difficulty);
    final label = difficulty.label;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        label,
        style: GoogleFonts.inter(
          fontSize: 10,
          fontWeight: FontWeight.w600,
          color: color,
        ),
      ),
    );
  }

  Color _getDifficultyColor(DifficultyLevel level) {
    switch (level) {
      case DifficultyLevel.beginner:
        return Colors.green;
      case DifficultyLevel.elementary:
        return Colors.lightGreen;
      case DifficultyLevel.intermediate:
        return Colors.orange;
      case DifficultyLevel.upperIntermediate:
        return Colors.deepOrange;
      case DifficultyLevel.advanced:
        return Colors.red;
    }
  }
}

class ConversationDetailScreen extends StatelessWidget {
  final Conversation conversation;

  const ConversationDetailScreen({super.key, required this.conversation});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          conversation.title,
          style: GoogleFonts.inter(fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Scenario Card
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Scenario',
                    style: GoogleFonts.inter(
                      fontSize: 12,
                      color: Colors.grey[600],
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    conversation.scenario.context,
                    style: GoogleFonts.inter(fontSize: 15),
                  ),
                  const SizedBox(height: 12),
                  Wrap(
                    spacing: 8,
                    children: conversation.scenario.participants
                        .map((p) => Chip(
                              label: Text(p, style: const TextStyle(fontSize: 12)),
                              padding: EdgeInsets.zero,
                            ))
                        .toList(),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),

          // Learning Points
          if (conversation.learningPoints.isNotEmpty) ...[
            Text(
              'Learning Points',
              style: GoogleFonts.inter(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            ...conversation.learningPoints.map((point) => _LearningPointCard(point: point)),
            const SizedBox(height: 16),
          ],

          // Conversation Messages
          Text(
            'Conversation',
            style: GoogleFonts.inter(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          ...conversation.messages.map((msg) => _MessageCard(message: msg)),

          const SizedBox(height: 80),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Audio feature coming soon!')),
          );
        },
        icon: const Icon(Icons.play_arrow),
        label: const Text('Practice'),
      ),
    );
  }
}

class _LearningPointCard extends StatelessWidget {
  final LearningPoint point;

  const _LearningPointCard({required this.point});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(_getPointTypeIcon(point.type), size: 16, color: Colors.blue),
                const SizedBox(width: 8),
                Text(
                  point.title,
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              point.explanation,
              style: GoogleFonts.inter(fontSize: 13),
            ),
            const SizedBox(height: 4),
            Text(
              point.indonesianExplanation,
              style: GoogleFonts.inter(
                fontSize: 12,
                color: Colors.grey[600],
                fontStyle: FontStyle.italic,
              ),
            ),
          ],
        ),
      ),
    );
  }

  IconData _getPointTypeIcon(LearningPointType type) {
    switch (type) {
      case LearningPointType.grammar:
        return Icons.rule;
      case LearningPointType.vocabulary:
        return Icons.book;
      case LearningPointType.pronunciation:
        return Icons.volume_up;
      case LearningPointType.culture:
        return Icons.public;
      case LearningPointType.expression:
        return Icons.chat;
      case LearningPointType.formalInformal:
        return Icons.compare;
    }
  }
}

class _MessageCard extends StatelessWidget {
  final ConversationMessage message;

  const _MessageCard({required this.message});

  @override
  Widget build(BuildContext context) {
    final isUser = message.speaker == 'You';

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundColor: isUser ? Colors.blue : Colors.grey[300],
                radius: 16,
                child: Text(
                  message.speaker[0],
                  style: const TextStyle(color: Colors.white, fontSize: 12),
                ),
              ),
              const SizedBox(width: 8),
              Text(
                '${message.speaker} (${message.speakerRole})',
                style: GoogleFonts.inter(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: isUser ? Colors.blue[50] : Colors.grey[100],
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  message.english,
                  style: GoogleFonts.inter(fontSize: 14),
                ),
                const SizedBox(height: 8),
                Text(
                  message.indonesian,
                  style: GoogleFonts.inter(
                    fontSize: 13,
                    color: Colors.grey[600],
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ],
            ),
          ),
          if (message.notes.isNotEmpty) ...[
            const SizedBox(height: 8),
            ...message.notes.map((note) => _MessageNote(note: note)),
          ],
        ],
      ),
    );
  }
}

class _MessageNote extends StatelessWidget {
  final MessageNote note;

  const _MessageNote({required this.note});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.amber[50],
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.amber[200]!),
      ),
      child: Row(
        children: [
          Icon(Icons.lightbulb_outline, size: 14, color: Colors.amber[700]),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              note.content,
              style: GoogleFonts.inter(
                fontSize: 11,
                color: Colors.amber[800],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
