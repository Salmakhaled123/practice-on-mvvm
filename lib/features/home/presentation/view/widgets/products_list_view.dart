import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:products/features/home/presentation/view%20model/home_cubit.dart';
import 'package:products/features/home/presentation/view/widgets/product_item.dart';

class ProductsListView extends StatelessWidget {
  const ProductsListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state is HomeSuccess) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: ListView.builder(physics: const BouncingScrollPhysics(),
                itemCount: state.products.length,
                itemBuilder: (context, index) {
                  return ProductItem(
                    model: state.products[index],
                  );
                }),
          );
        }
        else if (state is HomeFailure) {
          return Center(
            child: Text(state.errorMessage,
                style: TextStyle(
                  fontSize: 21.sp,
                  fontWeight: FontWeight.bold,
                )),
          );
        }
      return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
