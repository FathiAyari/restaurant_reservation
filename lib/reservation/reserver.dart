import 'package:flutter/material.dart';
import 'package:resservation/reservation/administrateur.dart';

// ignore: camel_case_types
class reserver extends StatefulWidget {
  static const String reservationRoute = 'reserver';

  const reserver({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _reserverState createState() => _reserverState();
}
  // ignore: camel_case_types
  class _reserverState  extends State<reserver> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.cyan[200],
      appBar: AppBar(
        title: const Text ('Formulaire de reservation de ticket de restaurant'),
        backgroundColor:Colors.blue[500],
      ),
      body: Column (
        children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: 800.0,
              height: 20.0,
              child: Divider(
                 color: Colors.blue[500]
             ),
           ),
            const SizedBox(height: 50.0),
            const TextField(
              decoration: InputDecoration(
                labelText: 'num_ticket:',
                labelStyle: TextStyle(
                    color: Colors.black87,
                    fontSize: 20.0
                ),
                hintText: 'saisie votre numero',
                border: OutlineInputBorder()
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(width: 20.0),
            const TextField(
              decoration: InputDecoration(
                labelText: 'date_reserver:',
                labelStyle: TextStyle(
                    color: Colors.black87,
                    fontSize: 20.0
                ),
                hintText: 'saisie votre date',
                border: OutlineInputBorder()
              ),
              keyboardType: TextInputType.datetime,
            ),
             const SizedBox(height: 50.0),
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
                         Navigator.pushNamed(context, administrateur.reservationRoute);

                       },
                       minWidth: 200,
                       height: 50,
                       child: const Text('Suivant', style: TextStyle(
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
