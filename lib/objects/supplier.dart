class Supplier {
  final String id;
  final String name;
  final String image;
  final String description;
  final String website;

  Supplier({
    required this.id, required this.name,
    required this.image,required this.description,
    required this.website
});

  Map<String, dynamic> toJson() {
    return {
      'id' : id,
      'name' : name,
      'image' : image,
      'description': description,
      'website' : website
    };
  }//end toJson

  factory Supplier.fromJson(Map<String,dynamic> json){
    return Supplier(
        id: json['id'], name: json['name'], image: json['image'], description: json['description'],
        website: json['website']);
  }//end from json
}//end class