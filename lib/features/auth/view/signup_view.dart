import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twitter_clone/common/loader_widget.dart';
import 'package:twitter_clone/common/rounded_small_button.dart';
import 'package:twitter_clone/constants/ui_constants.dart';
import 'package:twitter_clone/features/auth/controller/auth_controller.dart';
import 'package:twitter_clone/features/auth/view/login_view.dart';
import 'package:twitter_clone/features/auth/widgets/auth_field.dart';
import 'package:twitter_clone/theme/pallate.dart';

class SignUpView extends ConsumerStatefulWidget {
  static route() => MaterialPageRoute(
        builder: (context) => const SignUpView(),
      );
  const SignUpView({super.key});

  @override
  ConsumerState<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends ConsumerState<SignUpView> {
  final AppBar appBar = UIConstants.appBar();
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;

  @override
  void initState() {
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void onSignUp() {
    ref.read(authControllerProvider.notifier).signup(
          email: _emailController.text,
          password: _passwordController.text,
          context: context,
        );
  }

  @override
  Widget build(BuildContext context) {
    final isLoading = ref.watch(authControllerProvider);

    return Scaffold(
      appBar: appBar,
      body: isLoading
          ? const LoadingScreen()
          : Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Text Field 1
                      AuthField(
                        controller: _emailController,
                        placeholder: "Email Address",
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      // Text Field 2
                      AuthField(
                        controller: _passwordController,
                        placeholder: "Password",
                        secureEntry: true,
                      ),
                      const SizedBox(
                        height: 32,
                      ),
                      // Done Button
                      Align(
                        alignment: Alignment.centerRight,
                        child: RoundedSmallButton(
                          label: "Done",
                          onTap: onSignUp,
                        ),
                      ),
                      const SizedBox(
                        height: 32,
                      ),

                      // Text Span
                      RichText(
                        text: TextSpan(
                          text: "Already have an account? ",
                          style: const TextStyle(fontSize: 16),
                          children: [
                            TextSpan(
                              text: "Log In",
                              style: const TextStyle(
                                color: Pallate.kBlueColor,
                                fontSize: 16,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.push(
                                    context,
                                    LoginView.route(),
                                  );
                                },
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
