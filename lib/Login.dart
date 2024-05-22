import 'package:hotel_khujo/LoginC.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Login extends StatelessWidget{
  const Login({super.key});

  @override
  Widget build(BuildContext context) {

    final LoginC c=Get.put(LoginC());

    final border = OutlineInputBorder(
      borderSide: const BorderSide(
        color: Colors.black,
        width: 2.0,
        style: BorderStyle.solid,
        strokeAlign: BorderSide.strokeAlignOutside,
      ),
      borderRadius: BorderRadius.circular(10),
    );

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.orange,
          elevation: 1,
          title: const Text("Login Page"),
          titleTextStyle: const TextStyle(
            color: Colors.black,
            fontSize: 25,
            fontWeight: FontWeight.w500,
          ),
          centerTitle: true,
        ) ,

        body:Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Padding(
                padding:EdgeInsets.fromLTRB(2, 2, 2, 80),
                child: Text(
                  'Welcome',
                  style: TextStyle(
                    color: Colors.deepOrange,
                    backgroundColor: Colors.white,
                    fontSize: 40,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(8),
                child: TextField(
                  style:const TextStyle(
                    color: Colors.black,
                  ),
                  decoration: InputDecoration(
                    hintText: 'Username',
                    hintStyle:const TextStyle(
                      color: Colors.black,
                    ),
                    prefixIcon: const Icon(Icons.account_circle),
                    prefixIconColor: Colors.black,
                    filled: true,
                    fillColor: Colors.white10,
                    focusedBorder: border,
                    enabledBorder: border,
                  ),
                ) ,
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: TextField(
                  style:const TextStyle(
                    color: Colors.black,
                  ),
                  decoration: InputDecoration(
                    hintText: 'Password',
                    hintStyle:const TextStyle(
                      color: Colors.black,
                    ),
                    prefixIcon: const Icon(Icons.lock),
                    prefixIconColor: Colors.black,
                    filled: true,
                    fillColor: Colors.white10,
                    focusedBorder: border,
                    enabledBorder: border,
                  ),
                  obscureText: true,
                ) ,
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: ElevatedButton(
                  onPressed: () {
                    c.loginMessageShow();
                    c.getToHomePage();
                  },
                  style: ElevatedButton.styleFrom(
                    elevation: 10,
                    backgroundColor: Colors.orangeAccent,
                    foregroundColor: Colors.white,
                    minimumSize: const Size(double.infinity,50),
                    shape:RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)
                    ),
                  ),
                  child: const Text('Login'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: TextButton(
                  onPressed: () {
                    c.regMessageShow();
                    //c.getToRegPage();
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.white,
                  ),
                  child: const Text(
                    'Register',
                    style: TextStyle(
                      color: Colors.orange,
                    ),
                  ),
                ),
              ),
            ],
          ),
        )

    );
  }


}