import 'package:dnt7/start/get_started_page.dart';
import 'package:dnt7/services/shared_preference.dart';
import 'package:flutter/material.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferenceService.instance.init();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({
    super.key,
  });

  @override
  State <MyApp> createState() => _MyAppState();
}
class _MyAppState extends State<MyApp> {
  bool isDarkMode = false;

  @override
  void initState() {
    super.initState();
    _loadTheme();
  }
  Future <void> _loadTheme() async {
    final isDark = SharedPreferenceService.instance.savedDarkMode;
    setState(() {
      isDarkMode = isDark;
    });
  }

  @override 
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: isDarkMode? ThemeMode.dark : ThemeMode.light,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      home: GetStartedPage(),
      );
    }
}
