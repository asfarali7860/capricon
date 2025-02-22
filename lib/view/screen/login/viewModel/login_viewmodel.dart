
import 'dart:convert';

import 'package:capricon/core/constant.dart';
import 'package:capricon/core/state/data_state.dart';
import 'package:capricon/data/remote/login/login_repository.dart';
import 'package:capricon/data/remote/login/models/login_model.dart';
import 'package:capricon/domain/providers/repository_provider.dart';
import 'package:capricon/utils/utils.dart';
import 'package:capricon/view/screen/login/viewModel/state/login_state.dart';
import 'package:shared_preferences/shared_preferences.dart';

final loginNotifierProvider = StateNotifierProvider<LoginNotifier, LoginState>((ref)=> LoginNotifier(ref: ref, repository: ref.watch(loginRepositoryProvider)));

class LoginNotifier extends StateNotifier<LoginState>{
  late final Ref ref;
  late final LoginRepository repository;
  LoginNotifier({required this.ref, required this.repository}):super(const LoginInitial());

  Future<void> login(LoginRequestModel loginRequestModel) async{
    state = const LoginLoading();
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final resposne = await repository.login(loginRequestModel: loginRequestModel);
    switch(resposne){
      case DataStateSuccess<LoginReesponseModel>(data: var data):
        prefs.setString(KeyConstants.accessToken, data.jwt ?? "");
        String loginJson = jsonEncode(data.toJson());
        prefs.setString(KeyConstants.loginData, loginJson);
        getUserData();
        state = LoginLoaded(data: data);
      case DataStateError<LoginReesponseModel>(ex: var ex):
        state = LoginError(ex: ex.toString());
    }
  }

  Future<void> getUserData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userJson = prefs.getString(KeyConstants.loginData);

    if (userJson != null) {
      LoginReesponseModel loginReesponseModel =  LoginReesponseModel.fromJson(jsonDecode(userJson));
      Logger.printSuccess(loginReesponseModel.toString());
      state = LoginLoaded(data: loginReesponseModel);
    } else {
      state = LoginError();
    }
  }
}