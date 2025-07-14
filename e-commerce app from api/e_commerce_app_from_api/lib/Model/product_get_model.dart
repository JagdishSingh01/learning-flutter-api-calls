import 'dart:convert';

ProductModel productModelFromJson(String str) => ProductModel.fromJson(json.decode(str));

String productModelToJson(ProductModel data) => json.encode(data.toJson());

class ProductModel {
    List<Product> products;
    int total;
    int skip;
    int limit;

    ProductModel({
        required this.products,
        required this.total,
        required this.skip,
        required this.limit,
    });

    factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        products: List<Product>.from(json["products"].map((x) => Product.fromJson(x))),
        total: json["total"],
        skip: json["skip"],
        limit: json["limit"],
    );

    Map<String, dynamic> toJson() => {
        "products": List<dynamic>.from(products.map((x) => x.toJson())),
        "total": total,
        "skip": skip,
        "limit": limit,
    };
}

class Product {
    int id;
    String title;
    String description;
    String category;
    double price;
    double discountPercentage;
    double rating;
    int stock;
    List<String> images;
    String? brand;
    String thumbnail;
    
    Product({
        required this.id,
        required this.title,
        required this.description,
        required this.category,
        required this.price,
        required this.discountPercentage,
        required this.rating,
        required this.stock,
        required this.images,
        required this.brand,
        required this.thumbnail,
    });

    factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        category: json["category"],
        price: json["price"]?.toDouble(),
        discountPercentage: json["discountPercentage"]?.toDouble(),
        rating: json["rating"]?.toDouble(),
        stock: json["stock"],
        images: List<String>.from(json["tags"].map((x) => x)),
        brand: json["brand"],
        thumbnail: json["thumbnail"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "category": category,
        "price": price,
        "discountPercentage": discountPercentage,
        "rating": rating,
        "stock": stock,
        "brand": brand,
        "images": List<dynamic>.from(images.map((x) => x)),
        "thumbnail": thumbnail,
    };
}