import 'package:flutter/material.dart';
import 'package:team_project/Sections/subjec_request.dart';

import 'package:team_project/components/custom_appbar.dart';
import 'package:team_project/components/custom_drawer.dart';

import 'package:team_project/auth/login.dart';
import 'package:team_project/components/links.dart';
import 'package:team_project/auth/crud.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
//////////////////////////////////////////////////////////////////////////
// المتغيرات والتوابع

/////// 1: for store the current user id
  final Crud _crud = Crud();

  Future<dynamic> viewFunction() async {
    var response =
        await _crud.postrequest(linkHome, {"numberqz": "$current_user"});
    return response;
  }
// to here

  /////// 2: for search
  // 3 متغيرات للتحكم في *ظهور حقل البحث و في *نص البحث ول*تخزين قيمة النص المدخل
  bool _isSearching = false;
  TextEditingController _searchController = TextEditingController();
  String _searchQuery = "";

  // عند الضغط على أيقونة البحث
  void _toggleSearch() {
    setState(() {
      _isSearching = !_isSearching;
    });
  }

  // عند الكتابة في حقل البحث
  void _onSearchChanged(String query) {
    setState(() {
      _searchQuery = query;
    });
  }
  // to here

  /////// 3: for fliter subjects
  bool status1 = true; // المواد المتبقية
  bool status2 = false; // المواد المنجزة
  bool status3 = false; // المواد الشرطية
  bool status4 = true; // المواد الراسبة

  // تابع لتحديد نوع الفلترة ولون كل مادة
  Map<String, dynamic> filterGradeAndColor(dynamic grade) {
    switch (grade) {
      case 'A':
      case 'B':
      case 'C':
        return {'status': 1, 'color': Colors.green}; // المواد الناجحة
      case 'D':
        return {'status': 2, 'color': Colors.orange}; // المواد الشرطية
      case 'F':
        return {'status': 3, 'color': Colors.red}; // المواد الراسبة
      case null:
        return {
          'status': 4,
          'color': const Color.fromARGB(255, 76, 73, 227)
        }; // المواد المتبقية
      default:
        return {'status': 0, 'color': Colors.white};
    }
  }

////// to here

// انتهاء المتغيرات والتوابع
//////////////////////////////////////////////////////////////////////////
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //new
      appBar: CustomAppBar(
        context,
        "الصفحة الرئيسية",
        isSearching: _isSearching,
        onSearchTap: _toggleSearch,
        searchController: _searchController,
        searchQuery: _searchQuery,
        onSearchChanged: _onSearchChanged,
      ),
      //to here
      endDrawer: CustomDrawer(context),
      body: Directionality(
          textDirection: TextDirection.rtl,
          child: Column(
            children: [
              Container(
                color: const Color.fromARGB(255, 171, 169, 169),
                child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        SwitchListTile(
                            title: Text("المواد المتبقية"),
                            value: status1,
                            onChanged: (val) {
                              setState(() {
                                status1 = val;
                              });
                            }),
                        SwitchListTile(
                            title: Text("المواد الراسبة"),
                            value: status4,
                            onChanged: (val) {
                              setState(() {
                                status4 = val;
                              });
                            }),
                        SwitchListTile(
                            title: Text("المواد الشرطية"),
                            value: status3,
                            onChanged: (val) {
                              setState(() {
                                status3 = val;
                              });
                            }),
                        SwitchListTile(
                            title: Text("المواد المنجزة"),
                            value: status2,
                            onChanged: (val) {
                              setState(() {
                                status2 = val;
                              });
                            }),
                      ],
                    )),
              ),
              Expanded(
                child: FutureBuilder(
                    future: viewFunction(),
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(child: CircularProgressIndicator());
                      }
                      if (snapshot.hasData && snapshot.data != null) {
                        var filteredSubjects =
                            snapshot.data['data']?.where((subject) {
                          var gradeInfo = filterGradeAndColor(subject['grade']);
                          int gradeStatus = gradeInfo['status'];
                          if (status1 && gradeStatus == 4) return true;
                          if (status2 && gradeStatus == 1) return true;
                          if (status3 && gradeStatus == 2) return true;
                          if (status4 && gradeStatus == 3) return true;
                          return false;
                        }).toList();
                        //new
                        if (_searchQuery.isNotEmpty) {
                          filteredSubjects = filteredSubjects?.where((subject) {
                            return subject['name']
                                    .toLowerCase()
                                    .contains(_searchQuery.toLowerCase()) ||
                                subject['code']
                                    .toLowerCase()
                                    .contains(_searchQuery.toLowerCase());
                          }).toList();
                        }
                        //to here
                        if (filteredSubjects == null) {
                          return Center(child: Text("لا يوجد مواد"));
                        }
                        return GridView.builder(
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 1,
                            ),
                            itemCount: filteredSubjects.length,
                            itemBuilder: (context, i) {
                              var subject = filteredSubjects[i];
                              var gradeInfo =
                                  filterGradeAndColor(subject['grade']);
                              Color cardColor = gradeInfo['color'];

                              return InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const SubjecRequest()),
                                  );
                                },
                                child: Card(
                                  color: cardColor,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Expanded(
                                          child: ListTile(
                                        title: Text("${subject['name']}"),
                                        subtitle: Text(
                                            " رمز المقرر : ${subject['code']}\n المستوى: ${subject['level']}\n حالة المقرر: ${subject['grade']}"),
                                      ))
                                    ],
                                  ),
                                ),
                              );
                            });
                      }

                      return Center(child: Text("Loading ..."));
                    }),
              ),
            ],
          )),
    );
  }
}

