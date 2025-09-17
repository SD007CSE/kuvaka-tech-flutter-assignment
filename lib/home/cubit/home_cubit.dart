import 'package:application/home/cubit/home_state.dart';
import 'package:bloc/bloc.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(StartTrip());

  void startTrip() {
    emit(LoadingState());
    Future.delayed(Duration(seconds: 1), () {
      emit(OnGoingTrip());
    });
  }
  void onGoingTrip(){
    emit(LoadingState());
    Future.delayed(Duration(seconds: 1), () {
    emit(ArrivedAtRestaurant());
    });
  }

  void confirmPickup(){
    emit(LoadingState());
    Future.delayed(Duration(seconds: 1), () {
    emit(OnGoingTripToCustomer());
    });
  }
  void orderDelivered(){
    emit(LoadingState());
    Future.delayed(Duration(seconds: 1), () {
    emit(Delivered());
    });
  }
}
