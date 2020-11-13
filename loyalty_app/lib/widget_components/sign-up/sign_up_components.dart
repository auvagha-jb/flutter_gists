// import 'package:flutter/material.dart';
// import 'package:shop_ke/form/sign_up_validation.dart';
// import 'package:shop_ke/models/user.dart';

// class SignUpComponents {
//   final _formKey = GlobalKey<FormState>();
//   final _user = User();

//   genderDropDown() {
//     return DropdownButton<String>(
//       hint: Text("Select Gender"),
//       value: _user.gender,
//       onChanged: (String value) {
//         setState(() {
//           _user.gender = value;
//         });
//       },
//       items: genders.map((String gender) {
//         return DropdownMenuItem<String>(
//           value: gender,
//           child: Row(
//             children: <Widget>[
//               Text(
//                 gender,
//                 style: TextStyle(color: Colors.black),
//               ),
//             ],
//           ),
//         );
//       }).toList(),
//     );
//   }

//   submitButton(context) {
//     return Container(
//       width: double.infinity,
//       child: RaisedButton(
//         child: Text(
//           'REGISTER',
//           style: TextStyle(color: Theme.of(context).backgroundColor),
//         ),
//         color: Theme.of(context).accentColor,
//         onPressed: () => validate.submit(_formKey),
//       ),
//     );
//   }
// }
