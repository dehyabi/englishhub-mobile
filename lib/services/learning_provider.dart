import 'package:flutter/material.dart';
import '../models/models.dart';
import 'vocabulary_data.dart';
import 'conversation_data.dart';

/// Main state management provider for the learning app
class LearningProvider extends ChangeNotifier {
  // User progress
  UserProgress? _userProgress;

  // Learning data
  List<VocabularyWord> _vocabulary = [];
  List<Sentence> _sentences = [];
  List<Conversation> _conversations = [];
  List<Tense> _tenses = [];

  // UI state
  String _selectedCategory = 'all';
  bool _isLoading = false;
  String? _error;

  // Quiz state
  QuizSession? _currentQuiz;

  // Getters
  UserProgress? get userProgress => _userProgress;
  List<VocabularyWord> get vocabulary => _vocabulary;
  List<Sentence> get sentences => _sentences;
  List<Conversation> get conversations => _conversations;
  List<Tense> get tenses => _tenses;
  String get selectedCategory => _selectedCategory;
  bool get isLoading => _isLoading;
  String? get error => _error;
  QuizSession? get currentQuiz => _currentQuiz;

  /// Filter vocabulary by selected category
  List<VocabularyWord> get filteredVocabulary {
    if (_selectedCategory == 'all') return _vocabulary;
    return _vocabulary.where((v) => v.category == _selectedCategory).toList();
  }

  /// Get vocabulary categories with counts
  List<Map<String, dynamic>> get categoryStats {
    final categories = VocabularyCategory.allCategories;
    return categories.map((cat) {
      final count = _vocabulary.where((v) => v.category == cat.id).length;
      final learned = _vocabulary.where((v) =>
        v.category == cat.id && v.masteryLevel != MasteryLevel.newbie
      ).length;
      return {
        'category': cat,
        'total': count,
        'learned': learned,
        'percentage': count > 0 ? (learned / count) * 100 : 0.0,
      };
    }).toList();
  }

  /// Initialize the provider
  Future<void> initialize() async {
    _isLoading = true;
    notifyListeners();

    try {
      // Load data
      _vocabulary = VocabularyData.allWords;
      _conversations = ConversationData.allConversations;
      _tenses = TensesData.allTenses;

      // Initialize user progress
      _userProgress = UserProgress(
        userId: 'user_001',
        stats: const LearningStats(),
        preferences: const UserPreferences(),
      );

      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _error = e.toString();
      _isLoading = false;
      notifyListeners();
    }
  }

  /// Set selected category
  void setSelectedCategory(String category) {
    _selectedCategory = category;
    notifyListeners();
  }

  /// Update vocabulary progress
  void updateVocabularyProgress(String wordId, bool correct) {
    final currentProgress = _userProgress?.vocabularyProgress[wordId] ??
      VocabularyProgress(wordId: wordId);

    final updatedProgress = currentProgress.updateResult(correct);

    _userProgress = _userProgress?.copyWith(
      vocabularyProgress: {
        ..._userProgress!.vocabularyProgress,
        wordId: updatedProgress,
      },
      totalXp: _userProgress!.totalXp + (correct ? 10 : 0),
    );

    // Update vocabulary list with new mastery level
    final wordIndex = _vocabulary.indexWhere((w) => w.id == wordId);
    if (wordIndex != -1) {
      final word = _vocabulary[wordIndex];
      _vocabulary[wordIndex] = word.copyWith(
        masteryLevel: updatedProgress.masteryLevel,
        reviewCount: updatedProgress.reviewCount,
        lastReviewed: updatedProgress.lastReviewed,
      );
    }

    notifyListeners();
  }

