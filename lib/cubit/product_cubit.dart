import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../repositories/product_repository.dart';
import 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit(this._repository) : super(const ProductState());

  final ProductRepository _repository;

  Future<void> loadProducts() async {
    emit(state.copyWith(isLoading: true, clearError: true));
    try {
      final products = await _repository.fetchProducts();
      emit(state.copyWith(products: products, isLoading: false));
      await loadFavourites();
    } catch (error) {
      emit(state.copyWith(
        isLoading: false,
        errorMessage: error.toString(),
      ));
    }
  }

  void searchProducts(String query) {
    emit(state.copyWith(searchQuery: query));
  }

  void selectCategory(String category) {
    emit(state.copyWith(selectedCategory: category));
  }

  Future<void> loadFavourites() async {
    final prefs = await SharedPreferences.getInstance();
    final ids = prefs.getStringList('favourite_ids') ?? [];
    emit(state.copyWith(favouriteIds: ids.map(int.parse).toSet()));
  }

  Future<void> toggleFavourite(int productId) async {
    final updatedIds = Set<int>.from(state.favouriteIds);

    if (updatedIds.contains(productId)) {
      updatedIds.remove(productId);
    } else {
      updatedIds.add(productId);
    }

    emit(state.copyWith(favouriteIds: updatedIds));

    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(
      'favourite_ids',
      updatedIds.map((id) => id.toString()).toList(),
    );
  }
}