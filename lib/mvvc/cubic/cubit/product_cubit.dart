import 'package:bloc/bloc.dart';
import 'package:shop/mvvc/model/data/prodact_data.dart';
import 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit() : super(ProductInitial());

  Future<void> fetchProducts(String category) async {
    emit(ProductLoading());
    try {
      final products = await ProductData.fetchCategory(category);
      emit(ProductSuccess(products));
    } catch (e) {
      emit(ProductError(e.toString()));
    }
  }
}
