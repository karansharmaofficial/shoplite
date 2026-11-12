import 'package:dio/dio.dart';
import '../models/product_model.dart';

class ProductRepository {
  ProductRepository()
      : _dio = Dio(
          BaseOptions(
            baseUrl: 'https://dummyjson.com',
            connectTimeout: const Duration(seconds: 15),
            receiveTimeout: const Duration(seconds: 15),
          ),
        );

  final Dio _dio;

  Future<List<Product>> fetchProducts() async {
    try {
      final response = await _dio.get('/products', queryParameters: {'limit': 100});
      final data = response.data as Map<String, dynamic>;
      final productsJson = data['products'] as List<dynamic>;

      return productsJson
          .map((item) => Product.fromJson(item as Map<String, dynamic>))
          .toList();
    } on DioException catch (error) {
      throw Exception(error.message ?? 'Could not connect to the product server.');
    } catch (_) {
      throw Exception('Something went wrong while reading products.');
    }
  }
}