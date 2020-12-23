class StudentModel {
  var name, roll_number;

  StudentModel.fromjson(json) {
    name = json['name'];
    roll_number = json['roll_number'];
  }
}
