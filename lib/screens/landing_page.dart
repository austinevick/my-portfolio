import 'dart:ui';

import 'package:entry/entry.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:resume_builder/constant.dart';
import 'package:resume_builder/routes.dart';
import 'package:resume_builder/screens/about_page.dart';
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
        body: LayoutBuilder(
          builder: (context, constraints) {
            print(constraints.maxWidth);
            print(MediaQuery.of(context).size.width);

            return Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    color: const Color(0xff11162a),
                    child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: AnimatedSwitcher(
                            child: constraints.maxWidth < 850
                                ? SmallScreenAppBar()
                                : LargeScreenAppBar(),
                            duration: const Duration(milliseconds: 800))),
                  ),
                  Container(
                      height: 2, width: double.infinity, color: Colors.grey),
                  const SizedBox(height: 20),
                  AnimatedSwitcher(
                    duration: const Duration(milliseconds: 800),
                    child: constraints.maxWidth < 850
                        ? const SmallScreen()
                        : const LargeScreenWidget(),
                  ),
                  const Spacer(),
                  const BottomItems()
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class SmallScreenAppBar extends StatelessWidget {
  const SmallScreenAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text('Augustine Victor', style: GoogleFonts.abrilFatface()),
        const Spacer(),
        const PopupButtonWidget(),
      ],
    );
  }
}

class LargeScreenAppBar extends StatelessWidget {
  const LargeScreenAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'Augustine Victor',
          style: GoogleFonts.abrilFatface(),
        ),
        const Spacer(),
        CustomButton(
          onPressed: () => Navigator.of(context)
              .pushReplacementNamed(RoutesName.landingPage),
          text: 'Home',
        ),
        CustomButton(
          onPressed: () => Navigator.pushNamed(context, RoutesName.projectPage),
          text: 'Work',
        ),
        CustomButton(
          onPressed: () async => await launch(resumeUrl),
          text: 'Resume',
        ),
      ],
    );
  }
}

class PopupButtonWidget extends StatelessWidget {
  const PopupButtonWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
        shape: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none),
        icon: const Icon(Icons.menu),
        itemBuilder: (context) => [
              PopupMenuItem(
                child: CustomButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    Navigator.of(context)
                        .pushReplacementNamed(RoutesName.landingPage);
                  },
                  text: 'Home',
                ),
              ),
              PopupMenuItem(
                child: CustomButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    Navigator.pushNamed(context, RoutesName.projectPage);
                  },
                  text: 'Work',
                ),
              ),
              PopupMenuItem(
                child: CustomButton(
                  onPressed: () async {
                    Navigator.of(context).pop();

                    await launch(resumeUrl);
                  },
                  text: 'Resume',
                ),
              )
            ]);
  }
}

class SmallScreen extends StatelessWidget {
  const SmallScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: CircleAvatar(
            radius: 80,
            backgroundColor: Color(0xff11162a),
            backgroundImage: AssetImage('images/img.png'),
          ),
        ),
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
              child: Text(description,
                  style: TextStyle(fontSize: 20), textAlign: TextAlign.center)),
        ),
      ],
    );
  }
}

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
              children: [
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
                      child: Text(description,
                          style: TextStyle(fontSize: 20),
                          textAlign: TextAlign.center)),
                ),
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

class BottomItems extends StatelessWidget {
  const BottomItems({
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
          )
        ],
      ),
    );
  }
}
