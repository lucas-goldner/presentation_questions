import 'package:broadcast_bloc/broadcast_bloc.dart';

import '../models/testing_question_answers.dart';

class TestingQuestionCubit extends BroadcastCubit<TestingQuestionAnswersCount> {
  TestingQuestionCubit()
      : super(TestingQuestionAnswersCount(doesTest: 0, doesNotTest: 0));

  void increaseDoesTest() {
    emit(state.copyWith(doesTest: state.doesTest + 1));
  }

  void increaseDoesNotTest() {
    emit(state.copyWith(doesNotTest: state.doesNotTest + 1));
  }

  void reset() {
    emit(TestingQuestionAnswersCount(doesTest: 0, doesNotTest: 0));
  }
}
