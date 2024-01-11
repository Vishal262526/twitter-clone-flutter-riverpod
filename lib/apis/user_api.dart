import 'package:twitter_clone/core/type_defs.dart';

abstract class IUserAPI {
  FutureEitherVoid savedUserDate(
      {required String email, required String password});
}

class UserAPI implements IUserAPI {
  @override
  FutureEitherVoid savedUserDate(
      {required String email, required String password}) {
    // TODO: implement savedUserDate
    throw UnimplementedError();
  }
}
