import 'package:dartz/dartz.dart';
import 'package:products/core/errors/failures.dart';
import 'package:products/features/home/data/model/product_model.dart';

abstract class HomeRepo{
 Future<Either<Failure,List<Products>>> fetchProducts();

}
