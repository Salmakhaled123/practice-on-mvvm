import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:products/core/errors/failures.dart';
import 'package:products/core/utils/api_service.dart';
import 'package:products/features/home/data/model/product_model.dart';

import 'home repo.dart';

class HomeRepoImp implements HomeRepo{
  ApiService apiService;
  HomeRepoImp(this.apiService);
  @override
  Future<Either<Failure, List<Products>>> fetchProducts() async
  {
           try {
             var result=await apiService.get();
           var data=  ProductModel.fromJson(result);
             return right(data.products!);
           } catch (e)
           {
            if(e is DioException)
              {
                return left(ServerFailure.fromDioError(e)) ;
              }
                return left(ServerFailure(e.toString()));

           }

  }

}