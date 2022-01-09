import 'package:entry/entry.dart';
import 'package:flutter/material.dart';
import 'package:resume_builder/constant.dart';

import 'landing_page.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
        child: Container(
      child: SizedBox(
        width: MediaQuery.of(context).size.width / 1.3,
        height: MediaQuery.of(context).size.width / 1.3,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(
                  height: 80,
                  color: Colors.black,
                  child: Text(
                    'About Me',
                    style: TextStyle(),
                  )),
              Expanded(
                  child: Entry.opacity(
                duration: Duration(seconds: 3),
                child: SizedBox(
                    child: ListView(
                  children: [
                    Text(aboutMe),
                  ],
                )),
              ))
            ],
          ),
        ),
      ),
    ));
  }
}
