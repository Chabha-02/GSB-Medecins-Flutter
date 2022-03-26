// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'spe.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Spe _$SpeFromJson(Map<String, dynamic> json) => Spe(
      id: json['id'] as int,
      libelle: json['libelle'] as String,
      medecins: (json['medecins'] as List<dynamic>?)
          ?.map((e) => Medecin.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SpeToJson(Spe instance) => <String, dynamic>{
      'id': instance.id,
      'libelle': instance.libelle,
      'medecins': instance.medecins,
    };
