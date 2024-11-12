import 'package:flutter/material.dart';

AppBar CustomAppBar(
  BuildContext context,
  String title, {
  bool isSearching = false,
  VoidCallback? onSearchTap,
  TextEditingController? searchController,
  String searchQuery = "",
  ValueChanged<String>? onSearchChanged, // إضافة معالج التغيير
}) {
  //new
  // final screenHeight = MediaQuery.of(context).size.height;
  // final screenWidth = MediaQuery.of(context).size.width;

  return AppBar(
    title: Row(
      mainAxisAlignment: MainAxisAlignment.end, // لضبط المحاذاة إلى اليمين
      children: [
        if (!isSearching) Text("$title"),
        if (isSearching)
          Expanded(
            child: Container(
              height: 45,
              child: TextField(
                controller: searchController,
                onChanged: onSearchChanged,
                decoration: InputDecoration(
                  fillColor: Colors.grey[100],
                  filled: true,
                  hintText: "اسم او رمز المادة",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(40),
                    borderSide: const BorderSide(
                      color: Color(0xff034da2),
                      width: 1.5,
                    ),
                  ),
                  prefixIcon: IconButton(
                    icon: Icon(Icons.close),
                    onPressed: () {
                      // عند الضغط على الإغلاق، يتم إيقاف البحث
                      onSearchTap!();
                      searchController?.clear();

                      onSearchChanged?.call(""); // مسح النص عند الإغلاق
                    },
                  ),
                ),
              ),
            ),
          ),
      ],
    ),
    backgroundColor: Colors.blue,
    automaticallyImplyLeading: false,
    actions: [
      //new
      if (title == "الصفحة الرئيسية" &&
          !isSearching) // إظهار أيقونة البحث فقط إذا كانت الصفحة هي Home
        IconButton(
          icon: const Icon(Icons.search, color: Colors.white),
          onPressed: onSearchTap,
        ),
      //to here
      Builder(
        builder: (context) => IconButton(
          icon: const Icon(Icons.menu, color: Colors.white),
          onPressed: () {
            Scaffold.of(context).openEndDrawer();
          },
        ),
      ),
    ],
  );
}
