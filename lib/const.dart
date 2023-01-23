import 'package:flutter/material.dart';
import 'dart:core';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

Color glColor = Colors.blue;//ff8daeff
Color appColor = Color(0xFFFFFFFF);
Color boxColor = Color(0xFFEFF3FF);
Color boxColor2 = Color(0xFFD5DFFF);
Color textColor = Color(0xFF1A1A1A);

class CustomIcons {
  CustomIcons._();

  static const _kFontFamily = 'IconFont';

  static const IconData calendar = IconData(0xe800, fontFamily: _kFontFamily);
  static const IconData podcasts = IconData(0xe801, fontFamily: _kFontFamily);
  static const IconData home = IconData(0xe802, fontFamily: _kFontFamily);
  static const IconData search = IconData(0xe803, fontFamily: _kFontFamily);
  static const IconData tickets = IconData(0xe804, fontFamily: _kFontFamily);
}


class ExampleTitle extends StatelessWidget {
  final String title;

  const ExampleTitle(this.title, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(title, style: Theme.of(context).textTheme.headline6),
    );
  }
}


printIntAsDay(int day) {
  print('Получено целое число: $day. Соответствует дню: ${intDayToEnglish(day)}');
}

String intDayToEnglish(int day) {
  if (day % 7 == DateTime.monday % 7) return 'Monday';
  if (day % 7 == DateTime.tuesday % 7) return 'Tueday';
  if (day % 7 == DateTime.wednesday % 7) return 'Wednesday';
  if (day % 7 == DateTime.thursday % 7) return 'Thursday';
  if (day % 7 == DateTime.friday % 7) return 'Friday';
  if (day % 7 == DateTime.saturday % 7) return 'Saturday';
  if (day % 7 == DateTime.sunday % 7) return 'Sunday';
  throw '🐞 Этого никогда не должно было случиться: $day';
}








