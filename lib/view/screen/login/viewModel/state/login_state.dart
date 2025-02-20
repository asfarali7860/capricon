
import 'package:capricon/data/remote/login/models/login_model.dart';

sealed class LoginState {
  const LoginState();
}

final class LoginInitial extends LoginState{
  const LoginInitial();
}

final class LoginLoading extends LoginState{
  const LoginLoading();
}

final class LoginLoaded extends LoginState {
  const LoginLoaded({required this.data});

  final LoginReesponseModel data;
}

final class LoginError extends LoginState{
  const LoginError({this.ex});

  final String? ex;
}

extension LoginExtension on LoginState {
  bool get isSuccess {
    switch(this) {
      case LoginLoaded(data: _):
        return true;
      default:
        return false;
    }
  }

  LoginReesponseModel? get loginResponse {
    switch(this){
      case LoginLoaded(data: final data):
        return data;
      default:
        return null;
    }
  }

  bool get isLoading {
    switch(this) {
      case LoginLoading():
        return true;
      default:
        return false;
    }
  }
}