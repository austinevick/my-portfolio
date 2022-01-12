import 'package:resume_builder/constant.dart';

class Project {
  final String? name;
  final String? image;
  final String? decs;
  final String? url;
  bool shouldShow;

  Project(
      {this.url, this.decs, this.name, this.image, this.shouldShow = false});
}

final projects = <Project>[
  Project(
      name: 'Moviee',
      image: 'images/movie_app.png',
      decs: movieAppDesc,
      url: 'https://github.com/austinevick/flutter_movie_app'),
  Project(
      name: 'Cryptocurrency app',
      image: 'images/crypto.png',
      url: 'https://github.com/austinevick/flutter-crypto-app',
      decs: 'A cryptocurrency app made with syncfusion and nomics api'),
  Project(
      name: 'Portfolio website',
      image: 'images/portfolio.png',
      url: 'https://github.com/austinevick/my-portfolio',
      decs: 'A flutter web portfolio website'),
  Project(
      name: 'Reminder App',
      image: 'images/reminder_app.png',
      url: 'https://github.com/austinevick/Reminder-app',
      decs: reminderAppDesc),
];
