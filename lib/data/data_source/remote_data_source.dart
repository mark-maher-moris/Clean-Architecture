import 'package:clean_architecture/data/network/requests.dart';
import 'package:clean_architecture/data/responses/responses.dart';
import 'package:clean_architecture/domain/model/models.dart';

abstract class RemoteDataSource {
  Future<AuthenticationResponse> login(LoginRequest loginRequest);
}
