import 'package:capricon/core/api_client.dart';
import 'package:capricon/core/endpoints.dart';
import 'package:capricon/core/exception.dart';
import 'package:capricon/core/state/data_state.dart';
import 'package:capricon/data/remote/search/models/search_model.dart';
import 'package:capricon/data/remote/search/search_repository.dart';

class SearchRepositoryImpl implements SearchRepository {
  final ApiClient _apiClient;
  SearchRepositoryImpl(this._apiClient);

  @override
  Future<DataState<SearchResponseModel>> getSearch({required QuerySearch querySearch}) async {
    try{
      final response = await _apiClient.get(
        EndPoints.login.val(),
        queryParams: querySearch.toJson()
      );

    return DataStateSuccess<SearchResponseModel>(data: SearchResponseModel.fromJson(response.data));
    }catch(ex){
      return DataStateError<SearchResponseModel>(ex: ApiException(ex.toString()));
    }
  }
}