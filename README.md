# EnglishHub - Learn English for Tech Professionals

A comprehensive Flutter application designed to help Indonesian speakers learn English specifically for full-stack development and AI/tech contexts.

## 🎯 Features

### Learning Modules

1. **Vocabulary** - Tech-focused English words with Indonesian translations
   - Frontend Development (component, render, state, props, hooks)
   - Backend Development (endpoint, middleware, authentication, API)
   - AI/ML (model, inference, token, embedding, LLM, RAG)
   - Database (query, index, transaction, schema)
   - DevOps (container, orchestration, pipeline, scalability)
   - Daily Conversation (standup, blocker, deadline, PR, deploy)
   - Business English (stakeholder, roadmap, deliverable, alignment)

2. **Sentences** - Learn sentence structures for various contexts
   - Introductions
   - Daily Routine
   - Work Communication
   - Tech Discussion
   - Meetings & Standups
   - Code Review
   - Problem Solving
   - AI/ML Discussion

3. **Conversations** - Practice real-world scenarios
   - Daily Standup Meeting
   - Code Review Discussion
   - Client Requirements Call
   - AI Implementation Discussion
   - Technical Interview

4. **Tenses** - Master all 12 English tenses
   - Present (Simple, Continuous, Perfect, Perfect Continuous)
   - Past (Simple, Continuous, Perfect, Perfect Continuous)
   - Future (Simple, Continuous, Perfect, Perfect Continuous)
   - Each with Indonesian explanations and tech-related examples

### App Features

- **Spaced Repetition** - Smart review scheduling using SM-2 algorithm
- **Progress Tracking** - Monitor mastery levels and learning stats
- **Daily Goals** - Set and achieve daily learning targets
- **Quiz Mode** - Test your knowledge with interactive quizzes
- **Category Filtering** - Focus on specific tech domains
- **Search** - Find words by English or Indonesian terms
- **Mastery Levels** - Track from Newbie → Master

## 📁 Project Structure

```
lib/
├── main.dart                 # App entry point
├── utils/
│   └── app_theme.dart        # Theme configuration
├── models/
│   ├── vocabulary_model.dart # Vocabulary data model
│   ├── sentence_model.dart   # Sentence data models
│   ├── conversation_model.dart # Conversation models
│   ├── tense_model.dart      # Tense models with examples
│   └── user_progress_model.dart # User progress tracking
├── services/
│   ├── learning_provider.dart # State management (Provider)
│   ├── vocabulary_data.dart   # Vocabulary data source
│   └── conversation_data.dart # Conversation scenarios
├── screens/
│   ├── home/                 # Home screen with dashboard
│   ├── vocabulary/           # Vocabulary list and details
│   ├── sentences/            # Sentence categories
│   ├── conversation/         # Conversation practice
│   ├── tenses/               # Tense learning
│   └── quiz/                 # Quiz/practice screen
└── widgets/                  # Reusable UI components
```

## 🚀 Getting Started

### Prerequisites

- Flutter SDK (>=3.0.0 <4.0.0)
- Dart SDK
- Android Studio / VS Code
- Android/iOS device or emulator

### Installation

1. Clone the repository:
```bash
git clone <repository-url>
cd english-mobile
```

2. Install dependencies:
```bash
flutter pub get
```

3. Run the app:
```bash
flutter run
```

## 📱 Screenshots

The app features:
- Clean, modern UI with Material 3 design
- Category-based learning with progress indicators
- Interactive quiz mode with instant feedback
- Detailed word/sentence/conversation views
- Progress tracking and daily goals

## 🎓 Learning Approach

### Vocabulary Learning
Each word includes:
- English term with pronunciation guide
- Indonesian translation
- Category (frontend, backend, AI, etc.)
- Example sentence in both languages
- Synonyms and related words
- Mastery level tracking

### Conversation Practice
Each conversation includes:
- Real-world tech scenarios
- Multiple participants
- Learning points (grammar, vocabulary, expressions)
- Message notes with tips
- Alternative phrasings

### Tense Mastery
Each tense includes:
- Clear usage explanation in English and Indonesian
- Formula (e.g., Subject + V1 + s/es)
- Signal words
- Multiple examples with tech context
- Common mistakes to avoid

## 🔧 Tech Stack

- **Flutter** - Cross-platform mobile framework
- **Provider** - State management
- **Google Fonts** - Typography (Inter font)
- **SharedPreferences** - Local storage for progress
- **Hive** - NoSQL local database (optional)
- **Percent Indicator** - Progress visualization
- **Animate Do** - Animations

## 📊 Content Coverage

| Category | Words | Conversations |
|----------|-------|---------------|
| Frontend | 6 | - |
| Backend | 6 | - |
| AI/ML | 8 | 1 |
| Database | 4 | - |
| DevOps | 4 | - |
| API | 4 | - |
| Daily | 5 | 3 |
| Business | 4 | 1 |
| **Total** | **41+** | **5** |

## 🎯 Roadmap

- [ ] Audio pronunciation for all words
- [ ] Speech recognition for conversation practice
- [ ] More conversation scenarios
- [ ] Sentence construction exercises
- [ ] Tense quizzes
- [ ] User authentication & cloud sync
- [ ] Offline mode
- [ ] Dark mode improvements
- [ ] Widget for home screen

## 🤝 Contributing

Contributions are welcome! Feel free to:
- Add more vocabulary words
- Create new conversation scenarios
- Improve translations
- Add new features

## 📄 License

This project is for educational purposes.

## 🙏 Acknowledgments

- Flutter team for the amazing framework
- Google Fonts for Inter typography
- Provider package for state management
- SM-2 spaced repetition algorithm
