import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:twitter_clone/core/failure.dart';
import 'package:twitter_clone/core/providers.dart';
import 'package:twitter_clone/core/type_defs.dart';

final authAPIProvider = Provider((ref) {
  return AuthAPI(account: ref.watch(appwriteAccountProvider));
});

abstract class IAuthAPI {
  FutureEither<User> signup({
    required String email,
    required String password,
  });

  FutureEither<Account> signin({
    required String email,
    required String password,
  });
}

class AuthAPI implements IAuthAPI {
  final Account _account;
  AuthAPI({
    required Account account,
  }) : _account = account;

  @override
  FutureEither<User> signup(
      {required String email, required String password}) async {
    try {
      final account = await _account.create(
          userId: ID.unique(), email: email, password: password);

      return right(account);
    } on AppwriteException catch (e, stackTrace) {
      return left(
          Failure(errorMessage: e.message ?? "Error", stackTrace: stackTrace));
    } catch (e, stackTrace) {
      return left(Failure(errorMessage: e.toString(), stackTrace: stackTrace));
    }
  }

  @override
  FutureEither<Account> signin(
      {required String email, required String password}) {
    // TODO: implement signup
    throw UnimplementedError();
  }
}
