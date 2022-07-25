import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/utils/app_routes.dart';
import 'package:shop/view/cart_page.dart';
import 'package:shop/view/orders_page.dart';
import 'package:shop/view/product_detail_page.dart';
import 'package:shop/view/product_form_page.dart';
import 'package:shop/view/products_overview_page.dart';
import 'package:shop/view/products_page.dart';
import 'package:shop/viewModel/cart.viewmodel.dart';
import 'package:shop/viewModel/order_list.viewmodel.dart';
import 'package:shop/viewModel/product_list.viewmodel.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ProductListViewModel(),
        ),
        ChangeNotifierProvider(
          create: (_) => CartViewModel(),
        ),
        ChangeNotifierProvider(
          create: (_) => OrderListViewModel(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          fontFamily: 'Lato',
          colorScheme: ColorScheme.fromSwatch(
            primarySwatch: Colors.purple,
          ).copyWith(
            secondary: Colors.deepOrange,
          ),
        ),
        // home: ProductsOverviewPage(),
        routes: {
          AppRoutes.HOME: (ctx) => const ProductsOverviewPage(),
          AppRoutes.PRODUCT_DETAIL: (ctx) => const ProductDetailPage(),
          AppRoutes.CART: (ctx) => const CartPage(),
          AppRoutes.ORDERS: (ctx) => const OrdersPage(),
          AppRoutes.PRODUCTS: (ctx) => const ProductsPage(),
          AppRoutes.PRODUCT_FORM: (ctx) => const ProductFormPage(),
        },
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
