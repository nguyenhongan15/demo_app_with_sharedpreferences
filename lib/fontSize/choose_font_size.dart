import 'package:dnt7/helper/color/app_color.dart';
import 'package:dnt7/models/user_setting.dart';
import 'package:dnt7/pages/homepage/hello_user_page.dart';
import 'package:dnt7/services/shared_preference.dart';
import 'package:dnt7/widgets/appbar/basic_appbar.dart';
import 'package:dnt7/widgets/button/basic_button.dart';
import 'package:flutter/material.dart';

class ChooseFontSize extends StatefulWidget {
  final bool isDarkMode;
  final UserSetting user;
  const ChooseFontSize({
    super.key,
    required this.isDarkMode,
    required this.user,
  });

  @override
  State <ChooseFontSize> createState() => _ChooseFontSizeState();
}

class _ChooseFontSizeState  extends State<ChooseFontSize> {
  double _fontSize = 20.0;
  
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;

    final bgColor = widget.isDarkMode ? AppColor.darkBG : AppColor.lightBG;
    final textColor = widget.isDarkMode ? AppColor.white : AppColor.black;
    return Scaffold(
      appBar: BasicAppbar(),
      backgroundColor: bgColor,
      body: Padding(
        padding:  EdgeInsets.symmetric(
          vertical: height * 0.05,
          horizontal: width *0.08,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Text(
                'Choose fontSize',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: textColor,
                  fontSize: 40,
                )
              )
            ),
            SizedBox(height: height * 0.1),
            SizedBox(
              height: height * 0.3,
              width: double.infinity,
              child: Text(
                'Flutter is an open-source framework developed by Google for building beautiful, fast, and cross-platform applications from a single codebase.',
                style: TextStyle(
                  fontSize: _fontSize,
                  fontWeight: FontWeight.w500,
                  color: textColor,
                ),
                maxLines: 6,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            SizedBox(height: height * 0.08),
            Slider(
              value: _fontSize,
              min: 8.0, 
              max: 80.0,
              divisions: 18,
              label: _fontSize.toStringAsFixed(0),
              onChanged: (value) {
                setState(() {
                  _fontSize = value;
                });
              },
            ),
            SizedBox(height: height * 0.01),
            Text(
              'Font Size: ${_fontSize.toStringAsFixed(0)}',
              style: TextStyle(fontSize: 16, color: textColor),
            ),
            SizedBox(height: 10),
            BasicButton(
              onPressed: () async {
                final updatedUser = UserSetting(
                  userName: widget.user.userName,
                  isDarkMode: widget.isDarkMode,
                  fontSize: _fontSize,
                  avartarIndex: widget.user.avartarIndex,
                );
                await SharedPreferenceService.instance.addOrUpdateUsers(updatedUser);
                if (!context.mounted) return;
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HelloUserPage(user: updatedUser),
                  )
                );
              },
              title: 'Continue',
            ),
          ],
        )
      )
    );
  }
}