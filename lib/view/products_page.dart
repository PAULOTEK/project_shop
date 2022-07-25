import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/utils/app_routes.dart';
import 'package:shop/viewModel/product_list.viewmodel.dart';

import '../widgets/app_drawer.dart';
import '../widgets/product_item.dart';

class ProductsPage extends StatelessWidget {
  const ProductsPage({Key? key}) : super(key: key);

  Future<void> _refreshProducts(BuildContext context) {
    return Provider.of<ProductListViewModel>(
      context,
      listen: false,
    ).loadProducts();
  }

  @override
  Widget build(BuildContext context) {
    final ProductListViewModel products = Provider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gerenciar Produtos'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pushNamed(
                AppRoutes.PRODUCT_FORM,
              );
            },
          ),
        ],
      ),
      drawer: const AppDrawer(),
      body: RefreshIndicator(
        onRefresh: () => _refreshProducts(context),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: ListView.builder(
            itemCount: products.itemsCount,
            itemBuilder: (ctx, i) => Column(
              children: [
                ProductItem(
                  products.items[i],
                ),
                const Divider(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
