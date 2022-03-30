import 'package:flutter/material.dart';
import 'package:gsb_medecins/Screens/profil.dart';

import '../Entity/medecin.dart';
import '../Service/api.dart';
import '../constants.dart';

class MedecinsScreen extends StatefulWidget {
  const MedecinsScreen({Key? key}) : super(key: key);

  @override
  _MedecinScreenState createState() => _MedecinScreenState();
}

class _MedecinScreenState extends State<MedecinsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Add from here...
      appBar: AppBar(
          title: const Center(
        child: Text('GSB - Listes des médecins'),
      )),

      body: Card(
        child: FutureBuilder<List<Medecin>>(
          future: Api().getMedecins(),
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
                      title: Text(snapshot.data![i].nom +
                          " " +
                          snapshot.data![i].prenom),
                      onTap: (){
                        Navigator.pushNamed(context,MedecinProfil.routeName, arguments: Api().getMedecinByID(snapshot.data![i].id));
                      },
                    );
                  });
            }
          },
        ),
      ),
    );
  }
}
//searchDelegate
