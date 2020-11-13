import 'package:flutter/material.dart';

class ValidatedTextField extends StatefulWidget {
  final String labelText;
  final String errorText;

  ValidatedTextField({
    @required this.labelText,
    this.errorText = 'This field is required',
  });

  @override
  _ValidatedTextFieldState createState() => _ValidatedTextFieldState();
}

class _ValidatedTextFieldState extends State<ValidatedTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: widget.labelText,
        border: OutlineInputBorder(),
      ),
      validator: (value) {
        if (value.isEmpty) {
          return widget.errorText;
        }
        return null;
      },
    );
  }
}

// class ValidatedTextField extends StatelessWidget {
//   final labelText;
//   final errorText;

//   ValidatedTextField({
//     @required this.labelText,
//     this.errorText = "This is a required field",
//   });

//   @override
//   Widget build(BuildContext context) {
//     return TextFormField(
//       obscureText: false,
//       decoration: InputDecoration(
//         labelText: labelText,
//         border: OutlineInputBorder(),
//       ),
//       validator: (value) {
//         if (value.isEmpty) {
//           return errorText;
//         }
//         return null;
//       },
//     );
//   }
// }
