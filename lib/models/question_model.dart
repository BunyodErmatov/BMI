import 'package:flutter/material.dart';
import '../utils/app_state.dart';
import 'app_test_translations.dart';

class QuestionModel {
  final String question;
  final Map<String, String>? localizedQuestions;
  final List<String> options;
  final Map<String, List<String>>? localizedOptions;
  final int correctIndex;
  final String? formula;

  const QuestionModel({
    required this.question,
    this.localizedQuestions,
    required this.options,
    this.localizedOptions,
    required this.correctIndex,
    this.formula,
  });

  // "askQuestion" maxsus getteri: Savolning asl o'rniga hozirgi tilni tekshirib tarjimasini qaytaradi
  String get askQuestion {
    if (localizedQuestions != null) {
      final lang = AppState.language.value;
      if (localizedQuestions!.containsKey(lang))
        return localizedQuestions![lang]!;
    }
    return tMock(
      question,
    ); // Agar maxsus tarjima yo'q bo'lsa globalDictionary(tMock) ga so'rov yuboradi
  }

  // Variantlarni (A, B, C, D) ham mos ravishda tarjima bilan qaytaruvchi getter
  List<String> get askOptions {
    if (localizedOptions != null) {
      final lang = AppState.language.value;
      if (localizedOptions!.containsKey(lang)) return localizedOptions![lang]!;
    }
    return options.map((o) => tMock(o)).toList();
  }
}

class SubjectModel {
  final String name;
  final String icon;
  final int testCount;
  final Color color;
  final List<QuestionModel> questions;

  const SubjectModel({
    required this.name,
    required this.icon,
    required this.testCount,
    required this.color,
    required this.questions,
  });
}

