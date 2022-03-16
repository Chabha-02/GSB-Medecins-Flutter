import 'package:gsb_medecins/Entity/medecin.dart';
import 'package:gsb_medecins/Entity/pays.dart';
import 'package:json_annotation/json_annotation.dart';

part 'departement.g.dart';

@JsonSerializable()
class Departement {
  int id;
  String nom;
  List<Medecin>? medecins;
  Pays? pays;

  Departement({
    required this.id,
    required this.nom,
    this.medecins,
    this.pays,
  });

  factory Departement.fromJson(Map<String, dynamic> json) =>
      _$DepartementFromJson(json);

  Map<String, dynamic> toJson() => _$DepartementToJson(this);
}
