import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kilimanjaro_app/blocs/order_detail_bloc_provider.dart';
import 'package:kilimanjaro_app/blocs/orders_bloc.dart';
import 'package:kilimanjaro_app/screens/order_detail.dart';

import 'package:kilimanjaro_app/models/item_model.dart';

class OrderList extends StatefulWidget {
  @override
  OrderListState createState() {
    return new OrderListState();
  }
}

class OrderListState extends State<OrderList> {
  @override
  void initState() {
    super.initState();
    bloc.fetchAllOrders();
  }

  @override
  void dispose() {
    super.dispose();
    bloc.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: bloc.allOrders,
        builder: ((context, snapshot) {
          if (snapshot.hasData) {
            return buildList(snapshot);
          } else if (snapshot.hasError) {
            print("Inside hasError");
            return Text(snapshot.error.toString());
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        }),
      ),
    );
  }

  Widget buildList(AsyncSnapshot<ItemModel> snapshot) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: ListView.builder(
        itemBuilder: (context, index) {
          // itemCount:
          // snapshot.data.orders.length;
          return GestureDetector(
            onTap: () => goToOrdersDetailPage(snapshot.data, index),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: new FittedBox(
                child: Material(
                  color: Colors.white,
                  elevation: 14.0,
                  borderRadius: BorderRadius.circular(24.0),
                  shadowColor: Color(0x802196F3),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      new MealCard(
                          orderName: snapshot.data.data.orders[index].name,
                          paymentMode: snapshot
                              .data.data.orders[index].paymentDetailsType,
                          orderTime: snapshot.data.data.orders[index].createdAt
                              .toString(),
                          orderAmount: snapshot.data.data.orders[index].total
                              .toString()),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        width: 250,
                        height: 200,
                        child: ClipRRect(
                          borderRadius: new BorderRadius.circular(24.0),
                          child: Image(
                            fit: BoxFit.contain,
                            alignment: Alignment.topRight,
                            image: NetworkImage(
                                "https://kilimanjarofood.co.ke/assets/img/kilimanjaro-new-logo.jpeg"),
                          ),
                        ),
                      ),

                      ///btn
                    ],
                  ),
                ),
              ),
            ),
          );
        },
        itemCount: snapshot.data.data.orders.length,
      ),
    );
  }

  goToOrdersDetailPage(ItemModel data, int index) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return OrderDetailBlocProvider(
        child: OrderDetailScreen(
          mobile: data.data.orders[index].mobile,
          name: data.data.orders[index].name,
          orderDate: data.data.orders[index].createdAt,
          total: data.data.orders[index].total.toString(),
          id: data.data.orders[index].id,
        ),
      );
    }));
  }
}

///under image desc
class MealCard extends StatelessWidget {
  MealCard(
      {this.orderName,
      this.orderAmount,
      this.paymentMode,
      this.orderTime,
      this.mobile});
  final String orderName;
  final String orderAmount;
  final String paymentMode;
  final String orderTime;
  final String mobile;

  @override
  Widget build(BuildContext context) {
    return new Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      child: new Column(
        children: <Widget>[
          Container(
            child: Icon(
              FontAwesomeIcons.userTie,
              color: Colors.black,
              size: 20.0,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 2.0),
            child: Container(
              child: Text(
                orderName,
                style: TextStyle(
                    color: Color(0xffe6020a),
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.only(left: 2.0),
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                    child: Icon(
                      FontAwesomeIcons.calendarAlt,
                      color: Colors.amber,
                      size: 20.0,
                    ),
                  ),
                  SizedBox(width: 10),
                  Container(
                    child: Text(
                      orderTime,
                      style: TextStyle(
                          color: Colors.blueAccent,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            child: Padding(
              padding: const EdgeInsets.only(left: 2.0),
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Container(
                      child: Icon(
                        FontAwesomeIcons.moneyBillWave,
                        color: Colors.amber,
                        size: 20.0,
                      ),
                    ),
                    SizedBox(width: 15),
                    Container(
                      child: Text(
                        paymentMode,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
