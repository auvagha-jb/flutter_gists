import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DobDatePicker extends StatefulWidget {
  final Function onChangeDate;

  DobDatePicker(this.onChangeDate);

  @override
  _DobDatePickerState createState() => _DobDatePickerState();
}

class _DobDatePickerState extends State<DobDatePicker> {
  String _selectedDate = 'Choose a date';

  void _presentDatePicker() async {
    String formattedDate;
    try {
      var pickedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1970),
        lastDate: DateTime.now(),
      );

      if (pickedDate == null) return;

      formattedDate = DateFormat.yMMMd().format(pickedDate);

      //Update user object
      widget.onChangeDate(formattedDate);

      //Update the UI
      setState(() {
        _selectedDate = formattedDate;
      });
    } catch (e) {
      print(e);
      print({'formattedDate': formattedDate});
    }
  }

  @override
  Widget build(BuildContext context) {
    return OutlineButton(
      textColor: Theme.of(context).primaryColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            _selectedDate,
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          Icon(Icons.arrow_drop_down),
        ],
      ),
      onPressed: _presentDatePicker,
    );
  }
}
