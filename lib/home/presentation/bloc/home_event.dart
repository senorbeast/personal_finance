part of 'home_bloc.dart';

abstract class HomeEvent {
  const HomeEvent();

  List<Object> get props => [];
}

class GetUserData extends HomeEvent {
  final String userId;
  final String email;

  const GetUserData(this.userId, this.email);

  @override
  List<Object> get props => [
        userId,
        email,
      ];
}

class GetAllTransactions extends HomeEvent {
  final String userId;

  const GetAllTransactions(
    this.userId,
  );

  @override
  List<Object> get props => [
        userId,
      ];
}
