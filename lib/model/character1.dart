class character1{

  var id;
  var category_id;
  
  var subcategory_name;
  var subcategory_logo ;
  
  var slug;
  var order;
  var created_at;
  var updated_at;
 // void main(){

  character1.fromJson(Map json)
      : id = json['id'],
        category_id=json['category_id'],
        subcategory_name = json['subcategory_name'],
        subcategory_logo = json['subcategory_logo'],
        slug = json['slug'];

  Map toJson() {
    return {'id': id,'category_id':category_id, 'subcategory_name': subcategory_name, 'subcategory_logo': subcategory_logo, 'slug': slug};
  }
}