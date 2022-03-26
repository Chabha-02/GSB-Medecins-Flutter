import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;
import '../Entity/departement.dart';
import '../Entity/medecin.dart';
import '../Entity/pays.dart';

class Api {
  String baseUrl = "http://192.168.1.11:8080/api";

  Future<List<Medecin>> getMedecins() async {
    var response = await http.get(Uri.parse(baseUrl + "/medecins/"));
    var jsonData = jsonDecode(utf8.decode(response.bodyBytes)) as List;
    List<Medecin> medecins = [];

    for (var m in jsonData) {
      Medecin medecin = Medecin.fromJson(m);
      medecins.add(medecin);
    }
    print(medecins.length);
    return medecins;
  }

  Future<List<Departement>> getDepartements() async {
    var response = await http.get(Uri.parse(baseUrl + "/departements/"));
    var jsonData = jsonDecode(utf8.decode(response.bodyBytes)) as List;
    List<Departement> departements = [];

    for (var m in jsonData) {
      Departement departement = Departement.fromJson(m);
      departements.add(departement);
    }
    return departements;
  }

  Future<List<Pays>> getPays() async {
    var response = await http.get(Uri.parse(baseUrl + "/pays/"));
    var jsonData = jsonDecode(utf8.decode(response.bodyBytes)) as List;
    List<Pays> paysList = [];

    for (var m in jsonData) {
      Pays pays = Pays.fromJson(m);
      paysList.add(pays);
    }
    print(paysList.length);
    return paysList;
  }

  Future<List<Medecin>> getMedecinsByNom(String nom) async {
    var response = await http.get(Uri.parse(baseUrl + "/medecins?nom"));
    var jsonData = jsonDecode(response.body) as List;
    List<Medecin> medecins = [];

    for (var m in jsonData) {
      Medecin medecin = Medecin.fromJson(m);
      medecins.add(medecin);
    }
    return medecins;
  }

  Future<Pays> getPaysById(int id) async {
    var response =
        await http.get(Uri.parse(baseUrl + "/pays/" + id.toString()));
    var jsonData = jsonDecode(utf8.decode(response.bodyBytes));
    return Pays.fromJson(jsonData);
  }

  Future<List<Departement>> getDepartementsByPays(Pays pays) async {
    var response =
        await http.get(Uri.parse(baseUrl + "/pays/" + pays.id.toString()));
    var jsonData = jsonDecode(utf8.decode(response.bodyBytes));
    return Pays.fromJson(jsonData).departements!;
  }

  Future<List<Medecin>> getMedecinsByDepartement(
      Departement departement) async {
    var response = await http
        .get(Uri.parse(baseUrl + "/departements/" + departement.id.toString()));
    var jsonData = jsonDecode(utf8.decode(response.bodyBytes));
    return Departement.fromJson(jsonData).medecins!;
  }

  Future<Medecin> getMedecinByID(int id) async {
    var response =
    await http.get(Uri.parse(baseUrl + 'medecins/'+id.toString()));
    var jsonData = jsonDecode(utf8.decode(response.bodyBytes));
    return Medecin.fromJson(jsonData);
  }
}
