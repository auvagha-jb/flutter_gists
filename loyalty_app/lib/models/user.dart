import 'package:shop_ke/helpers/form/sign_up_validation.dart';

class User {
  static const String ReceiveNewsletter = 'newsletter';
  static const String ReceiveOffers = 'offers';

  String fullName;
  String emailAddress;
  String phoneNumber;
  String gender;
  var dob;
  bool termsAndConditions;

  User({this.termsAndConditions = false});

  Map<String, bool> subscriptions = {
    ReceiveNewsletter: false,
    ReceiveOffers: false,
  };


  Future<SignUpValidation> store(formKey, user) {
    final form = formKey.currentState;
    final validate = SignUpValidation();

    if (!validate.formValidation(form, user)) {
      validate.state = false;
      return Future.value(validate);
    }

    validate.state = true;
    return Future.value(validate);
  }
}
