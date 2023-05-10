// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
//import 'package:resservation/reservation/etudiant.dart';
import 'package:resservation/reservation/reserver.dart';


 // ignore: camel_case_types
 class inscription extends StatefulWidget {
   static const String reservationRoute = 'inscription';


   const inscription ({ Key? key}) : super (key: key);
   @override
   // ignore: library_private_types_in_public_api
   _inscriptionState createState() => _inscriptionState();
 }
 // ignore: camel_case_types
 class _inscriptionState extends State<inscription> {
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.cyan[200],
      appBar: AppBar(
        title: const Text ('INSCRIPTION'),
        backgroundColor:Colors.blue[500],
      ),
      body: Column (
        children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 100,
              child: const Image(
                image: NetworkImage('data:image/png;base64,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'
                ),
                height: 300.0,
                width: 900.0,
              ),
            ),
            SizedBox(
              width: 800.0,
              height: 05.0,
              child: Divider(
                  color: Colors.blue[500]
              ),
            ),
            const TextField(
              decoration: InputDecoration(
                labelText: 'num_inscript:',
                labelStyle: TextStyle(
                    color: Colors.black87,
                    fontSize: 20.0
                 ),
                hintText: 'saisie votre numero',
                border: OutlineInputBorder()
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 05.0),
            const TextField(
              decoration: InputDecoration(
                labelText: 'CIN:',
                labelStyle: TextStyle(
                    color: Colors.black87,
                    fontSize: 20.0
                ),
                hintText: 'saisie votre CIN',
                border: OutlineInputBorder()

              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 05.0),
            const TextField(
              decoration: InputDecoration(
                labelText: 'Nom:',
                labelStyle: TextStyle(
                    color: Colors.black87,
                    fontSize: 20.0
                ),
                hintText: 'saisie votre nom',
                border: OutlineInputBorder()

              ),
              keyboardType: TextInputType.text,
            ),
            const SizedBox(height: 05.0),
            const TextField(
              decoration: InputDecoration(
                labelText: 'Prenom:',
                labelStyle: TextStyle(
                    color: Colors.black87,
                    fontSize: 20.0
                ),
                hintText: 'saisie votre prenom',
                border: OutlineInputBorder()
              ),
              keyboardType: TextInputType.text,
            ),
            const SizedBox(height: 05.0),
            const TextField(
              decoration: InputDecoration(
                labelText: 'Date_Nais:',
                labelStyle: TextStyle(
                    color: Colors.black87,
                    fontSize: 20.0
                ),
                hintText: 'saisie votre date',
                border: OutlineInputBorder()

              ),
              keyboardType: TextInputType.datetime,
            ),
            const SizedBox(height: 05.0),
            const TextField(
              decoration: InputDecoration(
                labelText: 'Sexe:',
                labelStyle: TextStyle(
                    color: Colors.black87,
                    fontSize: 20.0
                ),
                hintText: '...........',
                border: OutlineInputBorder()

              ),
              keyboardType: TextInputType.text,
            ),
            const SizedBox(height: 05.0),
            const TextField(
              decoration: InputDecoration(
                labelText: 'num_cart_etudiant:',
                labelStyle: TextStyle(
                    color: Colors.black87,
                    fontSize: 20.0
                ),
                hintText: 'saisie votre numero',
                border: OutlineInputBorder()

              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 05.0),
            const TextField(
              decoration: InputDecoration(
                labelText: 'num_cart_post:',
                labelStyle: TextStyle(
                    color: Colors.black87,
                    fontSize: 20.0
                ),
                hintText: 'saisie votre numero',
                border: OutlineInputBorder()

              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 05.0),
            const TextField(
              decoration: InputDecoration(
                labelText: 'num_cart_banq:',
                labelStyle: TextStyle(
                    color: Colors.black87,
                    fontSize: 20.0
                ),

                hintText: 'saisie votre numero',
                border: OutlineInputBorder()

              ),
              keyboardType: TextInputType.number,
            ),
          ],

        ),

          const SizedBox(height: 20),
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
              child: const Text('Enregistrer', style: TextStyle(
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
                    child: const Text('Modifier', style: TextStyle(
                        color: Colors.white),
                    ),
                  ),
                ),
          const SizedBox(width: 10.0),
            Material(
              elevation: 5,
              color: Colors.red,
              borderRadius: BorderRadius.circular(10),
              child: MaterialButton(
              onPressed: (){},
              minWidth: 200,
              height: 50,
              child: const Text('Quitter', style: TextStyle(
                  color: Colors.white),
              ),
            ),
          ),
            ]
            ),
          ),
        ],
      ),
    );


  }

}