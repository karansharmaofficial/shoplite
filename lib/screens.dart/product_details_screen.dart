import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/product_cubit.dart';
import '../cubit/product_state.dart';
import '../models/product_model.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Product details')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 280,
              width: double.infinity,
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(22),
              ),
              child: Image.network(
                product.thumbnail,
                fit: BoxFit.contain,
                errorBuilder: (_, __, ___) =>
                    const Icon(Icons.image_not_supported_outlined, size: 60),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              product.category.toUpperCase(),
              style: const TextStyle(
                color: Color(0xFF315CDB),
                fontWeight: FontWeight.bold,
                letterSpacing: 1,
              ),
            ),
            const SizedBox(height: 8),
            Text(product.title,
                style:
                    const TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Row(
              children: [
                Text(
                  '\$${product.price.toStringAsFixed(2)}',
                  style: const TextStyle(
                      fontSize: 22, fontWeight: FontWeight.bold),
                ),
                const SizedBox(width: 14),
                const Icon(Icons.star, color: Colors.amber, size: 19),
                Text(product.rating.toStringAsFixed(1)),
              ],
            ),
            const SizedBox(height: 20),
            const Text('Description',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text(product.description,
                style: const TextStyle(height: 1.5)),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              height: 52,
              child: BlocBuilder<ProductCubit, ProductState>(
                builder: (context, state) {
                  final isSaved = state.favouriteIds.contains(product.id);
                  return FilledButton.icon(
                    onPressed: () => context
                        .read<ProductCubit>()
                        .toggleFavourite(product.id),
                    icon: Icon(
                        isSaved ? Icons.favorite : Icons.favorite_border),
                    label: Text(isSaved
                        ? 'Remove from favourites'
                        : 'Add to favourites'),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}