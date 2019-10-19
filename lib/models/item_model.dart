class ItemModel {
  List<_Result> _orders = [];

  ItemModel.fromJson(Map<String, dynamic> parsedJson) {
    print(parsedJson['data']['orders'].length);
    List<_Result> temp = [];
    for (int i = 0; i < parsedJson['data']['orders'].length; i++) {
      _Result result = _Result(parsedJson['data']['orders'][i]);
      temp.add(result);
    }
    _orders = temp;
  }

  List<_Result> get orders => _orders;
}

class _Result {
  //         "cart": [
  //             {
  //                 "product_id": 34,
  //                 "quantity": 1,
  //                 "price": null,
  //                 "accompaniment_id": null,
  //                 "product_name": "Berr",
  //                 "description": "Fried Liver",
  //                 "products_attribute_accompaniment": null,
  //                 "product_attrubute_size": null,
  //                 "product_attrubute_price": null
  //             }
  //         ]
  //     }
  // }

  int _id; //kilima
  int _dispatch_status; //NOT int..........
  var _quantity; //kil
  String _name; //kilma
  int _total; //NOT double.................
  String _mobile;
  String _payment_details_type; //kilima
  String _original_name; //kilman
  List _cart = []; //kilman

  String _description; //kiliman
  String _created_at; //kilimanl

  _Result(result) {
    _id = result['id'];
    _dispatch_status = result['dispatch_status'];
    _quantity = result['quantity'];
    _name = result['name'];
    _total = result['total']; //not a double
    _mobile = result['mobile'];
    _payment_details_type = result['payment_details_type'];

    // for (int i = 0; i < result['cart'].length; i++) {
    //   _cart.add(result['cart'][i]);
    // }

    _description = result['description'];
    _created_at = result['created_at'];
  }

  String get created_at => _created_at;

  String get description => _description;

  List get cart => _cart;
  String get mobile => _mobile;
  String get payment_details_type => _payment_details_type;

  int get total => _total;

  String get name => _name;

  double get quantity => _quantity;
  int get dispatch_status => _dispatch_status; //not a int

  int get id => _id;
}
