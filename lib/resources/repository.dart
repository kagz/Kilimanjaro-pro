import 'package:kilimanjaro_app/models/item_model.dart';
import 'package:kilimanjaro_app/models/order_detail.dart';
import 'order_api.dart';
import 'dart:async';

class Repository {
  final OrderApiProvider _orderApiProvider = OrderApiProvider();

  Future<ItemModel> fetchOrdersList() => _orderApiProvider.fetchOrderList();

  Future<OrderDetail> fetchOrderDetail(int orderId) =>
      _orderApiProvider.fetchOrderDetail(orderId);
}
