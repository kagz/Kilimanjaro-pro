import 'dart:convert';

OrderDetail orderDetailFromJson(String str) =>
    OrderDetail.fromJson(json.decode(str));

String orderDetailToJson(OrderDetail data) => json.encode(data.toJson());

class OrderDetail {
  String status;
  Data data;

  OrderDetail({
    this.status,
    this.data,
  });

  factory OrderDetail.fromJson(Map<String, dynamic> json) => OrderDetail(
        status: json["status"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": data.toJson(),
      };
}

class Data {
  Orders orders;

  Data({
    this.orders,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        orders: Orders.fromJson(json["orders"]),
      );

  Map<String, dynamic> toJson() => {
        "orders": orders.toJson(),
      };
}

class Orders {
  int id;
  int userId;
  String name;
  String countryCode;
  String mobile;
  String email;
  int total;
  dynamic error;
  int dispatchStatus;
  dynamic dispatchTime;
  DateTime createdAt;
  DateTime updatedAt;
  String deliveryReference;
  String deliveryAddress;
  String deliveryDropOffCoordinate;
  String deliveryContactPhoneNumber;
  String deliveryLocality;
  int deliveryCharge;
  String deliveryCountry;
  String paymentDetailsType;
  dynamic paymentDetailsReference;
  dynamic paymentDetailsProcessorReference;
  int paymentDetailsAmount;
  String paymentDetailsStatus;
  dynamic paymentDetailsPhoneNumber;
  List<Cart> cart;

  Orders({
    this.id,
    this.userId,
    this.name,
    this.countryCode,
    this.mobile,
    this.email,
    this.total,
    this.error,
    this.dispatchStatus,
    this.dispatchTime,
    this.createdAt,
    this.updatedAt,
    this.deliveryReference,
    this.deliveryAddress,
    this.deliveryDropOffCoordinate,
    this.deliveryContactPhoneNumber,
    this.deliveryLocality,
    this.deliveryCharge,
    this.deliveryCountry,
    this.paymentDetailsType,
    this.paymentDetailsReference,
    this.paymentDetailsProcessorReference,
    this.paymentDetailsAmount,
    this.paymentDetailsStatus,
    this.paymentDetailsPhoneNumber,
    this.cart,
  });

  factory Orders.fromJson(Map<String, dynamic> json) => Orders(
        id: json["id"],
        userId: json["user_id"],
        name: json["name"],
        countryCode: json["country_code"],
        mobile: json["mobile"],
        email: json["email"],
        total: json["total"],
        error: json["error"],
        dispatchStatus: json["dispatch_status"],
        dispatchTime: json["dispatch_time"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        deliveryReference: json["delivery_reference"],
        deliveryAddress: json["delivery_address"],
        deliveryDropOffCoordinate: json["delivery_drop_off_coordinate"],
        deliveryContactPhoneNumber: json["delivery_contact_phone_number"],
        deliveryLocality: json["delivery_locality"],
        deliveryCharge: json["delivery_charge"],
        deliveryCountry: json["delivery_country"],
        paymentDetailsType: json["payment_details_type"],
        paymentDetailsReference: json["payment_details_reference"],
        paymentDetailsProcessorReference:
            json["payment_details_processor_reference"],
        paymentDetailsAmount: json["payment_details_amount"],
        paymentDetailsStatus: json["payment_details_status"],
        paymentDetailsPhoneNumber: json["payment_details_phone_number"],
        cart: List<Cart>.from(json["cart"].map((x) => Cart.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "name": name,
        "country_code": countryCode,
        "mobile": mobile,
        "email": email,
        "total": total,
        "error": error,
        "dispatch_status": dispatchStatus,
        "dispatch_time": dispatchTime,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "delivery_reference": deliveryReference,
        "delivery_address": deliveryAddress,
        "delivery_drop_off_coordinate": deliveryDropOffCoordinate,
        "delivery_contact_phone_number": deliveryContactPhoneNumber,
        "delivery_locality": deliveryLocality,
        "delivery_charge": deliveryCharge,
        "delivery_country": deliveryCountry,
        "payment_details_type": paymentDetailsType,
        "payment_details_reference": paymentDetailsReference,
        "payment_details_processor_reference": paymentDetailsProcessorReference,
        "payment_details_amount": paymentDetailsAmount,
        "payment_details_status": paymentDetailsStatus,
        "payment_details_phone_number": paymentDetailsPhoneNumber,
        "cart": List<dynamic>.from(cart.map((x) => x.toJson())),
      };
}

class Cart {
  int productId;
  int quantity;
  int price;
  dynamic accompanimentId;
  String productName;
  String description;
  dynamic productsAttributeAccompaniment;
  dynamic productAttrubuteSize;
  dynamic productAttrubutePrice;

  Cart({
    this.productId,
    this.quantity,
    this.price,
    this.accompanimentId,
    this.productName,
    this.description,
    this.productsAttributeAccompaniment,
    this.productAttrubuteSize,
    this.productAttrubutePrice,
  });

  factory Cart.fromJson(Map<String, dynamic> json) => Cart(
        productId: json["product_id"],
        quantity: json["quantity"],
        price: json["price"],
        accompanimentId: json["accompaniment_id"],
        productName: json["product_name"],
        description: json["description"],
        productsAttributeAccompaniment:
            json["products_attribute_accompaniment"],
        productAttrubuteSize: json["product_attrubute_size"],
        productAttrubutePrice: json["product_attrubute_price"],
      );

  Map<String, dynamic> toJson() => {
        "product_id": productId,
        "quantity": quantity,
        "price": price,
        "accompaniment_id": accompanimentId,
        "product_name": productName,
        "description": description,
        "products_attribute_accompaniment": productsAttributeAccompaniment,
        "product_attrubute_size": productAttrubuteSize,
        "product_attrubute_price": productAttrubutePrice,
      };
}
