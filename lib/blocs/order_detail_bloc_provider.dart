import 'package:flutter/material.dart';
import 'package:kilimanjaro_app/blocs/order_detail_bloc.dart';


class OrderDetailBlocProvider extends InheritedWidget {

  final OrderDetailBloc bloc;

  OrderDetailBlocProvider({Key key, Widget child}) :bloc = OrderDetailBloc(), super(key:key, child:child);

  static OrderDetailBlocProvider of(BuildContext context) => 
    context.inheritFromWidgetOfExactType(OrderDetailBlocProvider);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return true;
  }

}