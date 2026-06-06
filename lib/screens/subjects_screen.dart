import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/app_colors.dart';
import '../utils/app_localizations.dart';
import '../models/question_model.dart';
import 'quiz_screen.dart';

class SubjectsScreen extends StatefulWidget {
  final Function(SubjectModel) onSubjectSelected;
  final Function(Map<String, dynamic>) onResultAdded;

  const SubjectsScreen({
    super.key,
    required this.onSubjectSelected,
    required this.onResultAdded,
  });

  @override
  State<SubjectsScreen> createState() => _SubjectsScreenState();
}

class _SubjectsScreenState extends State<SubjectsScreen> {
  String _searchQuery = '';

  @override
  Widget build(BuildContext context) {
    // Filter by translated subject name or original name
    final filteredSubjects = subjects.where((s) {
      final locName = _getSubjectLocName(s.name).toLowerCase();
      final original = s.name.toLowerCase();
      final query = _searchQuery.toLowerCase();
      return locName.contains(query) || original.contains(query);
    }).toList();

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    L.t('choose_subject'),
                    style: GoogleFonts.poppins(
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                      color: AppColors.textDark,
                    ),
                  ),
                  const SizedBox(height: 14),
                  // Search bar
                  Container(
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(color: AppColors.border),
                    ),
                    child: TextField(
                      onChanged: (val) {
                        setState(() {
                          _searchQuery = val;
                        });
                      },
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        color: AppColors.textDark,
                      ),
                      decoration: InputDecoration(
                        hintText: L.t('search_hint'),
                        hintStyle: GoogleFonts.poppins(
                          fontSize: 13,
                          color: AppColors.textLight,
                        ),
                        prefixIcon: Icon(
                          Icons.search_rounded,
                          color: AppColors.textLight,
                          size: 20,
                        ),
                        border: InputBorder.none,
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 14,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Subject list
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                itemCount: filteredSubjects.length,
                itemBuilder: (ctx, i) {
                  final s = filteredSubjects[i];
                  final locName = _getSubjectLocName(s.name);

                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => QuizScreen(
                            subject: s,
                            onFinished: widget.onResultAdded,
                          ),
                        ),
                      );
                    },
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 12),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 14,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.04),
                            blurRadius: 10,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: 46,
                            height: 46,
                            decoration: BoxDecoration(
                              color: s.color,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Center(
                              child: Text(
                                s.icon,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 14),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  locName,
                                  style: GoogleFonts.poppins(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.textDark,
                                  ),
                                ),
                                Text(
                                  '${s.testCount} ${L.t('tests_count')}',
                                  style: GoogleFonts.poppins(
                                    fontSize: 12,
                                    color: AppColors.textMedium,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Icon(
                            Icons.chevron_right_rounded,
                            color: AppColors.textLight,
                            size: 22,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _getSubjectLocName(String name) {
    switch (name) {
      case 'Matematika':
        return L.t('math');
      case 'Dasturlash':
        return L.t('coding');
      case 'Ingliz tili':
        return L.t('english');
      case 'Tarix':
        return L.t('history');
      case 'Fizika':
        return L.t('physics');
      default:
        return name;
    }
  }
}
