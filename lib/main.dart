import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resservation/ressources/router/router.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Reservation',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      onGenerateRoute: AppRouting.generateRoute,
      initialRoute: AppRouting.splashScreen,
      /*       routes: {
            accueil.reservationRoute: (context) => const accueil(),
            inscription.reservationRoute: (context) => const inscription(),
            //etudiant.reservationRoute: (context) => const etudiant(),
            reserver.reservationRoute: (context) => const reserver(),
            administrateur.reservationRoute: (context) => const administrateur(),
            validation.reservationRoute: (context) => const validation(),
          }*/
    );
  }
}
