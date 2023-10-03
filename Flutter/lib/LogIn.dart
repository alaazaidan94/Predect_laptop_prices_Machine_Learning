import 'package:flutter/material.dart';
import 'package:mlproject/Content.dart';

class LogIn extends StatelessWidget {

  final ke1 = GlobalKey<FormState>();
  var un = TextEditingController();
  var pw = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: ListView(
        children: <Widget>[
          Container(
              width: 100,
              height: 100,
              alignment: Alignment.center,
              padding: const EdgeInsets.all(10),
              child: const Text("An application to predict laptop prices in northern Syria",style: TextStyle(color: Colors.blue,fontSize: 25),)),
          Container(
              width: 100,
              height: 150,
              alignment: Alignment.center,
              padding: const EdgeInsets.all(10),
              child: Image.asset("image/ml.png")),
          Container(
            padding: const EdgeInsets.all(10),
            child: Form(
                key: ke1,
                child: Column(
                  children: [
                    TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "UserName Required";
                        }
                        return null;
                      },
                      controller: un,
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: const BorderSide(
                                width: 2,
                                color: Colors.green
                            )
                        ),
                        prefixIcon: const Icon(Icons.person),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        labelText: 'User Name',
                      ),
                    ),
                    const SizedBox(height: 20,),
                    TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "PassWord Required";
                        }
                        return null;
                      },
                      controller: pw,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.security),
                        suffixIcon: IconButton(
                          onPressed: () {
                          },
                          icon: const Icon(Icons.remove_red_eye),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: const BorderSide(
                              width: 2,
                              color: Colors.green,
                            )
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        labelText: 'Password',
                      ),
                    ),
                  ],
                )),
          ),
          Container(
              height: 60,
              padding:  const EdgeInsets.fromLTRB(100, 10, 100, 0),
              child: ElevatedButton(
                  style: ButtonStyle(
                      padding: MaterialStateProperty.all<EdgeInsets>(const EdgeInsets.all(15)),
                      backgroundColor: MaterialStateProperty.all<Color>(Colors.blue.shade400),
                      foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                          )
                      )
                  ),
                  child:  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(Icons.login),
                      SizedBox(width: 10,),
                      Text('Login'),
                    ],
                  ),
                  onPressed: () {
                    if(ke1.currentState!.validate()){
                      if((un.text == "test") && (pw.text == "test")){
                        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_){
                          return  Content();
                        }));
                      }
                      else{
                        showDialog(
                            barrierDismissible: false,
                            context: context,
                            builder: (context) {
                              Future.delayed(const Duration(seconds: 1), () {
                                Navigator.of(context).pop();

                              });
                              return const AlertDialog(
                                content: Text("UserName Or Password Incorrect"),
                              );
                            });
                      }
                    }
                  }

              )),
        ],
      ),
    );
  }
}
