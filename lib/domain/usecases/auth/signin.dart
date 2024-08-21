import 'package:dartz/dartz.dart';
import 'package:spotify_project/core/usecase/usecase.dart';
import 'package:spotify_project/data/models/auth/signin_user_req.dart';

import '../../../service_locator.dart';
import '../../repository/auth/auth.dart';

class SigninUseCase implements UseCase<Either,SigninUserReq> {
  @override
  Future<Either> call({SigninUserReq ? params}) async {
    return sl<AuthRepository>().signin(params!);
  }

}