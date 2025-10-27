import 'package:dnt7/helper/is_darkMode/is_dark_mode.dart';
import 'package:flutter/material.dart';

class BasicAppbar extends StatelessWidget implements PreferredSizeWidget {

  final Widget ? title;
  final VoidCallback ? onBack;
  const BasicAppbar( {
    super.key,
    this.title,
    this.onBack,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: title ?? const Text(''),
      centerTitle: true,
      leading: IconButton(
        onPressed: onBack ?? () => Navigator.pop(context),
        icon: Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            color: context.isDarkMode ? Colors.white : Colors.black,
            shape: BoxShape.circle,
          ),
          child: Icon(
            Icons.arrow_back_ios_new,
            color: context.isDarkMode ? Colors.black : Colors.white,
          ),
        )
      )
    );
  }

  @override 
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}