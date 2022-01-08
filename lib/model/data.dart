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
      name: 'Reminder App',
      image: 'images/reminder_app.png',
      url:
          'https://play.google.com/store/apps/details?id=com.augustinevictor.reminder_app',
      decs: 'A reminder app'),
];
