part of 'home_bloc.dart';

class HomeState extends Equatable {
  final String username;
  final String email;
  final User? user;
  final List<Transaction?>? transactions;

  const HomeState({
    required this.user,
    required this.username,
    required this.email,
    required this.transactions,
  });

  // Factory method for a default AuthenticationState
  factory HomeState.defaultState() {
    return const HomeState(
      username: '',
      email: '',
      user: null,
      transactions: null,
    );
  }

  @override
  List<Object?> get props => [
        username,
        email,
        user,
        transactions,
      ];

  HomeState copyWith({
    String? username,
    String? email,
    User? user,
    List<Transaction?>? transactions,
  }) {
    return HomeState(
      email: email ?? this.email,
      username: username ?? this.username,
      user: user ?? this.user,
      transactions: transactions ?? this.transactions,
    );
  }
}
