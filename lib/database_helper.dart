import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  static Database? _database;

  factory DatabaseHelper() {
    return _instance;
  }

  DatabaseHelper._internal();

  Future<Database> get database async {
    _database ??= await _initializeDatabase();
    return _database!;
  }

  Future<Database> _initializeDatabase() async {
    final directory = await getApplicationDocumentsDirectory();
    final path = join(directory.path, 'quiz_app.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: _createTables,
    );
  }

  Future<void> _createTables(Database db, int version) async {
    // Quiz Results Jadval
    await db.execute('''
      CREATE TABLE IF NOT EXISTS quiz_results (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        subject_name TEXT NOT NULL,
        correct_answers INTEGER NOT NULL,
        total_questions INTEGER NOT NULL,
        percentage REAL NOT NULL,
        date_taken TEXT NOT NULL,
        time_taken INTEGER
      )
    ''');

    // User Profile Jadval
    await db.execute('''
      CREATE TABLE IF NOT EXISTS user_profile (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT,
        email TEXT,
        total_quizzes_taken INTEGER DEFAULT 0,
        best_score REAL DEFAULT 0,
        created_at TEXT NOT NULL
      )
    ''');

    // Quiz Answers Jadval (Tafsilotlar uchun)
    await db.execute('''
      CREATE TABLE IF NOT EXISTS quiz_answers (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        quiz_result_id INTEGER NOT NULL,
        question_number INTEGER NOT NULL,
        question_text TEXT NOT NULL,
        user_answer TEXT,
        correct_answer TEXT NOT NULL,
        is_correct INTEGER NOT NULL,
        FOREIGN KEY (quiz_result_id) REFERENCES quiz_results(id)
      )
    ''');
  }

  // Quiz Natijasini Saqlash
  Future<int> insertQuizResult({
    required String subjectName,
    required int correctAnswers,
    required int totalQuestions,
    required double percentage,
    required String dateTaken,
    int? timeTaken,
  }) async {
    final db = await database;
    return await db.insert(
      'quiz_results',
      {
        'subject_name': subjectName,
        'correct_answers': correctAnswers,
        'total_questions': totalQuestions,
        'percentage': percentage,
        'date_taken': dateTaken,
        'time_taken': timeTaken,
      },
    );
  }

  // Barcha Quiz Natijalarini Olish
  Future<List<Map<String, dynamic>>> getAllQuizResults() async {
    final db = await database;
    return await db.query(
      'quiz_results',
      orderBy: 'date_taken DESC',
    );
  }

  // Bir Fanni Boylari Natijalarini Olish
  Future<List<Map<String, dynamic>>> getQuizResultsBySubject(
    String subject,
  ) async {
    final db = await database;
    return await db.query(
      'quiz_results',
      where: 'subject_name = ?',
      whereArgs: [subject],
      orderBy: 'date_taken DESC',
    );
  }

  // Quiz Natijasini O'chirish
  Future<int> deleteQuizResult(int id) async {
    final db = await database;
    return await db.delete(
      'quiz_results',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  // Foydalanuvchi Profilini Saqlash
  Future<void> updateUserProfile({
    required String name,
    required String email,
  }) async {
    final db = await database;
    final exists = await db.query('user_profile', limit: 1);

    if (exists.isEmpty) {
      await db.insert('user_profile', {
        'name': name,
        'email': email,
        'created_at': DateTime.now().toIso8601String(),
      });
    } else {
      await db.update(
        'user_profile',
        {'name': name, 'email': email},
        where: 'id = ?',
        whereArgs: [1],
      );
    }
  }

  // Foydalanuvchi Profilini Olish
  Future<Map<String, dynamic>?> getUserProfile() async {
    final db = await database;
    final results = await db.query('user_profile', limit: 1);
    return results.isNotEmpty ? results.first : null;
  }

  // Statistika Olish
  Future<Map<String, dynamic>> getStatistics() async {
    final db = await database;

    final totalResults = await db.rawQuery(
      'SELECT COUNT(*) as count, AVG(percentage) as avg_percentage, MAX(percentage) as max_percentage FROM quiz_results',
    );

    return {
      'totalQuizzes': totalResults[0]['count'] ?? 0,
      'averageScore': totalResults[0]['avg_percentage'] ?? 0.0,
      'bestScore': totalResults[0]['max_percentage'] ?? 0.0,
    };
  }

  // Database ni Tozalash (Barcha Ma'lumotlar O'chish)
  Future<void> clearAllData() async {
    final db = await database;
    await db.delete('quiz_answers');
    await db.delete('quiz_results');
  }

  // Database ni Yopish
  Future<void> closeDatabase() async {
    if (_database != null) {
      await _database!.close();
      _database = null;
    }
  }
}
