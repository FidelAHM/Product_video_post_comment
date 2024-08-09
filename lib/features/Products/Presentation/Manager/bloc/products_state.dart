part of 'products_bloc.dart';

sealed class ProductsState extends Equatable {
  const ProductsState();
  
  @override
  List<Object> get props => [];
}

final class ProductsInitial extends ProductsState {}
class ProductsLoadingState extends ProductsState {
  @override
  List<Object> get props => [];
}

class ProductsDataLoadedState extends ProductsState {
  final List<ProductsModel> products;
  ProductsDataLoadedState(this.products);
  @override
  List<Object> get props => [products];
}

class ProductsDataError extends ProductsState {
  final String error;
  ProductsDataError(this.error);
    @override
  List<Object> get props => [error];
}