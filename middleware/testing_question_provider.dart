import 'package:dart_frog/dart_frog.dart';

import '../cubits/testing_question_cubit.dart';

final _testingQuestionCubit = TestingQuestionCubit();

final testingQuestionProvider =
    provider<TestingQuestionCubit>((_) => _testingQuestionCubit);
