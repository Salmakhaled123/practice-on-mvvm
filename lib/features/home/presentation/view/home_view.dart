import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:products/core/utils/app_router.dart';
import 'package:products/features/home/presentation/view%20model/home_cubit.dart';
import 'package:products/features/home/presentation/view/widgets/products_list_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(automaticallyImplyLeading: false,
        title: const Text('Products'), centerTitle: true,
        actions: [
          IconButton(onPressed: () {
            GoRouter.of(context).push(AppRouter.favoriteView);
          },
              icon: const Icon(Icons.favorite_border_outlined))
        ]),
      body: const ProductsListView(),
    );
  }
}


