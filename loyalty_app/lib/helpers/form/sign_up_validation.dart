import 'package:shop_ke/models/user.dart';

class SignUpValidation {
  bool state;
  String message;

  SignUpValidation({this.state = false});

  defaultValidation(value) {
    if (value.length < 2) {
      return 'Name must be at least two characters';
    }
    return null;
  }

  phoneValidation(value) {
    if (value.length < 9 || value.length > 10) {
      return 'Enter a valid mobile number';
    }
    return null;
  }

  emailValidation(email) {
    bool emailValid = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);

    if (email.isEmpty || !emailValid) {
      return 'Enter a valid email address';
    }
  }

  termsAndConditionsValidation(boolState) {
    if (!boolState) {
      return false;
    }
    return true;
  }

  formValidation(form, User user) {
    if (form.validate() &&
        termsAndConditionsValidation(user.termsAndConditions)) {
      return true;
    }

    return false;
  }
}
