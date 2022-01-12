import 'package:flutter/material.dart';
import 'package:resume_builder/constant.dart';
import 'package:resume_builder/routes.dart';
import 'package:resume_builder/widget/custom_appbar.dart';
import 'package:resume_builder/widget/custom_button.dart';
import 'package:resume_builder/widget/desktop_screen_widget/large_screen_widget.dart';
import 'package:resume_builder/widget/mobile_screen_widget/small_screen_widget.dart';
import 'package:url_launcher/url_launcher.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SafeArea(
            child: Scaffold(
                appBar: PreferredSize(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: double.infinity,
                            color: const Color(0xff11162a),
                            child: constraints.maxWidth < 850
                                ? const SmallScreenAppBar()
                                : const LargeScreenAppBar(),
                          ),
                        ),
                        Container(
                            height: 2,
                            width: double.infinity,
                            color: Colors.grey),
                      ],
                    ),
                    preferredSize: const Size(100, 100)),
                body: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 800),
                  child: constraints.maxWidth < 850
                      ? const SmallScreen()
                      : const LargeScreenWidget(),
                )));
      },
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
                    Navigator.pushNamed(context, RoutesName.about);
                  },
                  text: 'About',
                ),
              ),
            ]);
  }
}
