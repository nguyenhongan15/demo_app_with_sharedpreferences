import 'package:dnt7/helper/color/app_color.dart';
import 'package:dnt7/helper/images/app_image.dart';
import 'package:dnt7/models/user_setting.dart';
import 'package:flutter/material.dart';

class UserProfile extends StatelessWidget {
  final UserSetting user;
  final VoidCallback onTap;

  const UserProfile({
    super.key,
    required this.user,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 10,
      ),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: 350,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: 0.1), // màu trong suốt nhẹ
            borderRadius: BorderRadius.circular(20), // bo góc
            border: Border.all(
              color: Colors.white.withValues(alpha: .3), // viền mờ nhẹ
              width: 1.5,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.2),
                blurRadius: 6,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage(
                  AppImage.getAvartar(user.avartarIndex),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                user.userName,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppColor.black,
                ),
              ),
            ],
          ),
        ),
      )
    );
  }
}