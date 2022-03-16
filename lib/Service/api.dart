import 'dart:convert';

import 'package:http/http.dart' as http;

import '../Entity/departement.dart';
import '../Entity/medecin.dart';
import '../Entity/pays.dart';

class Api {
  String baseUrl = "http://172.31.1.149:8080/api";

  Future<List<Medecin>> getMedecins() async {
    var response = await http.get(Uri.parse(baseUrl + "/medecins/"));
    var jsonData = jsonDecode(response.body) as List;
    List<Medecin> medecins = [];

    for (var m in jsonData) {
      Medecin medecin = Medecin.fromJson(m);
      medecins.add(medecin);
    }
    return medecins;
  }

  Future<List<Departement>> getDepartements() async {
    var response = await http.get(Uri.parse(baseUrl + "/departements/"));
    var jsonData = jsonDecode(response.body) as List;
    List<Departement> departements = [];

    for (var m in jsonData) {
      Departement departement = Departement.fromJson(m);
      departements.add(departement);
    }
    return departements;
  }

  Future<List<Pays>> getPays() async {
    var response = await http.get(Uri.parse(baseUrl + "/pays/"));
    var jsonData = jsonDecode(response.body) as List;
    List<Pays> paysList = [];

    for (var m in jsonData) {
      Pays pays = Pays.fromJson(m);
      paysList.add(pays);
    }
    return paysList;
  }
}
