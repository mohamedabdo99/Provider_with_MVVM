import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_mvvm/ui/home_screen/home_screen.dart';
import 'package:provider_mvvm/view_models/home_screen_view_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => HomeScreenViewModel()..getUsers(),),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyHomeScreen(),
      ),
    );
  }
}



