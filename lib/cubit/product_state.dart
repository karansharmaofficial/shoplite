import '../models/product_model.dart';

class ProductState {
  final List<Product> products;
  final bool isLoading;
  final String? errorMessage;
  final String searchQuery;
  final String selectedCategory;
  final Set<int> favouriteIds;

  const ProductState({
    this.products = const [],
    this.isLoading = false,
    this.errorMessage,
    this.searchQuery = '',
    this.selectedCategory = 'All',
    this.favouriteIds = const {},
  });

  List<String> get categories {
    final values = products.map((product) => product.category).toSet().toList()
      ..sort();
    return ['All', ...values];
  }

  List<Product> get filteredProducts {
    return products.where((product) {
      final matchesSearch =
          product.title.toLowerCase().contains(searchQuery.toLowerCase());
      final matchesCategory = selectedCategory == 'All' ||
          product.category == selectedCategory;
      return matchesSearch && matchesCategory;
    }).toList();
  }

  ProductState copyWith({
    List<Product>? products,
    bool? isLoading,
    String? errorMessage,
    bool clearError = false,
    String? searchQuery,
    String? selectedCategory,
    Set<int>? favouriteIds,
  }) {
    return ProductState(
      products: products ?? this.products,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: clearError ? null : (errorMessage ?? this.errorMessage),
      searchQuery: searchQuery ?? this.searchQuery,
      selectedCategory: selectedCategory ?? this.selectedCategory,
      favouriteIds: favouriteIds ?? this.favouriteIds,
    );
  }
}