import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kilimanjaro_app/blocs/order_detail_bloc.dart';
import 'package:kilimanjaro_app/blocs/order_detail_bloc_provider.dart';
import 'package:kilimanjaro_app/models/order_detail.dart';

class OrderDetailScreen extends StatefulWidget {
  final paymentMode;
  final orderDate;
  final String name;
  final String total;
  final String mobile;
  final int id;
//mobile
  OrderDetailScreen({
    this.name,
    this.paymentMode,
    this.orderDate,
    this.total,
    this.id,
    this.mobile,
  });

  @override
  _OrderDetailScreenState createState() => _OrderDetailScreenState();
}

class _OrderDetailScreenState extends State<OrderDetailScreen> {
  OrderDetailBloc bloc;
  final List<String> cartList = List<String>();

  @override
  void didChangeDependencies() {
    bloc = OrderDetailBlocProvider.of(context).bloc;
    bloc.fetchSimilarOrdersById(widget.id);
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: false,
        bottom: false,
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                expandedHeight: 200.0,
                floating: false,
                pinned: true,
                elevation: 0.0,
                flexibleSpace: FlexibleSpaceBar(
                    background: Image.network(
                  "https://kilimanjarofood.co.ke/assets/img/kilimanjaro-new-logo.jpeg",
                  fit: BoxFit.cover,
                )),
              ),
            ];
          },
          body: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Wrap(
                  direction: Axis.horizontal,
                  spacing: 50.0,
                  alignment: WrapAlignment.spaceBetween,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text(
                        widget.name,
                        style: TextStyle(
                          fontSize: 25.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    RaisedButton.icon(
                      onPressed: () {},
                      textColor: Colors.white,
                      label: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(' Details'),
                      ),
                      shape: StadiumBorder(),
                      color: Colors.red,
                      icon: Icon(Icons.info, color: Colors.white),
                    )
                  ],
                ),

                Container(margin: EdgeInsets.only(top: 8.0, bottom: 8.0)),
                Row(
                  children: <Widget>[
                    Icon(
                      Icons.shopping_cart,
                      color: Colors.red,
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 1.0, right: 1.0),
                    ),
                    Text(
                      "ksh",
                      style: TextStyle(
                        fontSize: 18.0,
                      ),
                    ),
                    Text(
                      widget.total,
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.blue,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 10.0, right: 10.0),
                    ),
                    Icon(
                      Icons.phone_iphone,
                      color: Colors.red,
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 1.0, right: 1.0),
                    ),
                    Text(
                      widget.mobile,
                      style: TextStyle(
                        fontSize: 18.0,
                      ),
                    ),
                     Container(
                      margin: EdgeInsets.only(left: 10.0, right: 10.0),
                    ),
                    Icon(
                      FontAwesomeIcons.moneyBillWaveAlt,
                      color: Colors.red,
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 6.0, right: 6.0),
                    ),
                    Text(
                      widget.paymentMode,
                      style: TextStyle(
                        fontSize: 18.0,
                      ),
                    ),
                  ],
                ),
                Container(margin: EdgeInsets.only(top: 8.0, bottom: 8.0)),
                // Text(widget.description),
                // descriptionText(),
                Container(margin: EdgeInsets.only(top: 8.0, bottom: 8.0)),

                StreamBuilder(
                  stream: bloc.orderDetail,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return FutureBuilder(
                        future: snapshot.data,
                        builder:
                            (context, AsyncSnapshot<OrderDetail> snapshot) {
                          if (snapshot.hasData) {
                            return chipLayout(snapshot.data);
                          } else {
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                        },
                      );
                    } else {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color.fromRGBO(245, 13, 165, 15),
        child: Icon(
          FontAwesomeIcons.receipt,
          color: Colors.white,
        ),
        //Widget to display inside Floating Action Button, can be `Text`, `Icon` or any widget.
        onPressed: () {
          //Code to execute when Floating Action Button is clicked
          //...
        },
      ),
    );
  }

  Widget chipLayout(OrderDetail data) {
    List<Widget> children = List<Widget>();

    if (data.data.orders.cart.isNotEmpty) {
      var cart = data.data.orders.cart;
      for (var i = 0; i < cart.length; i++) {
        String name = cart[i].productName;
        String qty = cart[i].quantity.toString();
        String desc = cart[i].description;
        cartList.add(name);
        cartList.add(qty);
        cartList.add(desc);
      }

      for (var i = 0; i < cartList.length; i++) {
        // print("Inside second loop");
        children.add(Padding(
          padding: const EdgeInsets.all(8.0),
          child: Chip(
            label: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(cartList[i]),
            ),
          ),
        ));
      }

      return Wrap(direction: Axis.horizontal, children: children);
    } else {
      return Padding(
        padding: const EdgeInsets.only(top: 20.0, left: 80.0, right: 20.0),
        child: Text(
          'No Foods Found',
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontStyle: FontStyle.italic),
        ),
      );
    }
  }
}
