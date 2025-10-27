class AppImage {
  static const String basePath = 'assets/images/avartar/';

  static const String av1 = '${basePath}av1.png';
  static const String av2 = '${basePath}av2.png';
  static const String av3 = '${basePath}av3.png';
  static const String av4 = '${basePath}av4.png';
  static const String av5 = '${basePath}av5.png';
  static const String av6 = '${basePath}av6.png';

  static String getAvartar(int index) {
    switch (index) {
      case 1: return av1;
      case 2: return av2;
      case 3: return av3;
      case 4: return av4;
      case 5: return av5;
      case 6: return av6;
      default: return av1;
    }
  }
}