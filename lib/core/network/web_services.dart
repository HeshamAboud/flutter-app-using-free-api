import 'package:dio/dio.dart';
import 'package:map_app/core/String/base_url.dart';
import 'package:map_app/core/success_api_result.dart';
import 'package:map_app/model/post_model/get_input_post_model.dart';
import 'package:retrofit/retrofit.dart';
part 'web_services.g.dart';

@RestApi(baseUrl: baseUrl)
abstract class AppWebServices {
  factory AppWebServices(Dio dio, {String baseUrl}) = _AppWebServices;

  @GET("posts")
  Future<List<GetPostOutPutModel>> getPosts();
}