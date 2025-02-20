import 'package:capricon/core/state/data_state.dart';
import 'package:capricon/data/remote/login/models/login_model.dart';

abstract interface class LoginRepository {
  Future<DataState<LoginReesponseModel>> login({required LoginRequestModel loginRequestModel});
}