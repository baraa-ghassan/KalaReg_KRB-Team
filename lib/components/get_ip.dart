import 'package:flutter/material.dart';
import 'package:team_project/components/links.dart';

class ServerConfig extends StatelessWidget {
  final TextEditingController serverController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    serverController.text = linkServerName
        .replaceFirst("http://", "")
        .replaceFirst("/team_project", "");

    return Scaffold(
      appBar: AppBar(title: Text("إعدادات السيرفر")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: serverController,
              decoration: InputDecoration(
                labelText: "عنوان السيرفر",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            Text(
              "السيرفر الحالي: $linkServerName",
              style: TextStyle(fontSize: 16, color: Colors.black54),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                updateServerAddress(serverController.text);
                Navigator.pop(context);
              },
              child: Text("حفظ"),
            ),
          ],
        ),
      ),
    );
  }
}
