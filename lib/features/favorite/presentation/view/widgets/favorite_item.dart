import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:products/features/favorite/presentation/view_model/favorite_cubit.dart';

import '../../../../home/data/model/product_model.dart';

class FavoriteItem extends StatelessWidget {
  const FavoriteItem({Key? key, required this.model}) : super(key: key);
  final Products model;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoriteCubit, FavoriteState>(
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.symmetric(vertical: 10.h),
          child: ListTile(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.r)),
            tileColor: Colors.grey[300],
            title: Text(
              model.title.toString(),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
            leading: Image.network(model.thumbnail!, width: 50.w),
            trailing: IconButton(
                onPressed: () {
                  BlocProvider.of<FavoriteCubit>(context)
                      .removeFromFavorite(model);
                },
                icon: const Icon(
                  Icons.delete,
                  color: Colors.red,
                )),
          ),
        );
      },
    );
  }
}
