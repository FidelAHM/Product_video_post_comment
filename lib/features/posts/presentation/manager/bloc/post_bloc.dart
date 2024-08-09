import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gift_shop/core/navigator_key.dart';
import 'package:gift_shop/core/widget/dialog/custom_snack_bard.dart';
import 'package:gift_shop/features/posts/Data_source/Model/post_model.dart';
import 'package:gift_shop/features/posts/Data_source/post_api.dart';

part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  PostBloc() : super(PostInitial()) {
    on<LoadPostEvent>((event, emit) async {
      emit(PostLoadingState());
      try {
        final posts = await PostAPI().listPosts();
        print('success');
        emit(PostDataLoadedState(posts as List<PostModel>));

      } catch (e) {
         print('___________Error ${e}');
         CustomSnackbar(navigatorKey.currentContext!)
            .showErrorMessage('An error an occured');
        emit(PostDataError('an error  has occured'));

      }
    });
  }
}
