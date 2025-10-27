import 'package:dnt7/helper/images/app_image.dart';
import 'package:dnt7/models/user_setting.dart';
import 'package:flutter/material.dart';

class AddUsers extends StatelessWidget {
  final VoidCallback onPressed;
  final UserSetting user;
  const AddUsers({
    super.key,
    required this.onPressed,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 12),
      child: GestureDetector(
        onTap: onPressed,
        child: CircleAvatar(
          radius: 60,
          backgroundImage: AssetImage(
            AppImage.getAvartar(user.avartarIndex),
          ),
        )
      )
    );
  }
}