//List? filterlist;

// class Search extends SearchDelegate {
//   List<Map<String, String>> filterlist = [];
//   @override
//   List<Widget>? buildActions(BuildContext context) {
//     return [
//       IconButton(
//           onPressed: () {
//             query = "";
//             showSuggestions(context);
//           },
//           icon: const Icon(Icons.close,size: 30,))
//     ];
//   }

//   @override
//   Widget? buildLeading(BuildContext context) {
//     return IconButton(
//         onPressed: () {
//           close(context, null);
//         },
//         icon: const Icon(Icons.arrow_back_ios_new,size: 30,));
//   }

//   @override
//   Widget buildResults(BuildContext context) {
//     return ListView.builder(
//       itemCount: filterlist.length,
//       itemBuilder: (context, i) {
//         return ListTile(
//           title: Text(filterlist[i]['name']!),
//           subtitle: Text(filterlist[i]['code']!),
//         );
//       },
//     );
//   }

//   @override
//   Widget buildSuggestions(BuildContext context) {
//     String queryLowerCase = query.toLowerCase();

//     // فلترة المواد بناءً على الاسم أو الكود، بعد تحويلهم إلى أحرف صغيرة
//     filterlist = allCourses.where((course) {
//       String courseNameLowerCase = course['name']!.toLowerCase();
//       String courseCodeLowerCase = course['code']!.toLowerCase();
//       return courseNameLowerCase.contains(queryLowerCase) ||
//           courseCodeLowerCase.contains(queryLowerCase);
//     }).toList();

//     if (query.isEmpty) {
//       return const Center(child: Text('اكتب للبحث عن مادة',style: TextStyle(fontSize: 30.0),));
//     } else if (filterlist.isEmpty) {
//       return const Center(child: Text('لا توجد نتائج'));
//     } else {
//       return ListView.builder(
//         itemCount: filterlist.length,
//         itemBuilder: (context, i) {
//           return ListTile(
//             title: Text(filterlist[i]['name']!),
//             subtitle: Text(filterlist[i]['code']!),
//             onTap: () {
//               query = filterlist[i]['name']!;
//               showResults(context);
//             },
//           );
//         },
//       );
//     }
//   }
// }
