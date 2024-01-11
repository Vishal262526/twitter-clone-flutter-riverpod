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

  FutureEither<Session> login({
    required String email,
    required String password,
  });

  Future<User?> getAuthState();
}

class AuthAPI implements IAuthAPI {
  final Account _account;
  AuthAPI({
    required Account account,
  }) : _account = account;

  // Get the User Authentication Status (if user is logged in reutnr User object otherwise return null)
  @override
  Future<User?> getAuthState() async {
    try {
      return await _account.get();
    } on AppwriteException catch (e) {
      return null;
    } catch (e) {
      return null;
    }
  }

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
  FutureEither<Session> login(
      {required String email, required String password}) async {
    try {
      final session =
          await _account.createEmailSession(email: email, password: password);

      return right(session);
    } on AppwriteException catch (e, stackTrace) {
      return left(
          Failure(errorMessage: e.message ?? "Error", stackTrace: stackTrace));
    } catch (e, stackTrace) {
      return left(Failure(errorMessage: e.toString(), stackTrace: stackTrace));
    }
  }
}
