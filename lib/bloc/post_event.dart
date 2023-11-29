part of 'post_bloc.dart';

@immutable
sealed class PostEvent {}

class LoadPostEvent extends PostEvent {}

class PullToRefreshEvent extends PostEvent {}
