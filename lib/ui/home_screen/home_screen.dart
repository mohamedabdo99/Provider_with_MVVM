import 'package:flutter/material.dart';
import 'package:provider_mvvm/components/user_list.dart';
import 'package:provider_mvvm/models/user_model.dart';
import 'package:provider_mvvm/ui/user_details_screen/user_details_screen.dart';
import 'package:provider_mvvm/utils/navigate_to.dart';
import 'package:provider_mvvm/view_models/home_screen_view_model.dart';
import 'package:provider/provider.dart';
class MyHomeScreen extends StatelessWidget {
  const MyHomeScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomeScreenViewModel homeScreenViewModel = context.watch<HomeScreenViewModel>();
    return Scaffold(
      appBar : AppBar(
        title: const Text("Users List" , style: TextStyle(color: Colors.white  , fontSize: 16.0),),
        centerTitle: true,

      ),
      body: Container(
        color: Colors.white,
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            buildBody(homeScreenViewModel),
          ],
        ),
      ),
    );
  }

  buildBody(HomeScreenViewModel viewModel){
    if(viewModel.loading){
      return Container(
        color: Colors.white,
      );
    }
    return Expanded(child: ListView.separated(
      itemBuilder: (context , index) {
        UserModel userModel = viewModel.userModelList[index];
        return UserListBody(userModel: userModel , onTap: () async{
          viewModel.setSelectedUser(userModel);
          navigateTo(context, const USerDetailsScreen());
        },
        );
      }, 
      separatorBuilder: (context , index) => Divider(),
       itemCount: viewModel.userModelList.length)
       );
  }
}