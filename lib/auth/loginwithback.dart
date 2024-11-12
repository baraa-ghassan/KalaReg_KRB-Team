import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:team_project/Sections/home.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> with SingleTickerProviderStateMixin {
  bool _isloading = false;
  bool _hidepassword = true;
  final ScrollController _scrollController = ScrollController();

  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    // إعداد AnimationController للتحكم في مدة الحركة
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 10), // مدة تكبير الصورة
    )..repeat(reverse: true); // تكرار الحركة ذهاباً وإياباً

    // إعداد Tween لتكبير الصورة
    _animation = Tween<double>(begin: 1.0, end: 1.5).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _scrollToField() {
    _scrollController.animateTo(
      _scrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void _login() {
    setState(() {
      _isloading = true;
    });

    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        _isloading = false;
      });

      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) =>  Home()));
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
          // الخلفية الكاملة للشاشة مع حركة التكبير التدريجي
          AnimatedBuilder(
            animation: _animationController,
            builder: (context, child) {
              return Transform.scale(
                scale: _animation.value, // تطبيق التكبير
                child: Container(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('images/back.jpg'),
                      fit: BoxFit.cover, // لجعل الصورة تغطي كامل الشاشة
                    ),
                  ),
                ),
              );
            },
          ),

          // باقي العناصر توضع فوق الخلفية
          SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                    height: screenHeight * 0.15), // مساحة فارغة أعلى الشاشة

                // الشعار والخلفية الشفافة
                Container(
                  width: screenWidth * 0.4, // حجم الخلفية الدائرية (ثابت)
                  height: screenWidth * 0.4, // نفس العرض لجعل الحاوية دائرية
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.5), // لون الخلفية
                    shape: BoxShape.circle, // لتغيير الشكل إلى دائرة
                  ),
                  padding: const EdgeInsets.all(8), // مساحة حول الشعار
                  margin: const EdgeInsets.all(4), // هامش ثابت
                  child: Center(
                    // لتمركز الشعار داخل الدائرة
                    child: Image.asset(
                      'images/IMG_8039.gif',
                      width: screenWidth * 0.3, // حجم الخلفية الدائرية (ثابت)
                      height: screenWidth * 0.3, // نفس العرض لتثبيت الحجم
                      fit: BoxFit.contain, // لضبط حجم الصورة داخل الحاوية
                    ),
                  ),
                ),

                // حقول الإدخال
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.1),
                  child: Column(
                    children: [
                      TextField(
                        textDirection: TextDirection.ltr,
                        onTap: _scrollToField,
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        decoration: FieldInputDecoration(
                          ' الرقم الجامعي ',
                          const Icon(FontAwesomeIcons.userGraduate),
                        ).copyWith(
                          fillColor: const Color.fromARGB(255, 224, 224, 224),
                          filled: true,
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.02),
                      TextField(
                        textDirection: TextDirection.ltr,
                        onTap: _scrollToField,
                        obscureText: _hidepassword,
                        decoration: FieldInputDecoration(
                          ' كلمة المرور ',
                          const Icon(Icons.key_rounded),
                        ).copyWith(
                          fillColor: const Color.fromARGB(255, 224, 224, 224),
                          filled: true,
                          suffixIcon: GestureDetector(
                            onTap: () {
                              setState(() {
                                _hidepassword = !_hidepassword;
                              });
                            },
                            child: Icon(
                              _hidepassword
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: const Color(0xff034da2),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.05),
                    ],
                  ),
                ),

                // زر تسجيل الدخول
                _isloading
                    ? const CircularProgressIndicator()
                    : MaterialButton(
                        elevation: 5.0,
                        color: const Color(0xff034da2),
                        padding: EdgeInsets.symmetric(
                          vertical: screenHeight * 0.03,
                          horizontal: screenWidth * 0.2,
                        ),
                        shape: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                          borderSide: BorderSide.none,
                        ),
                        onPressed: _login,
                        child: const Text(
                          'Login',
                          style: TextStyle(
                            color: Color.fromARGB(255, 248, 245, 244),
                            fontSize: 23,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                SizedBox(
                    height: screenHeight * 0.1), // مساحة إضافية تحت زر التسجيل
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// الخواص المشتركة لحقلي الرقم الجامعي وكلمة المرور لتجنب تكرارهم
InputDecoration FieldInputDecoration(String hintText, Widget prefixIcon) {
  return InputDecoration(
    hintText: hintText,
    hintStyle: const TextStyle(fontWeight: FontWeight.bold),
    prefixIcon: prefixIcon,
    prefixIconColor: const Color(0xff034da2),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
      borderSide: const BorderSide(
        color: Color(0xff034da2),
        width: 1.5,
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
      borderSide: const BorderSide(
        color: Color(0xffff6900),
        width: 3.0,
      ),
    ),
  );
}
