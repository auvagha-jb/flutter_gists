import 'package:flutter/material.dart';

class GenderDropDown extends StatefulWidget {
  final Function onChangeGender;

  GenderDropDown(this.onChangeGender);

  @override
  _GenderDropDownState createState() => _GenderDropDownState();
}

class _GenderDropDownState extends State<GenderDropDown> {
  final genders = ['Male', 'Female', 'Other'];
  String gender;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      hint: Text("Select Gender"),
      value: gender,
      onChanged: (String value) {
        setState(() {
          gender = value;
        });
        //Update the value of the gender in user object
        widget.onChangeGender(value);
      },
      items: genders.map((String gender) {
        return DropdownMenuItem<String>(
          value: gender,
          child: Row(
            children: <Widget>[
              Text(
                gender,
                style: TextStyle(color: Colors.black),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}