  /// Start a quiz session
  void startQuiz(QuizType type, {List<String>? wordIds, int count = 10}) {
    List<VocabularyWord> words;

    if (wordIds != null) {
      words = _vocabulary.where((w) => wordIds.contains(w.id)).toList();
    } else {
      words = List.from(_vocabulary)..shuffle();
    }

    // Take only the requested count
    if (words.length > count) {
      words = words.sublist(0, count);
    }

    _currentQuiz = QuizSession(
      type: type,
      words: words,
      totalQuestions: words.length,
    );

    notifyListeners();
  }

  /// Submit quiz answer
  void submitQuizAnswer(String wordId, bool correct) {
    if (_currentQuiz == null) return;

    _currentQuiz = _currentQuiz!.copyWith(
      currentQuestionIndex: _currentQuiz!.currentQuestionIndex + 1,
      correctAnswers: correct ? _currentQuiz!.correctAnswers + 1 : _currentQuiz!.correctAnswers,
    );

    // Update progress
    updateVocabularyProgress(wordId, correct);

    notifyListeners();
  }

  /// End quiz session
  void endQuiz() {
    _currentQuiz = null;
    notifyListeners();
  }

  /// Get words due for review
  List<VocabularyWord> get wordsDueForReview {
    final now = DateTime.now();
    return _userProgress?.vocabularyProgress.entries
      .where((entry) =>
        entry.value.nextReviewDate != null &&
        entry.value.nextReviewDate!.isBefore(now)
      )
      .map((e) => _vocabulary.firstWhere((w) => w.id == e.key))
      .toList() ?? [];
  }

  /// Get daily progress stats
  Map<String, dynamic> get dailyStats {
    final now = DateTime.now();
    final todayStart = DateTime(now.year, now.month, now.day);

    int wordsReviewedToday = 0;
    int correctToday = 0;

    _userProgress?.vocabularyProgress.values.forEach((progress) {
      if (progress.lastReviewed != null &&
          progress.lastReviewed!.isAfter(todayStart)) {
        wordsReviewedToday++;
        correctToday += progress.correctCount;
      }
    });

    return {
      'wordsReviewed': wordsReviewedToday,
      'correctAnswers': correctToday,
      'dailyGoal': _userProgress?.preferences.dailyGoal ?? 10,
      'percentage': _userProgress != null
        ? (wordsReviewedToday / _userProgress!.preferences.dailyGoal * 100).clamp(0.0, 100.0)
        : 0.0,
    };
  }
}

/// Quiz session state
class QuizSession {
  final QuizType type;
  final List<VocabularyWord> words;
  final int totalQuestions;
  final int currentQuestionIndex;
  final int correctAnswers;

  QuizSession({
    required this.type,
    required this.words,
    required this.totalQuestions,
    this.currentQuestionIndex = 0,
    this.correctAnswers = 0,
  });

  QuizSession copyWith({
    QuizType? type,
    List<VocabularyWord>? words,
    int? totalQuestions,
    int? currentQuestionIndex,
    int? correctAnswers,
  }) {
    return QuizSession(
      type: type ?? this.type,
      words: words ?? this.words,
      totalQuestions: totalQuestions ?? this.totalQuestions,
      currentQuestionIndex: currentQuestionIndex ?? this.currentQuestionIndex,
      correctAnswers: correctAnswers ?? this.correctAnswers,
    );
  }

  /// Get current question
  VocabularyWord? get currentWord {
    if (currentQuestionIndex >= words.length) return null;
    return words[currentQuestionIndex];
  }

  /// Check if quiz is complete
  bool get isComplete => currentQuestionIndex >= totalQuestions;

  /// Get score percentage
  double get scorePercentage {
    if (totalQuestions == 0) return 0;
    return (correctAnswers / totalQuestions) * 100;
  }
}

/// Types of quizzes
enum QuizType {
  vocabulary('Vocabulary', 'Kosakata'),
  sentence('Sentence', 'Kalimat'),
  conversation('Conversation', 'Percakapan'),
  tense('Tense', 'Tenses'),
  mixed('Mixed', 'Campuran');

  final String name;
  final String indonesianName;

  const QuizType(this.name, this.indonesianName);
}
