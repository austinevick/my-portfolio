import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../constant.dart';
import 'image_button.dart';

class ContactButton extends StatelessWidget {
  const ContactButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ImageButton(
            'images/github.png',
            onPressed: () async => await launch(github),
            color: Colors.white,
          ),
          const SizedBox(width: 10),
          ImageButton(
            'images/gmail.png',
            onPressed: () async => await launch(email),
          ),
          const SizedBox(width: 10),
          ImageButton(
            'images/linkedIn.png',
            onPressed: () async => await launch(linkedIn),
            color: Colors.white,
          ),
          ImageButton(
            'images/whatsapp.png',
            onPressed: () async => await launch(whatsapp),
            color: Colors.white,
          )
        ],
      ),
    );
  }
}
