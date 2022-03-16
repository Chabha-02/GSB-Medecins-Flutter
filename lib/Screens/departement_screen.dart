import 'package:flutter/material.dart';
import 'package:gsb_medecins/Service/api.dart';

import '../Entity/departement.dart';
import '../constants.dart';

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
          backgroundColor: kPrimaryColor,
          title: const Center(
            child: Text('GSB - Listes des médecins'),
          )),

      body: Card(
        child: FutureBuilder<List<Departement>>(
          future: Api().getDepartements(),
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
                      title: Text(snapshot.data![i].nom),
                    );
                  });
            }
          },
        ),
      ),
    );
  }
}
