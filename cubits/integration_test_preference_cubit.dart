import 'package:broadcast_bloc/broadcast_bloc.dart';
import '../models/integration_test_preference.dart';

class IntegrationTestPreferenceCubit
    extends BroadcastCubit<IntegrationTestPreference> {
  IntegrationTestPreferenceCubit() : super(IntegrationTestPreference());

  void voteYes() {
    emit(state.copyWith(yes: state.yes + 1));
  }

  void voteNo() {
    emit(state.copyWith(no: state.no + 1));
  }

  void reset() {
    emit(IntegrationTestPreference());
  }
}