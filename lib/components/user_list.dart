import 'package:flutter/material.dart';
import 'package:provider_mvvm/models/user_model.dart';

class UserListBody extends StatelessWidget {
  final UserModel userModel;
  final VoidCallback  onTap;
   UserListBody({required this.userModel , required this.onTap});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  '${userModel.name}',
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Text(
                  '${userModel.email}',
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
    );
  }
}