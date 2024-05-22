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
    return Container(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.orange,
          elevation: 0,
        ),
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            Container(
              padding: const EdgeInsets.only(left: 35, top: 70),
              child: const Text('Create\nAccount', style: TextStyle(
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
                    TextField(
                      decoration: InputDecoration(
                          fillColor: Colors.grey.shade100,
                          filled: true,
                          hintText: 'Name',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          )
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    TextField(
                      decoration: InputDecoration(
                          fillColor: Colors.grey.shade100,
                          filled: true,
                          hintText: 'Email',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          )
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    TextField(
                      obscureText: _isHidden,
                      decoration: InputDecoration(
                          fillColor: Colors.grey.shade100,
                          filled: true,
                          hintText: 'Password',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          suffix: InkWell(
                            onTap: _togglePasswordView,
                            child: Icon(
                                    _isHidden
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                            ),
                          )
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Sign Up',
                          style: TextStyle(
                              color: Colors.orange,
                              fontSize: 27,
                              fontWeight: FontWeight.w700),
                        ),
                        CircleAvatar(
                          radius: 30,
                          backgroundColor: Colors.orange[200],
                          child: IconButton(
                            onPressed: (){
                              c.regMessageShow();
                              c.getToLoginPage();
                            },
                            icon: Icon(Icons.arrow_forward),
                          ),
                        )
                      ],
                    ),


                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
  void _togglePasswordView(){
    setState(() {
      _isHidden=!_isHidden;
    });
  }
}
