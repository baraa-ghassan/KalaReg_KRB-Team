// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:team_project/components/custom_appbar.dart';
import 'package:team_project/components/custom_drawer.dart';

class LessonPlan extends StatelessWidget {
  final List<Map<String, String>> courses;
  const LessonPlan({super.key, required this.courses});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(context, "الخطة الدراسية"),
      endDrawer: CustomDrawer(context),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: SingleChildScrollView(
          child: Column(
            children: [
              // 5. ExpansionTile
              xxx("الخطة الدراسية"),
              Column(
                children: courses.map((course) {
                  return ExpansionTile(
                    title: Text(course['name']!,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w900)),
                    subtitle: Text('رمز المقرر: ${course['code']} '),
                    children: [
                      ListTile(
                        subtitle: Text(
                            'عدد الساعات المعتمدة :3 \n المستوى: Year 2-2 \n الدرجة: A'),
                      ),
                    ],
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: LessonPlan(courses: qqq),
  ));
}

Padding xxx(String yyy) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child:
        Text(yyy, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
  );
}

List<Map<String, String>> qqq = [
  {'name': 'اللغة الانكليزية 1', 'code': 'ENGU10PI'},
  {'name': 'مهارات حاسوبية', 'code': 'COSC1002'},
  {'name': 'أنشطة طلابية 1', 'code': 'STAU1011'},
  {'name': 'اللغة العربية', 'code': 'ARBU1001'},
  {'name': 'فيزياء 1', 'code': 'EPHY1110'},
  {'name': 'الجبر الخطي', 'code': 'EMTH1110'},

// مواد السنة الأولى - الفصل الثاني
  {'name': 'اللغة الانكليزية 2', 'code': 'ENGU10IL'},
  {'name': 'مدخل الى الخوارزميات والبرمجة', 'code': 'ENIT1121'},
  {'name': 'أنشطة طلابية 2', 'code': 'STAU1012'},
  {'name': 'رسم هندسي', 'code': 'ENMX1121'},
  {'name': 'التحليل الرياضي 1', 'code': 'EMTH1120'},
  {'name': 'مدخل الى علوم الحاسوب', 'code': 'ENIT1322'},
  {'name': 'متطلب جامعة اختياري 1', 'code': 'XXXXXXXX'},
  {'name': 'متطلب جامعة اختياري 2', 'code': 'XXXXXXXX'},

// مواد السنة الثانية - الفصل الأول
  {'name': 'دارات منطقية', 'code': 'ENEC2111'},
  {'name': 'برمجة 1', 'code': 'ENIT2111'},
  {'name': 'إحصاء واحتمالات', 'code': 'EMTH2311'},
  {'name': 'التحليل الرياضي 2', 'code': 'EMTH2110'},
  {'name': 'رياضيات متقطعة', 'code': 'EMTH2310'},
  {'name': 'متطلب كلية اختياري 1', 'code': 'ENRQ020X'},

// مواد السنة الثانية - الفصل الثاني
  {'name': 'دارات كهربائية والكترونية', 'code': 'ENEC2624'},
  {'name': 'برمجة 2', 'code': 'ENIT2121'},
  {'name': 'خوارزميات وبنى معطيات 1', 'code': 'ENIT2123'},
  {'name': 'نظرية المعلومات', 'code': 'ENIT2322'},
  {'name': 'تحليل عددي', 'code': 'EMTH2120'},
  {'name': 'متطلب كلية اختياري 2', 'code': 'ENRQ020X'},

// مواد السنة الثالثة - الفصل الأول
  {'name': 'منظومات معالجات صغرية', 'code': 'ENEC3614'},
  {'name': 'قواعد معطيات 1', 'code': 'ENIT3312'},
  {'name': 'خوارزميات وبنى معطيات 2', 'code': 'ENIT3311'},
  {'name': 'مدخل الى الذكاء الصنعي', 'code': 'ENIT3315'},
  {'name': 'نظرية الحوسبة', 'code': 'ENIT3313'},
  {'name': 'مبادئ البحث العلمي', 'code': 'RESU3001'},

// مواد السنة الثالثة - الفصل الثاني
  {'name': 'نظم تشغيل 1', 'code': 'ENIT3323'},
  {'name': 'لغات برمجة', 'code': 'ENIT3326'},
  {'name': 'هندسة برمجيات 1', 'code': 'ENIT3322'},
  {'name': 'تطبيقات شبكية 1', 'code': 'ENIT3325'},
  {'name': 'تصميم مترجمات 1', 'code': 'ENIT3321'},
  {'name': 'شبكات 1', 'code': 'ENIT3324'},

// مواد السنة الرابعة - الفصل الأول
  {'name': 'نظم تشغيل 2', 'code': 'ENIT4315'},
  {'name': 'برمجة تفرعية', 'code': 'ENIT4311'},
  {'name': 'هندسة برمجيات 2', 'code': 'ENIT4312'},
  {'name': 'تطبيقات شبكية 2', 'code': 'ENIT4313'},
  {'name': 'معالجة إشارة', 'code': 'ENEC4611'},
  {'name': 'بحوث عمليات', 'code': 'EMTH4311'},
  {'name': 'برمجة الالعاب', 'code': 'ENIT4314'},

// مواد السنة الرابعة - الفصل الثاني
  {'name': 'نظم معلومات موزّعة', 'code': 'ENIT4321'},
  {'name': 'برمجة نظم تشغيل', 'code': 'ENIT4322'},
  {'name': 'بيانيات الحاسب', 'code': 'ENIT4324'},
  {'name': 'نمذجة ومحاكاة النظم', 'code': 'ENMX3323'},
  {'name': 'امن نظم معلومات', 'code': 'ENIT4323'},
  {'name': 'مشروع فصلي', 'code': 'ENIT4325'},
  {'name': 'إدارة مشاريع', 'code': 'ENMX4121'},

// مواد السنة الخامسة - الفصل الأول
  {'name': 'متطلب اختصاص 1', 'code': 'ENIT55XX'},
  {'name': 'متطلب اختصاص 2', 'code': 'ENIT55XX'},
  {'name': 'متطلب اختصاص 3', 'code': 'ENIT55XX'},
  {'name': 'متطلب اختصاص 4', 'code': 'ENIT55XX'},
  {'name': 'مشروع تخرج', 'code': 'ENIT5311'},

// مواد السنة الخامسة - الفصل الثاني
  {'name': 'متطلب اختصاص 5', 'code': 'ENIT55XX'},
  {'name': 'متطلب اختصاص 6', 'code': 'ENIT55XX'},
  {'name': 'متطلب اختصاص 7', 'code': 'ENIT55XX'},
  {'name': 'نظم الزمن الحقيقي', 'code': 'ENIT5321'},
  {'name': 'برمجة الأجهزة المحمولة', 'code': 'ENIT5322'},
  {'name': 'شبكات 2', 'code': 'ENIT5323'},
];
