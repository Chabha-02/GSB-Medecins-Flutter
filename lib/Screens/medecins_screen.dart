import 'dart:convert';
import 'package:flutter/material.dart';
import '../constants.dart';
import 'package:http/http.dart' as http;

class MedecinsScreen1 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MedecinsScreen(),

    );
  }
}

class Medecin {
  int id; String nom; String prenom; String adresse; String tel;
  Medecin(this.id, this.nom, this.prenom, this.adresse, this.tel);
}

class MedecinsScreen extends StatefulWidget {
  const MedecinsScreen({Key? key}) : super(key: key);

  @override
  _MedecinScreenState createState() => _MedecinScreenState();
}

class _MedecinScreenState extends State<MedecinsScreen> {
  Future<List<Medecin>> getMedecinData() async {
    var response = await http.get(Uri.parse('http://172.31.1.149:8080/api/medecins/'));
    var jsonData = jsonDecode(response.body) as List;
    List<Medecin> medecins = [];

    for(var m in jsonData){
      Medecin medecin = Medecin(m['id'], m['nom'], m['prenom'], m['adresse'], m['tel']);
      medecins.add(medecin);
    }
    print(medecins.length);
    return medecins;
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
          child: FutureBuilder<List<Medecin>>(
            future: getMedecinData(),
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
                        title: Text(snapshot.data![i].nom + " " + snapshot.data![i].prenom),
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