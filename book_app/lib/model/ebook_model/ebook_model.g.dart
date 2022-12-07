// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ebook_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_EbookModel _$$_EbookModelFromJson(Map<String, dynamic> json) =>
    _$_EbookModel(
      id: json['id'] as int?,
      title: json['title'] as String?,
      photo: json['photo'] as String?,
      description: json['description'] as String?,
      catId: json['cat_id'] as int?,
      statusNews: json['status_news'] as int?,
      pdf: json['pdf'] as String?,
      date: json['date'] as String?,
      authorName: json['author_name'] as String?,
      publisherName: json['publisher_name'] as String?,
      pages: json['pages'] as int?,
      language: json['language'] as String?,
      rating: json['rating'] as int?,
      free: json['free'] as int?,
    );

Map<String, dynamic> _$$_EbookModelToJson(_$_EbookModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'photo': instance.photo,
      'description': instance.description,
      'cat_id': instance.catId,
      'status_news': instance.statusNews,
      'pdf': instance.pdf,
      'date': instance.date,
      'author_name': instance.authorName,
      'publisher_name': instance.publisherName,
      'pages': instance.pages,
      'language': instance.language,
      'rating': instance.rating,
      'free': instance.free,
    };
