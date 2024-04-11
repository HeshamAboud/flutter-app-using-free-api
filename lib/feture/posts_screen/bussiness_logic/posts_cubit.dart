import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:map_app/model/post_model/get_input_post_model.dart';
import 'package:meta/meta.dart';

import '../../../core/network_exceptions.dart';
import '../data/repository/repo_post.dart';

part 'posts_state.dart';

class PostsCubit extends Cubit<PostsState> {
  PostsRepository repository;
  PostsCubit(this.repository) : super(PostsInitial());

  static PostsCubit get(context) => BlocProvider.of(context);

  getPostsData() {
    emit(GetPostsLoadingState());
    repository.getPosts().then((value) {
      value.when(
        success: (data) {
          emit(GetPostsSuccess1State(partiesData: data));
        },
        failure: (networkExceptions) {
          emit(GetPostsErrorState(networkExceptions: networkExceptions));
        },
      );
    });
  }
}
