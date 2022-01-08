import 'package:entry/entry.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fadein/flutter_fadein.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:resume_builder/constant.dart';
import 'package:resume_builder/model/data.dart';
import 'package:url_launcher/url_launcher.dart';

class Projectpage extends StatefulWidget {
  const Projectpage({Key? key}) : super(key: key);

  @override
  _ProjectpageState createState() => _ProjectpageState();
}

class _ProjectpageState extends State<Projectpage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: const Text('Projects'),
        ),
        body: Entry.opacity(
          duration: const Duration(seconds: 1),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Divider(thickness: 5),
                const SizedBox(height: 25),
                Expanded(child: buildProjects())
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildProjects() => Entry.all(
        duration: const Duration(seconds: 2),
        child: LayoutBuilder(builder: (context, BoxConstraints constraints) {
          return ListView(
              shrinkWrap: true,
              children: projects.map((e) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 35),
                    Text(e.name!, style: GoogleFonts.lobster(fontSize: 25)),
                    const SizedBox(width: 200, child: Divider(thickness: 5)),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                          alignment: Alignment.center,
                          width: 450,
                          child: Text(e.decs!,
                              style: const TextStyle(fontSize: 18))),
                    ),
                    InkWell(
                      hoverColor: Colors.transparent,
                      onTap: () async => await launch(e.url!),
                      onHover: (value) => setState(() => e.shouldShow = value),
                      child: Container(
                        child: e.shouldShow
                            ? Container(
                                width: constraints.maxWidth / 1.5,
                                color: Colors.black45,
                              )
                            : const SizedBox.shrink(),
                        height: 450,
                        width: constraints.maxWidth / 1.5,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            image: DecorationImage(
                                fit: BoxFit.fitHeight,
                                image: AssetImage(e.image!))),
                      ),
                    ),
                  ],
                );
              }).toList());
        }),
      );
}
