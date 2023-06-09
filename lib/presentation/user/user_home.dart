import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get_storage/get_storage.dart';
import 'package:lottie/lottie.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:resservation/models/Users.dart';
import 'package:resservation/presentation/widgets/icon_button_splash/view/icon_button_splash.dart';
import 'package:resservation/ressources/dimensions/constants.dart';
import 'package:resservation/services/AuthServices.dart';
import 'package:unicons/unicons.dart';

class HomeUser extends StatefulWidget {
  const HomeUser({Key? key}) : super(key: key);

  @override
  State<HomeUser> createState() => _HomeUserState();
}

class _HomeUserState extends State<HomeUser> {
  var user = GetStorage().read("user");
  Future<void> scanQR() async {
    String barcodeScanRes;
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode('#ff6666', 'Cancel', true, ScanMode.QR);
      var userData = await FirebaseFirestore.instance.collection('users').doc(barcodeScanRes).get();

      if (userData.exists) {
        var us = await FirebaseFirestore.instance.collection("users").doc(user['uid']).get();
        List myOldTickets = us.get('tickets');
        var frnd = await FirebaseFirestore.instance.collection("users").doc(userData.id).get();
        List friendTickets = frnd.get('tickets');

        friendTickets.add(myOldTickets.last);
        FirebaseFirestore.instance.collection('users').doc(userData.id).update({"tickets": friendTickets});
        FirebaseFirestore.instance
            .collection("users")
            .doc(userData.id)
            .collection("historics")
            .add({"dateTime": DateTime.now(), "subject": "Vous avez recu une ticket de ${user['name']} ${user['last_name']}"});

        myOldTickets.removeLast();
        FirebaseFirestore.instance.collection('users').doc(user['uid']).update({"tickets": myOldTickets});
        FirebaseFirestore.instance.collection("users").doc(user['uid']).collection("historics").add({
          "dateTime": DateTime.now(),
          "subject": "Vous avez envoyé une ticket a ${userData.get('name')} ${userData.get('last_name')}"
        });

        final snackBar = SnackBar(
          content: Text("Ticket envoyé"),
          backgroundColor: (Colors.green),
          action: SnackBarAction(
            label: 'fermer',
            textColor: Colors.white,
            onPressed: () {},
          ),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      } else {
        final snackBar = SnackBar(
          content: Text("Pas d'etudian avec ce Qr code"),
          backgroundColor: (Colors.red),
          action: SnackBarAction(
            label: 'fermer',
            textColor: Colors.white,
            onPressed: () {},
          ),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: IconButtonSplash(
        bgColor: Colors.indigo.withOpacity(0.5),
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text(
                  "Votre Qr code",
                  style: TextStyle(color: Colors.indigo),
                ),
                content: Container(
                  height: 200,
                  alignment: Alignment.center,
                  width: 200,
                  child: QrImage(
                    foregroundColor: Colors.indigo,
                    data: user['uid'],
                  ),
                ),
                actions: <Widget>[
                  TextButton(
                    child: Text(
                      'Fermer',
                      style: TextStyle(color: Colors.indigo),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              );
            },
          );
        },
        icon: Icon(UniconsLine.qrcode_scan),
        splashColor: Colors.indigo,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.transparent,
                    radius: 30,
                    child: Image.asset(
                      "assets/images/user.png",
                      color: Colors.indigo,
                    ),
                  ),
                  Text(
                    "Bonjour ${user['name']} ${user['last_name']}",
                    style: TextStyle(color: Colors.indigo, fontSize: 20),
                  ),
                  Spacer(),
                  IconButtonSplash(
                    bgColor: Colors.indigo.withOpacity(0.5),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text(
                              "Deconnecter",
                              style: TextStyle(color: Colors.indigo),
                            ),
                            content: Container(
                                child: Text(
                              "Clickez oui pour deconnecter",
                              style: TextStyle(color: Colors.indigo),
                            )),
                            actions: <Widget>[
                              TextButton(
                                child: Text(
                                  'Oui',
                                  style: TextStyle(color: Colors.indigo),
                                ),
                                onPressed: () {
                                  AuthServices().logOut(context);
                                  Navigator.of(context).pushNamedAndRemoveUntil('/login', (Route<dynamic> route) => false);
                                },
                              ),
                            ],
                          );
                        },
                      );
                    },
                    icon: Icon(UniconsLine.signout),
                    splashColor: Colors.indigo,
                  )
                ],
              ),
            ),
            StreamBuilder(
                stream: FirebaseFirestore.instance.collection('users').doc(user['uid']).snapshots(),
                builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot<Map<String, dynamic>>> userSnapshot) {
                  if (userSnapshot.hasData) {
                    Cusers tt = Cusers.fromJson(userSnapshot.data!.data() as Map<String, dynamic>);
                    if (tt.tickets!.isNotEmpty) {
                      return Expanded(
                          child: ListView.builder(
                        itemCount: tt.tickets!.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Slidable(
                              key: const ValueKey(0),
                              startActionPane: ActionPane(
                                motion: const ScrollMotion(),
                                children: [
                                  SlidableAction(
                                    borderRadius: BorderRadius.circular(10),
                                    onPressed: null,
                                    backgroundColor: Colors.red,
                                    foregroundColor: Colors.white,
                                    icon: Icons.cancel,
                                    label: 'Annuler',
                                  ),
                                  SlidableAction(
                                    onPressed: (ctx) async {
                                      scanQR();
                                    },
                                    borderRadius: BorderRadius.circular(10),
                                    backgroundColor: Colors.indigo.withOpacity(0.5),
                                    foregroundColor: Colors.white,
                                    icon: Icons.share,
                                    label: 'Partager',
                                  ),
                                ],
                              ),
                              child: Container(
                                width: double.infinity,
                                height: Constants.screenHeight * 0.1,
                                decoration:
                                    BoxDecoration(color: Colors.indigo.withOpacity(0.5), borderRadius: BorderRadius.circular(5)),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      Icon(
                                        UniconsLine.ticket,
                                        color: Colors.white,
                                      ),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            "Code de ticket : ${tt.tickets![index]}",
                                            style: TextStyle(color: Colors.white),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ));
                    } else {
                      return Center(
                        child: Container(
                          height: Constants.screenHeight * 0.5,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Lottie.asset("assets/lotties/error.json", repeat: false, height: Constants.screenHeight * 0.1),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text("Pas des tickets pour le moment "),
                              ),
                            ],
                          ),
                        ),
                      );
                    }
                  } else {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                })
          ],
        ),
      ),
    );
  }
}
