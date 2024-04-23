import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopbloc/bloc/shoplistbloc_event.dart';
import 'package:shopbloc/bloc/shoplistbloc_state.dart';

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  OrderBloc(OrderState initialState) : super(initialState);
}

class OpenOrdersBloc extends OrderBloc {
  OpenOrdersBloc() : super(LoadingState()) {
    on<FetchOrdersEvent>((event, emit) {
      // Fetch open orders
      List<Order> openOrders = fetchOpenOrders();
      emit(LoadedState(openOrders));
    });
  }

  List<Order> fetchOpenOrders() {
    // Mock data for open orders
    return [
      Order(
        title: 'Tea',
        description: 'Ginger Tea with or Without Sugar',
        price: 15.00,
        metaData: {'status': 'open'},
      ),
      Order(
        title: 'Milk',
        description: 'Plain Milk',
        price: 25.00,
        metaData: {'status': 'open'},
      ),
      // Add more mock open orders here
    ];
  }
}

class ClosedOrdersBloc extends OrderBloc {
  ClosedOrdersBloc() : super(LoadingState()) {
    on<FetchOrdersEvent>((event, emit) {
      // Fetch closed orders
      List<Order> closedOrders = fetchClosedOrders();
      emit(LoadedState(closedOrders));
    });
  }

  List<Order> fetchClosedOrders() {
    // Mock data for closed orders
    return [
      Order(
        title: 'Green Tea',
        description: 'Green tea with honey',
        price: 29.99,
        metaData: {'status': 'closed'},
      ),
      Order(
        title: 'Hybiscus tea',
        description: 'Hybiscus tea with honey',
        price: 35.00,
        metaData: {'status': 'closed'},
      ),
      // Add more mock closed orders here
    ];
  }
}
