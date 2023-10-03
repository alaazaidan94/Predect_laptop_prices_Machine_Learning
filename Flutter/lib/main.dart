import 'package:flutter/material.dart';
import 'package:mlproject/LogIn.dart';
import 'package:mlproject/ProviderClass.dart';
import 'package:provider/provider.dart';
void main(){
  runApp(ChangeNotifierProvider(create:(context) => ProviderClass(),
    builder: (context, child) {
      return const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MyApp(),
      );
    },
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child:Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            title: Text("Machine Learning Application"),
            backgroundColor: Colors.lightBlue,
          ),
          body: LogIn(),
        ),
      );
  }
}
