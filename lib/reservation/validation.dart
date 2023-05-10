import 'package:flutter/material.dart';

// ignore: camel_case_types
class validation extends StatefulWidget {
  static const String reservationRoute = 'validation';

  const validation({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _validationState createState() => _validationState();
}

// ignore: camel_case_types
class _validationState  extends State<validation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.cyan[200],
        appBar: AppBar(
          title: const Text ('validation'),
          backgroundColor: Colors.blue[500],
        ),
        body: Column(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
                SizedBox(height: 90.0),
                TextField(
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
                SizedBox(height: 10.0),
                TextField(
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
                SizedBox(height: 10.0),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'N_cart_etudiant:',
                    labelStyle: TextStyle(
                        color: Colors.black87,
                        fontSize: 20.0
                    ),
                    hintText: 'saisie votre numero',
                    border: OutlineInputBorder()
                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 10.0),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Nbr_ticket:',
                    labelStyle: TextStyle(
                        color: Colors.black87,
                        fontSize: 20.0
                    ),
                    hintText: 'saisie le nombre',
                    border: OutlineInputBorder()
                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 10.0),
                TextField(
                 decoration: InputDecoration(
                  labelText: 'Montant:',
                  labelStyle: TextStyle(
                      color: Colors.black87,
                      fontSize: 20.0
                  ),
                  hintText: 'saisie le prix',
                  border: OutlineInputBorder()
                 ),
                keyboardType: TextInputType.number,
              ),
             ],
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
                          child: const Text('Valider', style: TextStyle(
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
                          child: const Text('Quitter', style: TextStyle(
                              color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
               ],
            ),
    );
  }
}
