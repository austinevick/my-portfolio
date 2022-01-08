import 'dart:io';

import 'package:entry/entry.dart';
import 'package:flutter/material.dart';
import 'package:flutter_glow/flutter_glow.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_framework/responsive_wrapper.dart';
import 'package:resume_builder/constant.dart';
import 'package:resume_builder/routes.dart';
import 'package:resume_builder/screens/project_page.dart';
import 'package:resume_builder/widget/custom_button.dart';
import 'package:resume_builder/widget/image_button.dart';
import 'package:url_launcher/url_launcher.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ResponsiveWrapper.builder(
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  color: const Color(0xff11162a),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: CircleAvatar(
                            radius: 35,
                            backgroundColor: Color(0xff11162a),
                            backgroundImage: AssetImage('images/img.png'),
                          ),
                        ),
                        const Spacer(),
                        CustomButton(
                          onPressed: () => Navigator.pushNamed(
                              context, RoutesName.projectPage),
                          text: 'Work',
                        ),
                        CustomButton(
                          onPressed: () =>
                              Navigator.pushNamed(context, RoutesName.about),
                          text: 'About',
                        ),
                        CustomButton(
                          onPressed: () async => await launch(resumeUrl),
                          text: 'Resume',
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                    height: 2, width: double.infinity, color: Colors.grey),
                const SizedBox(height: 80),
                Entry.all(
                  duration: const Duration(seconds: 2),
                  child: GlowText(
                    headerText,
                    style: GoogleFonts.lobsterTwo(
                        color: const Color(0xff0ee6b7),
                        fontWeight: FontWeight.bold,
                        fontSize: 28),
                  ),
                ),
                const SizedBox(height: 10),
                Entry.all(
                  duration: const Duration(seconds: 2),
                  child: Text('Flutter Mobile Developer',
                      style: GoogleFonts.lobsterTwo(
                        fontSize: 22,
                        color: const Color(0xff1ba94c),
                      )),
                ),
                const SizedBox(height: 30),
                const Entry.all(
                  duration: Duration(seconds: 2),
                  delay: Duration(milliseconds: 800),
                  child: SizedBox(
                      width: 600,
                      child: Text(description,
                          style: TextStyle(fontSize: 20),
                          textAlign: TextAlign.center)),
                ),
                const Spacer(),
                Padding(
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
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
