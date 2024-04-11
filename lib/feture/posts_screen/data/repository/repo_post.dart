import 'package:map_app/core/api_result.dart';
import 'package:map_app/core/network/web_services.dart';
import 'package:map_app/core/network_exceptions.dart';
import 'package:map_app/core/success_api_result.dart';
import 'package:map_app/model/post_model/get_input_post_model.dart';

class PostsRepository {
  final AppWebServices webServices;

  PostsRepository(this.webServices);

  Future<ApiResult<List<GetPostOutPutModel>>> getPosts() async {
    try {
      var response = await webServices.getPosts();
      return ApiResult.success(response);
    } catch (error) {
      print(error.toString());
      return ApiResult.failure(NetworkExceptions.getDioException(error));
    }
  }
}