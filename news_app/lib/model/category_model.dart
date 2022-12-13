class CategoryModel {
  int? id;
  String? image;
  String? name;
  String? slug;
  String? createdAt;
  String? updatedAt;

  CategoryModel(
      {this.id,
      this.image,
      this.name,
      this.slug,
      this.createdAt,
      this.updatedAt});

  CategoryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
    name = json['name'];
    slug = json['slug'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['image'] = image;
    data['name'] = name;
    data['slug'] = slug;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
