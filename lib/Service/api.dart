import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;
import '../Entity/departement.dart';
import '../Entity/medecin.dart';
import '../Entity/pays.dart';
import '../Entity/spe.dart';

class Api {
  String baseUrl = "http://172.31.1.92:8080/api";

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
    var jsonData = jsonDecode(utf8.decode(response.bodyBytes)) as List;
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
    await http.get(Uri.parse(baseUrl + '/medecins/'+id.toString()));
    var jsonData = jsonDecode(utf8.decode(response.bodyBytes));
    return Medecin.fromJson(jsonData);
  }

  Future<List<Medecin>> getRecherche(String nom) async {
    var response = await http.get(Uri.parse(baseUrl + "/medecins"));
    var jsonData = jsonDecode(utf8.decode(response.bodyBytes)) as List;
    List<Medecin> medecins = [];

    for (var m in jsonData) {
      Medecin medecin = Medecin.fromJson(m);

      if (medecin.nom.contains(nom)) {
        medecins.add(medecin);
      }
    }
    return medecins;
  }

  Future<List<Medecin>> getMedecinsBySpe(
      Spe spe) async {
    var response = await http
        .get(Uri.parse(baseUrl + "/spe/" + spe.id.toString()));
    var jsonData = jsonDecode(utf8.decode(response.bodyBytes));
    return Spe.fromJson(jsonData).medecins!;
  }

  Future<List<Spe>> getSpe() async {
    var response = await http.get(Uri.parse(baseUrl + "/spe/"));
    var jsonData = jsonDecode(utf8.decode(response.bodyBytes)) as List;
    List<Spe> spes = [];

    for (var m in jsonData) {
      Spe spe = Spe.fromJson(m);
      spes.add(spe);
    }
    return spes;
  }





}
