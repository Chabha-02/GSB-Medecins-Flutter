import 'package:flutter/material.dart';
import 'package:gsb_medecins/Service/api.dart';

import '../Entity/medecin.dart';
import '../constants.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
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
