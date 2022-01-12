import 'package:entry/entry.dart';
import 'package:flutter/material.dart';
import 'package:resume_builder/constant.dart';
import 'package:resume_builder/widget/custom_appbar.dart';

import 'landing_page.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SafeArea(
            child: Scaffold(
          appBar: PreferredSize(
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    color: const Color(0xff11162a),
                    child: constraints.maxWidth < 850
                        ? const SmallScreenAppBar()
                        : const LargeScreenAppBar(),
                  ),
                  Container(
                      height: 2, width: double.infinity, color: Colors.grey),
                ],
              ),
              preferredSize: const Size(100, 100)),
          body: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    foregroundDecoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.center,
                            end: Alignment.bottomCenter,
                            colors: [
                          const Color(0xff11162a).withOpacity(0),
                          const Color(0xff11162a)
                        ])),
                    decoration: const BoxDecoration(
                        color: Colors.pinkAccent,
                        image: DecorationImage(
                            alignment: Alignment.topCenter,
                            fit: BoxFit.cover,
                            image: AssetImage('images/img.png'))),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.only(left: 50, right: 200),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'About Me',
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 30),
                      Text(aboutMe)
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
      },
    );
  }
}