// ═══════════════════════════════════════════════════════════
//  MATEMATIKA — 25 savol
// ═══════════════════════════════════════════════════════════
final List<QuestionModel> mathQuestions = [
  const QuestionModel(
    question: 'Quyidagi integralning qiymatini toping:',
    formula: '∫ x² dx = ?',
    options: ['x³/3 + C', 'x² + C', '2x + C', 'x³/2 + C'],
    correctIndex: 0,
  ),
  const QuestionModel(
    question: '2 + 2 × 4 = ?',
    options: ['16', '10', '8', '12'],
    correctIndex: 1,
  ),
  const QuestionModel(
    question: 'log₂(64) = ?',
    options: ['4', '5', '6', '8'],
    correctIndex: 2,
  ),
  const QuestionModel(
    question: '√144 = ?',
    options: ['11', '12', '13', '14'],
    correctIndex: 1,
  ),
  const QuestionModel(
    question: '3² + 4² = ?',
    options: ['20', '24', '25', '49'],
    correctIndex: 2,
  ),
  const QuestionModel(
    question: 'sin(90°) = ?',
    options: ['0', '0.5', '1', '-1'],
    correctIndex: 2,
  ),
  const QuestionModel(
    question: '200 ning 15% i = ?',
    options: ['25', '30', '35', '40'],
    correctIndex: 1,
  ),
  const QuestionModel(
    question: '8! = ?',
    options: ['5040', '40320', '362880', '3628800'],
    correctIndex: 1,
  ),
  const QuestionModel(
    question: 'Fibonacci: 1, 1, 2, 3, 5, 8, ?',
    options: ['11', '12', '13', '15'],
    correctIndex: 2,
  ),
  const QuestionModel(
    question: '7 × 8 = ?',
    options: ['54', '56', '57', '58'],
    correctIndex: 1,
  ),
  const QuestionModel(
    question:
        "Arifmetik progressiyaning n-hadi: aₙ = a₁ + (n−1)d. a₁=3, d=4, n=5 bo'lsa aₙ=?",
    options: ['15', '17', '19', '21'],
    correctIndex: 2,
  ),
  const QuestionModel(
    question: 'cos(0°) = ?',
    options: ['0', '1', '-1', '0.5'],
    correctIndex: 1,
  ),
  const QuestionModel(
    question: "To'g'ri to'rtburchak perimetri: a=6, b=4. P=?",
    options: ['10', '20', '24', '48'],
    correctIndex: 1,
  ),
  const QuestionModel(
    question: 'Kvadrat tenglamani yeching: x² − 5x + 6 = 0',
    options: ['x=1, x=6', 'x=2, x=3', 'x=−2, x=−3', 'x=0, x=5'],
    correctIndex: 1,
  ),
  const QuestionModel(
    question: '(a+b)² = ?',
    options: ['a²+b²', 'a²+2ab+b²', 'a²−2ab+b²', '2a+2b'],
    correctIndex: 1,
  ),
  const QuestionModel(
    question: "Doira yuzi: r=5. S=?",
    formula: 'S = πr²',
    options: ['25π', '10π', '50π', '5π'],
    correctIndex: 0,
  ),
  const QuestionModel(
    question: 'tg(45°) = ?',
    options: ['0', '√2', '1', '√3'],
    correctIndex: 2,
  ),
  const QuestionModel(
    question: "Kombinatsiya: C(5,2) = ?",
    options: ['5', '10', '15', '20'],
    correctIndex: 1,
  ),
  const QuestionModel(
    question: '2^10 = ?',
    options: ['512', '1024', '2048', '256'],
    correctIndex: 1,
  ),
  const QuestionModel(
    question: "Geometrik progressiya: b₁=2, q=3, n=4 → b₄=?",
    options: ['18', '54', '81', '162'],
    correctIndex: 1,
  ),
  const QuestionModel(
    question: 'Absolyut qiymat: |−15| = ?',
    options: ['-15', '0', '15', '1/15'],
    correctIndex: 2,
  ),
  const QuestionModel(
    question: "To'g'ri burchakli uchburchakda: a=3, b=4. Gipotenuz c=?",
    options: ['5', '6', '7', '25'],
    correctIndex: 0,
  ),
  const QuestionModel(
    question: 'log₁₀(1000) = ?',
    options: ['2', '3', '4', '10'],
    correctIndex: 1,
  ),
  const QuestionModel(
    question: "Agar f(x) = 2x + 3 bo'lsa, f(4) = ?",
    options: ['10', '11', '12', '14'],
    correctIndex: 1,
  ),
  const QuestionModel(
    question: '(-3)³ = ?',
    options: ['9', '-9', '27', '-27'],
    correctIndex: 3,
  ),
];

