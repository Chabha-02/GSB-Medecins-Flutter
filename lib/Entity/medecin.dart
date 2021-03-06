import 'package:gsb_medecins/Entity/departement.dart';
import 'package:gsb_medecins/Entity/spe.dart';
import 'package:json_annotation/json_annotation.dart';

part 'medecin.g.dart';

@JsonSerializable()
class Medecin {
  int id;
  String nom, prenom, adresse, tel;
  Spe? spe;
  Departement? departement;


  Medecin(
      {required this.id,
      required this.nom,
      required this.prenom,
      required this.adresse,
      required this.tel,
        this.spe,
      this.departement
        });

  factory Medecin.fromJson(Map<String, dynamic> json) =>
      _$MedecinFromJson(json);

  Map<String, dynamic> toJson() => _$MedecinToJson(this);
}
