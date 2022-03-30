import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gsb_medecins/Entity/medecin.dart';
import 'package:gsb_medecins/Screens/profil.dart';
import 'package:gsb_medecins/Service/api.dart';

import '../constants.dart';

class DepartMedecin extends StatefulWidget {
  const DepartMedecin({Key? key}) : super(key: key);

  static const routeName = '/departMedecin';

  @override
  _DepartMedecinState createState() => _DepartMedecinState();
}

class _DepartMedecinState extends State<DepartMedecin> {
  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as Future<List<Medecin>>;
    return Scaffold(
      // Add from here...
      appBar: AppBar(

          title: const Center(
            child: Text('GSB - Listes des médecins'),
          )),

      body: Card(
        child: FutureBuilder<List<Medecin>>(
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
                      title: Text(snapshot.data![i].nom +
                          "  " +
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
