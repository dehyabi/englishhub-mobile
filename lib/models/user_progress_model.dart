import 'package:flutter/material.dart';
import 'vocabulary_model.dart';

/// User's overall learning progress
class UserProgress {
  final String userId;
  final int totalXp;
  final int level;
  final int streak;
  final DateTime? lastActivity;
  final Map<String, VocabularyProgress> vocabularyProgress;
  final Map<String, SentenceProgress> sentenceProgress;
  final Map<String, ConversationProgress> conversationProgress;
  final Map<String, TenseProgress> tenseProgress;
  final List<Achievement> achievements;
  final LearningStats stats;
  final UserPreferences preferences;

  UserProgress({
    required this.userId,
    this.totalXp = 0,
    this.level = 1,
    this.streak = 0,
    this.lastActivity,
    this.vocabularyProgress = const {},
    this.sentenceProgress = const {},
    this.conversationProgress = const {},
    this.tenseProgress = const {},
    this.achievements = const [],
    required this.stats,
    required this.preferences,
  });

  UserProgress copyWith({
    String? userId,
    int? totalXp,
    int? level,
    int? streak,
    DateTime? lastActivity,
    Map<String, VocabularyProgress>? vocabularyProgress,
    Map<String, SentenceProgress>? sentenceProgress,
    Map<String, ConversationProgress>? conversationProgress,
    Map<String, TenseProgress>? tenseProgress,
    List<Achievement>? achievements,
    LearningStats? stats,
    UserPreferences? preferences,
  }) {
    return UserProgress(
      userId: userId ?? this.userId,
      totalXp: totalXp ?? this.totalXp,
      level: level ?? this.level,
      streak: streak ?? this.streak,
      lastActivity: lastActivity ?? this.lastActivity,
      vocabularyProgress: vocabularyProgress ?? this.vocabularyProgress,
      sentenceProgress: sentenceProgress ?? this.sentenceProgress,
      conversationProgress: conversationProgress ?? this.conversationProgress,
      tenseProgress: tenseProgress ?? this.tenseProgress,
      achievements: achievements ?? this.achievements,
      stats: stats ?? this.stats,
      preferences: preferences ?? this.preferences,
    );
  }

  /// Calculate overall mastery percentage
  double get overallMastery {
    if (vocabularyProgress.isEmpty) return 0;
    final totalMastery = vocabularyProgress.values.fold<double>(
      0,
      (sum, vp) => sum + vp.masteryPercentage,
    );
    return totalMastery / vocabularyProgress.length;
  }

  /// Get words due for review today
  List<String> get wordsDueForReview {
    final now = DateTime.now();
    return vocabularyProgress.entries
        .where((entry) => entry.value.nextReviewDate != null &&
            entry.value.nextReviewDate!.isBefore(now))
        .map((e) => e.key)
        .toList();
  }
}

/// Progress for a single vocabulary word
class VocabularyProgress {
  final String wordId;
  final MasteryLevel masteryLevel;
  final int reviewCount;
  final int correctCount;
  final int incorrectCount;
  final DateTime? firstLearned;
  final DateTime? lastReviewed;
  final DateTime? nextReviewDate;
  final double accuracy;
  final int easeFactor; // For spaced repetition
  final int intervalDays; // Days until next review

  VocabularyProgress({
    required this.wordId,
    this.masteryLevel = MasteryLevel.newbie,
    this.reviewCount = 0,
    this.correctCount = 0,
    this.incorrectCount = 0,
    this.firstLearned,
    this.lastReviewed,
    this.nextReviewDate,
    this.accuracy = 0,
    this.easeFactor = 250,
    this.intervalDays = 0,
  });

