import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:resservation/presentation/widgets/input_field.dart';
import 'package:resservation/ressources/dimensions/constants.dart';
import 'package:resservation/ressources/router/router.dart';
import 'package:resservation/services/AuthServices.dart';

import '../Sign_in/sign_in.dart';
import 'alertTask.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool loading = false;
  File? _image;
  String role = 'client';

  final _formkey = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController gsmController = TextEditingController();
  TextEditingController passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Form(
                  key: _formkey,
                  child: Stack(
                    children: [
                      Column(
                        children: [
                          Container(
                            height: 250,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(90),
                              ),
                              gradient: LinearGradient(begin: Alignment.topRight, end: Alignment.bottomLeft, colors: [
                                Colors.blueGrey,
                                Colors.indigo,
                              ]),
                            ),
                            child: Center(
                                child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(top: 50),
                                  child: Image(
                                    image: AssetImage('assets/images/logo.png'),
                                    height: 90,
                                    width: 90,
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 20),
                                  child: Text(
                                    'Créer un compte',
                                    textAlign: TextAlign.right,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 25,
                                        //  fontWeight: FontWeight.bold,
                                        fontStyle: FontStyle.italic),
                                  ),
                                )
                              ],
                            )),
                          ),
                          InputField(
                            label: "Nom et Prénom",
                            controller: nameController,
                            textInputType: TextInputType.text,
                            prefixWidget: Icon(
                              Icons.account_circle_outlined,
                              color: Colors.indigo,
                            ),
                          ),
                          InputField(
                            label: "Email",
                            controller: emailcontroller,
                            textInputType: TextInputType.emailAddress,
                            prefixWidget: Icon(
                              Icons.email,
                              color: Colors.indigo,
                            ),
                          ),
                          InputField(
                            label: "Numéro portable",
                            controller: gsmController,
                            textInputType: TextInputType.phone,
                            prefixWidget: Icon(
                              Icons.phone,
                              color: Colors.indigo,
                            ),
                          ),
                          InputField(
                            label: "Mot de passe",
                            controller: passController,
                            textInputType: TextInputType.visiblePassword,
                            prefixWidget: Icon(
                              Icons.lock,
                              color: Colors.indigo,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: double.infinity,
                              margin: EdgeInsets.symmetric(horizontal: 10),
                              height: Constants.screenHeight * 0.06,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.grey[200],
                              ),
                              child: DropdownButton<String>(
                                value: role,
                                underline: SizedBox(
                                  height: 0,
                                ),
                                items: [
                                  DropdownMenuItem(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        'Gestionnaire de centre de camping',
                                        style: TextStyle(fontSize: 14, fontStyle: FontStyle.italic, color: Colors.black38),
                                      ),
                                    ),
                                    value: 'manager',
                                  ),
                                  DropdownMenuItem(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        'Client',
                                        style: TextStyle(fontSize: 14, fontStyle: FontStyle.italic, color: Colors.black38),
                                      ),
                                    ),
                                    value: 'client',
                                  ),
                                ],
                                onChanged: (value) {
                                  setState(() {
                                    role = value!;
                                  });
                                },
                              ),
                            ),
                          ),
                          loading
                              ? CircularProgressIndicator()
                              : Container(
                                  padding: EdgeInsets.symmetric(horizontal: 26),
                                  margin: EdgeInsets.symmetric(horizontal: 20),
                                  child: Row(
                                    children: [
                                      Expanded(
                                          child: CupertinoButton(
                                              child: Text(
                                                'S\'inscrire',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 15,
                                                  fontStyle: FontStyle.italic, // fontWeight: FontWeight.bold )
                                                ),
                                              ),
                                              color: Colors.indigo,
                                              onPressed: () async {
                                                if (_formkey.currentState!.validate() && !_image.isNull) {
                                                  setState(() {
                                                    loading = true;
                                                  });

                                                  bool check = await AuthServices().signUp(emailcontroller.text,
                                                      passController.text, nameController.text, role, gsmController.text);

                                                  if (check) {
                                                    setState(() {
                                                      loading = false;
                                                    });
                                                    AuthServices().getUserData().then((value) {
                                                      AuthServices().saveUserLocally(value);

                                                      if (value.role == 'user') {
                                                        Navigator.pushNamed(context, AppRouting.homeClient);
                                                      } else if (value.role == 'admin') {
                                                        Navigator.pushNamed(context, AppRouting.homeAdmin);
                                                      } else {}
                                                    });
                                                  } else {
                                                    setState(() {
                                                      loading = false;
                                                    });
                                                    alertTask(
                                                      lottieFile: "assets/lotties/error.json",
                                                      action: "Ressayer",
                                                      message: "Email déja existe",
                                                      press: () {
                                                        Navigator.pop(context);
                                                      },
                                                    ).show(context);
                                                  }
                                                } else if (_image.isNull) {
                                                  Fluttertoast.showToast(
                                                      msg: "Image obligatoire",
                                                      toastLength: Toast.LENGTH_SHORT,
                                                      gravity: ToastGravity.BOTTOM,
                                                      timeInSecForIosWeb: 1,
                                                      backgroundColor: Colors.grey,
                                                      textColor: Colors.white,
                                                      fontSize: 16.0);
                                                }
                                              }))
                                    ],
                                  )),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: Constants.screenHeight * 0.07,
                          width: double.infinity,
                          child: Row(
                            children: [
                              IconButton(
                                onPressed: () {
                                  Get.to(SignInScreen());
                                },
                                icon: Icon(Icons.arrow_back_ios),
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: Constants.screenHeight * 0.08,
                              ),
                              Text(
                                "Creér un compte",
                                style: TextStyle(
                                    fontStyle: FontStyle.italic, color: Colors.white, fontSize: Constants.screenHeight * 0.03),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  )))),
    );
  }
}
