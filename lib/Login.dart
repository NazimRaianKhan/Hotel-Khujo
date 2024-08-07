import 'package:hotel_khujo/LoginC.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Login extends StatefulWidget{
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  bool _isHidden=true;

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
          child: SingleChildScrollView(
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
                    controller: Get.find<LoginC>().mail,
                    style:const TextStyle(
                      color: Colors.black,
                    ),
                    decoration: InputDecoration(
                      hintText: 'Email',
                      hintStyle:const TextStyle(
                        color: Colors.black,
                      ),
                      prefixIcon: const Icon(Icons.email_outlined),
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
                    controller: Get.find<LoginC>().pass,
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
                      suffix: InkWell(
                        onTap: _togglePasswordView,
                        child: Icon(
                          _isHidden
                          ? Icons.visibility_off
                          : Icons.visibility,
                        ),
                      )
                    ),
                    obscureText: _isHidden,
                  ) ,
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: ElevatedButton(
                    onPressed: () async{
                      c.loginMessageShow();
                      Get.find<LoginC>().singIn(context);
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
                      c.getToRegPage();
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
          ),
        )

    );
  }
  void _togglePasswordView(){
    setState(() {
      _isHidden=!_isHidden;
    });
}
}