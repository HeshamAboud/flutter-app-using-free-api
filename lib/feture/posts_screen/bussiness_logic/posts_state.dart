part of 'posts_cubit.dart';

@immutable
abstract class PostsState {}

class PostsInitial extends PostsState {}
class GetPostsLoadingState extends PostsState {}
class GetPostsSuccess1State extends PostsState {
  List<GetPostOutPutModel> partiesData;
  GetPostsSuccess1State({required this.partiesData});
}
class GetPostsErrorState extends PostsState {
  NetworkExceptions networkExceptions;
  GetPostsErrorState({required this.networkExceptions});
}
