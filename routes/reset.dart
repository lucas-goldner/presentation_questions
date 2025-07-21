import 'package:dart_frog/dart_frog.dart';

import '../cubits/testing_question_cubit.dart';

Response onRequest(RequestContext context) {
  context.read<TestingQuestionCubit>().reset();
  return Response(body: 'Reset successful');
}
