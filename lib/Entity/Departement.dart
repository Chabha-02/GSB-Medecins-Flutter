import 'package:gsb_medecins/Entity/Medecin.dart';

class Departement {
  int id;
  String nom;
  List<Medecin> medecins;

  Departement({
    required this.id,
    required this.nom,
    required this.medecins,
  });

}