import '../models/conversation_model.dart';
import '../models/sentence_model.dart' show DifficultyLevel;

/// Business and tech conversation scenarios
class ConversationData {
  static List<Conversation> get allConversations => [
        // DAILY STANDUP
        Conversation(
          id: 'conv_001',
          title: 'Daily Standup Meeting',
          indonesianTitle: 'Rapat Standup Harian',
          description: 'Practice a typical daily standup with your team',
          category: 'daily_standup',
          scenario: const ConversationScenario(
            location: 'Office / Video Call',
            indonesianLocation: 'Kantor / Panggilan Video',
            context: 'Morning standup meeting with the development team',
            participants: ['You (Developer)', 'Sarah (Tech Lead)', 'Mike (Developer)'],
            goal: 'Share yesterday\'s progress, today\'s plans, and any blockers',
          ),
          difficulty: DifficultyLevel.beginner,
          duration: 180,
          messages: [
            const ConversationMessage(
              id: 'm1',
              speaker: 'Sarah',
              speakerRole: 'Tech Lead',
              english: 'Good morning everyone! Let\'s start our daily standup. Who wants to go first?',
              indonesian: 'Selamat pagi semuanya! Mari mulai standup harian kita. Siapa yang mau duluan?',
              type: MessageType.greeting,
            ),
            const ConversationMessage(
              id: 'm2',
              speaker: 'You',
              speakerRole: 'Developer',
              english: 'I can start. Yesterday, I worked on the user authentication feature. I completed the login and registration endpoints.',
              indonesian: 'Saya bisa mulai. Kemarin, saya mengerjakan fitur autentikasi pengguna. Saya menyelesaikan endpoint login dan pendaftaran.',
              type: MessageType.normal,
              notes: [
                const MessageNote(
                  content: 'Use past tense "worked" and "completed" for yesterday\'s tasks',
                  type: NoteType.grammar,
                  highlightedWord: 'worked',
                ),
              ],
            ),
            const ConversationMessage(
              id: 'm3',
              speaker: 'You',
              speakerRole: 'Developer',
              english: 'Today, I\'m going to implement the password reset functionality. No blockers from my side.',
              indonesian: 'Hari ini, saya akan mengimplementasikan fungsi reset password. Tidak ada blocker dari sisi saya.',
              type: MessageType.normal,
              notes: [
                const MessageNote(
                  content: '"Going to" expresses your plan for today',
                  type: NoteType.grammar,
                ),
              ],
            ),
            const ConversationMessage(
              id: 'm4',
              speaker: 'Sarah',
              speakerRole: 'Tech Lead',
              english: 'Great progress! Make sure to update the API documentation as well.',
              indonesian: 'Progres yang bagus! Pastikan untuk memperbarui dokumentasi API juga.',
              type: MessageType.response,
            ),
            const ConversationMessage(
              id: 'm5',
              speaker: 'Mike',
              speakerRole: 'Developer',
              english: 'Yesterday I fixed the bug in the payment module. But I have a blocker - I need access to the staging database.',
              indonesian: 'Kemarin saya memperbaiki bug di modul pembayaran. Tapi saya punya blocker - saya butuh akses ke database staging.',
              type: MessageType.normal,
            ),
            const ConversationMessage(
              id: 'm6',
              speaker: 'Sarah',
              speakerRole: 'Tech Lead',
              english: 'I\'ll help you with that. Let\'s sync after this meeting and I\'ll give you the access.',
              indonesian: 'Saya akan membantu Anda dengan itu. Mari sinkronisasi setelah rapat ini dan saya akan memberikan Anda akses.',
              type: MessageType.suggestion,
              notes: [
                const MessageNote(
                  content: '"Let\'s sync" is common tech speak for "let\'s meet/discuss"',
                  type: NoteType.vocabulary,
                ),
              ],
            ),
          ],
          learningPoints: const [
            LearningPoint(
              title: 'Past Simple for Completed Actions',
              explanation: 'Use past simple (worked, completed, fixed) to describe what you did yesterday',
              indonesianExplanation: 'Gunakan past simple (worked, completed, fixed) untuk menjelaskan apa yang Anda lakukan kemarin',
              type: LearningPointType.grammar,
              example: 'I worked on the feature. I completed the task.',
            ),
            LearningPoint(
              title: 'Future Plans with "Going to"',
              explanation: 'Use "going to" to express your plans for today',
              indonesianExplanation: 'Gunakan "going to" untuk menyatakan rencana Anda untuk hari ini',
              type: LearningPointType.grammar,
              example: 'Today I\'m going to implement the feature.',
            ),
            LearningPoint(
              title: 'Expressing Blockers',
              explanation: 'Common phrases: "I have a blocker", "I\'m blocked by...", "I need help with..."',
              indonesianExplanation: 'Frasa umum: "I have a blocker", "I\'m blocked by...", "I need help with..."',
              type: LearningPointType.expression,
            ),
          ],
          vocabulary: ['standup', 'blocker', 'endpoint', 'sync', 'access', 'staging'],
        ),

        // CODE REVIEW
        Conversation(
          id: 'conv_002',
          title: 'Code Review Discussion',
          indonesianTitle: 'Diskusi Tinjauan Kode',
          description: 'Giving and receiving feedback on a pull request',
          category: 'code_review',
          scenario: const ConversationScenario(
            location: 'GitHub / GitLab PR Comments',
            indonesianLocation: 'Komentar PR GitHub / GitLab',
            context: 'Reviewing a colleague\'s pull request',
            participants: ['You (Reviewer)', 'Alex (PR Author)'],
            goal: 'Provide constructive feedback on the code changes',
          ),
          difficulty: DifficultyLevel.intermediate,
          duration: 300,
          messages: [
            const ConversationMessage(
              id: 'm1',
              speaker: 'You',
              speakerRole: 'Reviewer',
              english: 'Hi Alex! I\'ve reviewed your PR. Overall, the code looks good. Great job on the test coverage!',
              indonesian: 'Hai Alex! Saya sudah mereview PR kamu. Secara keseluruhan, kodenya terlihat bagus. Kerja bagus untuk cakupan tes!',
              type: MessageType.greeting,
            ),
            const ConversationMessage(
              id: 'm2',
              speaker: 'You',
              speakerRole: 'Reviewer',
              english: 'I have a few suggestions though. On line 45, consider extracting this logic into a separate function for better reusability.',
              indonesian: 'Saya punya beberapa saran meskipun begitu. Di baris 45, pertimbangkan untuk mengekstrak logika ini ke fungsi terpisah untuk reusable yang lebih baik.',
              type: MessageType.suggestion,
              notes: [
                const MessageNote(
                  content: '"Consider + -ing" is a polite way to make suggestions',
                  type: NoteType.grammar,
                  highlightedWord: 'consider extracting',
                ),
              ],
            ),
            const ConversationMessage(
              id: 'm3',
              speaker: 'You',
              speakerRole: 'Reviewer',
              english: 'Also, this variable name could be more descriptive. Instead of "data", maybe use "userData" or "responsePayload"?',
              indonesian: 'Juga, nama variabel ini bisa lebih deskriptif. Alih-alih "data", mungkin gunakan "userData" atau "responsePayload"?',
              type: MessageType.suggestion,
            ),
            const ConversationMessage(
              id: 'm4',
              speaker: 'Alex',
              speakerRole: 'PR Author',
              english: 'Thanks for the feedback! I agree with the function extraction. For the variable name, I think "responsePayload" is clearer.',
              indonesian: 'Terima kasih atas masukannya! Saya setuju dengan ekstraksi fungsi. Untuk nama variabel, saya pikir "responsePayload" lebih jelas.',
              type: MessageType.response,
            ),
            const ConversationMessage(
              id: 'm5',
              speaker: 'Alex',
              speakerRole: 'PR Author',
              english: 'One question though - should we add error handling for the edge case when the API returns null?',
              indonesian: 'Satu pertanyaan meskipun - haruskah kita menambahkan error handling untuk edge case ketika API mengembalikan null?',
              type: MessageType.question,
              notes: [
                const MessageNote(
                  content: '"One question though" is a polite way to introduce a question',
                  type: NoteType.expression,
                ),
              ],
            ),
            const ConversationMessage(
              id: 'm6',
              speaker: 'You',
              speakerRole: 'Reviewer',
              english: 'Good catch! Yes, let\'s add a null check. I\'ll leave a comment on that line.',
              indonesian: 'Tangkapan yang bagus! Ya, mari tambahkan pemeriksaan null. Saya akan meninggalkan komentar di baris itu.',
              type: MessageType.response,
              notes: [
                const MessageNote(
                  content: '"Good catch!" is common praise when someone spots an issue',
                  type: NoteType.expression,
                ),
              ],
            ),
          ],
          learningPoints: const [
            LearningPoint(
              title: 'Giving Constructive Feedback',
              explanation: 'Start with positive feedback, then use "I have a suggestion" or "Consider..." for improvements',
              indonesianExplanation: 'Mulai dengan umpan balik positif, lalu gunakan "I have a suggestion" atau "Consider..." untuk perbaikan',
              type: LearningPointType.expression,
            ),
            LearningPoint(
              title: 'Asking Questions Politely',
              explanation: '"One question though", "Should we...", "What do you think about..." are polite question starters',
              indonesianExplanation: '"One question though", "Should we...", "What do you think about..." adalah pembuka pertanyaan yang sopan',
              type: LearningPointType.expression,
            ),
            LearningPoint(
              title: 'Technical Vocabulary',
              explanation: 'PR, test coverage, edge case, null check, error handling - common code review terms',
              indonesianExplanation: 'PR, test coverage, edge case, null check, error handling - istilah tinjauan kode umum',
              type: LearningPointType.vocabulary,
            ),
          ],
          vocabulary: ['PR', 'test coverage', 'function', 'variable', 'edge case', 'null check', 'error handling'],
        ),

        // CLIENT CALL
        Conversation(
          id: 'conv_003',
          title: 'Client Requirements Call',
          indonesianTitle: 'Panggilan Persyaratan Klien',
          description: 'Discussing project requirements with a client',
          category: 'client_call',
          scenario: const ConversationScenario(
            location: 'Video Conference',
            indonesianLocation: 'Konferensi Video',
            context: 'Initial meeting to understand client requirements',
            participants: ['You (Developer)', 'Mr. Johnson (Client)'],
            goal: 'Understand the client\'s needs and explain technical constraints',
          ),
          difficulty: DifficultyLevel.upperIntermediate,
          duration: 600,
          messages: [
            const ConversationMessage(
              id: 'm1',
              speaker: 'Mr. Johnson',
              speakerRole: 'Client',
              english: 'So, we need an e-commerce platform that can handle at least 10,000 concurrent users. Is that feasible?',
              indonesian: 'Jadi, kami membutuhkan platform e-commerce yang dapat menangani setidaknya 10.000 pengguna bersamaan. Apakah itu layak?',
              type: MessageType.question,
            ),
            const ConversationMessage(
              id: 'm2',
              speaker: 'You',
              speakerRole: 'Developer',
              english: 'Absolutely, that\'s definitely feasible. We\'ll need to implement proper load balancing and database optimization. Could you tell me more about your expected traffic patterns?',
              indonesian: 'Tentu, itu pasti layak. Kami perlu mengimplementasikan load balancing dan optimasi database yang tepat. Bisakah Anda memberi tahu saya lebih banyak tentang pola lalu lintas yang Anda harapkan?',
              type: MessageType.response,
              notes: [
                const MessageNote(
                  content: '"Could you..." is more polite than "Can you..." in formal contexts',
                  type: NoteType.grammar,
                ),
              ],
            ),
            const ConversationMessage(
              id: 'm3',
              speaker: 'Mr. Johnson',
              speakerRole: 'Client',
              english: 'Most of our traffic comes during flash sales, usually in the evenings. We might get up to 50,000 users during those peaks.',
              indonesian: 'Sebagian besar lalu lintas kami datang selama flash sale, biasanya di malam hari. Kami mungkin mendapat hingga 50.000 pengguna selama puncak tersebut.',
              type: MessageType.normal,
            ),
            const ConversationMessage(
              id: 'm4',
              speaker: 'You',
              speakerRole: 'Developer',
              english: 'I see. In that case, I\'d recommend implementing auto-scaling and using a CDN for static assets. This will ensure the site remains responsive during traffic spikes.',
              indonesian: 'Saya mengerti. Dalam hal ini, saya akan merekomendasikan untuk mengimplementasikan auto-scaling dan menggunakan CDN untuk aset statis. Ini akan memastikan situs tetap responsif selama lonjakan lalu lintas.',
              type: MessageType.suggestion,
              notes: [
                const MessageNote(
                  content: '"I\'d recommend" = "I would recommend" - conditional for polite suggestions',
                  type: NoteType.grammar,
                  highlightedWord: 'I\'d recommend',
                ),
              ],
            ),
            const ConversationMessage(
              id: 'm5',
              speaker: 'Mr. Johnson',
              speakerRole: 'Client',
              english: 'That sounds good. What about the timeline? When can we expect the first version?',
              indonesian: 'Itu terdengar bagus. Bagaimana dengan timeline? Kapan kami bisa mengharapkan versi pertama?',
              type: MessageType.question,
            ),
            const ConversationMessage(
              id: 'm6',
              speaker: 'You',
              speakerRole: 'Developer',
              english: 'For an MVP with core features, I\'d estimate about 8-10 weeks. We can deliver the product catalog and checkout first, then add advanced features in subsequent phases.',
              indonesian: 'Untuk MVP dengan fitur inti, saya memperkirakan sekitar 8-10 minggu. Kami dapat mengirimkan katalog produk dan checkout terlebih dahulu, kemudian menambahkan fitur canggih di fase berikutnya.',
              type: MessageType.response,
            ),
          ],
          learningPoints: const [
            LearningPoint(
              title: 'Polite Suggestions',
              explanation: '"I\'d recommend", "I\'d suggest", "We could consider" - use conditional for polite professional suggestions',
              indonesianExplanation: '"I\'d recommend", "I\'d suggest", "We could consider" - gunakan conditional untuk saran profesional yang sopan',
              type: LearningPointType.expression,
            ),
            LearningPoint(
              title: 'Discussing Feasibility',
              explanation: '"That\'s feasible", "That\'s doable", "We can make that happen" - positive responses to requirements',
              indonesianExplanation: '"That\'s feasible", "That\'s doable", "We can make that happen" - respons positif terhadap persyaratan',
              type: LearningPointType.expression,
            ),
            LearningPoint(
              title: 'Business & Tech Terms',
              explanation: 'MVP, concurrent users, load balancing, CDN, auto-scaling, traffic spikes - essential tech-business vocabulary',
              indonesianExplanation: 'MVP, concurrent users, load balancing, CDN, auto-scaling, traffic spikes - kosakata teknis-bisnis penting',
              type: LearningPointType.vocabulary,
            ),
          ],
          vocabulary: ['feasible', 'load balancing', 'auto-scaling', 'CDN', 'MVP', 'traffic spikes', 'concurrent users'],
        ),

        // AI PROJECT DISCUSSION
        Conversation(
          id: 'conv_004',
          title: 'AI Implementation Discussion',
          indonesianTitle: 'Diskusi Implementasi AI',
          description: 'Discussing an AI feature implementation with the team',
          category: 'ai_project',
          scenario: const ConversationScenario(
            location: 'Team Meeting Room',
            indonesianLocation: 'Ruang Rapat Tim',
            context: 'Planning session for adding AI features to the product',
            participants: ['You (ML Engineer)', 'Lisa (Product Manager)', 'Tom (Backend Lead)'],
            goal: 'Plan the AI feature implementation and discuss technical approach',
          ),
          difficulty: DifficultyLevel.advanced,
          duration: 900,
          messages: [
            const ConversationMessage(
              id: 'm1',
              speaker: 'Lisa',
              speakerRole: 'Product Manager',
              english: 'We want to add an AI-powered search feature. Users should be able to search using natural language instead of keywords. What\'s the best approach?',
              indonesian: 'Kami ingin menambahkan fitur pencarian berbasis AI. Pengguna harus dapat mencari menggunakan bahasa alami alih-alih kata kunci. Apa pendekatan terbaik?',
              type: MessageType.question,
            ),
            const ConversationMessage(
              id: 'm2',
              speaker: 'You',
              speakerRole: 'ML Engineer',
              english: 'I suggest we use a RAG architecture. We can embed our product catalog into a vector database and use semantic search. This way, the AI understands the intent behind queries, not just keywords.',
              indonesian: 'Saya menyarankan kita menggunakan arsitektur RAG. Kita dapat menyematkan katalog produk kita ke dalam database vektor dan menggunakan pencarian semantik. Dengan cara ini, AI memahami maksud di balik kueri, bukan hanya kata kunci.',
              type: MessageType.suggestion,
              notes: [
                const MessageNote(
                  content: 'RAG = Retrieval-Augmented Generation, a popular AI architecture',
                  type: NoteType.vocabulary,
                  highlightedWord: 'RAG',
                ),
              ],
            ),
            const ConversationMessage(
              id: 'm3',
              speaker: 'Tom',
              speakerRole: 'Backend Lead',
              english: 'What about latency? Will this add significant response time?',
              indonesian: 'Bagaimana dengan latensi? Apakah ini akan menambah waktu respons yang signifikan?',
              type: MessageType.question,
            ),
            const ConversationMessage(
              id: 'm4',
              speaker: 'You',
              speakerRole: 'ML Engineer',
              english: 'Good question. With proper caching and a optimized vector index, we can keep latency under 200ms. We should also implement a fallback to keyword search if the AI service is unavailable.',
              indonesian: 'Pertanyaan yang bagus. Dengan caching yang tepat dan indeks vektor yang dioptimalkan, kita dapat menjaga latensi di bawah 200ms. Kita juga harus mengimplementasikan fallback ke pencarian kata kunci jika layanan AI tidak tersedia.',
              type: MessageType.response,
            ),
            const ConversationMessage(
              id: 'm5',
              speaker: 'Lisa',
              speakerRole: 'Product Manager',
              english: 'How long would the implementation take?',
              indonesian: 'Berapa lama implementasi akan memakan waktu?',
              type: MessageType.question,
            ),
            const ConversationMessage(
              id: 'm6',
              speaker: 'You',
              speakerRole: 'ML Engineer',
              english: 'For a basic version, about 3-4 weeks. We need to set up the vector database, create embeddings for existing products, and integrate with the search API. Then we can iterate based on user feedback.',
              indonesian: 'Untuk versi dasar, sekitar 3-4 minggu. Kita perlu menyiapkan database vektor, membuat embeddings untuk produk yang ada, dan mengintegrasikan dengan API pencarian. Kemudian kita dapat iterasi berdasarkan umpan balik pengguna.',
              type: MessageType.response,
            ),
          ],
          learningPoints: const [
            LearningPoint(
              title: 'Explaining Technical Concepts',
              explanation: 'Use "This way..." to explain the benefit of your approach. Structure: Technical solution + "This way" + Business benefit',
              indonesianExplanation: 'Gunakan "This way..." untuk menjelaskan manfaat pendekatan Anda. Struktur: Solusi teknis + "This way" + Manfaat bisnis',
              type: LearningPointType.expression,
            ),
            LearningPoint(
              title: 'Addressing Concerns',
              explanation: '"Good question" acknowledges the concern. Then provide a specific, quantified answer when possible',
              indonesianExplanation: '"Good question" mengakui kekhawatiran. Kemudian berikan jawaban spesifik dan terukur ketika memungkinkan',
              type: LearningPointType.expression,
            ),
            LearningPoint(
              title: 'AI/ML Vocabulary',
              explanation: 'RAG, vector database, embeddings, semantic search, latency, fallback - essential AI implementation terms',
              indonesianExplanation: 'RAG, vector database, embeddings, semantic search, latency, fallback - istilah implementasi AI penting',
              type: LearningPointType.vocabulary,
            ),
          ],
          vocabulary: ['RAG', 'vector database', 'embeddings', 'semantic search', 'latency', 'fallback', 'iterate'],
        ),

        // TECHNICAL INTERVIEW
        Conversation(
          id: 'conv_005',
          title: 'Technical Interview',
          indonesianTitle: 'Wawancara Teknis',
          description: 'Common technical interview questions and responses',
          category: 'technical_interview',
          scenario: const ConversationScenario(
            location: 'Interview Room / Video Call',
            indonesianLocation: 'Ruang Wawancara / Panggilan Video',
            context: 'Software engineering technical interview',
            participants: ['You (Candidate)', 'Interviewer'],
            goal: 'Demonstrate technical knowledge and problem-solving skills',
          ),
          difficulty: DifficultyLevel.intermediate,
          duration: 1800,
          messages: [
            const ConversationMessage(
              id: 'm1',
              speaker: 'Interviewer',
              speakerRole: 'Interviewer',
              english: 'Can you tell me about a challenging technical problem you\'ve solved recently?',
              indonesian: 'Bisakah Anda menceritakan tentang masalah teknis menantang yang telah Anda selesaikan baru-baru ini?',
              type: MessageType.question,
            ),
            const ConversationMessage(
              id: 'm2',
              speaker: 'You',
              speakerRole: 'Candidate',
              english: 'Sure! In my last project, we had a performance issue where our API response time was over 5 seconds during peak hours. I led the investigation and found that the database queries were not optimized.',
              indonesian: 'Tentu! Di proyek terakhir saya, kami memiliki masalah kinerja di mana waktu respons API kami lebih dari 5 detik selama jam sibuk. Saya memimpin investigasi dan menemukan bahwa kueri database tidak dioptimalkan.',
              type: MessageType.response,
              notes: [
                const MessageNote(
                  content: 'Use the STAR method: Situation, Task, Action, Result',
                  type: NoteType.tip,
                ),
              ],
            ),
            const ConversationMessage(
              id: 'm3',
              speaker: 'You',
              speakerRole: 'Candidate',
              english: 'I added proper indexes, implemented query caching with Redis, and refactored the N+1 queries. This reduced the response time to under 200ms, a 95% improvement.',
              indonesian: 'Saya menambahkan indeks yang tepat, mengimplementasikan caching kueri dengan Redis, dan merefaktor kueri N+1. Ini mengurangi waktu respons menjadi di bawah 200ms, peningkatan 95%.',
              type: MessageType.normal,
            ),
            const ConversationMessage(
              id: 'm4',
              speaker: 'Interviewer',
              speakerRole: 'Interviewer',
              english: 'Great example. Now, let\'s say you need to design a URL shortener service. How would you approach this?',
              indonesian: 'Contoh yang bagus. Sekarang, katakanlah Anda perlu merancang layanan pemendek URL. Bagaimana Anda akan mendekati ini?',
              type: MessageType.question,
            ),
            const ConversationMessage(
              id: 'm5',
              speaker: 'You',
              speakerRole: 'Candidate',
              english: 'I\'d start by clarifying the requirements. What\'s the expected scale? Do we need analytics? Then I\'d design the core components: the ID generation algorithm, the database schema, and the redirect endpoint.',
              indonesian: 'Saya akan mulai dengan mengklarifikasi persyaratan. Apa skala yang diharapkan? Apakah kita perlu analitik? Kemudian saya akan merancang komponen inti: algoritma pembuatan ID, skema database, dan endpoint redirect.',
              type: MessageType.response,
              notes: [
                const MessageNote(
                  content: 'Always clarify requirements before jumping into solutions',
                  type: NoteType.tip,
                ),
              ],
            ),
          ],
          learningPoints: const [
            LearningPoint(
              title: 'STAR Interview Technique',
              explanation: 'Situation: Describe the context. Task: Your responsibility. Action: What you did. Result: The outcome with metrics',
              indonesianExplanation: 'Situation: Jelaskan konteksnya. Task: Tanggung jawab Anda. Action: Apa yang Anda lakukan. Result: Hasilnya dengan metrik',
              type: LearningPointType.expression,
            ),
            LearningPoint(
              title: 'Clarifying Questions',
              explanation: 'In system design interviews, always ask clarifying questions first: scale, requirements, constraints',
              indonesianExplanation: 'Dalam wawancara desain sistem, selalu ajukan pertanyaan klarifikasi terlebih dahulu: skala, persyaratan, batasan',
              type: LearningPointType.tip,
            ),
            LearningPoint(
              title: 'Technical Vocabulary',
              explanation: 'N+1 queries, caching, indexes, refactoring, response time, scale - common interview terms',
              indonesianExplanation: 'N+1 queries, caching, indexes, refactoring, response time, scale - istilah wawancara umum',
              type: LearningPointType.vocabulary,
            ),
          ],
          vocabulary: ['performance', 'optimized', 'indexes', 'caching', 'refactored', 'scale', 'requirements'],
        ),
      ];

  /// Get conversations by category
  static List<Conversation> getByCategory(String category) {
    return allConversations.where((c) => c.category == category).toList();
  }

  /// Get all unique categories
  static List<String> get categories {
    return allConversations.map((c) => c.category).toSet().toList();
  }

  /// Get conversations by difficulty
  static List<Conversation> getByDifficulty(DifficultyLevel difficulty) {
    return allConversations.where((c) => c.difficulty == difficulty).toList();
  }
}