// ═══════════════════════════════════════════════════════════
//  DASTURLASH — 25 savol
// ═══════════════════════════════════════════════════════════
final List<QuestionModel> codingQuestions = [
  const QuestionModel(
    question: "Flutter'da state boshqarish uchun qaysi widget ishlatiladi?",
    options: [
      'StatelessWidget',
      'StatefulWidget',
      'InheritedWidget',
      'Builder',
    ],
    correctIndex: 1,
  ),
  const QuestionModel(
    question: "Dart tilida const va final farqi nima?",
    options: [
      "Farqi yo'q",
      'const compile-time, final runtime',
      'final compile-time',
      'Ikkalasi runtime',
    ],
    correctIndex: 1,
  ),
  const QuestionModel(
    question: "Python'da list comprehension qaysi?",
    options: [
      '[x for x in range(10)]',
      '{x: x for x in range(10)}',
      '(x for x in range(10))',
      'map(x, range(10))',
    ],
    correctIndex: 0,
  ),
  const QuestionModel(
    question: 'HTTP GET va POST farqi?',
    options: [
      "GET oladi, POST yuboradi",
      "POST oladi, GET yuboradi",
      "Farqi yo'q",
      'Ikkalasi yuboradi',
    ],
    correctIndex: 0,
  ),
  const QuestionModel(
    question: 'SQL da qaysi buyruq jadval yaratadi?',
    options: ['INSERT', 'CREATE TABLE', 'ALTER', 'SELECT'],
    correctIndex: 1,
  ),
  const QuestionModel(
    question: "OOP da inkapsulyatsiya nima?",
    options: [
      'Vorislik',
      "Ma'lumotlarni yashirish",
      'Polimorfizm',
      'Abstraksiya',
    ],
    correctIndex: 1,
  ),
  const QuestionModel(
    question: 'Git buyrug\'i: yangi branch yaratish uchun?',
    options: [
      'git new branch',
      'git branch -b',
      'git checkout -b',
      'git create branch',
    ],
    correctIndex: 2,
  ),
  const QuestionModel(
    question: 'JSON nima?',
    options: [
      'Dasturlash tili',
      "Ma'lumot almashish formati",
      'Ma\'lumotlar bazasi',
      'Framework',
    ],
    correctIndex: 1,
  ),
  const QuestionModel(
    question: 'Python da list va tuple farqi?',
    options: [
      'Farqi yo\'q',
      'List o\'zgaruvchan, tuple o\'zgarmas',
      'Tuple o\'zgaruvchan, list o\'zgarmas',
      'Ikkalasi o\'zgarmas',
    ],
    correctIndex: 1,
  ),
  const QuestionModel(
    question: "Flutter'da widget nima?",
    options: ["Faqat tugma", 'UI qurilish bloki', "Faqat matn", "Faqat rasm"],
    correctIndex: 1,
  ),
  const QuestionModel(
    question: "Big O notasi O(n²) qanday algoritm murakkabligini bildiradi?",
    options: ['Chiziqli', 'Kvadratik', 'Logarifmik', 'Konstantli'],
    correctIndex: 1,
  ),
  const QuestionModel(
    question: 'CSS da qaysi xususiyat elementni markazga joylashtiradi?',
    options: [
      'align: center',
      'text-align: center',
      'display: flex + justify-content: center',
      'position: center',
    ],
    correctIndex: 2,
  ),
  const QuestionModel(
    question: "API nima?",
    options: [
      'Dasturlash tili',
      'Operatsion tizim',
      'Dasturlar o\'rtasida interfeys',
      'Ma\'lumotlar bazasi',
    ],
    correctIndex: 2,
  ),
  const QuestionModel(
    question: 'Dart da null safety uchun qaysi operator ishlatiladi?',
    options: ['?', '!', '??', 'Hammasi to\'g\'ri'],
    correctIndex: 3,
  ),
  const QuestionModel(
    question: 'Binary search algoritmi qaysi ro\'yxatda ishlaydi?',
    options: [
      "Tartibsiz ro'yxat",
      "Tartiblangan ro'yxat",
      "Faqat sonlar",
      "Faqat satrlar",
    ],
    correctIndex: 1,
  ),
  const QuestionModel(
    question: 'HTML da qaysi teg sarlavha (heading) uchun?',
    options: ['<p>', '<head>', '<h1>', '<title>'],
    correctIndex: 2,
  ),
  const QuestionModel(
    question: "Stack va Queue farqi?",
    options: [
      'Farqi yo\'q',
      'Stack LIFO, Queue FIFO',
      'Stack FIFO, Queue LIFO',
      'Ikkalasi FIFO',
    ],
    correctIndex: 1,
  ),
  const QuestionModel(
    question: 'Flutter\'da Future nima?',
    options: [
      'Sinxron funksiya',
      'Asinxron operatsiya natijasi',
      'Widget turi',
      'State turi',
    ],
    correctIndex: 1,
  ),
  const QuestionModel(
    question: 'Rekursiya nima?',
    options: [
      'Loop turi',
      "O'zini o'zi chaqiruvchi funksiya",
      'Massiv turi',
      "Ma'lumot turi",
    ],
    correctIndex: 1,
  ),
  const QuestionModel(
    question: 'Python da def kalit so\'zi nima uchun?',
    options: [
      'Sinf yaratish',
      'O\'zgaruvchi e\'lon qilish',
      'Funksiya aniqlash',
      'Import qilish',
    ],
    correctIndex: 2,
  ),
  const QuestionModel(
    question: 'SQL da WHERE qanday ishlatiladi?',
    options: [
      "Jadval yaratish",
      "Ma'lumot qo'shish",
      "Shart asosida filtrlash",
      "Tartiblash",
    ],
    correctIndex: 2,
  ),
  const QuestionModel(
    question: "Dart da Stream nima?",
    options: [
      "Bir marta ma'lumot",
      "Ketma-ket ma'lumotlar oqimi",
      "Widget turi",
      "Animatsiya",
    ],
    correctIndex: 1,
  ),
  const QuestionModel(
    question: 'Linked List da qaysi amal O(1) da ishlaydi?',
    options: [
      "O'rtaga qo'shish",
      "Boshiga qo'shish",
      "Oxirini topish",
      "N-tasini topish",
    ],
    correctIndex: 1,
  ),
  const QuestionModel(
    question: 'REST API da DELETE metodi nima qiladi?',
    options: [
      "Ma'lumot oladi",
      "Ma'lumot yaratadi",
      "Ma'lumot o'chiradi",
      "Ma'lumot yangilaydi",
    ],
    correctIndex: 2,
  ),
  const QuestionModel(
    question: 'Singleton pattern nima?',
    options: [
      "Ko'p nusxa yaratish",
      "Faqat bitta nusxa",
      "Vorislik usuli",
      "Interfeys turi",
    ],
    correctIndex: 1,
  ),
];

