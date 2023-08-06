class CartModel {
  int? pid;
  int userId;
  String date;
  List<CartItem> products;
  String? image;
  String? title;
  String? description;
  double? price;
  CartModel({required this.userId, required this.date, required this.products,this.image,this.title,this.description,this.price,this.pid});



  factory CartModel.fromJson(Map<String, dynamic> json) {
    return CartModel(
      pid: json['pid'],
      userId: json['userId'],
      date: json['date'],
      products: List<CartItem>.from(json['products'].map((product) => CartItem.fromJson(product))),
      image: json['image'],
      title: json['title'],
      description: json['description'],
      price: json['price'],
    );
  }


  Map<String, dynamic> toJson() {
    return {
       'pid':pid,
      'userId': userId,
      'date': date,
      'products': products.map((item) => item.toJson()).toList(),
      'image':image??"",
      'title':title??"",
      'description':description??"",
      'price':price??""
    };
  }
}

class CartItem {
  int productId;
  int quantity;

  CartItem({required this.productId, required this.quantity});


  factory CartItem.fromJson(Map<String, dynamic> json) {
    return CartItem(
      productId: json['productId'],
      quantity: json['quantity'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'productId': productId,
      'quantity': quantity,
    };
  }
}