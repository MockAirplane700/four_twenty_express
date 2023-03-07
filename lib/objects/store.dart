class Store {
  // id , name, description, images, products( uid ), website, address[ list - for franchises], phone, email
  final String id;
  final String name;
  final String description;
  final List<dynamic> images;
  final List<dynamic> products;
  final List<dynamic> address;
  final String website;
  final String phone;
  final String email;
  final String rating;

  Store({
    required this.id, required this.name, required this.description,
    required this.images, required this.products, required this.address,
    required this.website, required this.phone, required this.email, required this.rating
});

  Map<String, dynamic> toJson() {
    return {
      'id' : id,
      'name' : name,
      'description' : description,
      'images' : images.toString(),
      'products' : products.toString(),
      'address' :address.toString(),
      'website': website,
      'phone' : phone,
      'email' : email,
      'rating' : rating
    };
  }//end to json

  factory Store.fromJson(Map<String,dynamic> json) {
    return Store(
        id: json['id'], name: json['name'], description:json['description'] ,
        images: json['images'], products:json['products'] ,
        address: json['address'], website:json['website'] ,
        phone: json['phone'], email: json['email'], rating: json['rating']
    );
  }//end from json

}//end class