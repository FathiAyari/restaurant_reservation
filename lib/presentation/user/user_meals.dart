import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:resservation/models/meal.dart';
import 'package:resservation/ressources/dimensions/constants.dart';
import 'package:unicons/unicons.dart';

class UserMeals extends StatefulWidget {
  const UserMeals({Key? key}) : super(key: key);

  @override
  State<UserMeals> createState() => _UserMealsState();
}

class _UserMealsState extends State<UserMeals> {
  var user = GetStorage().read("user");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder(
            stream: FirebaseFirestore.instance.collection('repas').snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<Meal> ml = [];
                for (var data in snapshot.data!.docs.toList()) {
                  if (DateFormat("yyyy/MM/dd").format(data.get("start").toDate()) ==
                      DateFormat("yyyy/MM/dd").format(DateTime.now())) {
                    if (DateTime.parse(data.get("start").toDate().toString()).isBefore(DateTime.now()) &&
                        DateTime.parse(data.get("end").toDate().toString()).isAfter(DateTime.now())) {
                      ml.add(Meal.fromJson(data.data() as Map<String, dynamic>));
                    }
                  }
                }
                if (ml.isNotEmpty) {
                  return ListView.builder(
                    itemCount: ml.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: !ml[index].students.contains(user['uid'])
                            ? Slidable(
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
                                        var tk = await FirebaseFirestore.instance.collection("users").doc(user['uid']).get();
                                        List oldTk = tk.get('tickets');
                                        if (oldTk.isNotEmpty) {
                                          List old = ml[index].students;
                                          old.add(user['uid']);
                                          FirebaseFirestore.instance
                                              .collection('repas')
                                              .doc(snapshot.data!.docs[index].id)
                                              .update({"students": old});

                                          oldTk.removeLast();
                                          FirebaseFirestore.instance
                                              .collection('users')
                                              .doc(user['uid'])
                                              .update({"tickets": oldTk});
                                          FirebaseFirestore.instance
                                              .collection("users")
                                              .doc(user['uid'])
                                              .collection("historics")
                                              .add({"dateTime": DateTime.now(), "subject": "Vous aves reservé dans un plat"});
                                          final snackBar = SnackBar(
                                            content: Text("Vous aves reservé"),
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
                                            content: Text("votre solde de tickets est 0"),
                                            backgroundColor: (Colors.red),
                                            action: SnackBarAction(
                                              label: 'fermer',
                                              textColor: Colors.white,
                                              onPressed: () {},
                                            ),
                                          );
                                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                                        }
                                      },
                                      borderRadius: BorderRadius.circular(10),
                                      backgroundColor: Colors.green.withOpacity(0.5),
                                      foregroundColor: Colors.white,
                                      icon: Icons.done_all,
                                      label: 'Reserver',
                                    ),
                                  ],
                                ),
                                child: Container(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: [
                                        Icon(
                                          UniconsLine.utensils_alt,
                                          color: Colors.white,
                                        ),
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              "Date de debut: ${DateFormat("yyyy/MM/dd HH:mm").format(ml[index].start)}",
                                              style: TextStyle(color: Colors.white),
                                            ),
                                            Text(
                                              "Date de fin : ${DateFormat("yyyy/MM/dd HH:mm").format(ml[index].end)}",
                                              style: TextStyle(color: Colors.white),
                                            ),
                                            Text(
                                              "Entree : ${ml[index].entree}",
                                              style: TextStyle(color: Colors.white),
                                            ),
                                            Text(
                                              "Plat principal : ${ml[index].principal} ",
                                              style: TextStyle(color: Colors.white),
                                            ),
                                            Text(
                                              "Dessert : ${ml[index].dessert}",
                                              style: TextStyle(color: Colors.white),
                                            ),
                                            Text(
                                              "Statut : ${ml[index].students.contains(user['uid']) ? "Vous avez reservé" : "Pas de reservation"}",
                                              style: TextStyle(color: Colors.white),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      color: Colors.indigo.withOpacity(0.5), borderRadius: BorderRadius.circular(5)),
                                ),
                              )
                            : Container(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      Icon(
                                        UniconsLine.utensils_alt,
                                        color: Colors.white,
                                      ),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            "Date de debut: ${DateFormat("yyyy/MM/dd HH:mm").format(ml[index].start)}",
                                            style: TextStyle(color: Colors.white),
                                          ),
                                          Text(
                                            "Date de fin : ${DateFormat("yyyy/MM/dd HH:mm").format(ml[index].end)}",
                                            style: TextStyle(color: Colors.white),
                                          ),
                                          Text(
                                            "Entree : ${ml[index].entree}",
                                            style: TextStyle(color: Colors.white),
                                          ),
                                          Text(
                                            "Plat principal : ${ml[index].principal} ",
                                            style: TextStyle(color: Colors.white),
                                          ),
                                          Text(
                                            "Dessert : ${ml[index].dessert}",
                                            style: TextStyle(color: Colors.white),
                                          ),
                                          Text(
                                            "Statut : ${ml[index].students.contains(user['uid']) ? "Vous avez rservé" : "Pas de reservation"}",
                                            style: TextStyle(color: Colors.white),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                width: double.infinity,
                                decoration:
                                    BoxDecoration(color: Colors.indigo.withOpacity(0.5), borderRadius: BorderRadius.circular(5)),
                              ),
                      );
                    },
                  );
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
                            child: Text("Pas des repas pour le moment "),
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
            }));
  }
}
