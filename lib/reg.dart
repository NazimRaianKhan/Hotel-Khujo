import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_khujo/RegC.dart';

class Register extends StatefulWidget {
  final String title;

  const Register({
    super.key,
    required this.title,
  });

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  bool _isHidden=true;
  final RegC c=Get.put(RegC());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Container(
            padding: const EdgeInsets.only(left: 35, top: 100),
            child: const Text('Sign up', style: TextStyle(
              color: Colors.deepOrange,
              fontSize: 33,
            ),),
          ),
          SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.28,
                  right: 35,
                  left: 35),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                    child: TextFormField(
                      controller: Get.find<RegC>().name,
                      decoration: const InputDecoration(
                        hintText: 'Name',
                        border: UnderlineInputBorder(),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                    child: TextFormField(
                      controller: Get.find<RegC>().mail,
                      decoration: const InputDecoration(
                        hintText: 'Email',
                        border: UnderlineInputBorder(),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                   Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                    child: TextField(
                      controller: Get.find<RegC>().pass,
                      decoration: const InputDecoration(
                        hintText: 'Password',
                        border: UnderlineInputBorder(),
                      ),
                    ),
                  ),

                  const SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: ElevatedButton(
                      onPressed: () async{
                        Get.find<RegC>().signUp(context);
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
                      child: const Text('Sign up'),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
  void _togglePasswordView(){
    setState(() {
      _isHidden=!_isHidden;
    });
  }
}
