import 'dart:convert';

class UserSetting {
  final String userName;
  final bool isDarkMode;
  final double fontSize;
  final int avartarIndex;

  UserSetting({
    required this.userName,
    required this.isDarkMode,
    required this.fontSize,
    required this.avartarIndex,
  });

  // chuyen tu object sang Json
  Map <String, dynamic> toJson() => {
    'userName': userName,
    'isDarkMode': isDarkMode,
    'fontSize': fontSize,
    'avartarIndex': avartarIndex,
  };

  // chuyen tu Json sang object
  factory UserSetting.fromJson(Map <String, dynamic> json) => UserSetting(
    userName: json['userName'],
    isDarkMode: json['isDarkMode'],
    fontSize: (json['fontSize'] as num).toDouble(),
    avartarIndex: json['avartarIndex'] ?? 1,
  );
}

// giai ma chuoi JSON -> List <UserSetting>
List <UserSetting> decodeUserList(String jsonString) {
  if (jsonString.isEmpty) return [];
  try {
    final List list = json.decode(jsonString);
    return list.map((e) => UserSetting.fromJson(e)).toList();
  }  catch (_) {
    return [];
  }
}

// ma hoa List <UserSetting>  -> chuỗi JSON
String encodeUserList(List <UserSetting> users) => json.encode(users.map((u) => u.toJson()).toList());