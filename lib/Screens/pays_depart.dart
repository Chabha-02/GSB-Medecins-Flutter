import 'package:flutter/material.dart';

import '../Entity/departement.dart';
import '../Service/api.dart';
import '../constants.dart';
import 'depart_medecin.dart';

class PaysDepart extends StatefulWidget {
  const PaysDepart({Key? key}) : super(key: key);

  static const routeName = '/paysDepart';

  @override
  _PaysDepartState createState() => _PaysDepartState();
}

class _PaysDepartState extends State<PaysDepart> {
  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as Future<List<Departement>>;
    return Scaffold(
      // Add from here...
      appBar: AppBar(
          backgroundColor: kPrimaryColor,
          title: const Center(
            child: Text('GSB - Listes des médecins'),
          )),

      body: Card(
        child: FutureBuilder<List<Departement>>(
          future: args,
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: Text('Chargement...'),
              );
            } else {
              return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, i) {
                    return ListTile(
                        title: Text(snapshot.data![i].num +
                            " - " +
                            snapshot.data![i].nom),
                        onTap: () {
                          Navigator.pushNamed(context, DepartMedecin.routeName,
                              arguments: Api()
                                  .getMedecinsByDepartement(snapshot.data![i]));
                        });
                  });
            }
          },
        ),
      ),
    );
  }
}
