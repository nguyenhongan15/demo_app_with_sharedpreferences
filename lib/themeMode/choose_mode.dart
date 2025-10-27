import 'package:dnt7/fontSize/choose_font_size.dart';
import 'package:dnt7/helper/color/app_color.dart';
import 'package:dnt7/models/user_setting.dart';
import 'package:dnt7/widgets/appbar/basic_appbar.dart';
import 'package:dnt7/widgets/button/basic_button.dart';
import 'package:flutter/material.dart';

class ChooseMode extends StatefulWidget {
  final UserSetting user;
  //final void Function(bool)? onToggleTheme;
  const ChooseMode({
    super.key,
    required this.user,
    //this.onToggleTheme,
  });

  @override
  State<ChooseMode> createState() => _ChooseModeState();
}

class _ChooseModeState extends State<ChooseMode> {

  bool ? _isDarkMode;

  @override
  Widget build(BuildContext context) {
    //final isDark = _isDarkMode ?? widget.user.isDarkMode;
    // final isDark = context.isDarkMode; // từ extension bạn đã tạo
    // final bgColor = isDark ? Colors.black : Colors.white;
    // final textColor = isDark ? Colors.white : Colors.black;

    return Scaffold(
      appBar: BasicAppbar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 60,
              horizontal: 60,
            ),
            child: Column(
              children: [
                const Align(
                  alignment: Alignment.topCenter,
                  child: Text(
                    'Choose Mode',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: AppColor.black,
                      fontSize: 40,
                    )
                  )
                ),
                const SizedBox(height: 200),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              _isDarkMode = false;
                            });
                          },
                          child: ClipOval(
                            child: Container(
                              height: 100,
                              width: 100,
                              decoration: BoxDecoration(
                                color: _isDarkMode == false ? AppColor.choosed.withValues(alpha: 0.5) 
                                : AppColor.bgIcon.withValues(alpha: 0.5),
                                shape: BoxShape.circle,
                              ),
                              child: Center(
                                child: Icon(
                                  Icons.wb_sunny,
                                  size: 50,
                                  color: AppColor.colorIcons,
                                )
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 15),
                        Text(
                          'Light Mode',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 17,
                            color: AppColor.black,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(width: 60,),
                    Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              _isDarkMode = true;
                            });
                            //widget.onToggleTheme?.call(true);
                          },
                          child: ClipOval(
                            child: Container(
                              height: 100,
                              width: 100,
                              decoration: BoxDecoration(
                                color: _isDarkMode == true ? AppColor.choosed.withValues(alpha: 0.5) 
                                : AppColor.bgIcon.withValues(alpha: 0.5),
                                shape: BoxShape.circle,
                              ),
                              child: Center(
                                child: Icon(
                                  Icons.nightlight_round,
                                  size: 50,
                                  color: AppColor.colorIcons,
                                )
                              )
                            ),  
                          )
                        ),
                        const SizedBox(height: 15),
                        Text(
                          'Dark Mode',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 17,
                            color: AppColor.black,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 60),
                BasicButton(
                  onPressed: () {
                    if (_isDarkMode == null) return;
                    final updatedUser = UserSetting(
                      userName: widget.user.userName,
                      isDarkMode: _isDarkMode!,
                      fontSize: widget.user.fontSize,
                      avartarIndex: widget.user.avartarIndex,
                    );
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) =>  ChooseFontSize(isDarkMode: _isDarkMode!, user: updatedUser),
                      )
                    );
                  },
                  title: 'Continue',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}