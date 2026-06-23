/// Represents a conversation scenario for practice
class Conversation {
  final String id;
  final String title;
  final String indonesianTitle;
  final String description;
  final String category;
  final List<ConversationMessage> messages;
  final ConversationScenario scenario;
  final DifficultyLevel difficulty;
  final List<LearningPoint> learningPoints;
  final String? audioUrl;
  final int duration; // in seconds
  final List<String> vocabulary;

  Conversation({
    required this.id,
    required this.title,
    required this.indonesianTitle,
    required this.description,
    required this.category,
    required this.messages,
    required this.scenario,
    required this.difficulty,
    required this.learningPoints,
    this.audioUrl,
    required this.duration,
    this.vocabulary = const [],
  });

  Conversation copyWith({
    String? id,
    String? title,
    String? indonesianTitle,
    String? description,
    String? category,
    List<ConversationMessage>? messages,
    ConversationScenario? scenario,
    DifficultyLevel? difficulty,
    List<LearningPoint>? learningPoints,
    String? audioUrl,
    int? duration,
    List<String>? vocabulary,
  }) {
    return Conversation(
      id: id ?? this.id,
      title: title ?? this.title,
      indonesianTitle: indonesianTitle ?? this.indonesianTitle,
      description: description ?? this.description,
      category: category ?? this.category,
      messages: messages ?? this.messages,
      scenario: scenario ?? this.scenario,
      difficulty: difficulty ?? this.difficulty,
      learningPoints: learningPoints ?? this.learningPoints,
      audioUrl: audioUrl ?? this.audioUrl,
      duration: duration ?? this.duration,
      vocabulary: vocabulary ?? this.vocabulary,
    );
  }
}

/// A single message in a conversation
class ConversationMessage {
  final String id;
  final String speaker;
  final String speakerRole;
  final String english;
  final String indonesian;
  final MessageType type;
  final List<MessageNote> notes;
  final String? alternative;
  final String? alternativeIndonesian;

  const ConversationMessage({
    required this.id,
    required this.speaker,
    required this.speakerRole,
    required this.english,
    required this.indonesian,
    this.type = MessageType.normal,
    this.notes = const [],
    this.alternative,
    this.alternativeIndonesian,
  });
}

/// Type of message in conversation
enum MessageType {
  normal,
  question,
  response,
  suggestion,
  clarification,
  greeting,
  farewell,
}

/// Conversation scenario metadata
class ConversationScenario {
  final String location;
  final String indonesianLocation;
  final String context;
  final List<String> participants;
  final String goal;

  const ConversationScenario({
    required this.location,
    required this.indonesianLocation,
    required this.context,
    required this.participants,
    required this.goal,
  });
}

/// Learning points extracted from a conversation
class LearningPoint {
  final String title;
  final String explanation;
  final String indonesianExplanation;
  final LearningPointType type;
  final String? example;

  const LearningPoint({
    required this.title,
    required this.explanation,
    required this.indonesianExplanation,
    required this.type,
    this.example,
  });
}

/// Types of learning points
enum LearningPointType {
  grammar,
  vocabulary,
  pronunciation,
  culture,
  expression,
  formalInformal,
}

/// Note attached to a message
class MessageNote {
  final String content;
  final NoteType type;
  final String? highlightedWord;

  const MessageNote({
    required this.content,
    required this.type,
    this.highlightedWord,
  });
}

enum NoteType {
  grammar,
  vocabulary,
  tip,
  warning,
  alternative,
}

/// Conversation categories for business and tech contexts
class ConversationCategory {
  final String id;
  final String name;
  final String indonesianName;
  final String description;

  const ConversationCategory({
    required this.id,
    required this.name,
    required this.indonesianName,
    required this.description,
  });

  static List<ConversationCategory> get allCategories => [
        const ConversationCategory(
          id: 'daily_standup',
          name: 'Daily Standup',
          indonesianName: 'Standup Harian',
          description: 'Practice daily scrum standup conversations',
        ),
        const ConversationCategory(
          id: 'code_review',
          name: 'Code Review Discussion',
          indonesianName: 'Diskusi Tinjauan Kode',
          description: 'Giving and receiving code feedback',
        ),
        const ConversationCategory(
          id: 'team_meeting',
          name: 'Team Meeting',
          indonesianName: 'Rapat Tim',
          description: 'Participating in team meetings',
        ),
        const ConversationCategory(
          id: 'client_call',
          name: 'Client Call',
          indonesianName: 'Panggilan Klien',
          description: 'Communicating with clients',
        ),
        const ConversationCategory(
          id: 'technical_interview',
          name: 'Technical Interview',
          indonesianName: 'Wawancara Teknis',
          description: 'Job interview conversations',
        ),
        const ConversationCategory(
          id: 'pair_programming',
          name: 'Pair Programming',
          indonesianName: 'Pemrograman Berpasangan',
          description: 'Collaborative coding conversations',
        ),
        const ConversationCategory(
          id: 'bug_discussion',
          name: 'Bug Discussion',
          indonesianName: 'Diskusi Bug',
          description: 'Reporting and discussing bugs',
        ),
        const ConversationCategory(
          id: 'ai_project',
          name: 'AI Project Discussion',
          indonesianName: 'Diskusi Proyek AI',
          description: 'Discussing AI/ML projects and implementations',
        ),
        const ConversationCategory(
          id: 'casual_chat',
          name: 'Casual Chat',
          indonesianName: 'Obrolan Santai',
          description: 'Informal conversations with colleagues',
        ),
      ];
}
