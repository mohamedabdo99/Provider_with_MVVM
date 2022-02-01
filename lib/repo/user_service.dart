import 'dart:developer';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:provider_mvvm/models/user_model.dart';
import 'package:provider_mvvm/repo/api_status.dart';
import 'package:provider_mvvm/utils/constants.dart';

class UserServices{

  static Future<Object> getUsers() async 
  {
    try{
      var url = Uri.parse(BASE_URL);
      var response = await http.get(url);
      if(response.statusCode == 200)
      {
        return Success(200, userModelFromJson(response.body));
      }
      return Failure(USER_INVALID_RESPONSE, 'Invalid Response');

    } on HttpException{
      return Failure(NO_INTERNET, 'No Internet');
    } on FormatException{
      return Failure(INVALID_FORMAT, 'Invalid Format');
    }
    catch(ex){
      log("Error : " + ex.toString());
      return Failure(EX_ERROR, 'Invalid : ' +ex.toString());
    }

  }


}