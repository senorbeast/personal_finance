import 'package:equatable/equatable.dart';
import 'package:personal_finance/core/domain/entities/api_result_model.dart';

abstract class BaseParamsUseCase<Response, Request> {
  Future<ApiResultModel<Response>> call(Request? params);
}

class NoParams extends Equatable {
  @override
  List<Object> get props => <Object>[];
}
