import 'dart:ui';

class AppColor {
  static Color primary = fromHex('#000000');

  static Color primaryLight = fromHex('#c7c7c7');

  static Color secondary = fromHex('#ffffff');

  static Color text1 = fromHex('#212121');

  static Color text2 = fromHex('#757575');

  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}
