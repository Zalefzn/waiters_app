import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_mobile/model/produk.dart';

class Services {
  static const String url =
      "https://backend-staging.qoligo.com/api/product?_deep=0";

  static Future<List<Produk>> getProduk() async {
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        List<Produk> list = parseProduk(response.body);
        return list;
      } else {
        throw Exception("Error");
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  static List<Produk> parseProduk(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();

    return parsed.map<Produk>((json) => Produk.fromJson(json)).toList();
  }
}
