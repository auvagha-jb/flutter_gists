import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class UrlLink extends StatelessWidget {
  final url;
  final urlText;

  const UrlLink({@required this.url, @required this.urlText});

  _launchURL(url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Text(urlText),
      onTap: () => _launchURL(url),
    );
  }
}

