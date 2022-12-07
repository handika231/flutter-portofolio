import 'package:freezed_annotation/freezed_annotation.dart';

part 'ebook_model.freezed.dart';
part 'ebook_model.g.dart';

@freezed
class EbookModel with _$EbookModel {
	factory EbookModel({
		int? id,
		String? title,
		String? photo,
		String? description,
		@JsonKey(name: 'cat_id') int? catId,
		@JsonKey(name: 'status_news') int? statusNews,
		String? pdf,
		String? date,
		@JsonKey(name: 'author_name') String? authorName,
		@JsonKey(name: 'publisher_name') String? publisherName,
		int? pages,
		String? language,
		int? rating,
		int? free,
	}) = _EbookModel;

	factory EbookModel.fromJson(Map<String, dynamic> json) => _$EbookModelFromJson(json);
}