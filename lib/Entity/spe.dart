import 'package:json_annotation/json_annotation.dart';
import 'medecin.dart';
part 'spe.g.dart';

@JsonSerializable()
class Spe {
  int id;
  String libelle;
  List<Medecin>? medecins;

  Spe({required this.id, required this.libelle, this.medecins});

  factory Spe.fromJson(Map<String, dynamic> json) => _$SpeFromJson(json);

  Map<String, dynamic> toJson() => _$SpeToJson(this);
}
