import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twitter_clone/apis/auth_api.dart';
import 'package:twitter_clone/core/utils.dart';
import 'package:twitter_clone/features/auth/view/login_view.dart';
import 'package:twitter_clone/features/home/view/home_view.dart';

final authControllerProvider =
    StateNotifierProvider<AuthController, bool>((ref) {
  return AuthController(
    authAPI: ref.watch(authAPIProvider),
  );
});

final authStateProvider = FutureProvider((ref) async {
  final authController = ref.watch(authControllerProvider.notifier);
  return authController.getCurrentUserAuthState();
});

class AuthController extends StateNotifier<bool> {
  final AuthAPI _authAPI;
  AuthController({required AuthAPI authAPI})
      : _authAPI = authAPI,
        super(false);

  // state = isLoading

  Future<User?> getCurrentUserAuthState() async =>
      await _authAPI.getAuthState();

  void login({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    state = true;

    final res = await _authAPI.login(email: email, password: password);

    res.fold((l) {
      showSnackBar(context, l.errorMessage);
      state = false;
    }, (r) {
      state = false;
      showSnackBar(context, "User Successfully Logged In");
      Navigator.pushReplacement(context, HomeView.route());
    });
  }

  void signup({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    state = true;

    final res = await _authAPI.signup(email: email, password: password);

    res.fold((l) {
      showSnackBar(context, l.errorMessage);
      state = false;
    }, (r) {
      state = false;
      showSnackBar(context, "Account Successfully Created, Please Log In");
      Navigator.push(context, LoginView.route());
    });
  }
}
