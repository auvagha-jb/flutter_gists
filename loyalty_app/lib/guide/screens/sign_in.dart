import 'package:flutter/material.dart';
import 'package:shop_ke/screens/authentication/sign_up_screen.dart';

class SignIn extends StatefulWidget {
  //final Function addTx;
  static final routeName = '/sign-in';
  void addTx(p1, p2, p3) {
    return;
  }

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime _selectedDate;

  void _submitData() {
    if (_amountController.text.isEmpty) {
      return;
    }
    final enteredTitle = _titleController.text;
    final enteredAmount = double.parse(_amountController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0 || _selectedDate == null) {
      return;
    }

    widget.addTx(
      enteredTitle,
      enteredAmount,
      _selectedDate,
    );

    Navigator.of(context).pop();
  }

  final textFieldSpacing = 15.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(15),
        margin: EdgeInsets.symmetric(vertical: 25, horizontal: 5),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              //The top half of the form
              Container(
                margin: EdgeInsets.only(bottom: 90),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: 10,
                    ),
                    Text('Welcome Back!'),
                    SizedBox(height: textFieldSpacing),
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'Title',
                        border: OutlineInputBorder(),
                        // suffixIcon: IconButton(
                        //   icon: Icon(
                        //     Icons.clear,
                        //     color: Colors.grey,
                        //   ),
                        //   onPressed: () => _titleController.clear(),
                        // ),
                      ),
                      controller: _titleController,
                      onSubmitted: (_) => _submitData(),
                      // onChanged: (val) {
                      //   titleInput = val;
                      // },
                    ),
                    SizedBox(height: textFieldSpacing),
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'Amount',
                        border: OutlineInputBorder(),
                      ),
                      controller: _amountController,
                      keyboardType: TextInputType.number,
                      onSubmitted: (_) => _submitData(),
                      // onChanged: (val) => amountInput = val,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        FlatButton(
                          child: Text('Forgot Password?'),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              /* The bottom half of the login page */
              //Submit buttom and register link section
              Container(
                width: double.infinity,
                child: Column(
                  children: <Widget>[
                    //Submit button
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: RaisedButton(
                        child: Text(
                          'LOG IN',
                          style: TextStyle(color: Colors.white),
                        ),
                        color: Theme.of(context).accentColor,
                        onPressed: _submitData,
                      ),
                    ),

                    //Register link
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        // FlatButton(
                        //   child: Text(
                        //     'Don\'t have an account? Register',
                        //   ),
                        //   onPressed: () {
                        //     Navigator.of(context).pushNamed(SignUp.routeName);
                        //   },
                        // ),()
                        Text('Don\'t have an account?'),
                        SizedBox(width: 2),
                        InkWell(
                          child: Text(
                            'Register',
                            style: TextStyle(
                                color: Theme.of(context).primaryColor),
                          ),
                          onTap: () {
                            Navigator.of(context).pushNamed(
                                SignUpScreen.routeName);
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
