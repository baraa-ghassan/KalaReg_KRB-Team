import 'package:flutter/material.dart';
import 'package:team_project/auth/loginwithback.dart';
import 'package:team_project/components/custom_appbar.dart';
import 'package:team_project/components/custom_drawer.dart';

class ExeptionRequest extends StatefulWidget {
  const ExeptionRequest({super.key});

  @override
  _ExeptionRequestState createState() => _ExeptionRequestState();
}

class _ExeptionRequestState extends State<ExeptionRequest> {
  int _selectedOption = 0; // الخيار المحدد
  int completedHours = 150; // عدد الساعات المنجزة
  double currentGPA = 3.9; // المعدل الفصلي الحالي
  List<String> availableCourses = [
    'مادة 1',
    'مادة 2',
    'مادة 3',
    'مادة 4'
  ]; // المواد المتاحة
  String? selectedCourse1; // المادة الأولى
  String? selectedCourse2; // المادة الثانية

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(context, "طلب الاستثناء"),
      endDrawer: CustomDrawer(context),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "طلب استثناء",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff034da2),
                ),
              ),
              const SizedBox(height: 30),

              // حقل الإدخال
              TextField(
                decoration: FieldInputDecoration(
                  "وصف الطلب.....",
                  const Icon(Icons.message),
                ),
                maxLines: 5,
              ),
              const SizedBox(height: 20),

              const Text(
                "علما أنني:",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff034da2),
                ),
              ),

              _buildOption(
                context,
                title: 'خريج في الفصل القادم',
                value: 1,
                groupValue: _selectedOption,
              ),

              _buildOption(
                context,
                title: 'أريد تنزيل أكثر من 18 ساعة',
                value: 2,
                groupValue: _selectedOption,
              ),

              _buildOption(
                context,
                title: 'لدي مشكلة تضارب الفاينل',
                value: 3,
                groupValue: _selectedOption,
              ),

              if (_selectedOption == 3) ...[
                const SizedBox(height: 20),
                const Text(
                  "اختر المادتين المتضاربتين:",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff034da2),
                  ),
                ),
                _buildDropdown(
                  context,
                  hint: 'اختر المادة الأولى',
                  value: selectedCourse1,
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedCourse1 = newValue;
                    });
                  },
                ),
                _buildDropdown(
                  context,
                  hint: 'اختر المادة الثانية',
                  value: selectedCourse2,
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedCourse2 = newValue;
                    });
                  },
                ),
              ],

              const SizedBox(height: 20),

              // زر الإرسال
              Center(
                child: MaterialButton(
                  elevation: 5.0,
                  color: const Color(0xff034da2),
                  shape: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                    borderSide: BorderSide.none,
                  ),
                  onPressed: _submitRequest,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  child: const Text(
                    'إرسال',
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
        ),
      ),
    );
  }

  // دالة لبناء الخيارات
  Widget _buildOption(BuildContext context,
      {required String title, required int value, required int groupValue}) {
    return Container(
      decoration: BoxDecoration(
        color:
            _selectedOption == value ? const Color(0xff034da2) : Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: _selectedOption == value
              ? const Color(0xffff6900)
              : const Color(0xff034da2),
          width: 2,
        ),
      ),
      margin: const EdgeInsets.only(top: 10),
      child: RadioListTile<int>(
        activeColor: const Color(0xffff6900),
        title: Text(
          title,
          style: TextStyle(
            color: _selectedOption == value
                ? Colors.white
                : const Color(0xff034da2),
            fontWeight: FontWeight.bold,
          ),
        ),
        value: value,
        groupValue: groupValue,
        onChanged: (int? newValue) {
          setState(() {
            _selectedOption = newValue!;
          });
        },
      ),
    );
  }

  // دالة لبناء قائمة الاختيار
  Widget _buildDropdown(BuildContext context,
      {required String hint,
      required String? value,
      required Function(String?) onChanged}) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: const Color(0xff034da2), width: 2),
      ),
      child: DropdownButton<String>(
        hint: Text(
          hint,
          style: const TextStyle(
            color: Color(0xff034da2),
            fontWeight: FontWeight.bold,
          ),
        ),
        value: value,
        dropdownColor: Colors.white,
        icon: const Icon(Icons.arrow_drop_down, color: Color(0xff034da2)),
        onChanged: onChanged,
        items: availableCourses.map<DropdownMenuItem<String>>((String course) {
          return DropdownMenuItem<String>(
            value: course,
            child: Text(
              course,
              style: const TextStyle(color: Color(0xff034da2)),
            ),
          );
        }).toList(),
        underline: Container(
          height: 1,
          color: const Color(0xff034da2),
        ),
      ),
    );
  }

  // دالة لعرض نافذة التأكيد
  void _showConfirmationDialog(BuildContext context, Function onConfirm) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: const Color(0xff034da2),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          title: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(Icons.info, color: Colors.white),
              Text(
                'تأكيد الطلب',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),
              ),
            ],
          ),
          content: const Text(
            'هل أنت متأكد أنك تريد إرسال الطلب؟',
            textAlign: TextAlign.right,
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
          ),
          actions: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // زر الإلغاء
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(Icons.cancel, color: Colors.white),
                  label: const Text('إلغاء',
                      style: TextStyle(color: Colors.white)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                const SizedBox(width: 20),

                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.of(context).pop();
                    onConfirm();
                  },
                  icon: const Icon(Icons.check, color: Colors.white),
                  label: const Text(
                    'تأكيد',
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }

// دالة لإرسال الطلب
  void _submitRequest() {
    if (_selectedOption == 1) {
      int remainingHours = 172 - completedHours;
      if (remainingHours < 30) {
        _showConfirmationDialog(context, () {
          _showDialog(
              context, 'تم ارسال الطلب', Colors.green, Icons.check_circle);
        });
      } else {
        _showDialog(
            context, ' المتبقي أكثر من 30 ساعة', Colors.red, Icons.error);
      }
    } else if (_selectedOption == 2) {
      if (currentGPA >= 3.0) {
        _showConfirmationDialog(context, () {
          _showDialog(
              context, 'تم ارسال الطلب', Colors.green, Icons.check_circle);
        });
      } else {
        _showDialog(
            context, ' المعدل الفصلي أقل من 3.0', Colors.red, Icons.error);
      }
    } else if (_selectedOption == 3) {
      if (selectedCourse1 != null &&
          selectedCourse2 != null &&
          checkFinalConflict(selectedCourse1!, selectedCourse2!)) {
        _showConfirmationDialog(context, () {
          _showDialog(
              context, 'تم تقديم الطلب', Colors.green, Icons.check_circle);
        });
      } else {
        _showDialog(
            context, 'لا يوجد تضارب في الفاينل', Colors.red, Icons.error);
      }
    }
  }

// دالة لإظهار الرسائل
  void _showDialog(
      BuildContext context, String message, Color color, IconData icon) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          title: Row(
            children: [
              Expanded(
                child: Text(
                  message,
                  style: TextStyle(
                    color: color,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                  textAlign: TextAlign.right,
                ),
              ),
              const SizedBox(width: 10),
              Icon(
                icon,
                color: color,
                size: 30,
              ),
            ],
          ),
          actions: <Widget>[
            Center(
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: color,
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    'موافق',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  // تحقق من تضارب الفاينل
  bool checkFinalConflict(String course1, String course2) {
    return true;
  }
}
