
import 'package:dalalah/src/settings/domain/entities/about_us.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';

import '../../src/home/domain/entities/car.dart';
import '../exceptions/empty_list_exception.dart';
import '../network/api_response.dart';
import '../resources/data_state.dart';

abstract class BaseCubit extends Cubit<DataState>{
  BaseCubit() : super(UnInitState());

  executeSuccess<T>(Future<T> Function() invoke) async {
    try {
      emit(DataLoading());
      final response = await invoke();
      if(response == null || response is List && response.isEmpty || response is Map && response.isEmpty || response is String && response.isEmpty || (response is AboutUs &&  response.description!.isEmpty)){
        print('invoke response $response');
        throw EmptyListException();
      } else {
        print('response  sscc $response');
        emit(DataSuccess<T>(response));
      }
    } catch (e) {
      print('invoke e $e');
      emit(DataFailed(e));
      rethrow;
    }
  }
  executeBuilder<T>(Future<T> Function() invoke,
      {bool isRefresh = false, required ValueChanged<T> onSuccess , ValueChanged ? onError}) async {
    try {
      if(isRefresh){
        emit(DataLoading());
      }
      final response = await invoke();
      // print('invoke response ${(response is ApiResponse<List<C>> && response.data  == [])}');
      if(response == null || ( (response is ApiResponse<dynamic> && response.data is List && response.data == [])) || (  (response is List && response.isEmpty)) || response is Map && response.isEmpty || response is String && response.isEmpty || (response is AboutUs &&  response.description!.isEmpty)){
        print('invoke $response');
        throw EmptyListException();
      } else {
        print('response  sscc $response');
        onSuccess(response);
      }
    } catch (e) {
      if(onError!=null){
        onError(e);
      }else {
        emit(DataFailed(e));
      }
      rethrow;
    }
  }

  executeSuccessNotLoading<T>(Future<T> Function() invoke) async {
    try {
      emit(DataLoading());
      final response = await invoke();
      emit(DataSuccess<T>(response));
    } catch (e) {
      emit(DataFailed(e));
      rethrow;
    }
  }

  executeListener<T>(Future<T> Function() invoke,
      {required ValueChanged<T> onSuccess}) async {
    try {
      emit(LoadingStateListener());
      final response = await invoke();
      onSuccess(response);
    } catch (e) {
      print(e);
      emit(FailureStateListener(e));
      rethrow;
    }
  }

  executeEmitterListener(Future Function() invoke) {
    executeListener(() => invoke(), onSuccess: (v) {
      print('executeEmitterListener $v');
      emit((SuccessStateListener<String>(v.toString())));
    });
  }

  executeEmitterSuccess(Future Function() invoke, {ValueChanged? onSuccess}) {
    executeListener(() => invoke(), onSuccess: (v) {
      if(onSuccess!=null){
        onSuccess(v);
      }
      emit((SuccessState(v.toString())));
    });
  }


  executeEmitterMessage(Future Function() invoke) {
    executeListener(() => invoke(), onSuccess: (v) {
      emit((SuccessMessageState(v.toString())));
    });
  }

  executeEmitterData(Future<ApiResponse> Function() invoke) {
    executeListener(() => invoke(), onSuccess: (v) {
      emit(DataSuccess(v));
    });
  }
}