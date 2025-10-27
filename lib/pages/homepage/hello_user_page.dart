import 'package:dnt7/helper/color/app_color.dart';
import 'package:dnt7/helper/images/app_image.dart';
import 'package:dnt7/models/user_setting.dart';
import 'package:dnt7/services/shared_preference.dart';
import 'package:dnt7/start/get_started_page.dart';
import 'package:dnt7/widgets/appbar/basic_appbar.dart';
import 'package:flutter/material.dart';

class HelloUserPage extends StatelessWidget {
  final UserSetting user;
  const HelloUserPage({
    super.key,
    required this.user,
  });

  Future <void> _handleBack(BuildContext context) async {
    await SharedPreferenceService.instance.addOrUpdateUsers(user);
    if (!context.mounted) return;
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (_) => GetStartedPage(),
      ),
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    final bgColor = user.isDarkMode ? AppColor.darkBG : AppColor.lightBG;
    final textColor = user.isDarkMode ? AppColor.white : AppColor.black;
    return Scaffold(
      backgroundColor: bgColor,
      appBar: BasicAppbar(
        onBack: () => _handleBack(context),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircleAvatar(
                radius: 60,
                backgroundImage: AssetImage(
                  AppImage.getAvartar(user.avartarIndex),
                ),
              ),
              const SizedBox(height: 30),
              Text(
                'Hello ${user.userName}',
                style: TextStyle(
                  fontSize: user.fontSize,
                  color:  textColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}