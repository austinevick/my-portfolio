import 'package:entry/entry.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:resume_builder/model/data.dart';
import 'package:resume_builder/widget/custom_appbar.dart';
import 'package:url_launcher/url_launcher.dart';

import 'landing_page.dart';

class Projectpage extends StatefulWidget {
  const Projectpage({Key? key}) : super(key: key);

  @override
  _ProjectpageState createState() => _ProjectpageState();
}

class _ProjectpageState extends State<Projectpage> {
  final controller = PageController();

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
    return (LayoutBuilder(
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
            body: AnimatedSwitcher(
                duration: const Duration(milliseconds: 800),
                child: constraints.maxWidth < 600
                    ? const SmallScreenListView()
                    : largeScreenPageView()),
          ),
        );
      },
    ));
  }

  Widget largeScreenPageView() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
        const SizedBox(height: 30),
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
                return Entry.all(
                  duration: const Duration(seconds: 2),
                  child: Bounce(
                    duration: const Duration(milliseconds: 800),
                    onPressed: () {},
                    child: Container(
                      child: projects[i].shouldShow
                          ? Container(
                              width: 300,
                              color: Colors.black45,
                            )
                          : const SizedBox.shrink(),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                              image: AssetImage(projects[i].image!))),
                    ),
                  ),
                );
              })),
        ),
        const SizedBox(height: 30),
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
        Expanded(
          child: ListView.builder(
            itemCount: projects.length,
            itemBuilder: (context, i) => Entry.all(
              duration: const Duration(seconds: 1),
              child: Column(
                children: [
                  const SizedBox(height: 28),
                  Text(projects[i].name!,
                      style: const TextStyle(
                          fontSize: 25, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 10),
                  Text(
                    projects[i].decs!,
                    style: const TextStyle(color: Colors.grey),
                  ),
                  const SizedBox(height: 10),
                  Bounce(
                    duration: const Duration(milliseconds: 800),
                    onPressed: () async {
                      await launch(projects[i].url!);
                    },
                    child: Container(
                      height: 300,
                      // child: projects[i].shouldShow
                      //     ? Container(
                      //         color: Colors.black45,
                      //       )
                      //     : const SizedBox.shrink(),
                      decoration: BoxDecoration(
                          image: DecorationImage(
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
