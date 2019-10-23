import 'dart:convert';

ItemModel orderDetailFromJson(String str) =>
    ItemModel.fromJson(json.decode(str));

String orderDetailToJson(ItemModel data) => json.encode(data.toJson());

class ItemModel {
  String status;
  Data data;

  ItemModel({
    this.status,
    this.data,
  });

  factory ItemModel.fromJson(Map<String, dynamic> json) => ItemModel(
        status: json["status"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": data.toJson(),
      };
}

class Data {
  List<Order> orders;

  Data({
    this.orders,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        orders: List<Order>.from(json["orders"].map((x) => Order.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "orders": List<dynamic>.from(orders.map((x) => x.toJson())),
      };
}

class Order {
  int id;
  int userId;
  String name;
  String countryCode;
  String mobile;
  String email;
  String paymentDetailsType;
  int total;
  dynamic error;
  int dispatchStatus = 1;
  dynamic dispatchTime;
  DateTime createdAt;
  DateTime updatedAt;
  String deliveryReference;
  String deliveryAddress;
  String deliveryDropOffCoordinate;
  String deliveryContactPhoneNumber;
  String deliveryLocality;
  int deliveryCharge;

  String paymentDetailsReference;
  String paymentDetailsProcessorReference;
  int paymentDetailsAmount;

  String paymentDetailsPhoneNumber;
  List<Cart> cart;

  Order({
    this.id,
    this.userId,
    this.name,
    this.countryCode,
    this.mobile,
    this.email,
    this.paymentDetailsType,
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
    this.paymentDetailsReference,
    this.paymentDetailsProcessorReference,
    this.paymentDetailsAmount,
    this.paymentDetailsPhoneNumber,
    this.cart,
  });

  factory Order.fromJson(Map<String, dynamic> json) => Order(
        id: json["id"],
        userId: json["user_id"] == null ? null : json["user_id"],
        name: json["name"],
        countryCode: json["country_code"],
        mobile: json["mobile"],
        email: json["email"],
        paymentDetailsType: json["payment_details_type"],
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
        deliveryLocality: json["delivery_locality"] == null
            ? null
            : json["delivery_locality"],
        deliveryCharge: json["delivery_charge"],
        paymentDetailsReference: json["payment_details_reference"] == null
            ? null
            : json["payment_details_reference"],
        paymentDetailsProcessorReference:
            json["payment_details_processor_reference"] == null
                ? null
                : json["payment_details_processor_reference"],
        paymentDetailsAmount: json["payment_details_amount"],
        paymentDetailsPhoneNumber: json["payment_details_phone_number"] == null
            ? null
            : json["payment_details_phone_number"],
        cart: List<Cart>.from(json["cart"].map((x) => Cart.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId == null ? null : userId,
        "name": name,
        "country_code": countryCode,
        "mobile": mobile,
        "email": email,
        "payment_details_type": paymentDetailsType,
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
        "delivery_locality": deliveryLocality == null ? null : deliveryLocality,
        "delivery_charge": deliveryCharge,
        "payment_details_reference":
            paymentDetailsReference == null ? null : paymentDetailsReference,
        "payment_details_processor_reference":
            paymentDetailsProcessorReference == null
                ? null
                : paymentDetailsProcessorReference,
        "payment_details_amount": paymentDetailsAmount,
        "payment_details_phone_number": paymentDetailsPhoneNumber == null
            ? null
            : paymentDetailsPhoneNumber,
        "cart": List<dynamic>.from(cart.map((x) => x.toJson())),
      };
}

class Cart {
  int productId;
  int quantity;
  int price;
  int accompanimentId;
  String productName;
  String description;
  String productsAttributeAccompaniment;
  String productAttrubuteSize;
  int productAttrubutePrice;

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
        price: json["price"] == null ? null : json["price"],
        accompanimentId:
            json["accompaniment_id"] == null ? null : json["accompaniment_id"],
        productName: json["product_name"],
        description: json["description"],
        productsAttributeAccompaniment:
            json["products_attribute_accompaniment"] == null
                ? null
                : json["products_attribute_accompaniment"],
        productAttrubuteSize: json["product_attrubute_size"] == null
            ? null
            : json["product_attrubute_size"],
        productAttrubutePrice: json["product_attrubute_price"] == null
            ? null
            : json["product_attrubute_price"],
      );

  Map<String, dynamic> toJson() => {
        "product_id": productId,
        "quantity": quantity,
        "price": price == null ? null : price,
        "accompaniment_id": accompanimentId == null ? null : accompanimentId,
        "product_name": productName,
        "description": description,
        "products_attribute_accompaniment":
            productsAttributeAccompaniment == null
                ? null
                : productsAttributeAccompaniment,
        "product_attrubute_size":
            productAttrubuteSize == null ? null : productAttrubuteSize,
        "product_attrubute_price":
            productAttrubutePrice == null ? null : productAttrubutePrice,
      };
}
