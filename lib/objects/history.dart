class History {
  // id, uid ( product uid ) , storeUid,image, total, quantity, type,
  final String id;
  final String uid;
  final String storeUid;
  final String image;
  final double total;
  final int quantity;
  final String type;

  History({
    required this.id, required this.uid, required this.storeUid,
    required this.image, required this.total, required this.quantity,
    required this.type
});

  Map<String, dynamic> toJson() {
    return {
      'id' : id,
      'uid': uid,
      'storeUid': storeUid,
      'image' : image,
      'total' : total.toStringAsFixed(2),
      'quantity' : quantity.toString(),
      'type' : type
    };
  }//end to json

  factory History.fromJson(Map<String, dynamic> json) {
    return History(
        id:json['id'] , uid:json['uid'] , storeUid: json['storeUid'],
        image:json['image'] , total: json['total'],
        quantity:json['quantity'] , type: json['type']
    );
  }//end from json

}//end history