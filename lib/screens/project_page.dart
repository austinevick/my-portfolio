import 'package:entry/entry.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:resume_builder/model/data.dart';
import 'package:url_launcher/url_launcher.dart';

import 'landing_page.dart';

class Projectpage extends StatefulWidget {
  const Projectpage({Key? key}) : super(key: key);

  @override
  _ProjectpageState createState() => _ProjectpageState();
}

class _ProjectpageState extends State<Projectpage> {
  final controller = PageController(viewportFraction: 0.6, initialPage: 1);

  int currentPage = 1;
  String name = '';
  String desc = '';
  String url = '';
  @override
  void initState() {
    name = projects[currentPage].name!;
    desc = projects[currentPage].decs!;
    url = projects[currentPage].url!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: LayoutBuilder(
          builder: (context, constraints) {
            return AnimatedSwitcher(
                duration: const Duration(milliseconds: 800),
                child: constraints.maxWidth < 600
                    ? const SmallScreenListView()
                    : largeScreenPageView());
          },
        ),
      ),
    );
  }

  Widget largeScreenPageView() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: double.infinity,
          color: const Color(0xff11162a),
          child: const Padding(
              padding: EdgeInsets.all(8.0), child: LargeScreenAppBar()),
        ),
        Entry.all(
          duration: const Duration(seconds: 2),
          child: Padding(
            padding: const EdgeInsets.only(left: 80, right: 80),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(name,
                        style: const TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 10),
                    Text(
                      desc,
                      style: const TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
                TextButton.icon(
                    onPressed: () async => await launch(url),
                    icon: Image.asset('images/github.png',
                        color: Colors.white, height: 15, fit: BoxFit.cover),
                    label: const Text(
                      'Github',
                      style: TextStyle(color: Colors.white),
                    ))
              ],
            ),
          ),
        ),
        Expanded(
          child: PageView(
              controller: controller,
              onPageChanged: (index) {
                setState(() {
                  currentPage = index;
                  name = projects[index].name!;
                  desc = projects[index].decs!;
                  url = projects[index].url!;
                });
              },
              children: List.generate(projects.length, (i) {
                final active = i == currentPage;
                double margin = !active ? 120 : 70;
                return Entry.all(
                  duration: const Duration(seconds: 2),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 30, right: 30),
                    child: Bounce(
                      duration: const Duration(milliseconds: 800),
                      onPressed: () async {
                        await controller.animateToPage(i,
                            duration: const Duration(seconds: 1),
                            curve: Curves.easeIn);
                      },
                      child: AnimatedContainer(
                        margin: EdgeInsets.only(top: margin, bottom: margin),
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeInOutCubic,
                        child: projects[i].shouldShow
                            ? Container(
                                color: Colors.black45,
                              )
                            : const SizedBox.shrink(),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage(projects[i].image!))),
                      ),
                    ),
                  ),
                );
              })),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextButton(
                  onPressed: () {
                    controller.previousPage(
                        duration: const Duration(seconds: 1),
                        curve: Curves.easeIn);
                  },
                  child: const Text('Previous',
                      style: TextStyle(color: Colors.white))),
              TextButton(
                  onPressed: () {
                    controller.nextPage(
                        duration: const Duration(seconds: 1),
                        curve: Curves.easeIn);
                  },
                  child: const Text('Next',
                      style: TextStyle(color: Colors.white))),
            ],
          ),
        )
      ],
    );
  }
}

class SmallScreenListView extends StatelessWidget {
  const SmallScreenListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          color: const Color(0xff11162a),
          child: const Padding(
              padding: EdgeInsets.all(8.0), child: SmallScreenAppBar()),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: projects.length,
            itemBuilder: (context, i) => Entry.all(
              duration: const Duration(seconds: 1),
              child: Column(
                children: [
                  Text(projects[i].name!,
                      style: const TextStyle(
                          fontSize: 25, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 10),
                  Text(
                    projects[i].decs!,
                    style: const TextStyle(color: Colors.grey),
                  ),
                  Bounce(
                    duration: const Duration(milliseconds: 800),
                    onPressed: () async {
                      await launch(projects[i].url!);
                    },
                    child: AnimatedContainer(
                      height: 250, margin: EdgeInsets.all(20),
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeInOutCubic,
                      // child: projects[i].shouldShow
                      //     ? Container(
                      //         color: Colors.black45,
                      //       )
                      //     : const SizedBox.shrink(),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(projects[i].image!))),
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
