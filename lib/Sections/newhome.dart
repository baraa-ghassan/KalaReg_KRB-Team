import 'package:flutter/material.dart';

class NewHome extends StatefulWidget {
  const NewHome({super.key});

  @override
  State<NewHome> createState() => _NewHomeState();
}

class _NewHomeState extends State<NewHome> {
// المتغيرات
  bool y = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            leading: IconButton(
                icon: Icon(Icons.search, color: Colors.white),
                onPressed: () {
                  setState(() {
                    y = true;
                  });
                }),
            title: Row(
              mainAxisAlignment:
                  MainAxisAlignment.end, // لضبط المحاذاة إلى اليمين

              children: [
                if (y == false) Text("test"),
                if (y == true)
                  Expanded(
                      child: TextField(
                          decoration: InputDecoration(
                              suffixIcon: IconButton(
                                  icon: Icon(Icons.close, color: Colors.black),
                                  onPressed: () {
                                    setState(() {
                                      y = !y;
                                    });
                                  }))))
              ],
            ),
            backgroundColor: Colors.blue,
            actions: []),
        endDrawer: Drawer(),
        body: Text("data"));
  }
}
