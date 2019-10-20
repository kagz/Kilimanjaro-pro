import 'dart:async';

import 'package:kilimanjaro_app/models/order_detail.dart';
import 'package:rxdart/rxdart.dart';
import 'package:kilimanjaro_app/resources/repository.dart';

class OrderDetailBloc {
  final _repository = Repository();
  final _id = PublishSubject<int>();

  final _orderDetail = BehaviorSubject<Future<OrderDetail>>();

  Function(int) get fetchOrderDetailById => _id.sink.add;
  Observable<Future<OrderDetail>> get orderDetail => _orderDetail.stream;

  OrderDetailBloc() {
    _id.stream.transform(_orderDetailTransformer()).pipe(_orderDetail);
  }

  dispose() async {
    _id?.close();

    _orderDetail?.close();
  }

  _orderDetailTransformer() {
    return ScanStreamTransformer(
      (Future<OrderDetail> orderDetail, int id, int index) {
        print("ORDER ID : $id");
        orderDetail = _repository.fetchOrderDetail(id);
        return orderDetail;
      },
    );
  }
}
