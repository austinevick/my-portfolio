import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../routes.dart';

class SmallScreenAppBar extends StatelessWidget {
  const SmallScreenAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: () => Navigator.of(context)
              .pushReplacementNamed(RoutesName.landingPage),
          child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Augustine Victor',
                  style: GoogleFonts.abrilFatface(fontSize: 22))),
        ),
        const Spacer(),
        // const PopupButtonWidget(),
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
        InkWell(
          onTap: () => Navigator.of(context)
              .pushReplacementNamed(RoutesName.landingPage),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Augustine Victor',
              style: GoogleFonts.abrilFatface(fontSize: 22),
            ),
          ),
        ),
        const Spacer(),
        // CustomButton(
        //   onPressed: () => Navigator.of(context)
        //       .pushReplacementNamed(RoutesName.landingPage),
        //   text: 'Home',
        // ),
        // CustomButton(
        //   onPressed: () => Navigator.pushNamed(context, RoutesName.about),
        //   text: 'About',
        // ),
      ],
    );
  }
}
