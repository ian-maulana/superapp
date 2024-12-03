import 'package:flutter/material.dart';

class AppColors {
  static Color primary = HexColor.fromHex('#4A3CA4');
  static Color primary100 = HexColor.fromHex('#EDF2FC');
  static Color primary200 = HexColor.fromHex('#093DA0');
  static Color primary300 = HexColor.fromHex('#051E50');

  static Color secondary = HexColor.fromHex('#0b11d');
  static Color secondary100 = HexColor.fromHex('#F7F9FF');
  static Color secondary200 = HexColor.fromHex('#D3D9E3');
  static Color secondary300 = HexColor.fromHex('#818A9B');
  static Color secondary400 = HexColor.fromHex('#626B7D');
  static Color secondary500 = HexColor.fromHex('#3E4758');
  static Color secondary600 = HexColor.fromHex('#1F283B');
  static Color secondary700 = HexColor.fromHex('#192131');
  static Color secondary800 = HexColor.fromHex('#131B2A');

  static Color warning = HexColor.fromHex('#f7b200');
  static Color warning100 = HexColor.fromHex('#FDF0CC');
  static Color warning200 = HexColor.fromHex('#CE9400');
  static Color warning300 = HexColor.fromHex('#7B5900');

  static Color error = HexColor.fromHex('#EE1549');
  static Color error100 = HexColor.fromHex('#FEE8ED');
  static Color error200 = HexColor.fromHex('#FFFFFF');
  static Color error300 = HexColor.fromHex('#770A24');

  static Color white = HexColor.fromHex('#FFFFFF');

  static Color disabled = HexColor.fromHex('#9CA3AF');

  static Color body = HexColor.fromHex('#1A1A1A');
  static Color body100 = HexColor.fromHex('#D3D9E3');
  static Color body200 = HexColor.fromHex('#828282');
  static Color body300 = HexColor.fromHex('#626B7D');

  static Color border = HexColor.fromHex('#50515F');
  static Color border100 = HexColor.fromHex('#E4EBF3');

  static Color bearer = const Color.fromRGBO(29, 58, 112, 0.7);
}

extension HexColor on Color {
  static Color fromHex(String hexColorString) {
    hexColorString = hexColorString.replaceAll('#', '');

    if (hexColorString.length == 6) {
      hexColorString = 'FF$hexColorString'; // 8 char with opacity 100%
    }

    return Color(int.parse(hexColorString, radix: 16));
  }
}
