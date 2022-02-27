part of 'relative_bloc.dart';

abstract class RelativeState extends Equatable {
  const RelativeState();
}

class RelativeLoadingState extends RelativeState {
  @override
  List<Object> get props => [];
}

class RelativeErrorState extends RelativeState {
  final String errorMessage;

  const RelativeErrorState(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}

class RelativeLoadedState extends RelativeState {
  final RelativeModel? allRelativesData;

  const RelativeLoadedState({required this.allRelativesData});

  @override
  List<Object?> get props => [allRelativesData];
}

class RelativeNoInternetState extends RelativeState {
  @override
  List<Object> get props => [];
}
