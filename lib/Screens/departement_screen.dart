import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../constants.dart';

class DepartementScreen1 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: DepartementScreen(),

    );
  }
}

class Departement {
  int id; String nom;
  Departement(this.id, this.nom);
}

class DepartementScreen extends StatefulWidget {
  const DepartementScreen({Key? key}) : super(key: key);

  @override
  _DepartementScreenState createState() => _DepartementScreenState();
}

class _DepartementScreenState extends State<DepartementScreen> {
  Future<List<Departement>> getDepartementData() async {
    var response = await http.get(Uri.parse('http://172.31.1.149:8080/api/departements/'));
    var jsonData = jsonDecode(response.body) as List;
    List<Departement> departements = [];

    for(var m in jsonData){
      Departement departement = Departement(m['id'], m['nom']);
      departements.add(departement);
    }
    print(departements.length);
    return departements;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold (
      // Add from here...
      appBar: AppBar(
          backgroundColor: kPrimaryColor,
          title: const Center(
            child: Text('GSB - Listes des médecins'),
          )
      ),

      body: Container(
        child: Card(
          child: FutureBuilder<List<Departement>>(
            future: getDepartementData(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return Container(
                  child: const Center(
                    child: Text('Chargement...'),
                  ),
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
      ),
    );

  }
}