import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/view/auth_page.dart';
import 'package:shop/view/products_overview_page.dart';

import '../viewModel/auth.view_model.dart';

class AuthOrHomePage extends StatelessWidget {
  const AuthOrHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthViewModel auth = Provider.of(context);
    return FutureBuilder(
      future: auth.tryAutoLogin(),
      builder: (ctx, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.error != null) {
          return const Center(
            child: Text('Ocorreu um erro!'),
          );
        } else {
          return auth.isAuth ? const ProductsOverviewPage() : const AuthPage();
        }
      },
    );
  }
}
