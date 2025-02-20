import 'package:capricon/core/api_client.dart';
import 'package:capricon/data/remote/login/login_repository.dart';
import 'package:capricon/data/remote/login/login_repository_impl.dart';
import 'package:capricon/utils/utils.dart';

final apiClientProvider = Provider<ApiClient>((ref) => ApiClient(ref));
final loginRepositoryProvider = Provider<LoginRepository>((ref) => LoginRepositoryImpl(ref.watch(apiClientProvider)));