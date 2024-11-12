// ignore_for_file: non_constant_identifier_names, use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:team_project/auth/crud.dart';
import 'package:team_project/components/get_ip.dart';
import 'package:team_project/components/custom_textform.dart';
import 'package:team_project/components/links.dart';

String current_user = "";

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _isloading = false;
  bool _hidepassword = true;

//new

  final Crud _crud = Crud();
  TextEditingController number = TextEditingController();
  TextEditingController password = TextEditingController();

  login_function() async {
    current_user = number.text;
    _isloading = true;
    setState(() {});
    var response = await _crud.postrequest(
        linkLogin, {"numberqz": number.text, "passwordqz": password.text});
    _isloading = false;
    setState(() {});
    if (response['status'] == "success") {
      Navigator.of(context).pushNamedAndRemoveUntil("home", (route) => false);
    } else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text("تنبيه"),
          content: Text("رقمك الجامعي او كلمة المرور خاطئة"),
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
  }
// to here

  // void _login() {
  //   setState(() {
  //     _isloading = true;
  //   });
  //   Future.delayed(const Duration(seconds: 2), () {
  //     setState(() {
  //       _isloading = false;
  //     });
  //     Navigator.pushReplacement(
  //         context, MaterialPageRoute(builder: (context) => const Home()));
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
        child: SingleChildScrollView(
          // controller: _scrollController,
          scrollDirection: Axis.vertical,
          child: Column(
            children: <Widget>[
              Image.asset(
                'images/IMG_8039.gif',
                width: screenWidth * 0.6,
                height: screenHeight * 0.6,
              ),
              TextField(
                controller: number, //new
                // onTap: _scrollToField,
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                decoration: FieldInputDecoration(
                  ' الرقم الجامعي ',
                  const Icon(FontAwesomeIcons.userGraduate),
                ),
              ),
              SizedBox(
                height: screenHeight * 0.05,
              ),
              TextField(
                  controller: password, //new
                  // onTap: _scrollToField,
                  obscureText: _hidepassword,
                  decoration: FieldInputDecoration(
                    ' كلمة المرور ',
                    const Icon(Icons.key_rounded),
                  ).copyWith(
                      suffixIcon: GestureDetector(
                    onTap: () {
                      setState(() {
                        _hidepassword = !_hidepassword;
                      });
                    },
                    child: Icon(
                      _hidepassword ? Icons.visibility_off : Icons.visibility,
                      color: const Color(0xff034da2),
                    ),
                  ))),
              SizedBox(
                height: screenHeight * 0.05,
              ),
              _isloading == true
                  ? const CircularProgressIndicator() // دائرة التحميل
                  : MaterialButton(
                      elevation: 5.0,
                      color: const Color(0xff034da2),
                      padding: EdgeInsets.symmetric(
                        vertical: screenHeight * 0.03,
                        horizontal: screenWidth * 0.2,
                      ),
                      shape: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                          borderSide: BorderSide.none),
                      onPressed: () async {
                        await login_function();
                      },
                      child: const Text(
                        'تسجيل الدخول',
                        style: TextStyle(
                          color: Color.fromARGB(255, 248, 245, 244),
                          fontSize: 23,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
              SizedBox(height: screenHeight * 0.02),
              Align(
                alignment: Alignment.bottomLeft,
                child: TextButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => ServerConfig()),
                    );
                  },
                  child: Text(
                    "إعدادات السيرفر",
                    style: TextStyle(color: Colors.blue, fontSize: 9),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      //new
      floatingActionButton: Container(
        width: 30,
        height: 30,
        child: FloatingActionButton(
          onPressed: () {
            Navigator.of(context)
                .pushNamedAndRemoveUntil("home", (route) => false);
          },
          child: const Icon(Icons.navigate_next),
          backgroundColor: Colors.blue,
        ),
      ),
    );
  }
}
