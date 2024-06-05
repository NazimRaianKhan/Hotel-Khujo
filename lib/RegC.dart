import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_khujo/Login.dart';

class RegC extends GetxController{
  TextEditingController mail=TextEditingController();
  TextEditingController pass=TextEditingController();
  TextEditingController name=TextEditingController();

  regMessageShow() => print('Pressed sign up');
  getToLoginPage() => Get.offAll(
      ()=>const Login(),
    transition: Transition.rightToLeft,
    duration: Durations.extralong1,
  );

  void updateName() async{
    final user = FirebaseAuth.instance.currentUser;
    await user?.updateDisplayName(name.text.toString());
    print('Name is updated');

  }


  void signUp(BuildContext context) async {
    if(name.text.isEmpty){
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Username is not valid'),
          ));
    }
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
        email: mail.text,
        password: pass.text,
      );
      updateName();
      getToLoginPage();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text(
                  'The password is too weak. Use more than 6 characters'),
            ));
      } else if (e.code == 'email-already-in-use') {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Email is already in use'),
            ));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('The email address is badly formated.'),
            ));
      }
    }
  }

}