import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_mvvm/view_models/home_screen_view_model.dart';

class USerDetailsScreen extends StatelessWidget {
  const USerDetailsScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomeScreenViewModel viewModel = context.watch<HomeScreenViewModel>();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '${viewModel.selectedUser.name}'
          ),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 20.0,
              left: 20.0,
              right: 20.0,
            ),
            child: Text(
                  '${viewModel.selectedUser.name}',
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}