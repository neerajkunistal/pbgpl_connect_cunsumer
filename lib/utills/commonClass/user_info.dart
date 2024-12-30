import 'package:customer_connect/features/login/domain/model/login_model.dart';

class UserInfo {
  static UserInfo? instance;
  LoginModel? userData;
  List<LoginModel>? userList;

  static UserInfo? instanceInit() {
    instance ??= UserInfo();
    return instance;
  }

  setUserInfo(LoginModel useData) {
    userData ??= LoginModel();
    userData = useData;
  }

  setUserList(List<LoginModel> list) {
    userList ??= [];
    userList = list;
  }
}
