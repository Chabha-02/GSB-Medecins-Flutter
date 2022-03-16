import 'Departement.dart';

class Pays {
  int id;
  String nom;
  List<Departement> departements;

  Pays({
    required this.id,
    required this.nom,
    required this.departements,
  });
}