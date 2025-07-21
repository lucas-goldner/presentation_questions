import 'package:dart_frog/dart_frog.dart';

import '../cubits/test_types_cubit.dart';
import '../cubits/testing_question_cubit.dart';

Response onRequest(RequestContext context) {
  context.read<TestingQuestionCubit>().reset();
  context.read<TestTypesCubit>().reset();
  return Response(body: 'Reset successful');
}