// ═══════════════════════════════════════════════════════════
//  INGLIZ TILI — 25 savol
// ═══════════════════════════════════════════════════════════
final List<QuestionModel> englishQuestions = [
  const QuestionModel(
    question: 'What is the past tense of "go"?',
    options: ['goed', 'gone', 'went', 'going'],
    correctIndex: 2,
  ),
  const QuestionModel(
    question: 'Choose the correct sentence:',
    options: [
      "She don't like apples",
      "She doesn't likes apples",
      "She doesn't like apples",
      'She not like apples',
    ],
    correctIndex: 2,
  ),
  const QuestionModel(
    question: '"Ubiquitous" means?',
    options: ['Unique', 'Present everywhere', 'Expensive', 'Large'],
    correctIndex: 1,
  ),
  const QuestionModel(
    question: 'Plural of "child":',
    options: ['childs', 'childes', 'children', 'childrens'],
    correctIndex: 2,
  ),
  const QuestionModel(
    question: 'Which is correct?',
    options: ['I am agree', 'I agree with you', 'I agreeing', 'I does agree'],
    correctIndex: 1,
  ),
  const QuestionModel(
    question: 'What does "diligent" mean?',
    options: ['Lazy', 'Hardworking', 'Careless', 'Slow'],
    correctIndex: 1,
  ),
  const QuestionModel(
    question: 'Choose the correct tense: "I ___ since morning." (work)',
    options: ['work', 'worked', 'have been working', 'am working'],
    correctIndex: 2,
  ),
  const QuestionModel(
    question: 'Which word is a synonym of "happy"?',
    options: ['Sad', 'Joyful', 'Angry', 'Tired'],
    correctIndex: 1,
  ),
  const QuestionModel(
    question:
        'Choose the correct article: "___ apple a day keeps the doctor away."',
    options: ['A', 'An', 'The', 'No article'],
    correctIndex: 1,
  ),
  const QuestionModel(
    question: '"She ___ a book when I called." (read)',
    options: ['reads', 'read', 'was reading', 'has read'],
    correctIndex: 2,
  ),
  const QuestionModel(
    question: 'Opposite of "ancient":',
    options: ['Old', 'Modern', 'Small', 'Dark'],
    correctIndex: 1,
  ),
  const QuestionModel(
    question: 'What is the comparative of "good"?',
    options: ['gooder', 'more good', 'better', 'best'],
    correctIndex: 2,
  ),
  const QuestionModel(
    question: '"Ephemeral" means:',
    options: ['Permanent', 'Short-lived', 'Beautiful', 'Dangerous'],
    correctIndex: 1,
  ),
  const QuestionModel(
    question: 'Choose the correct preposition: "I arrived ___ Monday."',
    options: ['in', 'at', 'on', 'by'],
    correctIndex: 2,
  ),
  const QuestionModel(
    question: 'Which is correct conditional: "If I ___ rich, I would travel."',
    options: ['am', 'was', 'were', 'be'],
    correctIndex: 2,
  ),
  const QuestionModel(
    question: 'Passive voice: "They built the house." →',
    options: [
      'The house built.',
      'The house was built.',
      'The house is built.',
      'The house has built.',
    ],
    correctIndex: 1,
  ),
  const QuestionModel(
    question: '"Meticulous" means:',
    options: ['Careless', 'Very careful about details', 'Fast', 'Noisy'],
    correctIndex: 1,
  ),
  const QuestionModel(
    question: 'Choose the correct form: "Neither of them ___ ready."',
    options: ['are', 'is', 'were', 'have'],
    correctIndex: 1,
  ),
  const QuestionModel(
    question: 'What does "perseverance" mean?',
    options: [
      'Giving up',
      'Continued effort despite difficulty',
      'Happiness',
      'Speed',
    ],
    correctIndex: 1,
  ),
  const QuestionModel(
    question: 'Choose the correct word: "The news ___ shocking."',
    options: ['are', 'were', 'is', 'have'],
    correctIndex: 2,
  ),
  const QuestionModel(
    question: 'Reported speech: He said, "I am tired." →',
    options: [
      'He said he is tired.',
      'He said he was tired.',
      'He said he were tired.',
      'He said I am tired.',
    ],
    correctIndex: 1,
  ),
  const QuestionModel(
    question: '"Ambiguous" means:',
    options: ['Clear', 'Having two meanings', 'Impossible', 'Simple'],
    correctIndex: 1,
  ),
  const QuestionModel(
    question: 'Choose correct: "I wish I ___ fly."',
    options: ['can', 'could', 'will', 'would'],
    correctIndex: 1,
  ),
  const QuestionModel(
    question: 'Which sentence uses the Present Perfect correctly?',
    options: [
      'I have went there.',
      'I have gone there.',
      'I have go there.',
      'I has gone there.',
    ],
    correctIndex: 1,
  ),
  const QuestionModel(
    question: '"Eloquent" means:',
    options: ['Silent', 'Fluent and expressive in speech', 'Rude', 'Confused'],
    correctIndex: 1,
  ),
];

