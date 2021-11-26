class Character {
  int id;
  String category_name;
  String category_logo;
  
  String slug;

  Character.fromJson(Map json)
      : id = json['id'],
        category_name = json['category_name'],
        category_logo = json['category_logo'],
        slug = json['slug'];

  Map toJson() {
    return {'id': id, 'category_name': category_name, 'category_logo': category_logo, 'slug': slug};
  }
}
