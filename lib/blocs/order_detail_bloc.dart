import 'dart:async';

import 'package:kilimanjaro_app/models/item_model.dart';
import 'package:kilimanjaro_app/models/order_detail.dart';
import 'package:rxdart/rxdart.dart';
import 'package:kilimanjaro_app/resources/repository.dart';

class OrderDetailBloc {
  final _repository = Repository();
  final _orderId = PublishSubject<int>();
  final _similarOrders = BehaviorSubject<Future<ItemModel>>();
  final _orderDetail = BehaviorSubject<Future<OrderDetail>>();

  Function(int) get fetchSimilarOrdersById => _orderId.sink.add;
  Observable<Future<ItemModel>> get similarOrders => _similarOrders.stream;

  Function(int) get fetchOrderDetailById => _orderId.sink.add;
  Observable<Future<OrderDetail>> get orderDetail => _orderDetail.stream;

  OrderDetailBloc() {
    _orderId.stream.transform(_orderDetailTransformer()).pipe(_orderDetail);
  }

  dispose() async {
    _orderId?.close();
    _similarOrders?.close();
    _orderDetail?.close();
  }

  _orderDetailTransformer() {
    return ScanStreamTransformer(
      (Future<OrderDetail> orderDetail, int id, int index) {
        print("MOVIE ID kwa detail : $id");
        orderDetail = _repository.fetchOrderDetail(id);
        print("NAFIKA HAPA PIA : $id");
        print(orderDetail);
        return orderDetail;
      },
    );
  }
}
