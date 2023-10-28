import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:products/features/home/data/model/product_model.dart';
import '../../data/repos/home repo.dart';
part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.homeRepo) : super(HomeInitial());
 final HomeRepo homeRepo;
  Future fetchProducts()async
  {
       var result=await  homeRepo.fetchProducts();
       result.fold((failure) {
         emit(HomeFailure(failure.errorMessage));
       }
       , (products) {
             emit(HomeSuccess(products));
           });
  }
}
