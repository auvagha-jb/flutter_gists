class User {
  static const String PassionCooking = 'cooking';
  static const String PassionHiking = 'hiking';
  static const String PassionTraveling = 'traveling';

  Map<String, bool> passions = {
    PassionCooking: false,
    PassionHiking: false,
    PassionTraveling: false,
  };

  String firstName = '';
  String lastName = '';

  bool newsletter = false;

  void save() {
    print('save function');
  }
}
