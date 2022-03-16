import 'package:flutter/material.dart';
import 'package:gsb_medecins/Service/api.dart';

import '../Entity/pays.dart';
import '../constants.dart';

class PaysScreen extends StatefulWidget {
  const PaysScreen({Key? key}) : super(key: key);

  @override
  _PaysScreenState createState() => _PaysScreenState();
}

class _PaysScreenState extends State<PaysScreen> {
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
        child: FutureBuilder<List<Pays>>(
          future: Api().getPays(),
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
