import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

/// DatabaseHelper sinfi — SQLite bazasini boshqaruvchi yagona (Singleton) klass.
/// Bu yerda ma'lumotlar bazasini ochish, yaratish va CRUD amallar bajariladi.
class DatabaseHelper {
  // Singleton Pattern: Bu sinfdan faqat bitta obyekt yaratilishi mumkin
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  factory DatabaseHelper() => _instance;
  DatabaseHelper._internal();

  // SQLite baza obyekti (kech initsializatsiya - _db null bo'lishi mumkin)
  static Database? _db;

  // Baza versiyasi va nomi
  static const String _dbName = 'quiz_app.db';
  static const int _dbVersion = 1;

  // Jadval nomlari
  static const String tableResults = 'results';
  static const String tableSettings = 'settings';

  /// SQLite bazasiga ulanish yoki ochish.
  /// Agar baza avval ochilgan bo'lsa, o'sha obyektni qaytaradi (Cache).
  Future<Database> get database async {
    if (_db != null) return _db!; // Allaqachon ulanilgan bo'lsa qaytarib ber
    _db = await _initDb(); // Yo'q bo'lsa yangi ochib ber
    return _db!;
  }

  /// Bazani yaratish va jadvallarni tayyorlash
  Future<Database> _initDb() async {
    // Qurilmadagi ma'lumotlar bazalari uchun maxsus papka yo'lini aniqlash
    final dbPath = await getDatabasesPath();

    // Papka yo'li va fayl nomini birlashtirish: /data/data/com.app/databases/quiz_app.db
    final path = join(dbPath, _dbName);

    // Bazani ochish yoki birinchi marta yaratish
    return await openDatabase(
      path,
      version: _dbVersion,
      onCreate:
          _onCreate, // Faqat birinchi marta ishlaydi (jadvallarni yaratadi)
    );
  }

  /// Jadvallarni yaratish (Faqat baza birinchi marta ochilganda ishlaydi)
  Future<void> _onCreate(Database db, int version) async {
    // "results" jadvali — har bir ishlangan test natijasini saqlaydi
    await db.execute('''
      CREATE TABLE $tableResults (
        id          INTEGER PRIMARY KEY AUTOINCREMENT, -- Har bir yozuvning noyob raqami
        subject     TEXT    NOT NULL,                  -- Fan nomi (Dasturlash, Matematika)
        date        TEXT    NOT NULL,                  -- Test ishlangan sana (10.06.2026)
        score       INTEGER NOT NULL,                  -- Foiz ko'rinishidagi bal (88)
        icon        TEXT    NOT NULL,                  -- Fan belgisi (💻, Σ)
        color_value INTEGER NOT NULL                   -- Rang kodi (saqlanadi, qayta tiklash uchun)
      )
    ''');

    // "settings" jadvali — foydalanuvchi sozlamalarini saqlaydi
    await db.execute('''
      CREATE TABLE $tableSettings (
        key   TEXT PRIMARY KEY, -- Kalit: masalan 'studentName', 'language', 'isDark'
        value TEXT NOT NULL     -- Qiymat: masalan 'Bunyod', 'uz', 'true'
      )
    ''');
  }

  // ─────────────────────────────────────────────────────────────
  //  RESULTS JADVALI BILAN ISHLASH (CRUD — Create Read Delete)
  // ─────────────────────────────────────────────────────────────

  /// Yangi test natijasini bazaga qo'shish (INSERT)
  Future<int> insertResult(Map<String, dynamic> result) async {
    final db = await database;
    // conflict: replace — agar bir xil id bo'lsa ustiga yozib ketadi
    return await db.insert(tableResults, {
      'subject': result['subject'], // Fan nomi
      'date': result['date'], // Sana
      'score': result['score'], // Ball
      'icon': result['icon'], // Belgi
      'color_value':
          (result['color']).value, // Rangni int raqamga aylantirib saqlash
    }, conflictAlgorithm: ConflictAlgorithm.replace);
  }

  /// Barcha natijalarni bazadan o'qib qaytarish (SELECT)
  /// Eng yangi natijalar birinchi chiqishi uchun id DESC tartibida
  Future<List<Map<String, dynamic>>> getAllResults() async {
    final db = await database;
    return await db.query(
      tableResults,
      orderBy: 'id DESC', // Oxirgi qo'shilgan birinchi ko'rsatiladi
    );
  }

  /// Bitta natijani ID si orqali o'chirish (DELETE)
  Future<int> deleteResult(int id) async {
    final db = await database;
    return await db.delete(
      tableResults,
      where: 'id = ?', // Qaysi ID ni o'chirasi
      whereArgs: [id], // O'sha ID ning qiymati
    );
  }

  /// Barcha natijalarni tozalash (DELETE ALL)
  Future<int> clearAllResults() async {
    final db = await database;
    return await db.delete(tableResults);
  }

  // ─────────────────────────────────────────────────────────────
  //  SETTINGS JADVALI BILAN ISHLASH (saqlash / o'qish)
  // ─────────────────────────────────────────────────────────────

  /// Sozlamani kalit-qiymat shaklida saqlash (INSERT yoki REPLACE)
  Future<void> saveSetting(String key, String value) async {
    final db = await database;
    await db.insert(
      tableSettings,
      {'key': key, 'value': value},
      conflictAlgorithm: ConflictAlgorithm.replace, // Bor bo'lsa ustiga yozadi
    );
  }

  /// Kalit orqali sozlamani o'qish (SELECT)
  Future<String?> getSetting(String key) async {
    final db = await database;
    final rows = await db.query(
      tableSettings,
      where: 'key = ?',
      whereArgs: [key],
    );
    if (rows.isEmpty) return null; // Topilmasa null qaytaradi
    return rows.first['value'] as String;
  }

  /// Kalit orqali sozlamani o'chirish (DELETE)
  Future<void> deleteSetting(String key) async {
    final db = await database;
    await db.delete(tableSettings, where: 'key = ?', whereArgs: [key]);
  }

  /// Bazani to'liq yopish (ilovadan chiqishda ishlatiladi)
  Future<void> close() async {
    final db = await database;
    await db.close();
    _db = null; // Keyingi marta yangi ulanish bo'lishi uchun null qilamiz
  }
}
