// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
//import 'package:lottie/lottie.dart';
import 'package:resservation/reservation/inscription.dart';
import 'package:resservation/reservation/reserver.dart';



// ignore: camel_case_types
class accueil extends StatefulWidget {

  static const String reservationRoute = 'accueil';

  const accueil({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _accueilState createState() => _accueilState();
}
  // ignore: camel_case_types
  class _accueilState extends State<accueil> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white30,
      appBar: AppBar(
        title: const Text ('BIEN VENUE AU RESTAURANT UNIVERSITAIRE'),
        backgroundColor:Colors.cyan[200],
      ),
      body: Column (
        children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
              const SizedBox(height: 100),

            const TextField(
              decoration: InputDecoration(
                labelText: 'id_inscript:',
                  labelStyle: TextStyle(
                      color: Colors.black87,
                      fontSize: 20.0
                  ),
                hintText: 'saisie votre ID',
                border: OutlineInputBorder()
              ),
              keyboardType: TextInputType.number,
            ),

            const SizedBox(height: 40),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
              Material(
                elevation: 5,
                color: Colors.blue[900],
                borderRadius: BorderRadius.circular(10),
                child: MaterialButton(
                  onPressed: (){
                    Navigator.pushNamed(context, reserver.reservationRoute);
                  },
                  minWidth: 200,
                  height: 50,
                  child: const Text('reserver', style: TextStyle(
                      color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(width: 10.0),
              Material(
                elevation: 5,
                color: Colors.blue[800],
                borderRadius: BorderRadius.circular(10),
                child: MaterialButton(
                  onPressed: (){
                    Navigator.pushNamed(context, inscription.reservationRoute);
                  },
                  minWidth: 200,
                  height: 50,
                  child: const Text('inscription', style: TextStyle(
                    color: Colors.white),
                  ),
                ),
              ),
                ],
              ),
            ),
          ],
        ),
        ],
      ),
    );
  }
}
