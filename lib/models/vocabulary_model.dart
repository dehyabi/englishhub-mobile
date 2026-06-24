import 'package:flutter/material.dart';

/// Represents a vocabulary word with English-Indonesian translation
class VocabularyWord {
  final String id;
  final String english;
  final String indonesian;
  final String pronunciation;
  final String category;
  final String? exampleSentence;
  final String? exampleSentenceIndonesian;
  final List<String> synonyms;
  final List<String> relatedWords;
  final MasteryLevel masteryLevel;
  final int reviewCount;
  final DateTime? lastReviewed;

  VocabularyWord({
    required this.id,
    required this.english,
    required this.indonesian,
    this.pronunciation = '',
    this.category = 'general',
    this.exampleSentence,
    this.exampleSentenceIndonesian,
    this.synonyms = const [],
    this.relatedWords = const [],
    this.masteryLevel = MasteryLevel.newbie,
    this.reviewCount = 0,
    this.lastReviewed,
  });

  VocabularyWord copyWith({
    String? id,
    String? english,
    String? indonesian,
    String? pronunciation,
    String? category,
    String? exampleSentence,
    String? exampleSentenceIndonesian,
    List<String>? synonyms,
    List<String>? relatedWords,
    MasteryLevel? masteryLevel,
    int? reviewCount,
    DateTime? lastReviewed,
  }) {
    return VocabularyWord(
      id: id ?? this.id,
      english: english ?? this.english,
      indonesian: indonesian ?? this.indonesian,
      pronunciation: pronunciation ?? this.pronunciation,
      category: category ?? this.category,
      exampleSentence: exampleSentence ?? this.exampleSentence,
      exampleSentenceIndonesian:
          exampleSentenceIndonesian ?? this.exampleSentenceIndonesian,
      synonyms: synonyms ?? this.synonyms,
      relatedWords: relatedWords ?? this.relatedWords,
      masteryLevel: masteryLevel ?? this.masteryLevel,
      reviewCount: reviewCount ?? this.reviewCount,
      lastReviewed: lastReviewed ?? this.lastReviewed,
    );
  }

  /// Get color based on mastery level
  Color get masteryColor => masteryLevel.color;

  /// Get icon based on category
  IconData get categoryIcon {
    switch (category) {
      case 'frontend':
        return Icons.web;
      case 'backend':
        return Icons.storage;
      case 'ai':
        return Icons.psychology;
      case 'devops':
        return Icons.cloud;
      case 'database':
        return Icons.table_chart;
      case 'api':
        return Icons.http;
      case 'daily':
        return Icons.chat;
      case 'business':
        return Icons.business;
      default:
        return Icons.book;
    }
  }
}

/// Mastery levels for tracking learning progress
enum MasteryLevel {
  newbie(0, 'Newbie', Colors.grey),
  learning(1, 'Learning', Colors.blue),
  familiar(2, 'Familiar', Colors.green),
  proficient(3, 'Proficient', Colors.orange),
  master(4, 'Master', Colors.red);

  final int value;
  final String label;
  final Color color;

  const MasteryLevel(this.value, this.label, this.color);

  /// Calculate mastery percentage
  double get percentage => (value / 4) * 100;
}

/// Category metadata for organizing vocabulary
class VocabularyCategory {
  final String id;
  final String name;
  final String indonesianName;
  final IconData icon;
  final Color color;
  final String description;

  const VocabularyCategory({
    required this.id,
    required this.name,
    required this.indonesianName,
    required this.icon,
    required this.color,
    required this.description,
  });

  static List<VocabularyCategory> get allCategories => [
        VocabularyCategory(
          id: 'frontend',
          name: 'Frontend Development',
          indonesianName: 'Pengembangan Frontend',
          icon: Icons.web,
          color: Colors.blue,
          description: 'HTML, CSS, JavaScript, React, Vue, etc.',
        ),
        VocabularyCategory(
          id: 'backend',
          name: 'Backend Development',
          indonesianName: 'Pengembangan Backend',
          icon: Icons.storage,
          color: Colors.green,
          description: 'Server, API, Database, Authentication, etc.',
        ),
        VocabularyCategory(
          id: 'ai',
          name: 'Artificial Intelligence',
          indonesianName: 'Kecerdasan Buatan',
          icon: Icons.psychology,
          color: Colors.purple,
          description: 'ML, Neural Networks, LLM, NLP, etc.',
        ),
        VocabularyCategory(
          id: 'devops',
          name: 'DevOps & Cloud',
          indonesianName: 'DevOps & Cloud',
          icon: Icons.cloud,
          color: Colors.orange,
          description: 'CI/CD, Docker, Kubernetes, AWS, etc.',
        ),
        VocabularyCategory(
          id: 'database',
          name: 'Database',
          indonesianName: 'Basis Data',
          icon: Icons.table_chart,
          color: Colors.teal,
          description: 'SQL, NoSQL, Queries, Indexing, etc.',
        ),
        VocabularyCategory(
          id: 'api',
          name: 'API & Integration',
          indonesianName: 'API & Integrasi',
          icon: Icons.http,
          color: Colors.indigo,
          description: 'REST, GraphQL, Webhooks, etc.',
        ),
        VocabularyCategory(
          id: 'daily',
          name: 'Daily Conversation',
          indonesianName: 'Percakapan Sehari-hari',
          icon: Icons.chat,
          color: Colors.pink,
          description: 'Common phrases for daily use',
        ),
        VocabularyCategory(
          id: 'business',
          name: 'Business English',
          indonesianName: 'Bahasa Inggris Bisnis',
          icon: Icons.business,
          color: Colors.amber,
          description: 'Meetings, presentations, emails, etc.',
        ),
      ];
}
