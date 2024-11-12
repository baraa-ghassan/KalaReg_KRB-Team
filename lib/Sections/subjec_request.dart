import 'package:flutter/material.dart';
import 'package:team_project/components/custom_appbar.dart';
import 'package:team_project/components/custom_drawer.dart';

class SubjecRequest extends StatefulWidget {
  const SubjecRequest({super.key});

  @override
  State<SubjecRequest> createState() => _SubjecRequestState();
}

class _SubjecRequestState extends State<SubjecRequest> {
  String? _selectedOption;

  void _submit() {
    if (_selectedOption == null) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text("تنبيه"),
          content: Text("يرجى اختيار خيار قبل الإرسال."),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("موافق"),
            ),
          ],
        ),
      );
      return;
    }

    String message = "تم ارسال طلبك بنجاح";
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("تم الإرسال"),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text("موافق"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(context, "تقديم طلب"),
      endDrawer: CustomDrawer(context),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            RadioListTile<String>(
              title: Text("توسيع فئة/زمرة"),
              value: "option1",
              groupValue: _selectedOption,
              onChanged: (value) {
                setState(() {
                  _selectedOption = value;
                });
              },
            ),
            RadioListTile<String>(
              title: Text("طلب فتح فئة/زمرة صفرية"),
              value: "option2",
              groupValue: _selectedOption,
              onChanged: (value) {
                setState(() {
                  _selectedOption = value;
                });
              },
            ),
            RadioListTile<String>(
              title: Text("طلب فتح للمادة"),
              value: "option3",
              groupValue: _selectedOption,
              onChanged: null,
              activeColor: Colors.grey,
            ),
            SizedBox(height: 20),
            MaterialButton(
              elevation: 5.0,
              color: const Color(0xff034da2),
              shape: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50),
                borderSide: BorderSide.none,
              ),
              onPressed: _submit,
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
              child: const Text(
                'إرسال',
                style: TextStyle(
                  color: Color.fromARGB(255, 248, 245, 244),
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
