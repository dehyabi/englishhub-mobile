import 'package:flutter/material.dart';

/// Represents an English tense with examples and Indonesian explanation
class Tense {
  final String id;
  final String name;
  final String indonesianName;
  final TenseGroup group;
  final TenseTime time;
  final TenseAspect aspect;
  final String usage;
  final String indonesianUsage;
  final String formula;
  final String indonesianFormula;
  final List<TenseExample> examples;
  final List<String> signalWords;
  final List<String> indonesianSignalWords;
  final Color color;
  final List<CommonMistake> commonMistakes;

  Tense({
    required this.id,
    required this.name,
    required this.indonesianName,
    required this.group,
    required this.time,
    required this.aspect,
    required this.usage,
    required this.indonesianUsage,
    required this.formula,
    required this.indonesianFormula,
    required this.examples,
    this.signalWords = const [],
    this.indonesianSignalWords = const [],
    required this.color,
    this.commonMistakes = const [],
  });
}

/// Example sentence for a tense
class TenseExample {
  final String english;
  final String indonesian;
  final bool isNegative;
  final bool isQuestion;
  final String? note;
  final String? indonesianNote;

  const TenseExample({
    required this.english,
    required this.indonesian,
    this.isNegative = false,
    this.isQuestion = false,
    this.note,
    this.indonesianNote,
  });
}

/// Common mistakes learners make with tenses
class CommonMistake {
  final String incorrect;
  final String correct;
  final String explanation;
  final String indonesianExplanation;

  const CommonMistake({
    required this.incorrect,
    required this.correct,
    required this.explanation,
    required this.indonesianExplanation,
  });
}

/// Tense groups (Simple, Continuous, Perfect, Perfect Continuous)
enum TenseGroup {
  simple('Simple', 'Sederhana'),
  continuous('Continuous/Progressive', 'Berkelanjutan'),
  perfect('Perfect', 'Sempurna'),
  perfectContinuous('Perfect Continuous', 'Sempurna Berkelanjutan');

  final String name;
  final String indonesianName;

  const TenseGroup(this.name, this.indonesianName);
}

/// Time reference (Past, Present, Future)
enum TenseTime {
  past('Past', 'Masa Lalu'),
  present('Present', 'Masa Kini'),
  future('Future', 'Masa Depan');

  final String name;
  final String indonesianName;

  const TenseTime(this.name, this.indonesianName);
}

/// Aspect of the tense
enum TenseAspect {
  simple('Simple', 'Sederhana'),
  continuous('Continuous', 'Berkelanjutan'),
  perfect('Perfect', 'Sempurna'),
  perfectContinuous('Perfect Continuous', 'Sempurna Berkelanjutan');

  final String name;
  final String indonesianName;

  const TenseAspect(this.name, this.indonesianName);
}

