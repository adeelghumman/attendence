import 'package:attendence/StudentModel.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class ViewAllStudents extends StatefulWidget {
  @override
  _ViewAllStudentsState createState() => _ViewAllStudentsState();
}

class _ViewAllStudentsState extends State<ViewAllStudents> {
  final Dbref = FirebaseDatabase.instance.reference();
  List<StudentModel> StudentObjList = [];
  List PresentStudents = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Dbref.child("Attendence").once().then((snap) {
      snap.value.forEach((key, elemet) {
        StudentModel studentobj = new StudentModel.fromjson(elemet);
        StudentObjList.add(studentobj);
      });
    });
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("View all Students"),
        ),
        body: Column(
          children: [
            ListView.builder(
              itemCount: StudentObjList.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    PresentStudents = StudentObjList[index].name;
                  },
                  child: ListTile(
                    leading: Text(StudentObjList[index].name),
                    trailing: Text(StudentObjList[index].roll_number),
                  ),
                );
              },
            ),
            Container(
              height: 200,
              width: 200,
              color: Colors.yellow,
              child: PresentStudents.isEmpty
                  ? Text("Present Students",
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: "cursive",
                          fontWeight: FontWeight.bold))
                  : ListView.builder(itemBuilder: null),
            )
          ],
        ));
  }
}
