import 'package:bloc/bloc.dart';
import 'package:e_learning/data/model/post.dart';
import 'package:e_learning/data/repository/api_repository.dart';
import 'package:meta/meta.dart';

part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  final ApiRepository apiRepository;
  PostBloc({required this.apiRepository}) : super(PostInitial()) {
    on<PostEvent>((event, emit) async {
      if (event is LoadPostEvent || event is PullToRefreshEvent) {
        emit(LoadingState());
        try {
          final posts = await apiRepository.getPostsList();
          emit(LoadedState(posts: posts));
      } catch (e) {
          emit(FailedToLoadState(message: e.toString()));
        }
      }
    });
  }
}
