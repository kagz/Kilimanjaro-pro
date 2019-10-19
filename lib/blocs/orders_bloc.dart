import 'package:kilimanjaro_app/models/item_model.dart';
import 'package:rxdart/rxdart.dart';
import 'package:kilimanjaro_app/resources/repository.dart';

class OrdersBloc {

  final _repository = Repository();
  final _ordersFetcher = PublishSubject<ItemModel>();

  Observable<ItemModel> get allOrders => _ordersFetcher.stream;

  fetchAllOrders() async {
    ItemModel itemModel = await _repository.fetchOrdersList();
    _ordersFetcher.sink.add(itemModel); 
  }

  dispose() {
    _ordersFetcher?.close();
  }
}
final bloc = OrdersBloc();