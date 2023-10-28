import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:products/features/favorite/presentation/view/widgets/favorite_item.dart';
import 'package:products/features/favorite/presentation/view_model/favorite_cubit.dart';

class FavoriteView extends StatelessWidget {
  const FavoriteView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(body:BlocBuilder<FavoriteCubit, FavoriteState>(
      builder: (context, state) {
        var cubit=BlocProvider.of<FavoriteCubit>(context);

              if(cubit.favorites.isNotEmpty )
                {
                  return  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: ListView.builder(physics: const BouncingScrollPhysics(),
                        itemCount: cubit.favorites.length,
                        itemBuilder: (context, index) {
                          return FavoriteItem(model: cubit.favorites[index]);
                        }),
                  );
                }

        return  Center(
              child: Text('Empty WishList ',
        style: TextStyle(fontSize: 24.sp,fontWeight: FontWeight.bold),));



      
      },
    ) ,);
  }
}

