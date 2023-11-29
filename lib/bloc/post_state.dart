part of 'post_bloc.dart';

@immutable
sealed class PostState {}

final class PostInitial extends PostState {}

final class LoadingState extends PostState {}

class LoadedState extends PostState {
  final List<Post> posts;
  LoadedState({
    required this.posts,
  });
}

class FailedToLoadState extends PostState {
  final String message;
  FailedToLoadState({
    required this.message,
  });
}
