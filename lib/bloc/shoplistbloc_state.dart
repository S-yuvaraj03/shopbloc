import 'package:equatable/equatable.dart';

abstract class OrderState extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoadingState extends OrderState {}

class LoadedState extends OrderState {
  final List<Order> orders;

  LoadedState(this.orders);

  @override
  List<Object?> get props => [orders];
}

class Order {
  final String title;
  final String description;
  final double price;
  final Map<String, dynamic> metaData;

  Order({
    required this.title,
    required this.description,
    required this.price,
    required this.metaData,
  });
}
