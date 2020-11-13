import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shop_ke/helpers/form/sign_up_validation.dart';
import 'package:shop_ke/helpers/widgets/responsive_container.dart';
import 'package:shop_ke/models/user.dart';
import 'package:shop_ke/screens/my_profile/change_password_screen.dart';

class EditDetailsScreen extends StatefulWidget {
  static const routeName = '/edit-details';

  @override
  _EditDetailsScreenState createState() => _EditDetailsScreenState();
}

class _EditDetailsScreenState extends State<EditDetailsScreen> {
  final _formKey = GlobalKey<FormState>();
  final appBar = AppBar(
    title: Text('My Profile'),
  );
  final textFieldSpacing = 10.0;

  final validate = SignUpValidation();
  final _user = User();
  final genders = <String>['Male', 'Female', 'Other'];
  var _selectedDate = 'Date of Birth';

  void _presentDatePicker() async {
    String formattedDate;
    try {
      var pickedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1950),
        lastDate: DateTime.now(),
      );

      if (pickedDate == null) {
        return;
      }

      formattedDate = DateFormat.yMMMd().format(pickedDate);
      setDate(formattedDate);

    } catch (e) {
      print(e);
      print({'formattedDate': formattedDate});
    }
  }

  void setDate(formattedDate) {
    setState(() {
      _selectedDate = formattedDate;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 25, horizontal: 15),
        //Sign up form
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              //The main body of the form
              ResponsiveContainer(
                height: 0.7,
                appBar: appBar,
                child: Column(
                  children: <Widget>[
                    //Full name
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Full name',
                        border: OutlineInputBorder(),
                      ),
                      initialValue: 'Jerry Auvagha',
                      validator: (value) => validate.defaultValidation(value),
                    ),

                    SizedBox(height: textFieldSpacing),
                    //Email Address
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        labelText: 'Email Address',
                        border: OutlineInputBorder(),
                      ),
                      initialValue: 'jerry.auvagha@gmail.com',
                      validator: (value) => validate.emailValidation(value),
                    ),
                    SizedBox(height: textFieldSpacing),

                    //Phone number row
                    Row(
                      children: <Widget>[
                        //Country Code
                        Expanded(
                          flex: 2,
                          child: TextFormField(
                            enabled: false,
                            initialValue: '+254',
                            decoration: InputDecoration(
                              labelText: 'Code',
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),

                        //Phone number input field
                        Expanded(
                          flex: 8,
                          child: TextFormField(
                            keyboardType: TextInputType.phone,
                            decoration: InputDecoration(
                              labelText: 'Phone',
                              border: OutlineInputBorder(),
                            ),
                            initialValue: '722309497',
                            validator: (value) =>
                                validate.phoneValidation(value),
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: textFieldSpacing),

                    //Gender and Date of Birth Row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        //Gender Field
                        Expanded(
                          flex: 3,
                          child: DropdownButton<String>(
                            hint: Text("Select Gender"),
                            value: _user.gender,
                            onChanged: (String value) {
                              setState(() {
                                _user.gender = value;
                              });
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
                          ),
                        ),

                        SizedBox(width: 15),

                        //Date of Birth field
                        Expanded(
                          flex: 4,
                          child: OutlineButton(
                            padding: EdgeInsets.symmetric(vertical: 10),
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
                          ),
                        ),
                        //End of DOB field
                      ],
                    ),
                  ],
                ),
              ),

              //Submit Button
              Container(
                width: double.infinity,
                child: RaisedButton(
                  child: Text(
                    'UPDATE',
                    style: TextStyle(color: Theme.of(context).backgroundColor),
                  ),
                  color: Theme.of(context).accentColor,
                  onPressed: () => {},
                ),
              ),

              //Link to sign in page
              Container(
                padding: EdgeInsets.symmetric(vertical: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('Password Compromised?'),
                    SizedBox(width: 8),
                    InkWell(
                      child: Text(
                        'Change it',
                        style: TextStyle(color: Theme.of(context).primaryColor),
                      ),
                      onTap: () =>
                          Navigator.of(context).pushNamed(
                              ChangePasswordScreen.routeName),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
