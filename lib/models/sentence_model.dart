/// Represents a sentence for learning with translation
class Sentence {
  final String id;
  final String english;
  final String indonesian;
  final String category;
  final String? context;
  final List<SentenceWord> words;
  final DifficultyLevel difficulty;
  final List<String> grammarPoints;
  final String? audioUrl;
  final int practiceCount;
  final double? accuracy;

  Sentence({
    required this.id,
    required this.english,
    required this.indonesian,
    this.category = 'general',
    this.context,
    this.words = const [],
    this.difficulty = DifficultyLevel.beginner,
    this.grammarPoints = const [],
    this.audioUrl,
    this.practiceCount = 0,
    this.accuracy,
  });

  Sentence copyWith({
    String? id,
    String? english,
    String? indonesian,
    String? category,
    String? context,
    List<SentenceWord>? words,
    DifficultyLevel? difficulty,
    List<String>? grammarPoints,
    String? audioUrl,
    int? practiceCount,
    double? accuracy,
  }) {
    return Sentence(
      id: id ?? this.id,
      english: english ?? this.english,
      indonesian: indonesian ?? this.indonesian,
      category: category ?? this.category,
      context: context ?? this.context,
      words: words ?? this.words,
      difficulty: difficulty ?? this.difficulty,
      grammarPoints: grammarPoints ?? this.grammarPoints,
      audioUrl: audioUrl ?? this.audioUrl,
      practiceCount: practiceCount ?? this.practiceCount,
      accuracy: accuracy ?? this.accuracy,
    );
  }
}

/// Individual word within a sentence for detailed learning
class SentenceWord {
  final String word;
  final String? translation;
  final String? pronunciation;
  final String? partOfSpeech;
  final bool isHighlighted;

  const SentenceWord({
    required this.word,
    this.translation,
    this.pronunciation,
    this.partOfSpeech,
    this.isHighlighted = false,
  });
}

/// Difficulty levels for sentences
enum DifficultyLevel {
  beginner(1, 'Beginner', 'Pemula'),
  elementary(2, 'Elementary', 'Dasar'),
  intermediate(3, 'Intermediate', 'Menengah'),
  upperIntermediate(4, 'Upper Intermediate', 'Menengah Atas'),
  advanced(5, 'Advanced', 'Lanjut');

  final int value;
  final String label;
  final String indonesianLabel;

  const DifficultyLevel(this.value, this.label, this.indonesianLabel);
}

/// Sentence categories for organization
class SentenceCategory {
  final String id;
  final String name;
  final String indonesianName;
  final String description;

  const SentenceCategory({
    required this.id,
    required this.name,
    required this.indonesianName,
    required this.description,
  });

  static List<SentenceCategory> get allCategories => [
        const SentenceCategory(
          id: 'introductions',
          name: 'Introductions',
          indonesianName: 'Perkenalan',
          description: 'Self-introduction and greeting sentences',
        ),
        const SentenceCategory(
          id: 'daily_routine',
          name: 'Daily Routine',
          indonesianName: 'Rutinitas Harian',
          description: 'Sentences about daily activities',
        ),
        const SentenceCategory(
          id: 'work_communication',
          name: 'Work Communication',
          indonesianName: 'Komunikasi Kerja',
          description: 'Professional workplace sentences',
        ),
        const SentenceCategory(
          id: 'tech_discussion',
          name: 'Tech Discussion',
          indonesianName: 'Diskusi Teknologi',
          description: 'Technical conversation sentences',
        ),
        const SentenceCategory(
          id: 'meetings',
          name: 'Meetings & Standups',
          indonesianName: 'Rapat & Standup',
          description: 'Meeting and standup sentences',
        ),
        const SentenceCategory(
          id: 'code_review',
          name: 'Code Review',
          indonesianName: 'Tinjauan Kode',
          description: 'Code review feedback sentences',
        ),
        const SentenceCategory(
          id: 'problem_solving',
          name: 'Problem Solving',
          indonesianName: 'Penyelesaian Masalah',
          description: 'Debugging and troubleshooting sentences',
        ),
        const SentenceCategory(
          id: 'ai_ml_discussion',
          name: 'AI/ML Discussion',
          indonesianName: 'Diskusi AI/ML',
          description: 'Artificial intelligence conversation',
        ),
      ];
}
