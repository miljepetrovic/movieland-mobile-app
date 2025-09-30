import 'package:equatable/equatable.dart';

abstract class UseCase<TResponse, TParams> {
  Future<TResponse> call(TParams params);
}

class NoParams extends Equatable {
  const NoParams();

  @override
  List<Object> get props => [];
}

abstract class Params extends Equatable {
  const Params();
}