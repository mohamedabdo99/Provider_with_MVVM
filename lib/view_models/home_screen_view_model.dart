import 'package:flutter/cupertino.dart';
import 'package:provider_mvvm/models/user_model.dart';
import 'package:provider_mvvm/repo/api_status.dart';
import 'package:provider_mvvm/repo/user_service.dart';

class HomeScreenViewModel extends ChangeNotifier{
  bool _loading = false;
  List<UserModel> _userModelList = [];
  UserModel? _selectedUser;

  bool get loading => _loading;
  List<UserModel> get userModelList => _userModelList;
  UserModel get selectedUser => _selectedUser!;

  setLoading(bool loading){
    _loading = loading;
    notifyListeners();
  }

  setListUser(List<UserModel> list){
    _userModelList = list;
  }

  setSelectedUser(UserModel userModel){
    _selectedUser = userModel;
  }
  getUsers() async {
    setLoading(true);
    var response = await UserServices.getUsers();
    if(response is Success){
      setListUser(response.response as List<UserModel>);
    }
    setLoading(false);
  }
}