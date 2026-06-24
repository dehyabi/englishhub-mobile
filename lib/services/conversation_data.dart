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
                  type: NoteType.tip,
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
                  type: NoteType.tip,
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
              type: LearningPointType.grammar,
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

        // TEAM MEETING
        Conversation(
          id: 'conv_006',
          title: 'Sprint Planning Meeting',
          indonesianTitle: 'Rapat Perencanaan Sprint',
          description: 'Planning the next sprint with your team',
          category: 'team_meeting',
          scenario: const ConversationScenario(
            location: 'Meeting Room / Video Call',
            indonesianLocation: 'Ruang Rapat / Panggilan Video',
            context: 'Sprint planning meeting to decide next iteration tasks',
            participants: ['You (Developer)', 'Anna (Scrum Master)', 'Ravi (Product Owner)'],
            goal: 'Plan the sprint backlog and agree on commitments',
          ),
          difficulty: DifficultyLevel.intermediate,
          duration: 420,
          messages: [
            const ConversationMessage(
              id: 'm1',
              speaker: 'Anna',
              speakerRole: 'Scrum Master',
              english: 'Alright team, let\'s start our sprint planning. We have 15 story points capacity this sprint. Ravi, what are the priorities?',
              indonesian: 'Baik tim, mari mulai perencanaan sprint kita. Kami memiliki kapasitas 15 story point sprint ini. Ravi, apa prioritasnya?',
              type: MessageType.greeting,
            ),
            const ConversationMessage(
              id: 'm2',
              speaker: 'Ravi',
              speakerRole: 'Product Owner',
              english: 'The top priority is the payment integration feature. We also need to fix the search bug that users have been reporting.',
              indonesian: 'Prioritas utama adalah fitur integrasi pembayaran. Kami juga perlu memperbaiki bug pencarian yang telah dilaporkan pengguna.',
              type: MessageType.normal,
            ),
            const ConversationMessage(
              id: 'm3',
              speaker: 'You',
              speakerRole: 'Developer',
              english: 'The payment integration is about 8 story points. For the search bug, I\'d estimate 3 points since I\'ve already looked into it.',
              indonesian: 'Integrasi pembayaran sekitar 8 story point. Untuk bug pencarian, saya perkirakan 3 point karena saya sudah melihatnya.',
              type: MessageType.response,
              notes: [
                const MessageNote(
                  content: '"I\'d estimate" is polite and shows the estimate is approximate',
                  type: NoteType.tip,
                ),
              ],
            ),
            const ConversationMessage(
              id: 'm4',
              speaker: 'Anna',
              speakerRole: 'Scrum Master',
              english: 'That leaves us with 4 points. Should we take on the dashboard redesign or keep some buffer?',
              indonesian: 'Itu menyisakan kita 4 point. Haruskah kita mengambil redesign dashboard atau menyimpan beberapa buffer?',
              type: MessageType.question,
            ),
            const ConversationMessage(
              id: 'm5',
              speaker: 'You',
              speakerRole: 'Developer',
              english: 'I\'d suggest keeping a buffer. The payment integration might have some unexpected complexity, and we don\'t want to overcommit.',
              indonesian: 'Saya sarankan menyimpan buffer. Integrasi pembayaran mungkin memiliki beberapa kompleksitas tak terduga, dan kita tidak ingin terlalu berkomitmen.',
              type: MessageType.suggestion,
              notes: [
                const MessageNote(
                  content: '"We don\'t want to overcommit" is a professional way to set realistic expectations',
                  type: NoteType.tip,
                ),
              ],
            ),
            const ConversationMessage(
              id: 'm6',
              speaker: 'Ravi',
              speakerRole: 'Product Owner',
              english: 'Fair point. Let\'s keep 4 points as buffer. We can always pull in more tasks if we finish early.',
              indonesian: 'Poin yang masuk akal. Mari simpan 4 point sebagai buffer. Kita selalu bisa menarik lebih banyak tugas jika kita selesai lebih awal.',
              type: MessageType.response,
            ),
          ],
          learningPoints: const [
            LearningPoint(
              title: 'Sprint Planning Vocabulary',
              explanation: 'Story points, capacity, sprint backlog, buffer, overcommit - key agile terms',
              indonesianExplanation: 'Story points, capacity, sprint backlog, buffer, overcommit - istilah agile penting',
              type: LearningPointType.vocabulary,
            ),
            LearningPoint(
              title: 'Making Estimates',
              explanation: 'Use "I\'d estimate" or "about" to show estimates are approximate, not guarantees',
              indonesianExplanation: 'Gunakan "I\'d estimate" atau "about" untuk menunjukkan estimasi bersifat perkiraan, bukan jaminan',
              type: LearningPointType.expression,
            ),
            LearningPoint(
              title: 'Setting Realistic Expectations',
              explanation: '"We don\'t want to overcommit" and "keeping a buffer" show responsible planning',
              indonesianExplanation: '"We don\'t want to overcommit" dan "keeping a buffer" menunjukkan perencanaan yang bertanggung jawab',
              type: LearningPointType.expression,
            ),
          ],
          vocabulary: ['sprint', 'story points', 'capacity', 'backlog', 'buffer', 'overcommit', 'priorities'],
        ),

        // PAIR PROGRAMMING
        Conversation(
          id: 'conv_007',
          title: 'Pair Programming Session',
          indonesianTitle: 'Sesi Pemrograman Berpasangan',
          description: 'Collaborating with a colleague on a feature',
          category: 'pair_programming',
          scenario: const ConversationScenario(
            location: 'Desk / Screen Share',
            indonesianLocation: 'Meja / Berbagi Layar',
            context: 'Pair programming to implement a new feature together',
            participants: ['You (Driver)', 'Jordan (Navigator)'],
            goal: 'Implement a new feature while communicating effectively',
          ),
          difficulty: DifficultyLevel.elementary,
          duration: 300,
          messages: [
            const ConversationMessage(
              id: 'm1',
              speaker: 'Jordan',
              speakerRole: 'Navigator',
              english: 'So for this function, I think we should validate the input first before processing it. What do you think?',
              indonesian: 'Jadi untuk fungsi ini, saya pikir kita harus memvalidasi input terlebih dahulu sebelum memprosesnya. Apa pendapatmu?',
              type: MessageType.suggestion,
            ),
            const ConversationMessage(
              id: 'm2',
              speaker: 'You',
              speakerRole: 'Driver',
              english: 'Good idea. I\'ll add a guard clause at the top to check for null values. Should we also check the format?',
              indonesian: 'Ide bagus. Saya akan menambahkan guard clause di atas untuk memeriksa nilai null. Haruskah kita juga memeriksa formatnya?',
              type: MessageType.response,
              notes: [
                const MessageNote(
                  content: '"Guard clause" = early return pattern to handle edge cases',
                  type: NoteType.vocabulary,
                  highlightedWord: 'guard clause',
                ),
              ],
            ),
            const ConversationMessage(
              id: 'm3',
              speaker: 'Jordan',
              speakerRole: 'Navigator',
              english: 'Yes, let\'s validate the email format too. We can use a regex for that.',
              indonesian: 'Ya, mari validasi format email juga. Kita bisa menggunakan regex untuk itu.',
              type: MessageType.response,
            ),
            const ConversationMessage(
              id: 'm4',
              speaker: 'You',
              speakerRole: 'Driver',
              english: 'Got it. I\'m writing the validation logic now. Can you check the naming convention? I want to make sure we\'re consistent with the rest of the codebase.',
              indonesian: 'Mengerti. Saya sedang menulis logika validasi sekarang. Bisakah kamu memeriksa konvensi penamaan? Saya ingin memastikan kita konsisten dengan sisa codebase.',
              type: MessageType.normal,
              notes: [
                const MessageNote(
                  content: '"Consistent with the codebase" - important principle in team coding',
                  type: NoteType.tip,
                ),
              ],
            ),
            const ConversationMessage(
              id: 'm5',
              speaker: 'Jordan',
              speakerRole: 'Navigator',
              english: 'Looks good! One small thing - maybe rename "data" to "userPayload" for clarity. Also, I noticed we\'re not handling the error case. Should we add a try-catch?',
              indonesian: 'Terlihat bagus! Satu hal kecil - mungkin ganti nama "data" menjadi "userPayload" untuk kejelasan. Juga, saya perhatikan kita tidak menangani kasus error. Haruskah kita menambahkan try-catch?',
              type: MessageType.suggestion,
            ),
            const ConversationMessage(
              id: 'm6',
              speaker: 'You',
              speakerRole: 'Driver',
              english: 'You\'re right, let me add that. I\'ll wrap it in a try-catch and throw a custom error if validation fails.',
              indonesian: 'Kamu benar, biarkan saya menambahkannya. Saya akan membungkusnya dalam try-catch dan melempar error kustom jika validasi gagal.',
              type: MessageType.response,
            ),
          ],
          learningPoints: const [
            LearningPoint(
              title: 'Pair Programming Roles',
              explanation: 'Driver writes code, Navigator reviews and suggests. Switch roles regularly',
              indonesianExplanation: 'Driver menulis kode, Navigator meninjau dan memberi saran. Tukar peran secara teratur',
              type: LearningPointType.vocabulary,
            ),
            LearningPoint(
              title: 'Collaborative Language',
              explanation: '"What do you think?", "Should we...?", "Let\'s..." - inclusive language for teamwork',
              indonesianExplanation: '"What do you think?", "Should we...?", "Let\'s..." - bahasa inklusif untuk kerja tim',
              type: LearningPointType.expression,
            ),
            LearningPoint(
              title: 'Code Review During Pairing',
              explanation: '"One small thing", "I noticed...", "Maybe rename..." - gentle suggestion patterns',
              indonesianExplanation: '"One small thing", "I noticed...", "Maybe rename..." - pola saran yang lembut',
              type: LearningPointType.expression,
            ),
          ],
          vocabulary: ['guard clause', 'validate', 'regex', 'naming convention', 'codebase', 'try-catch', 'custom error'],
        ),

        // BUG DISCUSSION
        Conversation(
          id: 'conv_008',
          title: 'Bug Triage Discussion',
          indonesianTitle: 'Diskusi Triage Bug',
          description: 'Discussing and prioritizing bugs with the team',
          category: 'bug_discussion',
          scenario: const ConversationScenario(
            location: 'Slack / Team Chat',
            indonesianLocation: 'Slack / Obrolan Tim',
            context: 'Team discussing a critical production bug',
            participants: ['You (Developer)', 'Sam (QA Engineer)', 'Nina (DevOps)'],
            goal: 'Identify the root cause and assign the fix',
          ),
          difficulty: DifficultyLevel.intermediate,
          duration: 360,
          messages: [
            const ConversationMessage(
              id: 'm1',
              speaker: 'Sam',
              speakerRole: 'QA Engineer',
              english: 'We have a P1 bug - users are getting a 500 error when they try to checkout. It started about 30 minutes ago.',
              indonesian: 'Kami punya bug P1 - pengguna mendapatkan error 500 ketika mereka mencoba checkout. Itu dimulai sekitar 30 menit lalu.',
              type: MessageType.normal,
              notes: [
                const MessageNote(
                  content: 'P1 = Priority 1, the highest priority level for bugs',
                  type: NoteType.vocabulary,
                  highlightedWord: 'P1',
                ),
              ],
            ),
            const ConversationMessage(
              id: 'm2',
              speaker: 'You',
              speakerRole: 'Developer',
              english: 'I\'ll take a look right away. Is it happening for all users or just a specific region?',
              indonesian: 'Saya akan segera melihatnya. Apakah itu terjadi untuk semua pengguna atau hanya wilayah tertentu?',
              type: MessageType.response,
            ),
            const ConversationMessage(
              id: 'm3',
              speaker: 'Sam',
              speakerRole: 'QA Engineer',
              english: 'It seems to be affecting all users. The error logs show a timeout on the payment gateway connection.',
              indonesian: 'Sepertinya mempengaruhi semua pengguna. Log error menunjukkan timeout pada koneksi gateway pembayaran.',
              type: MessageType.normal,
            ),
            const ConversationMessage(
              id: 'm4',
              speaker: 'Nina',
              speakerRole: 'DevOps',
              english: 'I just checked - the payment gateway API is indeed having issues on their end. Their status page confirms an ongoing incident.',
              indonesian: 'Saya baru saja memeriksa - API gateway pembayaran memang memiliki masalah di pihak mereka. Halaman status mereka mengonfirmasi insiden yang sedang berlangsung.',
              type: MessageType.normal,
            ),
            const ConversationMessage(
              id: 'm5',
              speaker: 'You',
              speakerRole: 'Developer',
              english: 'OK, so it\'s an external dependency issue. I\'ll add a fallback mechanism so if the gateway times out, we show a retry option instead of a 500 error.',
              indonesian: 'OK, jadi ini masalah dependensi eksternal. Saya akan menambahkan mekanisme fallback jadi jika gateway timeout, kita tampilkan opsi coba lagi alih-alih error 500.',
              type: MessageType.suggestion,
              notes: [
                const MessageNote(
                  content: '"Fallback mechanism" = backup system when the primary fails',
                  type: NoteType.vocabulary,
                  highlightedWord: 'fallback mechanism',
                ),
              ],
            ),
            const ConversationMessage(
              id: 'm6',
              speaker: 'Nina',
              speakerRole: 'DevOps',
              english: 'Good plan. I\'ll also set up an alert so we get notified immediately if the gateway goes down again.',
              indonesian: 'Rencana yang bagus. Saya juga akan menyiapkan peringatan agar kami segera diberitahu jika gateway down lagi.',
              type: MessageType.response,
            ),
          ],
          learningPoints: const [
            LearningPoint(
              title: 'Bug Priority Levels',
              explanation: 'P1 = Critical/Blocking, P2 = High, P3 = Medium, P4 = Low - standard priority classification',
              indonesianExplanation: 'P1 = Kritis/Menghalangi, P2 = Tinggi, P3 = Sedang, P4 = Rendah - klasifikasi prioritas standar',
              type: LearningPointType.vocabulary,
            ),
            LearningPoint(
              title: 'Investigating Bugs',
              explanation: '"Is it happening for all users?", "The error logs show...", "I just checked" - investigation phrases',
              indonesianExplanation: '"Is it happening for all users?", "The error logs show...", "I just checked" - frasa investigasi',
              type: LearningPointType.expression,
            ),
            LearningPoint(
              title: 'Proposing Solutions',
              explanation: '"I\'ll add a fallback mechanism", "Good plan", "I\'ll also set up an alert" - action-oriented responses',
              indonesianExplanation: '"I\'ll add a fallback mechanism", "Good plan", "I\'ll also set up an alert" - respons berorientasi tindakan',
              type: LearningPointType.expression,
            ),
          ],
          vocabulary: ['P1 bug', '500 error', 'checkout', 'timeout', 'payment gateway', 'fallback', 'alert', 'incident'],
        ),

        // CASUAL CHAT
        Conversation(
          id: 'conv_009',
          title: 'Coffee Break Chat',
          indonesianTitle: 'Obrolan Istirahat Kopi',
          description: 'Informal conversation with a colleague during break',
          category: 'casual_chat',
          scenario: const ConversationScenario(
            location: 'Office Kitchen / Chat App',
            indonesianLocation: 'Dapur Kantor / Aplikasi Chat',
            context: 'Casual conversation during a coffee break at work',
            participants: ['You', 'Emma (Colleague)'],
            goal: 'Practice casual workplace small talk',
          ),
          difficulty: DifficultyLevel.beginner,
          duration: 180,
          messages: [
            const ConversationMessage(
              id: 'm1',
              speaker: 'Emma',
              speakerRole: 'Colleague',
              english: 'Hey! How\'s it going? I haven\'t seen you around this week.',
              indonesian: 'Hei! Bagaimana kabarmu? Saya belum melihatmu minggu ini.',
              type: MessageType.greeting,
              notes: [
                const MessageNote(
                  content: '"How\'s it going?" is a casual way to ask "How are you?"',
                  type: NoteType.tip,
                ),
              ],
            ),
            const ConversationMessage(
              id: 'm2',
              speaker: 'You',
              speakerRole: 'Developer',
              english: 'Hey Emma! Yeah, I\'ve been swamped with the new feature launch. Finally getting a breather today.',
              indonesian: 'Hei Emma! Ya, saya sudah kewalahan dengan peluncuran fitur baru. Akhirnya bisa bernapas hari ini.',
              type: MessageType.response,
              notes: [
                const MessageNote(
                  content: '"Swamped" = very busy. "Getting a breather" = having a short rest',
                  type: NoteType.vocabulary,
                  highlightedWord: 'swamped',
                ),
              ],
            ),
            const ConversationMessage(
              id: 'm3',
              speaker: 'Emma',
              speakerRole: 'Colleague',
              english: 'Oh nice! Is that the AI search thing? I heard the demo was really impressive.',
              indonesian: 'Oh bagus! Apakah itu halaman pencarian AI? Saya dengar demonya sangat mengesankan.',
              type: MessageType.normal,
            ),
            const ConversationMessage(
              id: 'm4',
              speaker: 'You',
              speakerRole: 'Developer',
              english: 'That\'s the one! It was a lot of work, but the team really pulled together. By the way, did you catch the game last night?',
              indonesian: 'Itu dia! Banyak kerja keras, tapi tim benar-benar bersatu. Ngomong-ngomong, apakah kamu menonton pertandingan tadi malam?',
              type: MessageType.normal,
              notes: [
                const MessageNote(
                  content: '"Pulled together" = worked well as a team. "By the way" transitions to a new topic',
                  type: NoteType.vocabulary,
                  highlightedWord: 'pulled together',
                ),
              ],
            ),
            const ConversationMessage(
              id: 'm5',
              speaker: 'Emma',
              speakerRole: 'Colleague',
              english: 'I did! That last-minute goal was insane. Anyway, we should grab lunch sometime this week. I want to hear more about the project!',
              indonesian: 'Iya! Gol menit terakhir itu gila. Ngomong-ngomong, kita harus makan siang suatu hari minggu ini. Saya ingin mendengar lebih banyak tentang proyek itu!',
              type: MessageType.normal,
              notes: [
                const MessageNote(
                  content: '"We should grab lunch" = casual invitation to eat together',
                  type: NoteType.tip,
                  highlightedWord: 'grab lunch',
                ),
              ],
            ),
            const ConversationMessage(
              id: 'm6',
              speaker: 'You',
              speakerRole: 'Developer',
              english: 'Absolutely, let\'s do Thursday! I know a great ramen place near the office.',
              indonesian: 'Tentu, mari lakukan hari Kamis! Saya tahu tempat ramen yang bagus dekat kantor.',
              type: MessageType.response,
            ),
          ],
          learningPoints: const [
            LearningPoint(
              title: 'Casual Greetings',
              explanation: '"How\'s it going?", "What\'s up?", "How are things?" - informal workplace greetings',
              indonesianExplanation: '"How\'s it going?", "What\'s up?", "How are things?" - sapaan informal di tempat kerja',
              type: LearningPointType.expression,
            ),
            LearningPoint(
              title: 'Informal Idioms',
              explanation: '"Swamped" (very busy), "pull together" (work as a team), "grab lunch" (eat together casually)',
              indonesianExplanation: '"Swamped" (sangat sibuk), "pull together" (bekerja sebagai tim), "grab lunch" (makan bersama secara santai)',
              type: LearningPointType.vocabulary,
            ),
            LearningPoint(
              title: 'Topic Transitions',
              explanation: '"By the way", "Anyway", "Speaking of..." - natural ways to change the subject',
              indonesianExplanation: '"By the way", "Anyway", "Speaking of..." - cara alami untuk mengganti topik',
              type: LearningPointType.expression,
            ),
          ],
          vocabulary: ['swamped', 'breather', 'pulled together', 'grab lunch', 'insane', 'by the way', 'anyway'],
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
