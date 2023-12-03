part of 'core_bloc.dart';

@immutable
sealed class CoreEvent {
  const CoreEvent();
}

final class CoreGetData extends CoreEvent {
  const CoreGetData();
}

final class CoreUpdateData extends CoreEvent {
  const CoreUpdateData();
}
