part of 'product_bloc.dart';

abstract class ProductEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class GetProductsEvent extends ProductEvent {
  final bool isFavorites;
  GetProductsEvent({this.isFavorites = false});
  @override
  List<Object> get props => [isFavorites];
}
