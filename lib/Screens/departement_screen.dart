import 'package:flutter/material.dart';
import 'package:gsb_medecins/Service/api.dart';

import '../Entity/departement.dart';
import '../Entity/spe.dart';
import '../constants.dart';
import 'depart_medecin.dart';

class DepartementScreen extends StatefulWidget {
  const DepartementScreen({Key? key}) : super(key: key);

  @override
  _DepartementScreenState createState() => _DepartementScreenState();
}

class _DepartementScreenState extends State<DepartementScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Add from here...
      appBar: AppBar(

          title: const Center(
            child: Text('GSB - Spécialités complémentaires'),
          )),

      body: Card(
        child: FutureBuilder<List<Spe>>(
          future: Api().getSpe(),
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
                      title: Text(snapshot.data![i].libelle),
                      onTap: () {
                    Navigator.pushNamed(context, DepartMedecin.routeName, arguments: Api().getMedecinsBySpe(snapshot.data![i]));
                    }
                    );
                  });
            }
          },
        ),
      ),
    );
  }
}
