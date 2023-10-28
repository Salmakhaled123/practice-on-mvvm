import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:products/core/utils/service_locator.dart';
import 'package:products/features/favorite/presentation/view_model/favorite_cubit.dart';
import 'core/bloc_observer.dart';
import 'core/utils/app_router.dart';

void main() {
  setup();
  Bloc.observer = MyBlocObserver();
  runApp(const ProductsApp());
}

class ProductsApp extends StatelessWidget {
  const ProductsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FavoriteCubit(),
      child: ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, child) {
          return MaterialApp.router(
            theme: ThemeData(primarySwatch: Colors.pink),
            routerConfig: AppRouter.router,
            title: 'Products',
            debugShowCheckedModeBanner: false,
          );
        },
      ),
    );
  }
}
