import 'package:dart_frog/dart_frog.dart';

import '../cubits/testing_question_cubit.dart';

Future<Response> onRequest(RequestContext context) async {
  final body = await context.request.json() as Map<String, dynamic>;
  final vote = body['vote'] as int?;

  if (vote == null) {
    return Response(statusCode: 400, body: 'Invalid vote');
  }

  if (vote == 1) {
    context.read<TestingQuestionCubit>().increaseDoesTest();
  } else if (vote == 0) {
    context.read<TestingQuestionCubit>().increaseDoesNotTest();
  }

  return Response(
    body: 'Vote received: $vote',
  );
}
