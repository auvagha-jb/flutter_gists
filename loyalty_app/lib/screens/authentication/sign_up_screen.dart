import 'package:flutter/material.dart';
import 'package:shop_ke/helpers/form/sign_up_validation.dart';
import 'package:shop_ke/helpers/widgets/url_link.dart';
import 'package:shop_ke/models/user.dart';
import 'package:shop_ke/widget_components/sign-up/dob_date_picker.dart';
import 'package:shop_ke/widget_components/sign-up/gender_dropdown.dart';

import 'sign_in_screen.dart';

class SignUpScreen extends StatefulWidget {
  static const routeName = '/sign-up';

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  //Init variables
  final _formKey = GlobalKey<FormState>();
  final textFieldSpacing = 10.0;
  final validate = SignUpValidation();
  final _user = User();

  //Navigator methods
  void goToSignIn() => Navigator.of(context).pushNamed(SignInScreen.routeName);

  //OnChange methods
  void onChangeGender(String gender) => _user.gender = gender;

  void onChangeDOB(String dob) => _user.dob = dob;

  //UI elements
  final appBar = AppBar(
    title: Text('Become a member'),
  );

  var privacyPolicyUrl = const UrlLink(
    url: 'https://www.carrefourkenya.com/privacy-policy',
    urlText: 'Privacy Policy',
  );

  var termsAndConditionsUrl = const UrlLink(
    url: 'https://www.carrefourkenya.com/privacy-policy',
    urlText: 'Terms and Conditions',
  );


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: Container(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(vertical: 25, horizontal: 15),
          //Sign up form
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                //Full name
                TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Full name',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) => validate.defaultValidation(value)),

                SizedBox(height: textFieldSpacing),
                //Email Address
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: 'Email Address',
                    border: OutlineInputBorder(),
                  ),
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
                        validator: (value) => validate.phoneValidation(value),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: textFieldSpacing),

                //Gender and Date of Birth Row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    //Gender
                    Expanded(
                      flex: 3,
                      child: GenderDropDown(onChangeGender),
                    ),

                    SizedBox(width: 15),

                    //Date of Birth
                    Expanded(flex: 4, child: DobDatePicker(onChangeDOB)),
                    //End of DOB field
                  ],
                ),

                //Subscribe to newsletter
                CheckboxListTile(
                  title: const Text('Subscribe to Newsletter'),
                  value: _user.subscriptions[User.ReceiveNewsletter],
                  onChanged: (bool value) {
                    print(_user);
                    setState(() {
                      _user.subscriptions[User.ReceiveNewsletter] = value;
                    });
                  },
                ),

                //Terms and Conditions
                SwitchListTile(
                  title: Text(
                      'I have read and understood the Privacy Policy and Terms and Conditions'),
                  value: _user.termsAndConditions,
                  onChanged: (bool value) {
                    setState(() {
                      _user.termsAndConditions = value;
                    });
                  },
                ),

                //Submit Button
                Container(
                  width: double.infinity,
                  child: RaisedButton(
                    child: Text(
                      'REGISTER',
                      style:
                          TextStyle(color: Theme.of(context).backgroundColor),
                    ),
                    color: Theme.of(context).accentColor,
                    onPressed: () => _user.store(_formKey, _user),
                  ),
                ),

                //Link to sign in page
                Container(
                  padding: EdgeInsets.symmetric(vertical: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('Already a member?'),
                      SizedBox(width: 8),
                      InkWell(
                        child: Text(
                          'Sign in',
                          style:
                              TextStyle(color: Theme.of(context).primaryColor),
                        ),
                        onTap: () => goToSignIn,
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
