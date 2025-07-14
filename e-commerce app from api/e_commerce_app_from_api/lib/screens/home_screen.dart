import 'package:e_commerce_app_from_api/Model/product_get_model.dart';
import 'package:e_commerce_app_from_api/screens/product_details.dart';
import 'package:e_commerce_app_from_api/services/product_get_services.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Product> productModel = [];
  bool isLoaded = false;
  getmyProducts() {
    isLoaded = true;
    getProducts().then((value) {
      setState(() {
        productModel = value;
        isLoaded = false;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    getmyProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text("E-Commerce App"))),
      body:
          isLoaded
              ? Center(child: const CircularProgressIndicator())
              : ListView.builder(
                shrinkWrap: true,
                itemCount: productModel.length,
                itemBuilder: (context, index) {
                  final apiProduct = productModel[index];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProductDetails(
                              product: apiProduct,
                            ),
                          ),
                        );
                      },
                      child: Material(
                        elevation: 1,
                        borderRadius: BorderRadius.circular(20),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Hero(
                                tag: apiProduct.thumbnail,
                                child: CircleAvatar(
                                  radius: 40,
                                  backgroundColor: Colors.transparent,
                                  backgroundImage: NetworkImage(
                                    apiProduct.thumbnail,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 5),
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 1.5,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    apiProduct.title.toString(),
                                    maxLines: 1,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        "\$${apiProduct.price.toString()}",
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(width: 5),
                                      Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                        size: 20,
                                      ),
                                      Text(apiProduct.rating.toString()),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
    );
  }
}
