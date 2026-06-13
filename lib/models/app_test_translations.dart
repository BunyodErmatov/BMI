import '../utils/app_state.dart';

final Map<String, Map<String, String>> globalDict = {
  // MATEMATIKA
  'Quyidagi integralning qiymatini toping:': {
    'ru': 'Найдите значение следующего интеграла:',
    'en': 'Find the value of the following integral:',
  },
  '200 ning 15% i = ?': {'ru': '15% от 200 = ?', 'en': '15% of 200 = ?'},
  "Arifmetik progressiyaning n-hadi: aₙ = a₁ + (n−1)d. a₁=3, d=4, n=5 bo'lsa aₙ=?": {
    'ru':
        'Арифметическая прогрессия: aₙ = a₁ + (n−1)d. Если a₁=3, d=4, n=5, то aₙ=?',
    'en':
        'Arithmetic progression: aₙ = a₁ + (n−1)d. If a₁=3, d=4, n=5, then aₙ=?',
  },
  "To'g'ri to'rtburchak perimetri: a=6, b=4. P=?": {
    'ru': 'Периметр прямоугольника: a=6, b=4. P=?',
    'en': 'Perimeter of a rectangle: a=6, b=4. P=?',
  },
  'Kvadrat tenglamani yeching: x² − 5x + 6 = 0': {
    'ru': 'Решите квадратное уравнение: x² − 5x + 6 = 0',
    'en': 'Solve the quadratic equation: x² − 5x + 6 = 0',
  },
  "Doira yuzi: r=5. S=?": {
    'ru': 'Площадь круга: r=5. S=?',
    'en': 'Area of a circle: r=5. S=?',
  },
  "Kombinatsiya: C(5,2) = ?": {
    'ru': 'Комбинация: C(5,2) = ?',
    'en': 'Combination: C(5,2) = ?',
  },
  "Geometrik progressiya: b₁=2, q=3, n=4 → b₄=?": {
    'ru': 'Геометрическая прогрессия: b₁=2, q=3, n=4 → b₄=?',
    'en': 'Geometric progression: b₁=2, q=3, n=4 → b₄=?',
  },
  'Absolyut qiymat: |−15| = ?': {
    'ru': 'Абсолютное значение: |−15| = ?',
    'en': 'Absolute value: |−15| = ?',
  },
  "To'g'ri burchakli uchburchakda: a=3, b=4. Gipotenuz c=?": {
    'ru': 'В прямоугольном треугольнике: a=3, b=4. Гипотенуза c=?',
    'en': 'In a right-angled triangle: a=3, b=4. Hypotenuse c=?',
  },
  "Agar f(x) = 2x + 3 bo'lsa, f(4) = ?": {
    'ru': 'Если f(x) = 2x + 3, то f(4) = ?',
    'en': 'If f(x) = 2x + 3, then f(4) = ?',
  },

  // DASTURLASH
  "Flutter'da state boshqarish uchun qaysi widget ishlatiladi?": {
    'ru': 'Какой виджет используется для управления состоянием во Flutter?',
    'en': 'Which widget is used for state management in Flutter?',
  },
  "Dart tilida const va final farqi nima?": {
    'ru': 'В чем разница между const и final в Dart?',
    'en': 'What is the difference between const and final in Dart?',
  },
  "Python'da list comprehension qaysi?": {
    'ru': 'Что из этого является list comprehension в Python?',
    'en': 'Which of these is a list comprehension in Python?',
  },
  'HTTP GET va POST farqi?': {
    'ru': 'В чем разница между HTTP GET и POST?',
    'en': 'What is the difference between HTTP GET and POST?',
  },
  'SQL da qaysi buyruq jadval yaratadi?': {
    'ru': 'Какая команда SQL создает таблицу?',
    'en': 'Which SQL command creates a table?',
  },
  "OOP da inkapsulyatsiya nima?": {
    'ru': 'Что такое инкапсуляция в ООП?',
    'en': 'What is encapsulation in OOP?',
  },
  'Git buyrug\'i: yangi branch yaratish uchun?': {
    'ru': 'Команда Git: для создания новой ветки?',
    'en': 'Git command: to create a new branch?',
  },
  'JSON nima?': {'ru': 'Что такое JSON?', 'en': 'What is JSON?'},
  'Python da list va tuple farqi?': {
    'ru': 'В чем разница между list и tuple в Python?',
    'en': 'What is the difference between list and tuple in Python?',
  },
  "Flutter'da widget nima?": {
    'ru': 'Что такое виджет во Flutter?',
    'en': 'What is a widget in Flutter?',
  },
  "Big O notasi O(n²) qanday algoritm murakkabligini bildiradi?": {
    'ru': 'Какую сложность алгоритма означает О(n²)?',
    'en': 'What algorithmic complexity does Big O notation O(n²) represent?',
  },
  'CSS da qaysi xususiyat elementni markazga joylashtiradi?': {
    'ru': 'Какое свойство в CSS выравнивает элемент по центру?',
    'en': 'Which property in CSS centers an element?',
  },
  "API nima?": {'ru': 'Что такое API?', 'en': 'What is an API?'},
  'Dart da null safety uchun qaysi operator ishlatiladi?': {
    'ru': 'Какой оператор используется для null safety в Dart?',
    'en': 'Which operator is used for null safety in Dart?',
  },
  'Binary search algoritmi qaysi ro\'yxatda ishlaydi?': {
    'ru': 'В каком списке работает алгоритм бинарного поиска?',
    'en': 'In which list does the binary search algorithm work?',
  },
  'HTML da qaysi teg sarlavha (heading) uchun?': {
    'ru': 'Какой тег в HTML используется для заголовков?',
    'en': 'Which tag is used for headings in HTML?',
  },
  "Stack va Queue farqi?": {
    'ru': 'В чем разница между Stack и Queue?',
    'en': 'What is the difference between Stack and Queue?',
  },
  'Flutter\'da Future nima?': {
    'ru': 'Что такое Future во Flutter?',
    'en': 'What is a Future in Flutter?',
  },
  'Rekursiya nima?': {'ru': 'Что такое рекурсия?', 'en': 'What is recursion?'},
  'Python da def kalit so\'zi nima uchun?': {
    'ru': 'Для чего нужно ключевое слово def в Python?',
    'en': 'What is the def keyword used for in Python?',
  },
  'SQL da WHERE qanday ishlatiladi?': {
    'ru': 'Как используется WHERE в SQL?',
    'en': 'How is WHERE used in SQL?',
  },
  "Dart da Stream nima?": {
    'ru': 'Что такое Stream в Dart?',
    'en': 'What is a Stream in Dart?',
  },
  'Linked List da qaysi amal O(1) da ishlaydi?': {
    'ru': 'Какая операция в Linked List работает за O(1)?',
    'en': 'Which operation in a Linked List works in O(1)?',
  },
  'REST API da DELETE metodi nima qiladi?': {
    'ru': 'Что делает метод DELETE в REST API?',
    'en': 'What does the DELETE method do in a REST API?',
  },
  'Singleton pattern nima?': {
    'ru': 'Что такое Singleton паттерн?',
    'en': 'What is the Singleton pattern?',
  },

  // Options Coding
  "Farqi yo'q": {'ru': 'Нет разницы', 'en': 'No difference'},
  'const compile-time, final runtime': {
    'ru': 'const compile-time, final runtime',
    'en': 'const is compile-time, final runtime',
  },
  "GET oladi, POST yuboradi": {
    'ru': 'GET получает, POST отправляет',
    'en': 'GET receives, POST sends',
  },
  "Ma'lumotlarni yashirish": {'ru': 'Сокрытие данных', 'en': 'Data hiding'},
  "Ma'lumot almashish formati": {
    'ru': 'Формат обмена данными',
    'en': 'Data exchange format',
  },
  'List o\'zgaruvchan, tuple o\'zgarmas': {
    'ru': 'List изменяемый, tuple неизменяемый',
    'en': 'List is mutable, tuple is immutable',
  },
  'UI qurilish bloki': {'ru': 'Блок построения UI', 'en': 'UI building block'},
  'Kvadratik': {'ru': 'Квадратичная', 'en': 'Quadratic'},
  'Dasturlar o\'rtasida interfeys': {
    'ru': 'Интерфейс между программами',
    'en': 'Interface between programs',
  },
  "Tartiblangan ro'yxat": {'ru': 'Отсортированный список', 'en': 'Sorted list'},
  'Stack LIFO, Queue FIFO': {
    'ru': 'Stack LIFO, Queue FIFO',
    'en': 'Stack LIFO, Queue FIFO',
  },
  'Asinxron operatsiya natijasi': {
    'ru': 'Результат асинхронной операции',
    'en': 'Result of an asynchronous operation',
  },
  "O'zini o'zi chaqiruvchi funksiya": {
    'ru': 'Функция, вызывающая саму себя',
    'en': 'A function that calls itself',
  },
  'Funksiya aniqlash': {
    'ru': 'Определение функции',
    'en': 'Defining a function',
  },
  "Shart asosida filtrlash": {
    'ru': 'Фильтрация по условию',
    'en': 'Filtering based on a condition',
  },
  "Ketma-ket ma'lumotlar oqimi": {
    'ru': 'Непрерывный поток данных',
    'en': 'Continuous data stream',
  },
  "Boshiga qo'shish": {
    'ru': 'Добавление в начало',
    'en': 'Adding to the beginning',
  },
  "Ma'lumot o'chiradi": {'ru': 'Удаляет данные', 'en': 'Deletes data'},
  "Faqat bitta nusxa": {
    'ru': 'Только один экземпляр',
    'en': 'Only one instance',
  },

  // INGLIZ TILI (savollar inglizchadan tarjima qilinadi)
  'What is the past tense of "go"?': {
    'uz': '"Go" fe\'lining o\'tgan zamon shakli nima?',
    'ru': 'Какова форма прошедшего времени глагола "go"?',
  },
  'Choose the correct sentence:': {
    'uz': 'To\'g\'ri gapni tanlang:',
    'ru': 'Выберите правильное предложение:',
  },
  '"Ubiquitous" means?': {
    'uz': '"Ubiquitous" so\'zining ma\'nosi?',
    'ru': 'Что означает "Ubiquitous"?',
  },
  'Plural of "child":': {
    'uz': '"Child" ning ko\'plik shakli:',
    'ru': 'Множественное число от "child":',
  },
  'Which is correct?': {
    'uz': 'Qaysi biri to\'g\'ri?',
    'ru': 'Какой вариант правильный?',
  },
  'What does "diligent" mean?': {
    'uz': '"Diligent" nima degani?',
    'ru': 'Что означает "diligent"?',
  },
  'Choose the correct tense: "I ___ since morning." (work)': {
    'uz': 'To\'g\'ri zamonni tanlang: "I ___ since morning." (work)',
    'ru': 'Выберите правильное время: "I ___ since morning." (work)',
  },
  'Which word is a synonym of "happy"?': {
    'uz': 'Qaysi so\'z "happy" ning sinonimi?',
    'ru': 'Какое слово является синонимом "happy"?',
  },
  'Choose the correct article: "___ apple a day keeps the doctor away."': {
    'uz':
        'To\'g\'ri artiklni tanlang: "___ apple a day keeps the doctor away."',
    'ru':
        'Выберите правильный артикль: "___ apple a day keeps the doctor away."',
  },
  '"She ___ a book when I called." (read)': {
    'uz': '"She ___ a book when I called." (read)',
    'ru': '"She ___ a book when I called." (read)',
  },
  'Opposite of "ancient":': {
    'uz': '"Ancient" ning teskarisi:',
    'ru': 'Антоним к "ancient":',
  },
  'What is the comparative of "good"?': {
    'uz': '"Good" ning qiyosiy darajasi:',
    'ru': 'Сравнительная степень от "good":',
  },
  '"Ephemeral" means:': {
    'uz': '"Ephemeral" nimani anglatadi:',
    'ru': 'Что означает "ephemeral":',
  },
  'Choose the correct preposition: "I arrived ___ Monday."': {
    'uz': 'To\'g\'ri predlogni tanlang: "I arrived ___ Monday."',
    'ru': 'Выберите правильный предлог: "I arrived ___ Monday."',
  },
  'Which is correct conditional: "If I ___ rich, I would travel."': {
    'uz': 'Qaysi shart gapi to\'g\'ri: "If I ___ rich, I would travel."',
    'ru':
        'Какое условное предложение правильное: "If I ___ rich, I would travel."',
  },
  'Passive voice: "They built the house." →': {
    'uz': 'Majhul nisbat: "They built the house." →',
    'ru': 'Страдательный залог: "They built the house." →',
  },
  '"Meticulous" means:': {
    'uz': '"Meticulous" ma\'nosi:',
    'ru': '"Meticulous" означает:',
  },
  'Choose the correct form: "Neither of them ___ ready."': {
    'uz': 'To\'g\'ri shaklni tanlang: "Neither of them ___ ready."',
    'ru': 'Выберите правильную форму: "Neither of them ___ ready."',
  },
  'What does "perseverance" mean?': {
    'uz': '"Perseverance" nima degani?',
    'ru': 'Что означает "perseverance"?',
  },
  'Choose the correct word: "The news ___ shocking."': {
    'uz': 'To\'g\'ri so\'zni tanlang: "The news ___ shocking."',
    'ru': 'Выберите правильное слово: "The news ___ shocking."',
  },
  'Reported speech: He said, "I am tired." →': {
    'uz': 'O\'zlashtirma gap: He said, "I am tired." →',
    'ru': 'Косвенная речь: He said, "I am tired." →',
  },
  '"Ambiguous" means:': {
    'uz': '"Ambiguous" ma\'nosi:',
    'ru': '"Ambiguous" означает:',
  },
  'Choose correct: "I wish I ___ fly."': {
    'uz': 'To\'g\'risini tanlang: "I wish I ___ fly."',
    'ru': 'Выберите правильное: "I wish I ___ fly."',
  },
  'Which sentence uses the Present Perfect correctly?': {
    'uz': 'Qaysi gapda Present Perfect to\'g\'ri ishlatilgan?',
    'ru': 'В каком предложении верно использовано Present Perfect?',
  },
  '"Eloquent" means:': {
    'uz': '"Eloquent" nimani anglatadi:',
    'ru': '"Eloquent" означает:',
  },

  // TARIX QISQARIB O'TDI, faqat universal nomlar
  "Amir Temur qachon tug'ilgan?": {
    'ru': 'Когда родился Амир Темур?',
    'en': 'When was Amir Temur born?',
  },
  "O'zbekiston mustaqilligini qachon qo'lga kiritdi?": {
    'ru': 'Когда Узбекистан обрел независимость?',
    'en': 'When did Uzbekistan gain independence?',
  },
  'Birinchi jahon urushi qachon boshlangan?': {
    'ru': 'Когда началась Первая мировая война?',
    'en': 'When did the First World War begin?',
  },
  'Samarqand shahri qachon asos solingan?': {
    'ru': 'Когда был основан город Самарканд?',
    'en': 'When was the city of Samarkand founded?',
  },
  "Buyuk Ipak Yo'li qaysi shahardan boshlanar edi?": {
    'ru': 'С какого города начинался Великий Шелковый Путь?',
    'en': 'From which city did the Great Silk Road begin?',
  },

  // FIZIKA
  "Yorug'lik tezligi qancha?": {
    'ru': 'Какова скорость света?',
    'en': 'What is the speed of light?',
  },
  "Nyutonning birinchi qonuni nima?": {
    'ru': 'В чем суть первого закона Ньютона?',
    'en': 'What is Newton\'s first law?',
  },
  'Elektr qarshiligi birligi:': {
    'ru': 'Единица электрического сопротивления:',
    'en': 'Unit of electrical resistance:',
  },
  'Gravitatsiya tezlanishi (g) qancha?': {
    'ru': 'Ускорение свободного падения (g)?',
    'en': 'Gravitational acceleration (g)?',
  },
  'Issiqlik birligi:': {
    'ru': 'Единица измерения тепла:',
    'en': 'Unit of heat:',
  },
};

/// tMock funksiyasi: Berilgan matni joriy tilga moslashtirib qaytaradi.
/// 1) Agar UZ bo'lsa va lug'atda yo'q bo'lsa — asl matnni qaytaradi
/// 2) Lug'atda tarjima topilsa — tarjimasini qaytaradi
/// 3) Tarjima topilmasa — asl matnni o'zini qaytaradi (xato prefiks yo'q)
String tMock(String text) {
  final lang = AppState.language.value;

  // O'zbek tili uchun tarjima shart emas — asl matnni qaytaramiz
  if (lang == 'uz') return text;

  // Lug'atda shu matn va shu til tarjimasi bor bo'lsa — tarjimasini qaytaramiz
  if (globalDict.containsKey(text) && globalDict[text]!.containsKey(lang)) {
    return globalDict[text]![lang]!;
  }

  // Tarjima topilmasa — asl matnni qaytaramiz (prefiks qo'shmaymiz)
  return text;
}
