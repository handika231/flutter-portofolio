class CategoryBySlugModel {
  int? id;
  String? image;
  String? name;
  String? slug;
  String? createdAt;
  String? updatedAt;
  List<Posts>? posts;

  CategoryBySlugModel(
      {this.id,
      this.image,
      this.name,
      this.slug,
      this.createdAt,
      this.updatedAt,
      this.posts});

  CategoryBySlugModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
    name = json['name'];
    slug = json['slug'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['posts'] != null) {
      posts = <Posts>[];
      json['posts'].forEach((v) {
        posts!.add(Posts.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['image'] = image;
    data['name'] = name;
    data['slug'] = slug;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (posts != null) {
      data['posts'] = posts!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Posts {
  int? id;
  String? title;
  String? slug;
  String? categoryId;
  String? userId;
  String? content;
  String? image;
  String? description;
  String? createdAt;
  String? updatedAt;
  Category? category;
  List<Comments>? comments;

  Posts(
      {this.id,
      this.title,
      this.slug,
      this.categoryId,
      this.userId,
      this.content,
      this.image,
      this.description,
      this.createdAt,
      this.updatedAt,
      this.category,
      this.comments});

  Posts.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    slug = json['slug'];
    categoryId = json['category_id'];
    userId = json['user_id'];
    content = json['content'];
    image = json['image'];
    description = json['description'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    category =
        json['category'] != null ? Category.fromJson(json['category']) : null;
    if (json['comments'] != null) {
      comments = <Comments>[];
      json['comments'].forEach((v) {
        comments!.add(Comments.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['slug'] = slug;
    data['category_id'] = categoryId;
    data['user_id'] = userId;
    data['content'] = content;
    data['image'] = image;
    data['description'] = description;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (category != null) {
      data['category'] = category!.toJson();
    }
    if (comments != null) {
      data['comments'] = comments!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Category {
  int? id;
  String? image;
  String? name;
  String? slug;
  String? createdAt;
  String? updatedAt;

  Category(
      {this.id,
      this.image,
      this.name,
      this.slug,
      this.createdAt,
      this.updatedAt});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
    name = json['name'];
    slug = json['slug'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['image'] = image;
    data['name'] = name;
    data['slug'] = slug;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class Comments {
  int? id;
  String? postId;
  String? name;
  String? email;
  String? comment;
  String? createdAt;
  String? updatedAt;

  Comments(
      {this.id,
      this.postId,
      this.name,
      this.email,
      this.comment,
      this.createdAt,
      this.updatedAt});

  Comments.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    postId = json['post_id'];
    name = json['name'];
    email = json['email'];
    comment = json['comment'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['post_id'] = postId;
    data['name'] = name;
    data['email'] = email;
    data['comment'] = comment;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
