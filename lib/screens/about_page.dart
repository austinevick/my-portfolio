import 'package:entry/entry.dart';
import 'package:flutter/material.dart';
import 'package:resume_builder/constant.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            title: const Text('About Me'),
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(child: Divider(thickness: 5)),
                  Entry.all(
                    duration: const Duration(seconds: 2),
                    child: Container(
                        foregroundDecoration: BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.center,
                                end: Alignment.bottomCenter,
                                colors: [
                              const Color(0xff11162a).withOpacity(0.1),
                              const Color(0xff11162a)
                            ])),
                        child: Image.asset('images/img.png',
                            height: 300, fit: BoxFit.cover)),
                  ),
                  const Entry.opacity(
                    duration: Duration(seconds: 3),
                    child: SizedBox(width: 500, child: Text(aboutMe)),
                  )
                ],
              ),
            ),
          )),
    );
  }
}
