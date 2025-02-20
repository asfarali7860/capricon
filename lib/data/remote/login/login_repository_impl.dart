import 'package:capricon/core/api_client.dart';
import 'package:capricon/core/endpoints.dart';
import 'package:capricon/core/exception.dart';
import 'package:capricon/core/state/data_state.dart';
import 'package:capricon/data/remote/login/login_repository.dart';
import 'package:capricon/data/remote/login/models/login_model.dart';

class LoginRepositoryImpl implements LoginRepository {
  final ApiClient _apiClient;
  LoginRepositoryImpl(this._apiClient);

  @override
  Future<DataState<LoginReesponseModel>> login({required LoginRequestModel loginRequestModel}) async {
    try{
      final response = await _apiClient.post(
        EndPoints.login.val(),
        loginRequestModel.toJson()
      );

    return DataStateSuccess<LoginReesponseModel>(data: LoginReesponseModel.fromJson(response.data));
    }catch(ex){
      return DataStateError<LoginReesponseModel>(ex: ApiException(ex.toString()));
    }
  }
}