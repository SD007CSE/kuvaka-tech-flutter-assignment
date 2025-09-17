import 'package:equatable/equatable.dart';

abstract class HomeState extends Equatable {}

class StartTrip extends HomeState{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class OnGoingTrip extends HomeState{
  @override
  // TODO: implement props
  List<Object?> get props => [];

}

class ArrivedAtRestaurant extends HomeState{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class OnGoingTripToCustomer extends HomeState{
  @override
  // TODO: implement props
  List<Object?> get props => [];

}

class ArrivedAtCustomer extends HomeState{
  @override
  // TODO: implement props
  List<Object?> get props => [];

}

class Delivered extends HomeState{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class LoadingState extends HomeState{
  @override
  // TODO: implement props
  List<Object?> get props => [];

}