/// All 12 English tenses with Indonesian explanations
class TensesData {
  static List<Tense> get allTenses => [
        // PRESENT TENSES
        Tense(
          id: 'present_simple',
          name: 'Present Simple',
          indonesianName: 'Present Sederhana',
          group: TenseGroup.simple,
          time: TenseTime.present,
          aspect: TenseAspect.simple,
          usage:
              'Used for habits, facts, general truths, and regular actions',
          indonesianUsage:
              'Digunakan untuk kebiasaan, fakta, kebenaran umum, dan tindakan teratur',
          formula: 'Subject + V1 (s/es)',
          indonesianFormula: 'Subjek + Kata Kerja 1 (s/es)',
          examples: [
            TenseExample(
              english: 'I write code every day',
              indonesian: 'Saya menulis kode setiap hari',
            ),
            TenseExample(
              english: 'She works at a tech company',
              indonesian: 'Dia bekerja di perusahaan teknologi',
            ),
            TenseExample(
              english: 'The API returns JSON data',
              indonesian: 'API mengembalikan data JSON',
            ),
            TenseExample(
              english: 'Do you use React or Vue?',
              indonesian: 'Apakah Anda menggunakan React atau Vue?',
              isQuestion: true,
            ),
          ],
          signalWords: [
            'always',
            'usually',
            'often',
            'every day',
            'sometimes',
            'never',
          ],
          indonesianSignalWords: [
            'selalu',
            'biasanya',
            'sering',
            'setiap hari',
            'kadang-kadang',
            'tidak pernah',
          ],
          color: Colors.blue,
          commonMistakes: [
            CommonMistake(
              incorrect: 'She work at Google',
              correct: 'She works at Google',
              explanation:
                  'Third person singular (he/she/it) needs -s ending',
              indonesianExplanation:
                  'Orang ketiga tunggal (he/she/it) membutuhkan akhiran -s',
            ),
          ],
        ),
        Tense(
          id: 'present_continuous',
          name: 'Present Continuous',
          indonesianName: 'Present Berkelanjutan',
          group: TenseGroup.continuous,
          time: TenseTime.present,
          aspect: TenseAspect.continuous,
          usage:
              'Used for actions happening now or temporary situations',
          indonesianUsage:
              'Digunakan untuk tindakan yang terjadi sekarang atau situasi sementara',
          formula: 'Subject + am/is/are + V-ing',
          indonesianFormula: 'Subjek + am/is/are + Kata Kerja-ing',
          examples: [
            TenseExample(
              english: 'I am debugging the code right now',
              indonesian: 'Saya sedang men-debug kode sekarang',
            ),
            TenseExample(
              english: 'She is learning TypeScript this month',
              indonesian: 'Dia sedang belajar TypeScript bulan ini',
            ),
            TenseExample(
              english: 'They are deploying the application',
              indonesian: 'Mereka sedang men-deploy aplikasi',
            ),
          ],
          signalWords: ['now', 'right now', 'at the moment', 'currently'],
          indonesianSignalWords: [
            'sekarang',
            'saat ini',
            'pada saat ini',
            'sedang',
          ],
          color: Colors.lightBlue,
        ),
        Tense(
          id: 'present_perfect',
          name: 'Present Perfect',
          indonesianName: 'Present Sempurna',
          group: TenseGroup.perfect,
          time: TenseTime.present,
          aspect: TenseAspect.perfect,
          usage:
              'Used for completed actions with present relevance or unspecified time',
          indonesianUsage:
              'Digunakan untuk tindakan selesai dengan relevansi sekarang atau waktu tidak spesifik',
          formula: 'Subject + have/has + V3',
          indonesianFormula: 'Subjek + have/has + Kata Kerja 3',
          examples: [
            TenseExample(
              english: 'I have finished the feature',
              indonesian: 'Saya telah menyelesaikan fitur tersebut',
            ),
            TenseExample(
              english: 'She has deployed the application',
              indonesian: 'Dia telah men-deploy aplikasi',
            ),
            TenseExample(
              english: 'We have fixed the bug',
              indonesian: 'Kami telah memperbaiki bug',
            ),
          ],
          signalWords: ['already', 'yet', 'just', 'ever', 'never', 'since', 'for'],
          indonesianSignalWords: ['sudah', 'belum', 'baru saja', 'pernah'],
          color: Colors.indigo,
        ),
        Tense(
          id: 'present_perfect_continuous',
          name: 'Present Perfect Continuous',
          indonesianName: 'Present Sempurna Berkelanjutan',
          group: TenseGroup.perfectContinuous,
          time: TenseTime.present,
          aspect: TenseAspect.perfectContinuous,
          usage: 'Used for actions that started in the past and continue to now',
          indonesianUsage: 'Digunakan untuk tindakan yang dimulai di masa lalu dan berlanjut hingga sekarang',
          formula: 'Subject + have/has + been + V-ing',
          indonesianFormula: 'Subjek + have/has + been + Kata Kerja-ing',
          examples: [
            TenseExample(
              english: 'I have been coding for 5 hours',
              indonesian: 'Saya telah sedang coding selama 5 jam',
            ),
            TenseExample(
              english: 'She has been working on this feature since morning',
              indonesian: 'Dia telah sedang mengerjakan fitur ini sejak pagi',
            ),
          ],
          signalWords: ['for', 'since', 'all day', 'all week'],
          indonesianSignalWords: ['selama', 'sejak'],
          color: Colors.purple,
        ),
        // PAST TENSES
        Tense(
          id: 'past_simple',
          name: 'Past Simple',
          indonesianName: 'Past Sederhana',
          group: TenseGroup.simple,
          time: TenseTime.past,
          aspect: TenseAspect.simple,
          usage: 'Used for completed actions at a specific time in the past',
          indonesianUsage: 'Digunakan untuk tindakan selesai di waktu spesifik di masa lalu',
          formula: 'Subject + V2',
          indonesianFormula: 'Subjek + Kata Kerja 2',
          examples: [
            TenseExample(
              english: 'I deployed the app yesterday',
              indonesian: 'Saya men-deploy aplikasi kemarin',
            ),
            TenseExample(
              english: 'She fixed the bug last night',
              indonesian: 'Dia memperbaiki bug tadi malam',
            ),
            TenseExample(
              english: 'We attended the meeting this morning',
              indonesian: 'Kami menghadiri rapat pagi ini',
            ),
          ],
          signalWords: ['yesterday', 'last week', 'ago', 'in 2023'],
          indonesianSignalWords: ['kemarin', 'minggu lalu', 'yang lalu'],
          color: Colors.orange,
        ),
        Tense(
          id: 'past_continuous',
          name: 'Past Continuous',
          indonesianName: 'Past Berkelanjutan',
          group: TenseGroup.continuous,
          time: TenseTime.past,
          aspect: TenseAspect.continuous,
          usage: 'Used for actions in progress at a specific time in the past',
          indonesianUsage: 'Digunakan untuk tindakan yang berlangsung di waktu spesifik di masa lalu',
          formula: 'Subject + was/were + V-ing',
          indonesianFormula: 'Subjek + was/were + Kata Kerja-ing',
          examples: [
            TenseExample(
              english: 'I was debugging when you called',
              indonesian: 'Saya sedang men-debug ketika Anda menelepon',
            ),
            TenseExample(
              english: 'They were having a standup at 9 AM',
              indonesian: 'Mereka sedang standup jam 9 pagi',
            ),
          ],
          signalWords: ['while', 'when', 'at 9 AM yesterday'],
          indonesianSignalWords: ['sedang', 'ketika'],
          color: Colors.deepOrange,
        ),
        Tense(
          id: 'past_perfect',
          name: 'Past Perfect',
          indonesianName: 'Past Sempurna',
          group: TenseGroup.perfect,
          time: TenseTime.past,
          aspect: TenseAspect.perfect,
          usage: 'Used for actions completed before another past action',
          indonesianUsage: 'Digunakan untuk tindakan selesai sebelum tindakan masa lalu lainnya',
          formula: 'Subject + had + V3',
          indonesianFormula: 'Subjek + had + Kata Kerja 3',
          examples: [
            TenseExample(
              english: 'I had finished the code before the meeting started',
              indonesian: 'Saya telah menyelesaikan kode sebelum rapat dimulai',
            ),
            TenseExample(
              english: 'She had already deployed when the bug was found',
              indonesian: 'Dia telah men-deploy ketika bug ditemukan',
            ),
          ],
          signalWords: ['before', 'after', 'already', 'by the time'],
          indonesianSignalWords: ['sebelum', 'setelah', 'sudah'],
          color: Colors.brown,
        ),
        Tense(
          id: 'past_perfect_continuous',
          name: 'Past Perfect Continuous',
          indonesianName: 'Past Sempurna Berkelanjutan',
          group: TenseGroup.perfectContinuous,
          time: TenseTime.past,
          aspect: TenseAspect.perfectContinuous,
          usage: 'Used for actions that were ongoing before another past action',
          indonesianUsage: 'Digunakan untuk tindakan yang sedang berlangsung sebelum tindakan masa lalu lainnya',
          formula: 'Subject + had + been + V-ing',
          indonesianFormula: 'Subjek + had + been + Kata Kerja-ing',
          examples: [
            TenseExample(
              english: 'I had been coding for 3 hours when the power went out',
              indonesian: 'Saya telah sedang coding selama 3 jam ketika listrik padam',
            ),
          ],
          signalWords: ['for', 'since', 'before'],
          indonesianSignalWords: ['selama', 'sejak', 'sebelum'],
          color: Colors.red,
        ),
        // FUTURE TENSES
        Tense(
          id: 'future_simple',
          name: 'Future Simple',
          indonesianName: 'Future Sederhana',
          group: TenseGroup.simple,
          time: TenseTime.future,
          aspect: TenseAspect.simple,
          usage: 'Used for actions that will happen in the future',
          indonesianUsage: 'Digunakan untuk tindakan yang akan terjadi di masa depan',
          formula: 'Subject + will + V1',
          indonesianFormula: 'Subjek + will + Kata Kerja 1',
          examples: [
            TenseExample(
              english: 'I will fix the bug tomorrow',
              indonesian: 'Saya akan memperbaiki bug besok',
            ),
            TenseExample(
              english: 'She will join the meeting later',
              indonesian: 'Dia akan bergabung dengan rapat nanti',
            ),
            TenseExample(
              english: 'We will deploy on Friday',
              indonesian: 'Kami akan men-deploy pada hari Jumat',
            ),
          ],
          signalWords: ['tomorrow', 'next week', 'soon', 'later'],
          indonesianSignalWords: ['besok', 'minggu depan', 'segera', 'nanti'],
          color: Colors.green,
        ),
        Tense(
          id: 'future_continuous',
          name: 'Future Continuous',
          indonesianName: 'Future Berkelanjutan',
          group: TenseGroup.continuous,
          time: TenseTime.future,
          aspect: TenseAspect.continuous,
          usage: 'Used for actions that will be in progress at a future time',
          indonesianUsage: 'Digunakan untuk tindakan yang akan berlangsung di waktu masa depan',
          formula: 'Subject + will + be + V-ing',
          indonesianFormula: 'Subjek + will + be + Kata Kerja-ing',
          examples: [
            TenseExample(
              english: 'I will be coding at 3 PM tomorrow',
              indonesian: 'Saya akan sedang coding jam 3 sore besok',
            ),
            TenseExample(
              english: 'They will be presenting the demo next Monday',
              indonesian: 'Mereka akan sedang presentasi demo Senin depan',
            ),
          ],
          signalWords: ['at this time tomorrow', 'next Monday at 9 AM'],
          indonesianSignalWords: ['pada saat ini besok'],
          color: Colors.lightGreen,
        ),
        Tense(
          id: 'future_perfect',
          name: 'Future Perfect',
          indonesianName: 'Future Sempurna',
          group: TenseGroup.perfect,
          time: TenseTime.future,
          aspect: TenseAspect.perfect,
          usage: 'Used for actions that will be completed before a future time',
          indonesianUsage: 'Digunakan untuk tindakan yang akan selesai sebelum waktu masa depan',
          formula: 'Subject + will + have + V3',
          indonesianFormula: 'Subjek + will + have + Kata Kerja 3',
          examples: [
            TenseExample(
              english: 'I will have finished the feature by Friday',
              indonesian: 'Saya akan telah menyelesaikan fitur pada hari Jumat',
            ),
            TenseExample(
              english: 'She will have deployed before the deadline',
              indonesian: 'Dia akan telah men-deploy sebelum tenggat waktu',
            ),
          ],
          signalWords: ['by tomorrow', 'by next week', 'by the time'],
          indonesianSignalWords: ['pada', 'sebelum'],
          color: Colors.teal,
        ),
        Tense(
          id: 'future_perfect_continuous',
          name: 'Future Perfect Continuous',
          indonesianName: 'Future Sempurna Berkelanjutan',
          group: TenseGroup.perfectContinuous,
          time: TenseTime.future,
          aspect: TenseAspect.perfectContinuous,
          usage: 'Used for actions that will have been ongoing up to a future time',
          indonesianUsage: 'Digunakan untuk tindakan yang akan telah berlangsung hingga waktu masa depan',
          formula: 'Subject + will + have + been + V-ing',
          indonesianFormula: 'Subjek + will + have + been + Kata Kerja-ing',
          examples: [
            TenseExample(
              english: 'By next month, I will have been working here for 2 years',
              indonesian: 'Pada bulan depan, saya akan telah sedang bekerja di sini selama 2 tahun',
            ),
          ],
          signalWords: ['by next year', 'for X years by'],
          indonesianSignalWords: ['pada', 'selama'],
          color: Colors cyan,
        ),
      ];
}
