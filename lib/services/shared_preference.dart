import 'package:shared_preferences/shared_preferences.dart';
import 'package:dnt7/models/user_setting.dart';


class SharedPreferenceService {
  // cau truc factory singleton pattern
  // dam bao chi co mot doi tuong sharedPreferences duy nhat cho toan app
  static final SharedPreferenceService instance = SharedPreferenceService._();  
  // constructor _() la private, chi dung trong file nay, khong cho file khac tao them instance
  SharedPreferenceService._();

  static const _usersKey = "users";
  static const _lastAvartarIndex = "lastavartarindex";

  // khoi tao sharedPreferences
  late SharedPreferences _preferences;
  Future <void> init() async{
    _preferences = await SharedPreferences.getInstance(); // mo ket noi den bo nho luu tru key-value
  }


  // quan ly chi so avartar trong thu muc assets, 
  int get lastAvartarIndex => _preferences.getInt(_lastAvartarIndex) ?? 0;       //
  Future <void> setLastAvartarIndex(int index) async {
    await _preferences.setInt(_lastAvartarIndex, index);
  }
  int get nextAvatarIndex {
    int next = (lastAvartarIndex % 6) + 1;
    setLastAvartarIndex(next);
    return next;
  }


  // lay danh sach users
  List <UserSetting> get users {                                                 //
    final jsonString = _preferences.getString(_usersKey) ?? '[]';
    return decodeUserList(jsonString);
  }
  
  // luu danh sach users
  Future <void> saveUsers(List<UserSetting> list) async {
    final jsonString = encodeUserList(list);
    await _preferences.setString(_usersKey, jsonString);
  }

  // them hoac cap nhat users
  Future <void> addOrUpdateUsers(UserSetting user) async {                       //
    final list = users;
    final index = list.indexWhere((u) => u.userName == user.userName);
    if (index >= 0) {
      list[index] = user;
    } else {
      list.add(user);
    }
    await saveUsers(list);
  }


  // xoa users
  Future <void> deleteUsers(String username) async {
    final list = users..removeWhere((u) => u.userName == username);
    await saveUsers(list);
  }

  // doc darkmode
  bool get savedDarkMode => _preferences.getBool('isDarkMode') ?? false;
  // luu dark mode
  Future<void> setSavedDarkMode(bool value) async {
    await _preferences.setBool('isDarkMode', value);
  }


  // lay thong tin users                                                         //
  UserSetting? getUser(String username) {
    try{
      return users.firstWhere((u) => u.userName == username);
    }catch (_) {
      return null;  
    }
  }
}
