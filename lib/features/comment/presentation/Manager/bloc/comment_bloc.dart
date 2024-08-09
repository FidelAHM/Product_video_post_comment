import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gift_shop/core/navigator_key.dart';
import 'package:gift_shop/core/widget/dialog/custom_snack_bard.dart';
import 'package:gift_shop/features/comment/data_source/Model/comment_model.dart';
import 'package:gift_shop/features/comment/data_source/comment_api.dart';

part 'comment_event.dart';
part 'comment_state.dart';

class CommentBloc extends Bloc<CommentEvent, CommentState> {
  CommentBloc() : super(CommentInitial()) {
    on<LoadCommentEvent>((event, emit) async {
      emit(CoomentLoadingState());

      try {
        final comments = await CommentAPI().listComments();
        print('__success');
        emit(CommentDataLoadedState(comments as List<CommentModel>));
      } catch (e) {
        print('___________Error ${e}');
        CustomSnackbar(navigatorKey.currentContext!)
            .showErrorMessage('An error an occured');
        emit(CommentDataError('An error has occured'));

      }
    });
  }
}
