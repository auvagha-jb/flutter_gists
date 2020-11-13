class AppHttp {
  static const BASE_URL = 'https://loyaltyapp-firebase.firebaseio.com/';

  createUrl(String extension) {
    return '$BASE_URL/$extension';
  }


}
