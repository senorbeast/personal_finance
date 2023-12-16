import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:personal_finance/home/domain/usecases/dashboard_use_cases.dart';
import 'package:personal_finance/models/ModelProvider.dart';
import 'package:personal_finance/models/User.dart';

part 'home_event.dart';
part 'home_state.dart';

@injectable
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final DashboardUseCase _dashboardUseCase; // Inject the use case

  HomeBloc(this._dashboardUseCase) : super(HomeState.defaultState()) {
    on<GetUserData>(_onGetUserData);
    on<GetAllTransactions>(_onAllTransactions);
  }

  void _onGetUserData(GetUserData event, Emitter<HomeState> emit) async {
    try {
      emit(state.copyWith());
      // Use the authentication use case to sign up the user
      final user = await _dashboardUseCase.getUserData(
        userId: event.userId,
        email: event.email,
      );

      emit(state.copyWith(
        user: user,
      ));
      print("Got User data");
    } catch (e) {
      // Handle sign-up failure, emit an unauthenticated state or show an error
      emit(HomeState.defaultState());
      print("Error: Cant get User Data: ${e.toString()}");
    }
  }

  void _onAllTransactions(
      GetAllTransactions event, Emitter<HomeState> emit) async {
    try {
      emit(state.copyWith());
      // Use the authentication use case to sign up the user
      final transactions = await _dashboardUseCase.getUserTransactions(
        userId: event.userId,
      );

      emit(state.copyWith(
        transactions: transactions,
      ));
      print("Got txns");
    } catch (e) {
      // Handle sign-up failure, emit an unauthenticated state or show an error
      emit(HomeState.defaultState());
      print("Error: Cant get Txn Data: ${e.toString()}");
    }
  }
}
