class OrderDetail {
  // "data": {
  //     "orders": {
  //         "id": 70,
  //         "user_id": 14,
  //         "name": "Nicholas Kimuli",
  //         "country_code": "254",
  //         "mobile": "703826457",
  //         "email": "nicholaskimuli@gmail.com",
  //         "total": 570,
  //         "error": null,
  //         "dispatch_status": 1,
  //         "dispatch_time": null,
  //         "created_at": "2019-10-10 21:45:58",
  //         "updated_at": "2019-10-17 08:35:36",
  //         "delivery_reference": "268",
  //         "delivery_address": "Strathmore University, Ole Sangale Rd, Nairobi, Kenya",
  //         "delivery_drop_off_coordinate": "-1.308869,36.812077000000045",
  //         "delivery_contact_phone_number": "0703826457",
  //         "delivery_locality": "Nairobi",
  //         "delivery_charge": 270,
  //         "delivery_country": "Kenya",
  //         "payment_details_type": "mpesa",
  //         "payment_details_reference": "MR73M6",
  //         "payment_details_processor_reference": "NJB56JESPX",
  //         "payment_details_amount": 570,
  //         "payment_details_status": "PAIDINFULL",
  //         "payment_details_phone_number": "0703826457",
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

  List<Cart> _cart;
  String _homepage;
  int _id;

  OrderDetail({
    List<Cart> cart,
    String homepage,
    int id,
  }) {
    this._cart = cart;
    this._homepage = homepage;
    this._id = id;
  }

  List<Cart> get cart => _cart;
  set cart(List<Cart> cart) => _cart = cart;
  String get homepage => _homepage;
  set homepage(String homepage) => _homepage = homepage;
  int get id => _id;
  set id(int id) => _id = id;

  OrderDetail.fromJson(Map<String, dynamic> json) {
    if (json['cart'] != null) {
      _cart = new List<Cart>();
      json['cart'].forEach((v) {
        _cart.add(new Cart.fromJson(v));
      });
    }
    _homepage = json['homepage'];
    _id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    if (this._cart != null) {
      data['cart'] = this._cart.map((v) => v.toJson()).toList();
    }
    data['homepage'] = this._homepage;
    data['id'] = this._id;
    return data;
  }
}

class Cart {
  int _id;
  String _name;

  Cart({int id, String name}) {
    this._id = id;
    this._name = name;
  }

  int get id => _id;
  set id(int id) => _id = id;
  String get name => _name;
  set name(String name) => _name = name;

  Cart.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['name'] = this._name;
    return data;
  }
}