  VocabularyProgress copyWith({
    String? wordId,
    MasteryLevel? masteryLevel,
    int? reviewCount,
    int? correctCount,
    int? incorrectCount,
    DateTime? firstLearned,
    DateTime? lastReviewed,
    DateTime? nextReviewDate,
    double? accuracy,
    int? easeFactor,
    int? intervalDays,
  }) {
    return VocabularyProgress(
      wordId: wordId ?? this.wordId,
      masteryLevel: masteryLevel ?? this.masteryLevel,
      reviewCount: reviewCount ?? this.reviewCount,
      correctCount: correctCount ?? this.correctCount,
      incorrectCount: incorrectCount ?? this.incorrectCount,
      firstLearned: firstLearned ?? this.firstLearned,
      lastReviewed: lastReviewed ?? this.lastReviewed,
      nextReviewDate: nextReviewDate ?? this.nextReviewDate,
      accuracy: accuracy ?? this.accuracy,
      easeFactor: easeFactor ?? this.easeFactor,
      intervalDays: intervalDays ?? this.intervalDays,
    );
  }

  /// Calculate mastery percentage (0-100)
  double get masteryPercentage {
    if (reviewCount == 0) return 0;
    return (masteryLevel.value / 4) * 100;
  }

  /// Update progress based on quiz result
  VocabularyProgress updateResult(bool correct) {
    final newCorrect = correct ? correctCount + 1 : correctCount;
    final newIncorrect = correct ? incorrectCount : incorrectCount + 1;
    final newReviewCount = reviewCount + 1;
    final newAccuracy = newCorrect / newReviewCount;

    // Adjust ease factor and interval based on SM-2 algorithm
    double newEaseFactor = easeFactor.toDouble();
    int newInterval = intervalDays;
    MasteryLevel newMasteryLevel = masteryLevel;

    if (correct) {
      newEaseFactor = easeFactor + (0.1 - (1 - newAccuracy) * (0.08 + (1 - newAccuracy) * 0.02));
      newInterval = intervalDays == 0 ? 1 : (intervalDays * newEaseFactor).round();
      if (masteryLevel.value < 4) {
        newMasteryLevel = MasteryLevel.values[
          (masteryLevel.value + 1).clamp(0, 4)
        ];
      }
    } else {
      newEaseFactor = (easeFactor - 0.2).clamp(1.3, 3.0);
      newInterval = 1;
      if (masteryLevel.value > 0) {
        newMasteryLevel = MasteryLevel.values[
          (masteryLevel.value - 1).clamp(0, 4)
        ];
      }
    }

    return VocabularyProgress(
      wordId: wordId,
      masteryLevel: newMasteryLevel,
      reviewCount: newReviewCount,
      correctCount: newCorrect,
      incorrectCount: newIncorrect,
      firstLearned: firstLearned ?? DateTime.now(),
      lastReviewed: DateTime.now(),
      nextReviewDate: DateTime.now().add(Duration(days: newInterval)),
      accuracy: newAccuracy,
      easeFactor: newEaseFactor.round(),
      intervalDays: newInterval,
    );
  }
}

/// Progress for a sentence
class SentenceProgress {
  final String sentenceId;
  final int practiceCount;
  final double accuracy;
  final DateTime? lastPracticed;
  final bool isMastered;

  SentenceProgress({
    required this.sentenceId,
    this.practiceCount = 0,
    this.accuracy = 0,
    this.lastPracticed,
    this.isMastered = false,
  });

  SentenceProgress copyWith({
    String? sentenceId,
    int? practiceCount,
    double? accuracy,
    DateTime? lastPracticed,
    bool? isMastered,
  }) {
    return SentenceProgress(
      sentenceId: sentenceId ?? this.sentenceId,
      practiceCount: practiceCount ?? this.practiceCount,
      accuracy: accuracy ?? this.accuracy,
      lastPracticed: lastPracticed ?? this.lastPracticed,
      isMastered: isMastered ?? this.isMastered,
    );
  }
}

/// Progress for a conversation
class ConversationProgress {
  final String conversationId;
  final int completedCount;
  final double fluencyScore;
  final DateTime? lastCompleted;
  final List<String> masteredPhrases;

