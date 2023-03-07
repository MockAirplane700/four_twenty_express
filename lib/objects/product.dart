class Product {
  // id , type, description, images,
  // quantity,
  final String id;
  final String name;
  final String type;
  final String description;
  final List<dynamic> images;
  final double price;
  int quantity;

  // THESE ARE NULLABLE AS THEY ARE DEPENDENT ON TYPE
  String strain;
  String thc;
  String cbd;
  String supplier;
  List sizes;
  List effects;
  String strainType;


  Product({
    required this.id, required this.name,required this.type, required this.description,
    required this.images, required this.price,this.quantity = 1, this.strain='null',
    this.thc='null', this.cbd='null', this.supplier='null', this.sizes=const ['1','3.5','7','14'],
    this.effects = const [''], this.strainType='null',
});

  Map<String, dynamic> toJson() {
    return {
      'id' : id,
      'name':name,
      'type' : type,
      'description' : description,
      'images' : images.toString(),
      'price' : price.toStringAsFixed(2),
      'quantity' : quantity.toString(),
      // NULLABLE
      'strain':strain,
      'thc':thc,
      'cbd':cbd,
      'supplier':supplier,
      'sizes':sizes,
      'strainType':strainType
    };
  }//end to json

  factory Product.fromJson(Map<String,dynamic> json) {
    return Product(
        id: json['id'], name: json['name'],type: json['type'], description: json['description'],
        images:json['images'] , price:json['price'], strain: json['strain'], thc: json['thc'],
      cbd: json['cbd'], supplier: json['supplier'], sizes: json['sizes'].split(','), strainType: json['strainType']
    );
  }//end from json
}//end product class