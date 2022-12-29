import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_projects/application/home/home_event.dart';
import 'package:flutter_projects/application/home/home_state.dart';


class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeState()) {

    on<HomeEvent>((event, emit) async {
      
    });
  }
}