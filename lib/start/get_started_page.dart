
import 'package:dnt7/models/user_setting.dart';
import 'package:dnt7/pages/homepage/hello_user_page.dart';
import 'package:dnt7/services/shared_preference.dart';
import 'package:dnt7/themeMode/choose_mode.dart';
import 'package:dnt7/widgets/button/circle_button.dart';
import 'package:dnt7/widgets/user/profile/user_profile.dart';
import 'package:flutter/material.dart';


class GetStartedPage extends StatefulWidget {
  //final void Function(bool)? onToggleTheme; 
  const GetStartedPage({
    super.key,
    //this.onToggleTheme,
  });

  @override
  State<GetStartedPage> createState() => _GetStartedPageState();
}


class _GetStartedPageState extends State<GetStartedPage> {

  List <UserSetting> userList = [];

  @override
  void initState() {
    super.initState();
    _initPref();
  }

  Future <void> _initPref() async {
    await SharedPreferenceService.instance.init();
    setState(() {
      userList = SharedPreferenceService.instance.users;
    });
  }

  Future <void>  _addNewUser(String name) async {
    if (name.trim().isEmpty) return;
    final avartarIndex = SharedPreferenceService.instance.nextAvatarIndex;

    final newUser = UserSetting(
      userName: name.trim(),
      isDarkMode: false,
      fontSize: 16,
      avartarIndex: avartarIndex,
    );
    await SharedPreferenceService.instance.addOrUpdateUsers(newUser);
    var updatedList = SharedPreferenceService.instance.users;
    if (updatedList.length > 3) {
      updatedList.removeAt(0);
      await SharedPreferenceService.instance.saveUsers(updatedList);
    }
    if (!mounted) return;
    setState(() {
      userList = updatedList;
    });
    
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (_) => ChooseMode(
          user: newUser,
          //onToggleTheme: widget.onToggleTheme,
        ),
      ),
      (route) => false,
    );
  }

  Future <void> _openUsers(UserSetting user) async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => HelloUserPage(user: user),
      ),
    );
    if (!mounted) return;
    setState(() {
      userList = SharedPreferenceService.instance.users;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const  EdgeInsets.symmetric(
              vertical: 40.0,
              horizontal: 16.0,
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (final user in userList)
                    UserProfile(
                      user: user,
                      onTap: () => _openUsers(user),
                    ),
                  const SizedBox(height: 18),
                  CircleAddButton(
                    onSubmitted: (text) => _addNewUser(text),
                  )
                ],
              ),
            )
          )
        )
      ),
    );
  }
}
