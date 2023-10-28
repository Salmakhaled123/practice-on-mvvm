import 'package:dio/dio.dart';

class ApiService{
  static const  _baseUrl='https://dummyjson.com/products';
final Dio  _dio;
ApiService( this._dio);
Future<Map<String,dynamic>>get()async
  {
    var response= await _dio.get(_baseUrl);
    return response.data;
  }
}