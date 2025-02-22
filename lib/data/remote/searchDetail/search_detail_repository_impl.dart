import 'package:capricon/core/api_client.dart';
import 'package:capricon/core/endpoints.dart';
import 'package:capricon/core/exception.dart';
import 'package:capricon/core/state/data_state.dart';
import 'package:capricon/data/remote/searchDetail/models/search_detail_model.dart';
import 'package:capricon/data/remote/searchDetail/search_detail_repository.dart';
import 'package:capricon/utils/logger.dart';

class SearchDetailRepositoryImpl implements SearchDetailRepository {
  final ApiClient _apiClient;
  SearchDetailRepositoryImpl(this._apiClient);

  @override
  Future<DataState<SearchDetailResponseModel>> getSearchDetail({required String searchId}) async {
    Logger.printError("${EndPoints.searchId.val()}$searchId");
    try{
      final response = await _apiClient.get(
        "${EndPoints.searchId.val()}$searchId",
      );
      Logger.printError(response.toString());

    return DataStateSuccess<SearchDetailResponseModel>(data: SearchDetailResponseModel.fromJson(response.data));
    }catch(ex){
      Logger.printError(ex.toString());
      return DataStateError<SearchDetailResponseModel>(ex: ApiException(ex.toString()));
    }
  }
}