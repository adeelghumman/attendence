import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class addstudent extends StatefulWidget {
  @override
  _addstudentState createState() => _addstudentState();
}

class _addstudentState extends State<addstudent> {
  String name = "";
  String roll_number = "";
  final Dbref = FirebaseDatabase.instance.reference();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(top: 10, left: 8.0, right: 8.0),
        child: Column(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Container(
                    width: 300,
                    height: 300,
                    color: Colors.blue,
                  ),
                  Container(
                    width: 300,
                    height: 300,
                    color: Colors.red,
                  ),
                ],
              ),
            ),
            Container(height: 20),
            TextField(
              onChanged: (value) {
                name = value;
              },
              decoration: InputDecoration(
                hintText: "Name",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            Container(height: 10),
            TextField(
              onChanged: (value) {
                roll_number = value;
              },
              decoration: InputDecoration(
                hintText: "Roll number",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            Container(height: 20),
            FloatingActionButton(
                onPressed: () {
                  Dbref.child("Attendence")
                      .push()
                      .set({'name': name, 'roll_number': roll_number});
                },
                child: Icon(Icons.add))
          ],
        ),
      ),
    ));
  }
}
