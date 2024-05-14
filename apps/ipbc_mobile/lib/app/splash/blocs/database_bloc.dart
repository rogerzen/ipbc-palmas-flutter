import 'package:auth_module/auth_module.dart';
import 'package:core_module/core_module.dart';
import 'package:flutter/material.dart';

class DatabaseBloc extends Bloc<DatabasesEvent, DatabasesState> {
  final AuthUseCase useCases;
  final String path = 'auth';

  DatabaseBloc({required this.useCases})
      : super(LoadingState()) {
    on<GetDataEvent>(_getData);
  }

  _getData(GetDataEvent event, emit) async {
    //var data = await useCases.get(path);
   // if((data as HiveAuthDTO).token != ""){
      emit(FetchingDataState(false));
  //  } else {
   //   emit(FetchingDataState(true));
   // }
  }
}

@immutable
abstract class DatabasesEvent {}

class GetDataEvent extends DatabasesEvent {
  GetDataEvent();
}

@immutable
abstract class DatabasesState {}

class LoadingState extends DatabasesState {
  LoadingState();
}

class ExceptionState extends DatabasesState {
  final String message;
  ExceptionState(this.message);
}

class FetchingDataState extends DatabasesState {
  final bool isData;
  FetchingDataState(this.isData);
}