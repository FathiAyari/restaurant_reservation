import 'package:flutter/material.dart';
import 'package:resservation/reservation/validation.dart';

// ignore: camel_case_types
class administrateur extends StatefulWidget {
  static const String reservationRoute = 'administrateur';

  const administrateur({Key? key}) : super(key: key);

  // ignore: library_private_types_in_public_api
  _administrateurState createState() => _administrateurState();
}

  // ignore: camel_case_types
  class _administrateurState  extends State<administrateur> {


    @override
    Widget build(BuildContext context) {
      return Scaffold(
        backgroundColor: Colors.cyan[200],
        appBar: AppBar(
          title: const Text ('administration'),
          backgroundColor: Colors.blue[800],
        ),
        body: Column(
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
                const SizedBox(height: 70.0),
                const TextField(
                  decoration: InputDecoration(
                    labelText: 'id_adm:',
                    labelStyle: TextStyle(
                        color: Colors.black87,
                        fontSize: 20.0
                    ),
                    hintText: 'saisie votre ID',
                    border: OutlineInputBorder()

                  ),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 20.0),
                const TextField(
                  decoration: InputDecoration(
                    labelText: 'creation listes des plats:',
                    labelStyle: TextStyle(
                        color: Colors.black87,
                        fontSize: 20.0
                    ),
                    hintText: 'les plats d°aujourd°hui',
                    border: OutlineInputBorder()
                  ),
                  keyboardType: TextInputType.number,
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
                           onPressed: (){},
                           minWidth: 200,
                           height: 50,
                           child: const Text('Modifier', style: TextStyle(
                               color: Colors.white),
                           ),
                         ),
                       ),
                   const SizedBox(width: 40.0),
                   Material(
                     elevation: 5,
                     color: Colors.red,
                     borderRadius: BorderRadius.circular(10),
                     child: MaterialButton(
                       onPressed: (){},
                       minWidth: 200,
                       height: 50,
                       child: const Text('Suprimer', style: TextStyle(
                           color: Colors.white),
                       ),
                     ),
                   ),
                   const SizedBox(width: 40.0),
                   Material(
                     elevation: 5,
                     color: Colors.blue,
                     borderRadius: BorderRadius.circular(10),
                     child: MaterialButton(
                       onPressed: (){
                         Navigator.pushNamed(context, validation.reservationRoute);

                       },
                       minWidth: 200,
                       height: 50,
                       child: const Text('suivant', style: TextStyle(
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