// ═══════════════════════════════════════════════════════════
//  TARIX — 25 savol
// ═══════════════════════════════════════════════════════════
final List<QuestionModel> historyQuestions = [
  const QuestionModel(
    question: "Amir Temur qachon tug'ilgan?",
    options: ['1336', '1346', '1356', '1370'],
    correctIndex: 0,
  ),
  const QuestionModel(
    question: "O'zbekiston mustaqilligini qachon qo'lga kiritdi?",
    options: ['1990', '1991', '1992', '1993'],
    correctIndex: 1,
  ),
  const QuestionModel(
    question: 'Birinchi jahon urushi qachon boshlangan?',
    options: ['1912', '1913', '1914', '1915'],
    correctIndex: 2,
  ),
  const QuestionModel(
    question: 'Samarqand shahri qachon asos solingan?',
    options: ['Mil. av. VIII asr', 'Mil. av. VII asr', 'I asr', 'IV asr'],
    correctIndex: 1,
  ),
  const QuestionModel(
    question: "Buyuk Ipak Yo'li qaysi shahardan boshlanar edi?",
    options: ['Pekin', 'Samarqand', 'Istanbul', 'Rim'],
    correctIndex: 0,
  ),
  const QuestionModel(
    question: "Al-Xorazmiy qaysi asarda algebra ilmiga asos soldi?",
    options: [
      'Kitob ul-manazir',
      'Al-jabr val-muqobala',
      'Avesto',
      'Zafarnoma',
    ],
    correctIndex: 1,
  ),
  const QuestionModel(
    question: "II Jahon urushi qachon tugagan?",
    options: ['1943', '1944', '1945', '1946'],
    correctIndex: 2,
  ),
  const QuestionModel(
    question: "Temuriylar sulolasi qаchon tashkil topgan?",
    options: ['1370', '1380', '1390', '1400'],
    correctIndex: 0,
  ),
  const QuestionModel(
    question: "Fransuz inqilobi qachon bo'lgan?",
    options: ['1776', '1789', '1799', '1815'],
    correctIndex: 1,
  ),
  const QuestionModel(
    question: "Qaysi buyuk mutafakkir 'Qomusul-ulum' asarini yozgan?",
    options: ['Al-Xorazmiy', 'Ibn Sino', 'Beruniy', 'Ulug\'bek'],
    correctIndex: 1,
  ),
  const QuestionModel(
    question: "Mongol imperiyasini kim asos solgan?",
    options: ['Ogedey', 'Chingizxon', "Botu'", "Hulagu"],
    correctIndex: 1,
  ),
  const QuestionModel(
    question: "Amerika Qo'shma Shtatlari mustaqilligini qachon e'lon qildi?",
    options: ['1774', '1775', '1776', '1777'],
    correctIndex: 2,
  ),
  const QuestionModel(
    question: "Ulug'bek rasadxonasi qayerda qurilgan?",
    options: ['Buxoro', 'Samarqand', 'Toshkent', 'Xiva'],
    correctIndex: 1,
  ),
  const QuestionModel(
    question: "Qadimgi Misr sivilizatsiyasi qaysi daryo bo'yida rivojlangan?",
    options: ['Tigr', 'Yevfrat', 'Nil', 'Ganga'],
    correctIndex: 2,
  ),
  const QuestionModel(
    question: "Xiva xonligi qachon tashkil topgan?",
    options: ['XVI asr', 'XVII asr', 'XVIII asr', 'XIX asr'],
    correctIndex: 0,
  ),
  const QuestionModel(
    question: "Birinchi Olimpiya o'yinlari qachon o'tkazilgan?",
    options: ['Mil. av. 776', 'Mil. av. 700', 'Mil. av. 490', 'Mil. av. 323'],
    correctIndex: 0,
  ),
  const QuestionModel(
    question: "Rossiya imperiyasini kim tuzgan?",
    options: ["Pyotr I", "Ekatarina II", "Nikolay I", "Aleksandr I"],
    correctIndex: 0,
  ),
  const QuestionModel(
    question: "'Zafarnoma' asarini kim yozgan?",
    options: ["Navoiy", "Sharafiddin Ali Yazdiy", "Bobur", "Jomiy"],
    correctIndex: 1,
  ),
  const QuestionModel(
    question: "Berlin devori qachon qurilgan?",
    options: ['1959', '1960', '1961', '1962'],
    correctIndex: 2,
  ),
  const QuestionModel(
    question: "Qaysi shaxs 'Boburnoma' asarini yozgan?",
    options: ["Amir Temur", "Ulug'bek", "Zahiriddin Bobur", "Husayn Boyqaro"],
    correctIndex: 2,
  ),
  const QuestionModel(
    question: "Qadimgi Rim imperatorlari orasida kim birinchi bo'lgan?",
    options: ['Sezar', 'Avgust', 'Neron', 'Trayan'],
    correctIndex: 1,
  ),
  const QuestionModel(
    question: "O'zbekiston Respublikasining birinchi Prezidenti kim?",
    options: ['Sh. Mirziyoyev', "I.A. Karimov", "R. Nabiyev", "N.Nazarboyev"],
    correctIndex: 1,
  ),
  const QuestionModel(
    question: "Buxoro amirligining so'nggi amiri kim bo'lgan?",
    options: ['Muzaffar', 'Abdulahad', 'Olimxon', 'Nasrulloh'],
    correctIndex: 2,
  ),
  const QuestionModel(
    question: "Qaysi yilda Toshkent zilzilasi sodir bo'lgan?",
    options: ['1964', '1966', '1968', '1970'],
    correctIndex: 1,
  ),
  const QuestionModel(
    question:
        "Ikkinchi jahon urushida qaysi davlatlar fashistlar koalitsiyasini tashkil etdi?",
    options: [
      'Germaniya, Italiya, Yaponiya',
      'SSSR, AQSh, Britaniya',
      'Fransiya, Ispaniya, Italiya',
      'Germaniya, SSSR, Yaponiya',
    ],
    correctIndex: 0,
  ),
];

