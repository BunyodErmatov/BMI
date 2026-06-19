import '../utils/app_state.dart';

final Map<String, Map<String, String>> globalDict = {
  // ── MATEMATIKA savollar ──────────────────────────────────
  'Quyidagi integralning qiymatini toping:': {
    'ru': 'Найдите значение следующего интеграла:',
    'en': 'Find the value of the following integral:',
  },
  '200 ning 15% i = ?': {'ru': '15% от 200 = ?', 'en': '15% of 200 = ?'},
  "Arifmetik progressiyaning n-hadi: aₙ = a₁ + (n−1)d. a₁=3, d=4, n=5 bo'lsa aₙ=?": {
    'ru':
        'Арифметическая прогрессия aₙ = a₁ + (n−1)d. Если a₁=3, d=4, n=5, то aₙ=?',
    'en':
        'Arithmetic progression aₙ = a₁ + (n−1)d. If a₁=3, d=4, n=5, then aₙ=?',
  },
  "To'g'ri to'rtburchak perimetri: a=6, b=4. P=?": {
    'ru': 'Периметр прямоугольника: a=6, b=4. P=?',
    'en': 'Rectangle perimeter: a=6, b=4. P=?',
  },
  'Kvadrat tenglamani yeching: x² − 5x + 6 = 0': {
    'ru': 'Решите квадратное уравнение: x² − 5x + 6 = 0',
    'en': 'Solve the quadratic equation: x² − 5x + 6 = 0',
  },
  'Doira yuzi: r=5. S=?': {
    'ru': 'Площадь круга: r=5. S=?',
    'en': 'Area of a circle: r=5. S=?',
  },
  'Kombinatsiya: C(5,2) = ?': {
    'ru': 'Комбинация: C(5,2) = ?',
    'en': 'Combination: C(5,2) = ?',
  },
  'Geometrik progressiya: b₁=2, q=3, n=4 → b₄=?': {
    'ru': 'Геометрическая прогрессия: b₁=2, q=3, n=4 → b₄=?',
    'en': 'Geometric progression: b₁=2, q=3, n=4 → b₄=?',
  },
  'Absolyut qiymat: |−15| = ?': {
    'ru': 'Абсолютное значение: |−15| = ?',
    'en': 'Absolute value: |−15| = ?',
  },
  "To'g'ri burchakli uchburchakda: a=3, b=4. Gipotenuz c=?": {
    'ru': 'В прямоугольном треугольнике: a=3, b=4. Гипотенуза c=?',
    'en': 'In a right triangle: a=3, b=4. Hypotenuse c=?',
  },
  "Agar f(x) = 2x + 3 bo'lsa, f(4) = ?": {
    'ru': 'Если f(x) = 2x + 3, то f(4) = ?',
    'en': 'If f(x) = 2x + 3, then f(4) = ?',
  },

  // ── DASTURLASH savollar ──────────────────────────────────
  "Flutter'da state boshqarish uchun qaysi widget ishlatiladi?": {
    'ru': 'Какой виджет используется для управления состоянием во Flutter?',
    'en': 'Which widget is used for state management in Flutter?',
  },
  'Dart tilida const va final farqi nima?': {
    'ru': 'В чём разница между const и final в Dart?',
    'en': 'What is the difference between const and final in Dart?',
  },
  "Python'da list comprehension qaysi?": {
    'ru': 'Что является list comprehension в Python?',
    'en': 'Which of these is a list comprehension in Python?',
  },
  'HTTP GET va POST farqi?': {
    'ru': 'В чём разница между HTTP GET и POST?',
    'en': 'What is the difference between HTTP GET and POST?',
  },
  'SQL da qaysi buyruq jadval yaratadi?': {
    'ru': 'Какая команда SQL создаёт таблицу?',
    'en': 'Which SQL command creates a table?',
  },
  'OOP da inkapsulyatsiya nima?': {
    'ru': 'Что такое инкапсуляция в ООП?',
    'en': 'What is encapsulation in OOP?',
  },
  "Git buyrug'i: yangi branch yaratish uchun?": {
    'ru': 'Команда Git для создания новой ветки?',
    'en': 'Git command to create a new branch?',
  },
  'JSON nima?': {'ru': 'Что такое JSON?', 'en': 'What is JSON?'},
  'Python da list va tuple farqi?': {
    'ru': 'В чём разница между list и tuple в Python?',
    'en': 'What is the difference between list and tuple in Python?',
  },
  "Flutter'da widget nima?": {
    'ru': 'Что такое виджет во Flutter?',
    'en': 'What is a widget in Flutter?',
  },
  'Big O notasi O(n²) qanday algoritm murakkabligini bildiradi?': {
    'ru': 'Какую сложность алгоритма означает O(n²)?',
    'en': 'What algorithmic complexity does O(n²) represent?',
  },
  'CSS da qaysi xususiyat elementni markazga joylashtiradi?': {
    'ru': 'Какое свойство CSS центрирует элемент?',
    'en': 'Which CSS property centers an element?',
  },
  'API nima?': {'ru': 'Что такое API?', 'en': 'What is an API?'},
  'Dart da null safety uchun qaysi operator ishlatiladi?': {
    'ru': 'Какой оператор используется для null safety в Dart?',
    'en': 'Which operator is used for null safety in Dart?',
  },
  "Binary search algoritmi qaysi ro'yxatda ishlaydi?": {
    'ru': 'В каком списке работает алгоритм бинарного поиска?',
    'en': 'In which list does binary search work?',
  },
  'HTML da qaysi teg sarlavha (heading) uchun?': {
    'ru': 'Какой тег HTML используется для заголовков?',
    'en': 'Which HTML tag is used for headings?',
  },
  'Stack va Queue farqi?': {
    'ru': 'В чём разница между Stack и Queue?',
    'en': 'What is the difference between Stack and Queue?',
  },
  "Flutter'da Future nima?": {
    'ru': 'Что такое Future во Flutter?',
    'en': 'What is a Future in Flutter?',
  },
  'Rekursiya nima?': {'ru': 'Что такое рекурсия?', 'en': 'What is recursion?'},
  "Python da def kalit so'zi nima uchun?": {
    'ru': 'Для чего нужно ключевое слово def в Python?',
    'en': 'What is the def keyword used for in Python?',
  },
  'SQL da WHERE qanday ishlatiladi?': {
    'ru': 'Как используется WHERE в SQL?',
    'en': 'How is WHERE used in SQL?',
  },
  'Dart da Stream nima?': {
    'ru': 'Что такое Stream в Dart?',
    'en': 'What is a Stream in Dart?',
  },
  'Linked List da qaysi amal O(1) da ishlaydi?': {
    'ru': 'Какая операция в Linked List работает за O(1)?',
    'en': 'Which Linked List operation runs in O(1)?',
  },
  'REST API da DELETE metodi nima qiladi?': {
    'ru': 'Что делает метод DELETE в REST API?',
    'en': 'What does the DELETE method do in REST API?',
  },
  'Singleton pattern nima?': {
    'ru': 'Что такое паттерн Singleton?',
    'en': 'What is the Singleton pattern?',
  },

  // ── DASTURLASH javob variantlari ────────────────────────
  "Farqi yo'q": {'ru': 'Нет разницы', 'en': 'No difference'},
  'const compile-time, final runtime': {
    'ru': 'const — compile-time, final — runtime',
    'en': 'const is compile-time, final is runtime',
  },
  'final compile-time': {
    'ru': 'final — compile-time',
    'en': 'final is compile-time',
  },
  'Ikkalasi runtime': {'ru': 'Оба runtime', 'en': 'Both are runtime'},
  'GET oladi, POST yuboradi': {
    'ru': 'GET получает, POST отправляет',
    'en': 'GET retrieves, POST sends',
  },
  'POST oladi, GET yuboradi': {
    'ru': 'POST получает, GET отправляет',
    'en': 'POST retrieves, GET sends',
  },
  'Ikkalasi yuboradi': {'ru': 'Оба отправляют', 'en': 'Both send data'},
  'Vorislik': {'ru': 'Наследование', 'en': 'Inheritance'},
  "Ma'lumotlarni yashirish": {'ru': 'Сокрытие данных', 'en': 'Data hiding'},
  'Polimorfizm': {'ru': 'Полиморфизм', 'en': 'Polymorphism'},
  'Abstraksiya': {'ru': 'Абстракция', 'en': 'Abstraction'},
  'Dasturlash tili': {
    'ru': 'Язык программирования',
    'en': 'Programming language',
  },
  "Ma'lumot almashish formati": {
    'ru': 'Формат обмена данными',
    'en': 'Data exchange format',
  },
  "Ma'lumotlar bazasi": {'ru': 'База данных', 'en': 'Database'},
  'Framework': {'ru': 'Фреймворк', 'en': 'Framework'},
  "List o'zgaruvchan, tuple o'zgarmas": {
    'ru': 'List изменяемый, tuple неизменяемый',
    'en': 'List is mutable, tuple is immutable',
  },
  "Tuple o'zgaruvchan, list o'zgarmas": {
    'ru': 'Tuple изменяемый, list неизменяемый',
    'en': 'Tuple is mutable, list is immutable',
  },
  "Ikkalasi o'zgarmas": {'ru': 'Оба неизменяемые', 'en': 'Both are immutable'},
  'Faqat tugma': {'ru': 'Только кнопка', 'en': 'Only a button'},
  'UI qurilish bloki': {'ru': 'Блок построения UI', 'en': 'UI building block'},
  'Faqat matn': {'ru': 'Только текст', 'en': 'Only text'},
  'Faqat rasm': {'ru': 'Только изображение', 'en': 'Only an image'},
  'Chiziqli': {'ru': 'Линейная', 'en': 'Linear'},
  'Kvadratik': {'ru': 'Квадратичная', 'en': 'Quadratic'},
  'Logarifmik': {'ru': 'Логарифмическая', 'en': 'Logarithmic'},
  'Konstantli': {'ru': 'Константная', 'en': 'Constant'},
  "Dasturlar o'rtasida interfeys": {
    'ru': 'Интерфейс между программами',
    'en': 'Interface between programs',
  },
  'Operatsion tizim': {'ru': 'Операционная система', 'en': 'Operating system'},
  "Hammasi to'g'ri": {'ru': 'Все правильно', 'en': 'All correct'},
  "Tartibsiz ro'yxat": {'ru': 'Неупорядоченный список', 'en': 'Unsorted list'},
  "Tartiblangan ro'yxat": {'ru': 'Отсортированный список', 'en': 'Sorted list'},
  'Faqat sonlar': {'ru': 'Только числа', 'en': 'Only numbers'},
  'Faqat satrlar': {'ru': 'Только строки', 'en': 'Only strings'},
  'Stack LIFO, Queue FIFO': {
    'ru': 'Stack — LIFO, Queue — FIFO',
    'en': 'Stack is LIFO, Queue is FIFO',
  },
  'Stack FIFO, Queue LIFO': {
    'ru': 'Stack — FIFO, Queue — LIFO',
    'en': 'Stack is FIFO, Queue is LIFO',
  },
  'Ikkalasi FIFO': {'ru': 'Оба FIFO', 'en': 'Both are FIFO'},
  'Sinxron funksiya': {
    'ru': 'Синхронная функция',
    'en': 'Synchronous function',
  },
  'Asinxron operatsiya natijasi': {
    'ru': 'Результат асинхронной операции',
    'en': 'Result of an asynchronous operation',
  },
  'Widget turi': {'ru': 'Тип виджета', 'en': 'Widget type'},
  'State turi': {'ru': 'Тип состояния', 'en': 'State type'},
  'Loop turi': {'ru': 'Тип цикла', 'en': 'Type of loop'},
  "O'zini o'zi chaqiruvchi funksiya": {
    'ru': 'Функция, вызывающая саму себя',
    'en': 'A function that calls itself',
  },
  'Massiv turi': {'ru': 'Тип массива', 'en': 'Array type'},
  "Ma'lumot turi": {'ru': 'Тип данных', 'en': 'Data type'},
  'Sinf yaratish': {'ru': 'Создание класса', 'en': 'Creating a class'},
  "O'zgaruvchi e'lon qilish": {
    'ru': 'Объявление переменной',
    'en': 'Declaring a variable',
  },
  'Funksiya aniqlash': {
    'ru': 'Определение функции',
    'en': 'Defining a function',
  },
  'Import qilish': {'ru': 'Импорт', 'en': 'Importing'},
  'Jadval yaratish': {'ru': 'Создание таблицы', 'en': 'Creating a table'},
  "Ma'lumot qo'shish": {'ru': 'Добавление данных', 'en': 'Adding data'},
  'Shart asosida filtrlash': {
    'ru': 'Фильтрация по условию',
    'en': 'Filtering by condition',
  },
  'Tartiblash': {'ru': 'Сортировка', 'en': 'Sorting'},
  "Bir marta ma'lumot": {'ru': 'Данные один раз', 'en': 'Data once'},
  "Ketma-ket ma'lumotlar oqimi": {
    'ru': 'Непрерывный поток данных',
    'en': 'A continuous stream of data',
  },
  'Animatsiya': {'ru': 'Анимация', 'en': 'Animation'},
  "O'rtaga qo'shish": {
    'ru': 'Вставка в середину',
    'en': 'Inserting in the middle',
  },
  "Boshiga qo'shish": {
    'ru': 'Вставка в начало',
    'en': 'Inserting at the beginning',
  },
  'Oxirini topish': {'ru': 'Поиск конца', 'en': 'Finding the end'},
  'N-tasini topish': {
    'ru': 'Поиск N-го элемента',
    'en': 'Finding the N-th element',
  },
  "Ma'lumot oladi": {'ru': 'Получает данные', 'en': 'Retrieves data'},
  "Ma'lumot yaratadi": {'ru': 'Создаёт данные', 'en': 'Creates data'},
  "Ma'lumot o'chiradi": {'ru': 'Удаляет данные', 'en': 'Deletes data'},
  "Ma'lumot yangilaydi": {'ru': 'Обновляет данные', 'en': 'Updates data'},
  "Ko'p nusxa yaratish": {
    'ru': 'Создание нескольких экземпляров',
    'en': 'Creating multiple instances',
  },
  'Faqat bitta nusxa': {
    'ru': 'Только один экземпляр',
    'en': 'Only one instance',
  },
  'Vorislik usuli': {'ru': 'Метод наследования', 'en': 'Inheritance method'},
  'Interfeys turi': {'ru': 'Тип интерфейса', 'en': 'Interface type'},

  // ── INGLIZ TILI savollar ────────────────────────────────
  'What is the past tense of "go"?': {
    'uz': '"go" fe\'lining o\'tgan zamon shakli?',
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
    'ru': 'Множественное число "child":',
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
    'uz': 'Qaysi so\'z "happy" sinonimi?',
    'ru': 'Какое слово является синонимом "happy"?',
  },
  'Choose the correct article: "___ apple a day keeps the doctor away."': {
    'uz': 'To\'g\'ri artiklni tanlang: "___ apple a day..."',
    'ru': 'Выберите правильный артикль: "___ apple a day..."',
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
    'ru': 'Степень сравнения слова "good":',
  },
  '"Ephemeral" means:': {
    'uz': '"Ephemeral" nima degani:',
    'ru': '"Ephemeral" означает:',
  },
  'Choose the correct preposition: "I arrived ___ Monday."': {
    'uz': 'To\'g\'ri predlogni tanlang: "I arrived ___ Monday."',
    'ru': 'Выберите правильный предлог: "I arrived ___ Monday."',
  },
  'Which is correct conditional: "If I ___ rich, I would travel."': {
    'uz': 'To\'g\'ri shaklni tanlang: "If I ___ rich, I would travel."',
    'ru': 'Правильная форма: "If I ___ rich, I would travel."',
  },
  'Passive voice: "They built the house." \u2192': {
    'uz': 'Passiv nisbat: "They built the house." →',
    'ru': 'Пассивный залог: "They built the house." →',
  },
  '"Meticulous" means:': {
    'uz': '"Meticulous" nima degani:',
    'ru': '"Meticulous" означает:',
  },
  'Choose the correct form: "Neither of them ___ ready."': {
    'uz': 'To\'g\'ri shaklni tanlang: "Neither of them ___ ready."',
    'ru': 'Правильная форма: "Neither of them ___ ready."',
  },
  'What does "perseverance" mean?': {
    'uz': '"Perseverance" nima degani?',
    'ru': 'Что означает "perseverance"?',
  },
  'Choose the correct word: "The news ___ shocking."': {
    'uz': 'To\'g\'ri so\'zni tanlang: "The news ___ shocking."',
    'ru': 'Выберите правильное слово: "The news ___ shocking."',
  },
  'Reported speech: He said, "I am tired." \u2192': {
    'uz': 'Bilvosita nutq: He said, "I am tired." →',
    'ru': 'Косвенная речь: He said, "I am tired." →',
  },
  '"Ambiguous" means:': {
    'uz': '"Ambiguous" nima degani:',
    'ru': '"Ambiguous" означает:',
  },
  'Choose correct: "I wish I ___ fly."': {
    'uz': 'To\'g\'ri tanlang: "I wish I ___ fly."',
    'ru': 'Выберите правильно: "I wish I ___ fly."',
  },
  'Which sentence uses the Present Perfect correctly?': {
    'uz': 'Qaysi gapda Present Perfect to\'g\'ri ishlatilgan?',
    'ru': 'В каком предложении Present Perfect использован правильно?',
  },
  '"Eloquent" means:': {
    'uz': '"Eloquent" nima degani:',
    'ru': '"Eloquent" означает:',
  },

  // ── TARIX savollar ───────────────────────────────────────
  "Amir Temur qachon tug'ilgan?": {
    'ru': 'Когда родился Амир Тимур?',
    'en': 'When was Amir Timur born?',
  },
  "O'zbekiston mustaqilligini qachon qo'lga kiritdi?": {
    'ru': 'Когда Узбекистан обрёл независимость?',
    'en': 'When did Uzbekistan gain independence?',
  },
  'Birinchi jahon urushi qachon boshlangan?': {
    'ru': 'Когда началась Первая мировая война?',
    'en': 'When did World War I begin?',
  },
  'Samarqand shahri qachon asos solingan?': {
    'ru': 'Когда был основан город Самарканд?',
    'en': 'When was the city of Samarkand founded?',
  },
  "Buyuk Ipak Yo'li qaysi shahardan boshlanar edi?": {
    'ru': 'Из какого города начинался Великий Шёлковый путь?',
    'en': 'From which city did the Great Silk Road begin?',
  },
  'Al-Xorazmiy qaysi asarda algebra ilmiga asos soldi?': {
    'ru': 'В каком труде Аль-Хорезми заложил основы алгебры?',
    'en': 'In which work did Al-Khwarizmi found algebra?',
  },
  'II Jahon urushi qachon tugagan?': {
    'ru': 'Когда закончилась Вторая мировая война?',
    'en': 'When did World War II end?',
  },
  'Temuriylar sulolasi qаchon tashkil topgan?': {
    'ru': 'Когда была основана династия Тимуридов?',
    'en': 'When was the Timurid dynasty established?',
  },
  "Fransuz inqilobi qachon bo'lgan?": {
    'ru': 'Когда произошла Французская революция?',
    'en': 'When did the French Revolution occur?',
  },
  "Qaysi buyuk mutafakkir 'Qomusul-ulum' asarini yozgan?": {
    'ru': 'Какой великий учёный написал "Энциклопедию наук"?',
    'en': 'Which great scholar wrote the "Encyclopedia of Sciences"?',
  },
  'Mongol imperiyasini kim asos solgan?': {
    'ru': 'Кто основал Монгольскую империю?',
    'en': 'Who founded the Mongol Empire?',
  },
  "Amerika Qo'shma Shtatlari mustaqilligini qachon e'lon qildi?": {
    'ru': 'Когда США провозгласили независимость?',
    'en': 'When did the USA declare independence?',
  },
  "Ulug'bek rasadxonasi qayerda qurilgan?": {
    'ru': 'Где была построена обсерватория Улугбека?',
    'en': "Where was Ulugbek's observatory built?",
  },
  "Qadimgi Misr sivilizatsiyasi qaysi daryo bo'yida rivojlangan?": {
    'ru': 'На берегах какой реки развивалась цивилизация Древнего Египта?',
    'en': 'Along which river did ancient Egyptian civilization develop?',
  },
  'Xiva xonligi qachon tashkil topgan?': {
    'ru': 'Когда было основано Хивинское ханство?',
    'en': 'When was the Khiva Khanate established?',
  },
  "Birinchi Olimpiya o'yinlari qachon o'tkazilgan?": {
    'ru': 'Когда были проведены первые Олимпийские игры?',
    'en': 'When were the first Olympic Games held?',
  },
  'Rossiya imperiyasini kim tuzgan?': {
    'ru': 'Кто основал Российскую империю?',
    'en': 'Who founded the Russian Empire?',
  },
  "'Zafarnoma' asarini kim yozgan?": {
    'ru': 'Кто написал "Зафарнаме"?',
    'en': 'Who wrote "Zafarnama"?',
  },
  'Berlin devori qachon qurilgan?': {
    'ru': 'Когда была построена Берлинская стена?',
    'en': 'When was the Berlin Wall built?',
  },
  "Qaysi shaxs 'Boburnoma' asarini yozgan?": {
    'ru': 'Кто написал "Бабур-наме"?',
    'en': 'Who wrote "Baburnama"?',
  },
  "Qadimgi Rim imperatorlari orasida kim birinchi bo'lgan?": {
    'ru': 'Кто был первым императором Древнего Рима?',
    'en': 'Who was the first emperor of ancient Rome?',
  },
  "O'zbekiston Respublikasining birinchi Prezidenti kim?": {
    'ru': 'Кто был первым Президентом Республики Узбекистан?',
    'en': 'Who was the first President of the Republic of Uzbekistan?',
  },
  "Buxoro amirligining so'nggi amiri kim bo'lgan?": {
    'ru': 'Кто был последним эмиром Бухарского эмирата?',
    'en': 'Who was the last emir of the Bukhara Emirate?',
  },
  "Qaysi yilda Toshkent zilzilasi sodir bo'lgan?": {
    'ru': 'В каком году произошло Ташкентское землетрясение?',
    'en': 'In which year did the Tashkent earthquake occur?',
  },
  'Ikkinchi jahon urushida qaysi davlatlar fashistlar koalitsiyasini tashkil etdi?': {
    'ru':
        'Какие страны составляли фашистскую коалицию во Второй мировой войне?',
    'en': 'Which countries formed the fascist coalition in World War II?',
  },

  // ── TARIX javoblar ─────────────────────────────────────
  'Mil. av. VIII asr': {'ru': 'VIII в. до н. э.', 'en': '8th century BC'},
  'Mil. av. VII asr': {'ru': 'VII в. до н. э.', 'en': '7th century BC'},
  'I asr': {'ru': 'I в. н. э.', 'en': '1st century AD'},
  'IV asr': {'ru': 'IV в. н. э.', 'en': '4th century AD'},
  'Kitob ul-manazir': {'ru': 'Китаб аль-маназир', 'en': 'Kitab al-Manazir'},
  'Al-jabr val-muqobala': {
    'ru': 'Аль-джабр валь-мукабала',
    'en': 'Al-jabr wal-muqabala',
  },
  'Avesto': {'ru': 'Авесто', 'en': 'Avesta'},
  'Zafarnoma': {'ru': 'Зафарнаме', 'en': 'Zafarnama'},
  'XVI asr': {'ru': 'XVI век', 'en': '16th century'},
  'XVII asr': {'ru': 'XVII век', 'en': '17th century'},
  'XVIII asr': {'ru': 'XVIII век', 'en': '18th century'},
  'XIX asr': {'ru': 'XIX век', 'en': '19th century'},
  'Mil. av. 776': {'ru': '776 г. до н. э.', 'en': '776 BC'},
  'Mil. av. 700': {'ru': '700 г. до н. э.', 'en': '700 BC'},
  'Mil. av. 490': {'ru': '490 г. до н. э.', 'en': '490 BC'},
  'Mil. av. 323': {'ru': '323 г. до н. э.', 'en': '323 BC'},
  'Germaniya, Italiya, Yaponiya': {
    'ru': 'Германия, Италия, Япония',
    'en': 'Germany, Italy, Japan',
  },
  'SSSR, AQSh, Britaniya': {
    'ru': 'СССР, США, Великобритания',
    'en': 'USSR, USA, Britain',
  },
  'Fransiya, Ispaniya, Italiya': {
    'ru': 'Франция, Испания, Италия',
    'en': 'France, Spain, Italy',
  },
  'Germaniya, SSSR, Yaponiya': {
    'ru': 'Германия, СССР, Япония',
    'en': 'Germany, USSR, Japan',
  },

  // ── FIZIKA savollar ──────────────────────────────────────
  "Yorug'lik tezligi qancha?": {
    'ru': 'Какова скорость света?',
    'en': 'What is the speed of light?',
  },
  'Nyutonning birinchi qonuni nima?': {
    'ru': 'Что такое первый закон Ньютона?',
    'en': "What is Newton's first law?",
  },
  'Elektr qarshiligi birligi:': {
    'ru': 'Единица электрического сопротивления:',
    'en': 'Unit of electrical resistance:',
  },
  'Gravitatsiya tezlanishi (g) qancha?': {
    'ru': 'Каково ускорение свободного падения (g)?',
    'en': 'What is gravitational acceleration (g)?',
  },
  'Issiqlik birligi:': {'ru': 'Единица теплоты:', 'en': 'Unit of heat:'},
  "Nyutonning ikkinchi qonuniga ko'ra F = ?": {
    'ru': 'По второму закону Ньютона F = ?',
    'en': "According to Newton's second law F = ?",
  },
  'Elektr kuchlanishi birligi:': {
    'ru': 'Единица электрического напряжения:',
    'en': 'Unit of electric voltage:',
  },
  'Qaysi zarracha manfiy zaryadga ega?': {
    'ru': 'Какая частица имеет отрицательный заряд?',
    'en': 'Which particle has a negative charge?',
  },
  'Ommaviy tortishish qonunini kim kashf etgan?': {
    'ru': 'Кто открыл закон всемирного тяготения?',
    'en': 'Who discovered the law of universal gravitation?',
  },
  'Mexanik energiyaning saqlanish qonuni nima bildiradi?': {
    'ru': 'Что гласит закон сохранения механической энергии?',
    'en': 'What does the law of conservation of mechanical energy state?',
  },
  'Bosim birligi (SI):': {
    'ru': 'Единица давления (СИ):',
    'en': 'Unit of pressure (SI):',
  },
  'Temperatura birligi (SI):': {
    'ru': 'Единица температуры (СИ):',
    'en': 'Unit of temperature (SI):',
  },
  'Elektr toki birligi:': {
    'ru': 'Единица электрического тока:',
    'en': 'Unit of electric current:',
  },
  'Atom yadrosi qanday zarrachalardan iborat?': {
    'ru': 'Из каких частиц состоит атомное ядро?',
    'en': 'What particles make up the atomic nucleus?',
  },
  'Tezlik formulasi:': {'ru': 'Формула скорости:', 'en': 'Formula for speed:'},
  "Oʻm qonuni: I = ?": {'ru': 'Закон Ома: I = ?', 'en': "Ohm's law: I = ?"},
  'Fotoeffektni kim kashf etgan?': {
    'ru': 'Кто открыл фотоэффект?',
    'en': 'Who discovered the photoelectric effect?',
  },
  'Tovush tezligi havoda (taxminan)?': {
    'ru': 'Скорость звука в воздухе (приблизительно)?',
    'en': 'Speed of sound in air (approximately)?',
  },
  'Massaning SI birligi:': {
    'ru': 'Единица массы (СИ):',
    'en': 'SI unit of mass:',
  },
  "Issiqlik o'tkazuvchanlik qonunini kim kashf etgan?": {
    'ru': 'Кто открыл закон теплопроводности?',
    'en': 'Who discovered the law of thermal conductivity?',
  },
  "Qaysi nur eng qisqa to'lqin uzunligiga ega?": {
    'ru': 'Какое излучение имеет наименьшую длину волны?',
    'en': 'Which radiation has the shortest wavelength?',
  },
  "Elektromagnit to'lqinlar kashfiyotchisi kim?": {
    'ru': 'Кто открыл электромагнитные волны?',
    'en': 'Who discovered electromagnetic waves?',
  },
  'Absolyut nol temperatura:': {
    'ru': 'Абсолютный ноль температуры:',
    'en': 'Absolute zero temperature:',
  },
  'Radioaktivlikni kim kashf etgan?': {
    'ru': 'Кто открыл радиоактивность?',
    'en': 'Who discovered radioactivity?',
  },
  "Kvant mexanikasining asosini kim qo'ygan?": {
    'ru': 'Кто заложил основы квантовой механики?',
    'en': 'Who laid the foundations of quantum mechanics?',
  },

  // ── FIZIKA javob variantlari ────────────────────────────
  'Inersiya qonuni': {'ru': 'Закон инерции', 'en': 'Law of inertia'},
  'Harakat va reaksiya': {
    'ru': 'Действие и противодействие',
    'en': 'Action and reaction',
  },
  'Energiya saqlanishi': {
    'ru': 'Сохранение энергии',
    'en': 'Conservation of energy',
  },
  'Proton': {'ru': 'Протон', 'en': 'Proton'},
  'Neytron': {'ru': 'Нейтрон', 'en': 'Neutron'},
  'Elektron': {'ru': 'Электрон', 'en': 'Electron'},
  'Alfa-zarracha': {'ru': 'Альфа-частица', 'en': 'Alpha particle'},
  "Energiya yo'qoladi": {'ru': 'Энергия теряется', 'en': 'Energy is lost'},
  "Kinetik va potensial energiya yig'indisi doimiy": {
    'ru': 'Сумма кинетической и потенциальной энергии постоянна',
    'en': 'Sum of kinetic and potential energy is constant',
  },
  'Faqat kinetik energiya saqlanadi': {
    'ru': 'Сохраняется только кинетическая энергия',
    'en': 'Only kinetic energy is conserved',
  },
  'Energiya yaratiladi': {'ru': 'Энергия создаётся', 'en': 'Energy is created'},
  'Selsiy': {'ru': 'Цельсий', 'en': 'Celsius'},
  'Farengeyt': {'ru': 'Фаренгейт', 'en': 'Fahrenheit'},
  'Kelvin': {'ru': 'Кельвин', 'en': 'Kelvin'},
  'Elektron va proton': {
    'ru': 'Электрон и протон',
    'en': 'Electron and proton',
  },
  'Proton va neytron': {'ru': 'Протон и нейтрон', 'en': 'Proton and neutron'},
  'Neytron va elektron': {
    'ru': 'Нейтрон и электрон',
    'en': 'Neutron and electron',
  },
  'Faqat proton': {'ru': 'Только протон', 'en': 'Only protons'},
  "Radio to'lqin": {'ru': 'Радиоволна', 'en': 'Radio wave'},
  'Infra-qizil': {'ru': 'Инфракрасное', 'en': 'Infrared'},
  "Ko'rinadigan yorug'lik": {'ru': 'Видимый свет', 'en': 'Visible light'},
  'Gamma nurlanish': {'ru': 'Гамма-излучение', 'en': 'Gamma radiation'},
};

String tMock(String text) {
  final lang = AppState.language.value;
  if (lang == 'uz') return text;
  if (globalDict.containsKey(text) && globalDict[text]!.containsKey(lang)) {
    return globalDict[text]![lang]!;
  }
  return text;
}
