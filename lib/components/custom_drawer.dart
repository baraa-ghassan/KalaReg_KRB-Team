import 'package:flutter/material.dart';
import 'package:team_project/Sections/home.dart';
import 'package:team_project/Sections/student_schedule.dart';
import 'package:team_project/Sections/plan.dart';
import 'package:team_project/Sections/request.dart';
import 'package:team_project/Sections/exeption.dart';
import 'package:team_project/auth/login.dart';
import 'package:team_project/Sections/newtable.dart';

// ignore: non_constant_identifier_names
Drawer CustomDrawer(BuildContext context) {
  final screenWidth = MediaQuery.of(context).size.width;
  final screenHeight = MediaQuery.of(context).size.height;
  return Drawer(
    width: screenWidth * 0.65,
    backgroundColor: Colors.white,
    child: ListView(
      padding: EdgeInsets.zero,
      children: [
        SizedBox(
          height: screenHeight * 0.05,
        ),
        Container(
          padding: EdgeInsets.all(screenHeight * 0.02),
          child: Column(
            children: [
              Center(
                child: Container(
                  width: screenWidth * 0.25,
                  height: screenWidth * 0.25,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: const Color(0xffff6900),
                      width: 2.0,
                    ),
                  ),
                  child: ClipOval(
                    child: Image.asset(
                      'images/IMG_8039.gif',
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: screenHeight * 0.02,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'خالد جمال الهلال',
                        style: TextStyle(
                          color: Color(0xff034da2),
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 1),
                      Text(
                        '202020040',
                        style: TextStyle(
                          color: Color(0xff034da2),
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
        const Divider(
          color: Color(0xff034da2),
          thickness: 1.5,
        ),
        SizedBox(
          height: screenHeight * 0.02,
        ),
        ListTile(
          leading: const Icon(
            Icons.home_outlined,
            color: Color(0xffff6900),
            size: 35,
          ),
          title: const Text(
            'الصفحة الرئيسية',
            style: TextStyle(
                color: Color(0xff034da2),
                fontWeight: FontWeight.bold,
                fontSize: 20),
            textAlign: TextAlign.right,
          ),
          onTap: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const Home()),
            );
          },
        ),
        ListTile(
          leading: const Icon(
            Icons.calendar_today,
            color: Color(0xffff6900),
            size: 35,
          ),
          title: const Text(
            'جدول الطالب',
            style: TextStyle(
                color: Color(0xff034da2),
                fontWeight: FontWeight.bold,
                fontSize: 20),
            textAlign: TextAlign.right,
          ),
          onTap: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      StudentSchedulePage(courses: exampleCourses)),
            );
          },
        ),
        SizedBox(
          height: screenHeight * 0.02,
        ),
        ListTile(
          leading: const Icon(
            Icons.book_outlined,
            color: Color(0xffff6900),
            size: 35,
          ),
          title: const Text(
            'الخطة الدرسية',
            style: TextStyle(
                color: Color(0xff034da2),
                fontWeight: FontWeight.bold,
                fontSize: 20),
            textAlign: TextAlign.right,
          ),
          onTap: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => LessonPlan(courses: qqq)),
            );
          },
        ),
        SizedBox(
          height: screenHeight * 0.02,
        ),
        ListTile(
          leading: const Icon(
            Icons.request_quote_outlined,
            color: Color(0xffff6900),
            size: 35,
          ),
          title: const Text(
            'الطلبات',
            style: TextStyle(
                color: Color(0xff034da2),
                fontWeight: FontWeight.bold,
                fontSize: 20),
            textAlign: TextAlign.right,
          ),
          onTap: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const StudentRequests()),
            );
          },
        ),
        SizedBox(
          height: screenHeight * 0.02,
        ),
        ListTile(
          leading: const Icon(
            Icons.error_outline,
            color: Color(0xffff6900),
            size: 35,
          ),
          title: const Text(
            'طلب استثناء',
            style: TextStyle(
                color: Color(0xff034da2),
                fontWeight: FontWeight.bold,
                fontSize: 20),
            textAlign: TextAlign.right,
          ),
          onTap: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const ExeptionRequest()),
            );
          },
        ),
        SizedBox(
          height: screenHeight * 0.02,
        ),
        ListTile(
          leading: const Icon(
            Icons.view_week_outlined,
            color: Color(0xffff6900),
            size: 35,
          ),
          title: const Text(
            'الجدول الأسبوعي ',
            style: TextStyle(
                color: Color(0xff034da2),
                fontWeight: FontWeight.bold,
                fontSize: 20),
            textAlign: TextAlign.right,
          ),
          onTap: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => StudySchedule()),
            );
          },
        ),
        SizedBox(
          height: screenHeight * 0.02,
        ),
        ListTile(
          leading: const Icon(
            Icons.logout,
            color: Color(0xffff6900),
            size: 35,
          ),
          title: const Text(
            'تسجيل خروج',
            style: TextStyle(
                color: Color(0xff034da2),
                fontWeight: FontWeight.bold,
                fontSize: 20),
            textAlign: TextAlign.right,
          ),
          onTap: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const Login()),
            );
          },
        ),
        SizedBox(
          height: screenHeight * 0.02,
        ),
      ],
    ),
  );
}
