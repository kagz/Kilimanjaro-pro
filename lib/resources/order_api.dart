import 'dart:async';

import 'package:http/http.dart' as http;
import 'package:kilimanjaro_app/models/item_model.dart';
import 'package:kilimanjaro_app/models/order_detail.dart';
import 'dart:convert';

class OrderApiProvider {
  http.Client client = http.Client();
  final _baseUrl = "https://demo.kilimanjarofood.co.ke/api/v1/dispatch";

  Future<ItemModel> fetchOrderList() async {
    final response = await client.get("$_baseUrl/orders");
    if (response.statusCode == 200) {
      return ItemModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load orders list');
    }
  }

  Future<OrderDetail> fetchOrderDetail(int orderId) async {
    final response = await client.get(
        "https://demo.kilimanjarofood.co.ke/api/v1/dispatch/order?orderId=$orderId");
    print("$_baseUrl/order?orderId=$orderId");
    if (response.statusCode == 200) {
      print(response.body);
      return OrderDetail.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to retrieve Order Detail');
    }
  }
}