// ═══════════════════════════════════════════════════════════
//  FIZIKA — 25 savol
// ═══════════════════════════════════════════════════════════
final List<QuestionModel> physicsQuestions = [
  const QuestionModel(
    question: "Yorug'lik tezligi qancha?",
    options: ['3×10⁶ m/s', '3×10⁷ m/s', '3×10⁸ m/s', '3×10⁹ m/s'],
    correctIndex: 2,
  ),
  const QuestionModel(
    question: "Nyutonning birinchi qonuni nima?",
    options: [
      'F = ma',
      'Inersiya qonuni',
      'Harakat va reaksiya',
      'Energiya saqlanishi',
    ],
    correctIndex: 1,
  ),
  const QuestionModel(
    question: 'Elektr qarshiligi birligi:',
    options: ['Amper', 'Volt', 'Om', 'Vatt'],
    correctIndex: 2,
  ),
  const QuestionModel(
    question: 'Gravitatsiya tezlanishi (g) qancha?',
    options: ['8.9 m/s²', '9.8 m/s²', '10.8 m/s²', '11 m/s²'],
    correctIndex: 1,
  ),
  const QuestionModel(
    question: 'Issiqlik birligi:',
    options: ['Joul', 'Njuton', 'Paskal', 'Vatt'],
    correctIndex: 0,
  ),
  const QuestionModel(
    question: 'Nyutonning ikkinchi qonuniga ko\'ra F = ?',
    options: ['m + a', 'ma', 'm/a', 'm²a'],
    correctIndex: 1,
  ),
  const QuestionModel(
    question: 'Elektr kuchlanishi birligi:',
    options: ['Amper', 'Vatt', 'Volt', 'Om'],
    correctIndex: 2,
  ),
  const QuestionModel(
    question: 'Qaysi zarracha manfiy zaryadga ega?',
    options: ['Proton', 'Neytron', 'Elektron', 'Alfa-zarracha'],
    correctIndex: 2,
  ),
  const QuestionModel(
    question: "Ommaviy tortishish qonunini kim kashf etgan?",
    options: ['Eynshteyn', 'Nyuton', 'Galiley', 'Faraday'],
    correctIndex: 1,
  ),
  const QuestionModel(
    question: "Mexanik energiyaning saqlanish qonuni nima bildiradi?",
    options: [
      'Energiya yo\'qoladi',
      'Kinetik va potensial energiya yig\'indisi doimiy',
      'Faqat kinetik energiya saqlanadi',
      'Energiya yaratiladi',
    ],
    correctIndex: 1,
  ),
  const QuestionModel(
    question: 'Bosim birligi (SI):',
    options: ['Njuton', 'Joul', 'Paskal', 'Vatt'],
    correctIndex: 2,
  ),
  const QuestionModel(
    question: "Temperatura birligi (SI):",
    options: ['Selsiy', 'Farengeyt', 'Kelvin', 'Joule'],
    correctIndex: 2,
  ),
  const QuestionModel(
    question: 'Elektr toki birligi:',
    options: ['Volt', 'Amper', 'Om', 'Vatt'],
    correctIndex: 1,
  ),
  const QuestionModel(
    question: 'Atom yadrosi qanday zarrachalardan iborat?',
    options: [
      'Elektron va proton',
      'Proton va neytron',
      'Neytron va elektron',
      'Faqat proton',
    ],
    correctIndex: 1,
  ),
  const QuestionModel(
    question: 'Tezlik formulasi:',
    options: ['v = m·t', 'v = s·t', 'v = s/t', 'v = F/m'],
    correctIndex: 2,
  ),
  const QuestionModel(
    question: "Oʻm qonuni: I = ?",
    options: ['U·R', 'U/R', 'R/U', 'U+R'],
    correctIndex: 1,
  ),
  const QuestionModel(
    question: 'Fotoeffektni kim kashf etgan?',
    options: ['Nyuton', 'Eynshteyn', 'Gerts', 'Plank'],
    correctIndex: 2,
  ),
  const QuestionModel(
    question: 'Tovush tezligi havoda (taxminan)?',
    options: ['100 m/s', '340 m/s', '1000 m/s', '3000 m/s'],
    correctIndex: 1,
  ),
  const QuestionModel(
    question: "Massaning SI birligi:",
    options: ['Gramm', 'Kilogramm', 'Newton', 'Pound'],
    correctIndex: 1,
  ),
  const QuestionModel(
    question: 'Issiqlik o\'tkazuvchanlik qonunini kim kashf etgan?',
    options: ['Nyuton', 'Furye', 'Boltsman', 'Karnot'],
    correctIndex: 1,
  ),
  const QuestionModel(
    question: "Qaysi nur eng qisqa to'lqin uzunligiga ega?",
    options: [
      'Radio to\'lqin',
      'Infra-qizil',
      'Ko\'rinadigan yorug\'lik',
      'Gamma nurlanish',
    ],
    correctIndex: 3,
  ),
  const QuestionModel(
    question: 'Elektromagnit to\'lqinlar kashfiyotchisi kim?',
    options: ['Tesla', 'Faraday', 'Maksvell', 'Gerts'],
    correctIndex: 3,
  ),
  const QuestionModel(
    question: 'Absolyut nol temperatura:',
    options: ['-100°C', '-273.15°C', '-373.15°C', '0°C'],
    correctIndex: 1,
  ),
  const QuestionModel(
    question: 'Radioaktivlikni kim kashf etgan?',
    options: ['Kuri', 'Rentgen', 'Bekkerel', 'Rezerford'],
    correctIndex: 2,
  ),
  const QuestionModel(
    question: "Kvant mexanikasining asosini kim qo'ygan?",
    options: ['Eynshteyn', 'Plank', 'Bor', 'Shredinger'],
    correctIndex: 1,
  ),
];

// ═══════════════════════════════════════════════════════════
//  FANLAR RO'YXATI
// ═══════════════════════════════════════════════════════════
final List<SubjectModel> subjects = [
  SubjectModel(
    name: 'Matematika',
    icon: 'Σ',
    testCount: 25,
    color: const Color(0xFF7C3AED),
    questions: mathQuestions,
  ),
  SubjectModel(
    name: 'Dasturlash',
    icon: '</>',
    testCount: 25,
    color: const Color(0xFF0891B2),
    questions: codingQuestions,
  ),
  SubjectModel(
    name: 'Ingliz tili',
    icon: 'EN',
    testCount: 25,
    color: const Color(0xFF059669),
    questions: englishQuestions,
  ),
  SubjectModel(
    name: 'Tarix',
    icon: '📜',
    testCount: 25,
    color: const Color(0xFFD97706),
    questions: historyQuestions,
  ),
  SubjectModel(
    name: 'Fizika',
    icon: '⚡',
    testCount: 25,
    color: const Color(0xFFDC2626),
    questions: physicsQuestions,
  ),
];
