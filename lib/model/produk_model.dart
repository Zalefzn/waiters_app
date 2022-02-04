import 'package:flutter/material.dart';

class ProdukModel {
  final int id_department;
  final int id_outlet;
  final int id_product;
  final int id_product_category;
  final String image;
  final String image_url;
  final String ppn;
  final String product_cogs;
  final String product_name;
  final String product_price;
  final String service;
  final int status;

  ProdukModel({
    required this.id_department,
    required this.id_outlet,
    required this.id_product,
    required this.id_product_category,
    required this.image,
    required this.image_url,
    required this.ppn,
    required this.product_cogs,
    required this.product_name,
    required this.product_price,
    required this.service,
    required this.status,
  });

  factory ProdukModel.fromJson(Map<String, dynamic> json) {
    return ProdukModel(
        id_department: json['id_department'] as int,
        id_outlet: json['id_outlet'] as int,
        id_product: json['id_product'] as int,
        id_product_category: json['id_product_category'] as int,
        image: json['image'] as String,
        image_url: json['image_url'] as String,
        ppn: json['ppn'] as String,
        product_cogs: json['product_cogs'] as String,
        product_name: json['product_name'] as String,
        product_price: json['product_price'] as String,
        service: json['service'] as String,
        status: json['status'] as int);
  }
}
