import 'package:http/http.dart' as http;
import 'package:statemanagment_getx/models/product.dart';

class RemoteServices {
  static var client = http.Client();

  static Future<List<Product>> fetchProducts() async {
    var response = await client.get(Uri.parse(
        'https://makeup-api.herokuapp.com/api/v1/products.json?brand=maybelline'));
    if (response.statusCode == 200) {
      var jsonResponse = response.body;
      return productFromJson(jsonResponse);
    } else {
      return null;
     }
  }
}