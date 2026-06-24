import '../models/sentence_model.dart';

/// Sentence data organized by category
class SentenceData {
  static List<Sentence> get allSentences => [
        // INTRODUCTIONS
        Sentence(
          id: 'int_001',
          english: 'Hi, I\'m Dehya. I\'m a fullstack developer.',
          indonesian: 'Hai, saya Dehya. Saya developer fullstack.',
          category: 'introductions',
          context: 'Introducing yourself at a tech meetup',
          difficulty: DifficultyLevel.beginner,
          words: [
            SentenceWord(word: 'Hi', translation: 'Hai'),
            SentenceWord(word: 'I\'m', translation: 'Saya'),
            SentenceWord(word: 'fullstack developer', translation: 'developer fullstack', isHighlighted: true),
          ],
          grammarPoints: ['Subject + be verb + complement'],
        ),
        Sentence(
          id: 'int_002',
          english: 'Nice to meet you! What do you do?',
          indonesian: 'Senang bertemu Anda! Apa pekerjaan Anda?',
          category: 'introductions',
          context: 'Meeting someone new',
          difficulty: DifficultyLevel.beginner,
          words: [
            SentenceWord(word: 'Nice to meet you', translation: 'Senang bertemu Anda', isHighlighted: true),
            SentenceWord(word: 'What do you do?', translation: 'Apa pekerjaan Anda?'),
          ],
          grammarPoints: ['Wh-question with "do"'],
        ),
        Sentence(
          id: 'int_003',
          english: 'I work as a backend engineer at a startup.',
          indonesian: 'Saya bekerja sebagai engineer backend di sebuah startup.',
          category: 'introductions',
          context: 'Describing your job',
          difficulty: DifficultyLevel.elementary,
          words: [
            SentenceWord(word: 'work as', translation: 'bekerja sebagai', isHighlighted: true),
            SentenceWord(word: 'backend engineer', translation: 'engineer backend', isHighlighted: true),
            SentenceWord(word: 'startup', translation: 'startup'),
          ],
          grammarPoints: ['"work as" + job title'],
        ),
        Sentence(
          id: 'int_004',
          english: 'I\'ve been coding for about three years now.',
          indonesian: 'Saya sudah coding selama sekitar tiga tahun.',
          category: 'introductions',
          context: 'Talking about experience',
          difficulty: DifficultyLevel.elementary,
          words: [
            SentenceWord(word: 'I\'ve been', translation: 'Saya sudah', isHighlighted: true),
            SentenceWord(word: 'coding', translation: 'coding'),
            SentenceWord(word: 'for about three years', translation: 'selama sekitar tiga tahun'),
          ],
          grammarPoints: ['Present perfect continuous: have been + V-ing'],
        ),
        Sentence(
          id: 'int_005',
          english: 'My main stack is React and Node.js.',
          indonesian: 'Stack utama saya adalah React dan Node.js.',
          category: 'introductions',
          context: 'Talking about tech stack',
          difficulty: DifficultyLevel.intermediate,
          words: [
            SentenceWord(word: 'stack', translation: 'stack/tumpukan teknologi', isHighlighted: true),
          ],
          grammarPoints: ['Possessive adjective + noun'],
        ),

        // DAILY ROUTINE
        Sentence(
          id: 'dr_001',
          english: 'I usually start working around 9 AM.',
          indonesian: 'Saya biasanya mulai bekerja sekitar jam 9 pagi.',
          category: 'daily_routine',
          context: 'Talking about daily schedule',
          difficulty: DifficultyLevel.beginner,
          words: [
            SentenceWord(word: 'usually', translation: 'biasanya'),
            SentenceWord(word: 'start working', translation: 'mulai bekerja', isHighlighted: true),
          ],
          grammarPoints: ['Adverb of frequency'],
        ),
        Sentence(
          id: 'dr_002',
          english: 'First, I check my emails and Slack messages.',
          indonesian: 'Pertama, saya cek email dan pesan Slack saya.',
          category: 'daily_routine',
          context: 'Morning routine',
          difficulty: DifficultyLevel.beginner,
          words: [
            SentenceWord(word: 'check', translation: 'cek'),
            SentenceWord(word: 'messages', translation: 'pesan-pesan'),
          ],
          grammarPoints: ['Sequencing: First, Then, Next'],
        ),
        Sentence(
          id: 'dr_003',
          english: 'I spend the first hour reviewing pull requests.',
          indonesian: 'Saya menghabiskan satu jam pertama untuk mereview pull request.',
          category: 'daily_routine',
          context: 'Work routine',
          difficulty: DifficultyLevel.elementary,
          words: [
            SentenceWord(word: 'spend', translation: 'menghabiskan', isHighlighted: true),
            SentenceWord(word: 'pull requests', translation: 'pull request'),
          ],
          grammarPoints: ['Spend + time + V-ing'],
        ),
        Sentence(
          id: 'dr_004',
          english: 'After lunch, I usually have a standup meeting.',
          indonesian: 'Setelah makan siang, saya biasanya ada rapat standup.',
          category: 'daily_routine',
          context: 'Afternoon routine',
          difficulty: DifficultyLevel.elementary,
          words: [
            SentenceWord(word: 'standup meeting', translation: 'rapat standup', isHighlighted: true),
          ],
          grammarPoints: ['After + noun clause'],
        ),

        // WORK COMMUNICATION
        Sentence(
          id: 'wc_001',
          english: 'Could you review my PR when you get a chance?',
          indonesian: 'Bisakah kamu mereview PR saya saat ada waktu?',
          category: 'work_communication',
          context: 'Asking for code review',
          difficulty: DifficultyLevel.elementary,
          words: [
            SentenceWord(word: 'Could you', translation: 'Bisakah kamu', isHighlighted: true),
            SentenceWord(word: 'review', translation: 'review/meninjau', isHighlighted: true),
            SentenceWord(word: 'when you get a chance', translation: 'saat ada waktu'),
          ],
          grammarPoints: ['Polite request: Could you...?'],
        ),
        Sentence(
          id: 'wc_002',
          english: 'I\'ll follow up on that ticket this afternoon.',
          indonesian: 'Saya akan menindaklanjuti tiket itu siang ini.',
          category: 'work_communication',
          context: 'Following up on a task',
          difficulty: DifficultyLevel.intermediate,
          words: [
            SentenceWord(word: 'follow up', translation: 'menindaklanjuti', isHighlighted: true),
            SentenceWord(word: 'ticket', translation: 'tiket'),
          ],
          grammarPoints: ['Phrasal verb: follow up'],
        ),
        Sentence(
          id: 'wc_003',
          english: 'Let\'s sync up after the standup to align on priorities.',
          indonesian: 'Mari sinkronisasi setelah standup untuk menyelaraskan prioritas.',
          category: 'work_communication',
          context: 'Coordinating with team',
          difficulty: DifficultyLevel.intermediate,
          words: [
            SentenceWord(word: 'sync up', translation: 'sinkronisasi', isHighlighted: true),
            SentenceWord(word: 'align', translation: 'menyelaraskan', isHighlighted: true),
            SentenceWord(word: 'priorities', translation: 'prioritas'),
          ],
          grammarPoints: ['Let\'s + verb (suggestion)'],
        ),
        Sentence(
          id: 'wc_004',
          english: 'I\'m blocked on the API integration. Can someone help?',
          indonesian: 'Saya terhalang pada integrasi API. Bisakah seseorang membantu?',
          category: 'work_communication',
          context: 'Reporting a blocker',
          difficulty: DifficultyLevel.elementary,
          words: [
            SentenceWord(word: 'blocked', translation: 'terhalang', isHighlighted: true),
            SentenceWord(word: 'integration', translation: 'integrasi'),
          ],
          grammarPoints: ['Passive voice: I\'m blocked on...'],
        ),
        Sentence(
          id: 'wc_005',
          english: 'The deployment went smoothly. Everything is in production now.',
          indonesian: 'Deployment berjalan lancar. Semuanya sudah di production sekarang.',
          category: 'work_communication',
          context: 'Reporting success',
          difficulty: DifficultyLevel.intermediate,
          words: [
            SentenceWord(word: 'went smoothly', translation: 'berjalan lancar', isHighlighted: true),
            SentenceWord(word: 'deployment', translation: 'deployment/penyebaran'),
            SentenceWord(word: 'production', translation: 'production/produksi'),
          ],
          grammarPoints: ['Subject + went + adjective'],
        ),

        // TECH DISCUSSION
        Sentence(
          id: 'td_001',
          english: 'We should refactor this component to use hooks instead of class lifecycle methods.',
          indonesian: 'Kita sebaiknya me-refactor komponen ini untuk menggunakan hooks daripada metode lifecycle class.',
          category: 'tech_discussion',
          context: 'Discussing code refactoring',
          difficulty: DifficultyLevel.intermediate,
          words: [
            SentenceWord(word: 'refactor', translation: 'me-refactor', isHighlighted: true),
            SentenceWord(word: 'hooks', translation: 'hooks'),
            SentenceWord(word: 'lifecycle methods', translation: 'metode lifecycle', isHighlighted: true),
          ],
          grammarPoints: ['Should + base verb (suggestion)'],
        ),
        Sentence(
          id: 'td_002',
          english: 'The database query is taking too long. We need to add an index.',
          indonesian: 'Query database terlalu lama. Kita perlu menambahkan indeks.',
          category: 'tech_discussion',
          context: 'Performance discussion',
          difficulty: DifficultyLevel.intermediate,
          words: [
            SentenceWord(word: 'taking too long', translation: 'terlalu lama', isHighlighted: true),
            SentenceWord(word: 'index', translation: 'indeks', isHighlighted: true),
          ],
          grammarPoints: ['Present continuous for ongoing situation'],
        ),
        Sentence(
          id: 'td_003',
          english: 'I think we should migrate to a microservices architecture.',
          indonesian: 'Saya pikir kita sebaiknya bermigrasi ke arsitektur microservices.',
          category: 'tech_discussion',
          context: 'Architecture discussion',
          difficulty: DifficultyLevel.upperIntermediate,
          words: [
            SentenceWord(word: 'migrate', translation: 'bermigrasi', isHighlighted: true),
            SentenceWord(word: 'microservices architecture', translation: 'arsitektur microservices', isHighlighted: true),
          ],
          grammarPoints: ['I think + should (opinion + suggestion)'],
        ),
        Sentence(
          id: 'td_004',
          english: 'Can you explain how the caching layer works in this system?',
          indonesian: 'Bisakah kamu jelaskan bagaimana cara kerja caching layer di sistem ini?',
          category: 'tech_discussion',
          context: 'Asking for explanation',
          difficulty: DifficultyLevel.intermediate,
          words: [
            SentenceWord(word: 'caching layer', translation: 'lapisan caching', isHighlighted: true),
          ],
          grammarPoints: ['Can you explain how... (indirect question)'],
        ),

        // MEETINGS
        Sentence(
          id: 'mt_001',
          english: 'Let\'s get started. Does everyone have the agenda?',
          indonesian: 'Mari kita mulai. Apakah semua orang sudah punya agenda?',
          category: 'meetings',
          context: 'Starting a meeting',
          difficulty: DifficultyLevel.beginner,
          words: [
            SentenceWord(word: 'get started', translation: 'mulai', isHighlighted: true),
            SentenceWord(word: 'agenda', translation: 'agenda'),
          ],
          grammarPoints: ['Let\'s + verb'],
        ),
        Sentence(
          id: 'mt_002',
          english: 'I have a question about the sprint goals.',
          indonesian: 'Saya punya pertanyaan tentang target sprint.',
          category: 'meetings',
          context: 'Asking a question in meeting',
          difficulty: DifficultyLevel.elementary,
          words: [
            SentenceWord(word: 'sprint goals', translation: 'target sprint', isHighlighted: true),
          ],
          grammarPoints: ['Have a question about...'],
        ),
        Sentence(
          id: 'mt_003',
          english: 'Yesterday I finished the login feature. Today I\'ll work on the dashboard.',
          indonesian: 'Kemarin saya menyelesaikan fitur login. Hari ini saya akan mengerjakan dashboard.',
          category: 'meetings',
          context: 'Standup update',
          difficulty: DifficultyLevel.beginner,
          words: [
            SentenceWord(word: 'finished', translation: 'menyelesaikan'),
            SentenceWord(word: 'dashboard', translation: 'dashboard'),
          ],
          grammarPoints: ['Past tense + future with will'],
        ),
        Sentence(
          id: 'mt_004',
          english: 'No blockers on my end. I\'m on track to finish by Friday.',
          indonesian: 'Tidak ada hambatan di sisi saya. Saya berada di jalur yang tepat untuk selesai pada hari Jumat.',
          category: 'meetings',
          context: 'Standup status',
          difficulty: DifficultyLevel.elementary,
          words: [
            SentenceWord(word: 'blockers', translation: 'hambatan', isHighlighted: true),
            SentenceWord(word: 'on track', translation: 'di jalur yang tepat', isHighlighted: true),
          ],
          grammarPoints: ['No + noun + on my end'],
        ),

        // CODE REVIEW
        Sentence(
          id: 'cr_001',
          english: 'This looks good overall, but I have a few suggestions.',
          indonesian: 'Secara keseluruhan ini terlihat bagus, tapi saya punya beberapa saran.',
          category: 'code_review',
          context: 'Starting a review comment',
          difficulty: DifficultyLevel.elementary,
          words: [
            SentenceWord(word: 'overall', translation: 'secara keseluruhan', isHighlighted: true),
            SentenceWord(word: 'suggestions', translation: 'saran'),
          ],
          grammarPoints: ['But + contrasting idea'],
        ),
        Sentence(
          id: 'cr_002',
          english: 'Could you add some unit tests for this function?',
          indonesian: 'Bisakah kamu menambahkan beberapa unit test untuk fungsi ini?',
          category: 'code_review',
          context: 'Requesting tests in review',
          difficulty: DifficultyLevel.elementary,
          words: [
            SentenceWord(word: 'unit tests', translation: 'unit test', isHighlighted: true),
          ],
          grammarPoints: ['Could you + verb (polite request)'],
        ),
        Sentence(
          id: 'cr_003',
          english: 'I think we should extract this logic into a separate utility function.',
          indonesian: 'Saya pikir kita sebaiknya mengekstrak logika ini ke fungsi utilitas terpisah.',
          category: 'code_review',
          context: 'Suggesting refactoring',
          difficulty: DifficultyLevel.intermediate,
          words: [
            SentenceWord(word: 'extract', translation: 'mengekstrak/mengeluarkan', isHighlighted: true),
            SentenceWord(word: 'utility function', translation: 'fungsi utilitas', isHighlighted: true),
          ],
          grammarPoints: ['Should + base verb'],
        ),
        Sentence(
          id: 'cr_004',
          english: 'This variable name is a bit unclear. Maybe rename it to something more descriptive?',
          indonesian: 'Nama variabel ini agak tidak jelas. Mungkin ganti nama ke sesuatu yang lebih deskriptif?',
          category: 'code_review',
          context: 'Naming feedback',
          difficulty: DifficultyLevel.elementary,
          words: [
            SentenceWord(word: 'unclear', translation: 'tidak jelas'),
            SentenceWord(word: 'descriptive', translation: 'deskriptif', isHighlighted: true),
          ],
          grammarPoints: ['Maybe + verb (soft suggestion)'],
        ),

        // PROBLEM SOLVING
        Sentence(
          id: 'ps_001',
          english: 'I\'m getting a null reference error on line 42.',
          indonesian: 'Saya mendapatkan error null reference di baris 42.',
          category: 'problem_solving',
          context: 'Reporting a bug',
          difficulty: DifficultyLevel.elementary,
          words: [
            SentenceWord(word: 'null reference error', translation: 'error null reference', isHighlighted: true),
          ],
          grammarPoints: ['Present continuous: I\'m getting...'],
        ),
        Sentence(
          id: 'ps_002',
          english: 'Have you tried clearing the cache and restarting the server?',
          indonesian: 'Sudahkah kamu mencoba menghapus cache dan me-restart server?',
          category: 'problem_solving',
          context: 'Suggesting a fix',
          difficulty: DifficultyLevel.intermediate,
          words: [
            SentenceWord(word: 'clearing the cache', translation: 'menghapus cache', isHighlighted: true),
            SentenceWord(word: 'restarting', translation: 'me-restart'),
          ],
          grammarPoints: ['Have you tried + V-ing'],
        ),
        Sentence(
          id: 'ps_003',
          english: 'The issue was a race condition in the async handler.',
          indonesian: 'Masalahnya adalah race condition di handler async.',
          category: 'problem_solving',
          context: 'Explaining root cause',
          difficulty: DifficultyLevel.upperIntermediate,
          words: [
            SentenceWord(word: 'race condition', translation: 'race condition', isHighlighted: true),
            SentenceWord(word: 'async handler', translation: 'handler async', isHighlighted: true),
          ],
          grammarPoints: ['Past passive: was + noun'],
        ),
        Sentence(
          id: 'ps_004',
          english: 'Let me check the logs and get back to you.',
          indonesian: 'Biarkan saya cek log-nya dan saya akan kembali ke kamu.',
          category: 'problem_solving',
          context: 'Investigating an issue',
          difficulty: DifficultyLevel.elementary,
          words: [
            SentenceWord(word: 'logs', translation: 'log/catatan'),
            SentenceWord(word: 'get back to you', translation: 'kembali ke kamu/menghubungi kembali', isHighlighted: true),
          ],
          grammarPoints: ['Let me + verb'],
        ),

        // AI/ML DISCUSSION
        Sentence(
          id: 'ai_001',
          english: 'We\'re fine-tuning the model on our domain-specific dataset.',
          indonesian: 'Kami sedang fine-tuning model pada dataset domain-specific kami.',
          category: 'ai_ml_discussion',
          context: 'Discussing ML training',
          difficulty: DifficultyLevel.advanced,
          words: [
            SentenceWord(word: 'fine-tuning', translation: 'fine-tuning/penyetelan halus', isHighlighted: true),
            SentenceWord(word: 'domain-specific', translation: 'domain-specific/khusus domain', isHighlighted: true),
            SentenceWord(word: 'dataset', translation: 'dataset/kumpulan data'),
          ],
          grammarPoints: ['Present continuous for ongoing actions'],
        ),
        Sentence(
          id: 'ai_002',
          english: 'The inference latency is too high for real-time use.',
          indonesian: 'Latensi inferensi terlalu tinggi untuk penggunaan real-time.',
          category: 'ai_ml_discussion',
          context: 'Discussing performance',
          difficulty: DifficultyLevel.advanced,
          words: [
            SentenceWord(word: 'inference latency', translation: 'latensi inferensi', isHighlighted: true),
            SentenceWord(word: 'real-time', translation: 'real-time/waktu nyata'),
          ],
          grammarPoints: ['Too + adjective + for + purpose'],
        ),
        Sentence(
          id: 'ai_003',
          english: 'We need to implement RAG to reduce hallucinations.',
          indonesian: 'Kita perlu mengimplementasikan RAG untuk mengurangi halusinasi.',
          category: 'ai_ml_discussion',
          context: 'Discussing AI architecture',
          difficulty: DifficultyLevel.advanced,
          words: [
            SentenceWord(word: 'implement', translation: 'mengimplementasikan'),
            SentenceWord(word: 'RAG', translation: 'RAG (Retrieval-Augmented Generation)', isHighlighted: true),
            SentenceWord(word: 'hallucinations', translation: 'halusinasi', isHighlighted: true),
          ],
          grammarPoints: ['Need to + verb'],
        ),
        Sentence(
          id: 'ai_004',
          english: 'Can you explain how the embedding model works?',
          indonesian: 'Bisakah kamu menjelaskan bagaimana model embedding bekerja?',
          category: 'ai_ml_discussion',
          context: 'Learning about AI concepts',
          difficulty: DifficultyLevel.upperIntermediate,
          words: [
            SentenceWord(word: 'embedding model', translation: 'model embedding', isHighlighted: true),
          ],
          grammarPoints: ['Can you explain how + clause'],
        ),
      ];

  static List<Sentence> getByCategory(String category) {
    return allSentences.where((s) => s.category == category).toList();
  }
}