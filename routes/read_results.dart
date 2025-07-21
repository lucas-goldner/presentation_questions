import 'package:dart_frog/dart_frog.dart';

import 'package:dart_frog_web_socket/dart_frog_web_socket.dart';

import '../cubits/integration_test_preference_cubit.dart';
import '../cubits/test_types_cubit.dart';
import '../cubits/testing_question_cubit.dart';

Future<Response> onRequest(RequestContext context) async {
  final handler = webSocketHandler((channel, protocol) {
    final testingQuestionCubit = context.read<TestingQuestionCubit>()
      ..subscribe(channel);
    final testTypesCubit = context.read<TestTypesCubit>()..subscribe(channel);
    final integrationTestPreferenceCubit =
        context.read<IntegrationTestPreferenceCubit>()..subscribe(channel);

    channel.stream.listen(
      (_) {
        final combinedState = {
          'testing_question': testingQuestionCubit.state.toJson(),
          'test_types': testTypesCubit.state.toJson(),
          'integration_test_preference':
              integrationTestPreferenceCubit.state.toJson(),
        };
        channel.sink.add(combinedState);
      },
      onDone: () {
        testingQuestionCubit.unsubscribe(channel);
        testTypesCubit.unsubscribe(channel);
        integrationTestPreferenceCubit.unsubscribe(channel);
      },
    );
  });
  return handler(context);
}
