import 'package:entry/entry.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:resume_builder/widget/contact_button.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../constant.dart';
import '../../routes.dart';

class LargeScreenWidget extends StatelessWidget {
  const LargeScreenWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 100, right: 100),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(),
                Entry.all(
                  duration: const Duration(seconds: 2),
                  child: Text(
                    'Hi,',
                    style: GoogleFonts.poppins(
                        color: const Color(0xff0ee6b7),
                        fontWeight: FontWeight.bold,
                        fontSize: 28),
                  ),
                ),
                Entry.all(
                  duration: const Duration(seconds: 2),
                  child: Text(
                    headerText,
                    style: GoogleFonts.poppins(
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
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(description,
                            style: TextStyle(fontSize: 16),
                            textAlign: TextAlign.center),
                      )),
                ),
                const SizedBox(height: 30),
                Entry.all(
                  duration: const Duration(seconds: 2),
                  delay: const Duration(milliseconds: 820),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MaterialButton(
                        height: 48,
                        color: const Color(0xff1ba94c),
                        minWidth: 180,
                        shape: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),
                            borderSide: const BorderSide()),
                        onPressed: () => Navigator.pushNamed(
                            context, RoutesName.projectPage),
                        child: const Text('My works'),
                      ),
                      const SizedBox(width: 10),
                      MaterialButton(
                        height: 48,
                        minWidth: 180,
                        shape: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),
                            borderSide: const BorderSide(
                              color: Color(0xff1ba94c),
                            )),
                        onPressed: () async => await launch(resumeUrl),
                        child: const Text('My resume'),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                const ContactButton()
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: CircleAvatar(
              radius: 180,
              backgroundColor: Color(0xff11162a),
              backgroundImage: AssetImage('images/img.png'),
            ),
          ),
        ],
      ),
    );
  }
}
