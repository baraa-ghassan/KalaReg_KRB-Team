// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:team_project/components/custom_appbar.dart';
import 'package:team_project/components/custom_drawer.dart';

class StudentSchedulePage extends StatelessWidget {
  final List<Map<String, String>> courses;
  const StudentSchedulePage({super.key, required this.courses});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(context,"جدول الطالب"),
      endDrawer: CustomDrawer(context),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: SingleChildScrollView(
          child: Column(
            children: [
              // 1. DataTable
              xxx("DataTable"),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: DataTable(
                  columns: [
                    DataColumn(label: Text('رمز المقرر')),
                    DataColumn(label: Text('المادة')),
                    DataColumn(label: Text('اليوم')),
                    DataColumn(label: Text('الوقت')),
                    DataColumn(label: Text('س.م')),
                    DataColumn(label: Text('الفئة/الزمرة')),
                    DataColumn(label: Text('المدرس')),
                  ],
                  rows: courses.map((course) {
                    return DataRow(cells: [
                      DataCell(Text(course['code']!)),
                      DataCell(Text(course['name']!)),
                      DataCell(Text(course['day']!)),
                      DataCell(Text(course['time']!)),
                      DataCell(Text(course['hours']!)),
                      DataCell(Text(course['group']!)),
                      DataCell(Text(course['teacher']!)),
                    ]);
                  }).toList(),
                ),
              ),
              Divider(
                color: Colors.black,
                height: 300,
                thickness: 10,
              ),

              // 2. Table
              xxx("Table"),
              Table(
                border: TableBorder.all(color: Colors.grey, width: 3),
                children: [
                  TableRow(
                    children: [
                      Text('رمز المقرر',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      Text('المادة',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      Text('اليوم',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      Text('الوقت',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      Text('س.م',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      Text('الفئة/الزمرة',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      Text('المدرس',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                  ...courses.map((course) {
                    return TableRow(
                      children: [
                        Text(course['code']!),
                        Text(course['name']!),
                        Text(course['day']!),
                        Text(course['time']!),
                        Text(course['hours']!),
                        Text(course['group']!),
                        Text(course['teacher']!),
                      ],
                    );
                  }),
                ],
              ),
              Divider(
                color: Colors.black,
                height: 300,
                thickness: 10,
              ),
              // 3. Card
              xxx("Card"),
              Column(
                children: courses.map((course) {
                  return Card(
                    margin: EdgeInsets.all(8.0),
                    child: ListTile(
                      title: Text(course['name']!,
                          style: TextStyle(
                              fontWeight: FontWeight.w900, fontSize: 25)),
                      subtitle: Text(
                          'رمز المقرر: ${course['code']}  \n اليوم: ${course['day']} \n الوقت: ${course['time']} \n س.م: ${course['hours']} \n الفئة: ${course['group']} \n المدرس: ${course['teacher']}'),
                    ),
                  );
                }).toList(),
              ),
              Divider(
                color: Colors.black,
                height: 300,
                thickness: 10,
              ),
              // 4. Grid
              xxx("Grid"),
              GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1,
                  mainAxisSpacing: 8.0,
                  crossAxisSpacing: 8.0,
                ),
                padding: EdgeInsets.all(8.0),
                itemCount: courses.length,
                itemBuilder: (context, index) {
                  final course = courses[index];
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(course['name']!,
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w900)),
                          Text('رمز المقرر: ${course['code']}'),
                          Text('اليوم: ${course['day']}'),
                          Text('الوقت: ${course['time']}'),
                          Text('س.م: ${course['hours']}'),
                          Text('الفئة/الزمرة: ${course['group']}'),
                          Text('المدرس: ${course['teacher']}'),
                        ],
                      ),
                    ),
                  );
                },
              ),
              Divider(
                color: Colors.black,
                height: 300,
                thickness: 10,
              ),
              // 5. ExpansionTile
              xxx("ExpansionTile"),
              Column(
                children: courses.map((course) {
                  return ExpansionTile(
                    title: Text(course['name']!,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w900)),
                    subtitle: Text(
                        'رمز المقرر: ${course['code']} \nاليوم: ${course['day']} - الوقت: ${course['time']}'),
                    children: [
                      ListTile(
                        title: Text('عدد الساعات المعتمدة: ${course['hours']}'),
                        subtitle: Text(
                            'الفئة/الزمرة: ${course['group']} \n المدرس: ${course['teacher']}'),
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
    home: StudentSchedulePage(courses: exampleCourses),
  ));
}

Padding xxx(String yyy) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child:
        Text(yyy, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
  );
}

List<Map<String, String>> exampleCourses = [
  {
    'code': 'ENIT0000',
    'name': 'مشروع فصلي',
    'day': '---',
    'time': '---',
    'hours': '2',
    'group': '1',
    'teacher': 'ماهر نوح ',
  },
  {
    'code': 'ENIT0000',
    'name': 'برمجة الاجهزة المحمولة',
    'day': 'الأحد',
    'time': '10:00 - 12:00',
    'hours': '3',
    'group': '1',
    'teacher': 'هيثم سفور',
  },
  {
    'code': 'ENIT0000',
    'name': 'شبكات 1',
    'day': 'الاثنين',
    'time': '12:00 - 14:00',
    'hours': '3',
    'group': '1',
    'teacher': 'رياض ضاهر',
  },
  {
    'code': 'ENIT0000',
    'name': 'برمجة تفرعية',
    'day': 'الأربعاء',
    'time': '08:00 - 10:00',
    'hours': '3',
    'group': '1',
    'teacher': 'محمود الأحمد',
  },
  {
    'code': 'ENIT0000',
    'name': 'نظم تشغيل 2',
    'day': 'الأحد',
    'time': '12:00 - 14:00',
    'hours': '3',
    'group': '1',
    'teacher': 'كمال قمر',
  },
  {
    'code': 'ENIT0000',
    'name': 'الرؤية الحاسوبية',
    'day': 'السبت',
    'time': '14:00 - 16:00',
    'hours': '3',
    'group': '1',
    'teacher': 'مريم ساعي',
  },
];
