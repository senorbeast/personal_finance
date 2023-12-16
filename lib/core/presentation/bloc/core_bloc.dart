import 'package:bloc/bloc.dart' show Bloc, Emitter;
import 'package:meta/meta.dart';

part 'core_event.dart';
part 'core_state.dart';

class CoreBloc extends Bloc<CoreEvent, CoreState> {
  CoreBloc() : super(CoreInitial()) {
    on<CoreGetData>(_getUserData);
    on<CoreUpdateData>(_updateUserData);
  }
  Future<void> _getUserData(event, Emitter<CoreState> emit) async {}
  Future<void> _updateUserData(event, Emitter<CoreState> emit) async {}
}
