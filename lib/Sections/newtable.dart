import 'package:flutter/material.dart';
import 'package:team_project/components/custom_appbar.dart';
import 'package:team_project/components/custom_drawer.dart';

class StudySchedule extends StatelessWidget {
  final List<String> days = [
    'السبت',
    'الأحد',
    'الاثنين',
    'الثلاثاء',
    'الأربعاء'
  ];
  final List<String> periods = [
    '8:00 - 10:00',
    '10:00 - 12:00',
    '12:00 - 14:00',
    '14:00 - 16:00',
  ];

  final Map<String, List<String>> schedule = {
    'السبت': [
      'نظم تشغيل 1 - قاعة 101',
      'مدخل ذكاء صنعي نظري - قاعة 202',
      'شبكات 2 نظري - قاعة 303',
      ''
    ],
    'الأحد': [
      'شبكات 2 عملي - قاعة 101',
      'مدخل ذكاء صنعي عملي - قاعة 202',
      '',
      'تحليل عددي - قاعة 101'
    ],
    'الاثنين': [
      '',
      'برمجة تفرعية عملي - قاعة 202',
      'برمجة تفرعية نظري - قاعة 101',
      ''
    ],
    'الثلاثاء': [
      'تصميم مترجمات نظري - قاعة 101',
      'تصميم مترجمات عملي - قاعة 303',
      '',
      'برمجة أجهزة محمولة نظري - قاعة 202'
    ],
    'الأربعاء': [
      'برمجة أجهزة محمولة عملي - قاعة 202',
      '',
      'علم نفس - قاعة 101',
      'عربي - قاعة 101'
    ],
  };

  StudySchedule({super.key});

  @override
  Widget build(BuildContext context) {
    // final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final double baseFontSize = screenWidth * 0.025;
    final double cellPadding = screenWidth * 0.035;
    return Scaffold(
        appBar: CustomAppBar(context,"الجدول الأسبوعي"),
        endDrawer: CustomDrawer(context),
        body: Directionality(
            textDirection: TextDirection.rtl,
            child: SingleChildScrollView(
              padding: EdgeInsets.all(cellPadding),
              child: Table(
                border: TableBorder.all(color: Colors.black),
                columnWidths: const {
                  0: FractionColumnWidth(0.2), // عرض العمود الأول لأيام الأسبوع
                },
                children: [
                  TableRow(
                    children: [
                      Container(), // خلية فارغة في الزاوية العلوية اليسرى
                      ...periods.map((period) => Center(
                            child: Padding(
                              padding: EdgeInsets.all(cellPadding),
                              child: Text(
                                period,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: baseFontSize),
                              ),
                            ),
                          )),
                    ],
                  ),
                  ...days.map((day) => TableRow(
                        children: [
                          // العمود الأول: الأيام
                          Center(
                            child: Padding(
                              padding: EdgeInsets.all(cellPadding),
                              child: Text(
                                day,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: baseFontSize),
                              ),
                            ),
                          ),
                          // الأعمدة التالية: المواد لكل يوم
                          ...schedule[day]!.map((subject) => TableCell(
                                verticalAlignment:
                                    TableCellVerticalAlignment.fill,
                                child: _buildSubjectCell(
                                    subject, baseFontSize, cellPadding),
                              )),
                        ],
                      )),
                ],
              ),
            )));
  }

  // Widget لبناء خلية المادة
  Widget _buildSubjectCell(
      String subject, double baseFontSize, double cellPadding) {
    return Container(
      margin: EdgeInsets.zero,
      padding: EdgeInsets.zero,
      color: subject.isNotEmpty
          ? Colors.lightBlueAccent.withOpacity(0.5)
          : Colors.white,
      child: Center(
        child: Padding(
          padding: EdgeInsets.zero,
          child: Text(
            subject.isNotEmpty ? subject : '',
            // style: const TextStyle(
            //  fontSize:baseFontSize * 0.8,
            // color: subject.isNotEmpty ? Colors.black : Colors.grey,
            // ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
