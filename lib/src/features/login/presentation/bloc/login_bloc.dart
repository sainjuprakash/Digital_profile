import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../data/repository/login_repository_impl.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final ImplLoginRepository _loginRepository;
  LoginBloc({required ImplLoginRepository loginRepository})
      : _loginRepository = loginRepository,
        super(LoginLoading()) {
    on<GetLoginEvent>((event, emit) async {
      try {
        await _loginRepository.login(event.email, event.password);
      } catch (errMsg) {
        emit(LoginFailure(errMsg: errMsg.toString()));
      }
    });
  }
}
