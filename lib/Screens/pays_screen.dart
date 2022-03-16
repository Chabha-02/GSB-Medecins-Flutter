import 'dart:convert';
import 'package:flutter/material.dart';
import '../constants.dart';
import 'package:http/http.dart' as http;

class PaysScreen1 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: PaysScreen(),

    );
  }
}

class Pays {
  int id; String nom;
  Pays(this.id, this.nom);
}

class PaysScreen extends StatefulWidget {
  const PaysScreen({Key? key}) : super(key: key);

  @override
  _PaysScreenState createState() => _PaysScreenState();
}

class _PaysScreenState extends State<PaysScreen> {
  Future<List<Pays>> getPaysData() async {
    var response = await http.get(Uri.parse('http://172.31.1.149:8080/api/pays/'));
    var jsonData = jsonDecode(response.body) as List;
    List<Pays> payss = [];

    for(var m in jsonData){
      Pays pays = Pays(m['id'], m['nom']);
      payss.add(pays);
    }
    print(payss.length);
    return payss;
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
          child: FutureBuilder<List<Pays>>(
            future: getPaysData(),
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