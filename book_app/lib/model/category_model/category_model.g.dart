// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CategoryModel _$$_CategoryModelFromJson(Map<String, dynamic> json) =>
    _$_CategoryModel(
      catId: json['cat_id'] as int?,
      photoCat: json['photo_cat'] as String?,
      name: json['name'] as String?,
      status: json['status'] as int?,
    );

Map<String, dynamic> _$$_CategoryModelToJson(_$_CategoryModel instance) =>
    <String, dynamic>{
      'cat_id': instance.catId,
      'photo_cat': instance.photoCat,
      'name': instance.name,
      'status': instance.status,
    };
