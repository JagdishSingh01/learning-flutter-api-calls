import 'package:e_commerce_app_from_api/Model/product_get_model.dart';
import 'package:http/http.dart' as http;

getProducts() async {
  Uri url = Uri.parse("https://dummyjson.com/products");
  var res = await http.get(url);
  try {
    if (res.statusCode == 200) {
      var data = productModelFromJson(res.body);
      return data.products;
    } else {
      print('if any error occured');
    }
  } catch (e) {
    print(e.toString());
  }
}