  ConversationProgress({
    required this.conversationId,
    this.completedCount = 0,
    this.fluencyScore = 0,
    this.lastCompleted,
    this.masteredPhrases = const [],
  });

  ConversationProgress copyWith({
    String? conversationId,
    int? completedCount,
    double? fluencyScore,
    DateTime? lastCompleted,
    List<String>? masteredPhrases,
  }) {
    return ConversationProgress(
      conversationId: conversationId ?? this.conversationId,
      completedCount: completedCount ?? this.completedCount,
      fluencyScore: fluencyScore ?? this.fluencyScore,
      lastCompleted: lastCompleted ?? this.lastCompleted,
      masteredPhrases: masteredPhrases ?? this.masteredPhrases,
    );
  }
}

/// Progress for a tense
class TenseProgress {
  final String tenseId;
  final int practiceCount;
  final double accuracy;
  final DateTime? lastPracticed;
  final bool isMastered;

  TenseProgress({
    required this.tenseId,
    this.practiceCount = 0,
    this.accuracy = 0,
    this.lastPracticed,
    this.isMastered = false,
  });

  TenseProgress copyWith({
    String? tenseId,
    int? practiceCount,
    double? accuracy,
    DateTime? lastPracticed,
    bool? isMastered,
  }) {
    return TenseProgress(
      tenseId: tenseId ?? this.tenseId,
      practiceCount: practiceCount ?? this.practiceCount,
      accuracy: accuracy ?? this.accuracy,
      lastPracticed: lastPracticed ?? this.lastPracticed,
      isMastered: isMastered ?? this.isMastered,
    );
  }
}

/// Learning statistics
class LearningStats {
  final int totalWordsLearned;
  final int totalSentencesPracticed;
  final int totalConversationsCompleted;
  final int totalTimeSpent; // in minutes
  final int currentStreak;
  final int longestStreak;
  final Map<String, int> categoryBreakdown;
  final List<DailyActivity> weeklyActivity;

  const LearningStats({
    this.totalWordsLearned = 0,
    this.totalSentencesPracticed = 0,
    this.totalConversationsCompleted = 0,
    this.totalTimeSpent = 0,
    this.currentStreak = 0,
    this.longestStreak = 0,
    this.categoryBreakdown = const {},
    this.weeklyActivity = const [],
  });
}

/// Daily activity record
class DailyActivity {
  final DateTime date;
  final int xpEarned;
  final int wordsReviewed;
  final int minutesSpent;

  const DailyActivity({
    required this.date,
    required this.xpEarned,
    required this.wordsReviewed,
    required this.minutesSpent,
  });
}

/// Achievement badge
class Achievement {
  final String id;
  final String name;
  final String indonesianName;
  final String description;
  final String indonesianDescription;
  final AchievementTier tier;
  final DateTime? unlockedAt;
  final IconData icon;
  final Color color;

  const Achievement({
    required this.id,
    required this.name,
    required this.indonesianName,
    required this.description,
    required this.indonesianDescription,
    required this.tier,
    this.unlockedAt,
    required this.icon,
    required this.color,
  });
}

enum AchievementTier {
  bronze,
  silver,
  gold,
  platinum,
  diamond,
}

/// User preferences
class UserPreferences {
  final int dailyGoal; // words per day
  final bool enableNotifications;
  final NotificationTime notificationTime;
  final String preferredCategories;
  final bool showIndonesianFirst;
  final int audioSpeed;

  const UserPreferences({
    this.dailyGoal = 10,
    this.enableNotifications = true,
    this.notificationTime = const NotificationTime(hour: 9, minute: 0),
    this.preferredCategories = 'all',
    this.showIndonesianFirst = false,
    this.audioSpeed = 100,
  });
}

class NotificationTime {
  final int hour;
  final int minute;

  const NotificationTime({required this.hour, required this.minute});
}
