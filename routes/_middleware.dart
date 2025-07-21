import 'package:dart_frog/dart_frog.dart';
import 'package:shelf_cors_headers/shelf_cors_headers.dart' as shelf;

import '../middleware/integration_test_preference_provider.dart';
import '../middleware/test_types_provider.dart';
import '../middleware/testing_question_provider.dart';

Handler middleware(Handler handler) => handler
    .use(testingQuestionProvider)
    .use(testTypesProvider)
    .use(integrationTestPreferenceProvider)
    .use(requestLogger())
    .use(
      fromShelfMiddleware(
        shelf.corsHeaders(
          headers: {
            shelf.ACCESS_CONTROL_ALLOW_ORIGIN:
                'https://presentation-answer.globeapp.dev',
          },
        ),
      ),
    );
