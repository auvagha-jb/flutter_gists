import 'package:flutter/foundation.dart';

class AppFeedback {
  bool status;
  final String message;
  String id;

  AppFeedback({@required this.message, this.status, this.id});
}
