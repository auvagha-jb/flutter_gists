import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({
    @required GlobalKey<FormState> formKey,
  }) : _formKey = formKey;

  final GlobalKey<FormState> _formKey;
  final textFieldSpacing = 0.02;
  final defaultError = 'This is a required field';

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          //Full Name
          TextFormField(
            decoration: const InputDecoration(
              labelText: 'Full name',
              border: OutlineInputBorder(),
            ),
            validator: (value) {
              if (value.length < 2) {
                return 'Name must be at least two characters';
              }
              return null;
            },
          ),
          SizedBox(height: textFieldSpacing),
          //Email Address
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              labelText: 'Email Address',
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: textFieldSpacing),

          //Phone number
          Row(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Full name',
                  border: OutlineInputBorder(),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
