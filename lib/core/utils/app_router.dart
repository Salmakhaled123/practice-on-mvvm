import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:products/core/utils/service_locator.dart';
import 'package:products/features/favorite/presentation/view/favorite_view.dart';
import 'package:products/features/home/presentation/view%20model/home_cubit.dart';
import 'package:products/features/splash/presentation/view/splash_view.dart';
import '../../features/home/data/repos/home_repo_imp.dart';
import '../../features/home/presentation/view/home_view.dart';

abstract class AppRouter {
  static const homeView = '/homeView';
  static const favoriteView = '/favoriteView';
  static final GoRouter router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return const SplashView();
        },
      ),
      GoRoute(
        path: favoriteView,
        builder: (BuildContext context, GoRouterState state) {
          return const FavoriteView();
        },
      ),
      GoRoute(
        path: homeView,
        builder: (BuildContext context, GoRouterState state) {
          return BlocProvider(
            create: (context) => HomeCubit(getIt.get<HomeRepoImp>())..fetchProducts(),
            child: const HomeView(),
          );
        },
      ),
    ],
  );
}