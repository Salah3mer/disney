import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class AppConstans {
  static Color backgrondColor = HexColor('#1D1D27');

  static String convertHoursMinutes(int minutes) {
    Duration d = Duration(minutes: minutes);
    List<String> parts = d.toString().split(':');
    return '${parts[0]}h ${parts[1]}m';
  }
}
