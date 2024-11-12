// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:team_project/components/custom_appbar.dart';
import 'package:team_project/components/custom_drawer.dart';

class StudentRequests extends StatelessWidget {
  const StudentRequests({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(context,"الطلبات"),
        endDrawer: CustomDrawer(context),
        body: Directionality(
          textDirection: TextDirection.rtl,
          child: Column(
            children: [
              Card(
                margin: EdgeInsets.all(8.0),
                child: ListTile(
                  title: Text('رقم الطلب',
                      style:
                          TextStyle(fontWeight: FontWeight.w900, fontSize: 25)),
                  subtitle: Text('\n حالة الطلب: '),
                ),
              ),
              Center(
                child: MaterialButton(
                  color: const Color(0xff034da2),
                  shape: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                    borderSide: BorderSide.none,
                  ),
                  onPressed: () {},
                  padding: const EdgeInsets.symmetric(
                      horizontal: 40, vertical: 15), // Adjust padding
                  child: const Text(
                    'تأكيد',
                    style: TextStyle(
                      color: Color.fromARGB(255, 248, 245, 244),
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
