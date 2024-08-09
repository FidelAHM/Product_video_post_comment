import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gift_shop/features/Products/Datasource/models/products_model.dart';
import 'package:gift_shop/features/Products/Datasource/products_data_source.dart';
import 'package:gift_shop/core/navigator_key.dart';
import 'package:gift_shop/core/widget/dialog/custom_snack_bard.dart';

part 'products_event.dart';
part 'products_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  ProductsBloc() : super(ProductsInitial()) {
    on<LoadProductsEvent>((event, emit) async {
      emit(ProductsLoadingState());
      try {
        final products = await ProductsRepository().listProducts();
       
        emit(ProductsDataLoadedState(products as List<ProductsModel>));
      } catch (e) {
        print('___________Error ${e}');
         CustomSnackbar(navigatorKey.currentContext!)
            .showErrorMessage('An error an occured');
        emit(ProductsDataError('an error  has occured'));
      }
    });
  }
}
