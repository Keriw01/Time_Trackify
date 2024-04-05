import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:time_trackify/blocs/auth/auth_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:time_trackify/styles/colors.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:time_trackify/widgets/custom_underline_input_border.dart';
import 'package:time_trackify/widgets/loading_indicator.dart';

@RoutePage()
class RegistrationPage extends StatelessWidget {
  RegistrationPage({super.key});

  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
            child: SingleChildScrollView(
              reverse: true,
              child: Column(
                children: <Widget>[
                  const SizedBox(height: 20),
                  Text(
                    "Rejestracja",
                    style: Theme.of(context).textTheme.displayLarge,
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 240,
                    child: SvgPicture.asset('assets/images/login_logo.svg'),
                  ),
                  const SizedBox(height: 20),
                  Form(
                    key: formKey,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(55, 0, 55, 10),
                          child: TextFormField(
                            controller: emailController,
                            keyboardType: TextInputType.emailAddress,
                            validator: (value) {
                              if (value != null) {
                                if (value.contains('@')) {
                                  return null;
                                }
                                return "Wprowadź poprawny adres e-mail";
                              }
                              return null;
                            },
                            cursorColor: seedColor,
                            style: const TextStyle(
                              color: blackColor,
                              fontFamily: 'OpenSans',
                              fontSize: 14,
                            ),
                            decoration: const InputDecoration(
                              filled: true,
                              fillColor: whiteColor,
                              errorBorder: underlineInputBorder,
                              focusedErrorBorder: underlineInputBorder,
                              focusedBorder: underlineInputBorder,
                              enabledBorder: underlineInputBorder,
                              prefixIcon: Icon(
                                Icons.email,
                                color: seedColor,
                                size: 22,
                              ),
                              labelText: "Wpisz swój e-mail",
                              labelStyle: TextStyle(
                                color: blackColor,
                                fontSize: 14,
                              ),
                              floatingLabelStyle: TextStyle(
                                color: blackColor,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(55, 10, 55, 10),
                          child: TextFormField(
                            controller: passwordController,
                            keyboardType: TextInputType.emailAddress,
                            validator: (value) {
                              if (value == null || value.trim().isEmpty) {
                                return "Hasło jest wymagane";
                              }
                              if (value.trim().length < 8) {
                                return "Hasło musi mieć co najmniej 8 znaków";
                              }
                              return null;
                            },
                            cursorColor: seedColor,
                            style: const TextStyle(
                              color: blackColor,
                              fontFamily: 'OpenSans',
                              fontSize: 14,
                            ),
                            decoration: const InputDecoration(
                              filled: true,
                              fillColor: whiteColor,
                              errorBorder: underlineInputBorder,
                              focusedErrorBorder: underlineInputBorder,
                              focusedBorder: underlineInputBorder,
                              enabledBorder: underlineInputBorder,
                              prefixIcon: Icon(
                                Icons.lock,
                                color: seedColor,
                                size: 22,
                              ),
                              labelText: "Wpisz swoje hasło",
                              labelStyle: TextStyle(
                                color: blackColor,
                                fontSize: 14,
                              ),
                              floatingLabelStyle: TextStyle(
                                color: blackColor,
                                fontSize: 12,
                              ),
                            ),
                            obscureText: true,
                          ),
                        ),
                        if (state.errorMessage != '')
                          Text(
                            state.errorMessage,
                            style: const TextStyle(
                              color: Colors.red,
                              fontSize: 12.0,
                            ),
                          ),
                        if (state.isLoading)
                          const LoadingIndicator(width: 75, height: 75)
                        else
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: ElevatedButton(
                              onPressed: () async {
                                if (formKey.currentState!.validate()) {
                                  context.read<AuthBloc>().register(
                                        emailController.text.trim(),
                                        passwordController.text.trim(),
                                      );
                                } else {
                                  emailController.clear();
                                  passwordController.clear();
                                }
                              },
                              style: ButtonStyle(
                                padding: MaterialStateProperty.all<EdgeInsets>(
                                  const EdgeInsets.fromLTRB(75, 10, 75, 10),
                                ),
                                backgroundColor:
                                    MaterialStateProperty.all(seedColor),
                                shape: MaterialStateProperty.all(
                                  const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(20.0),
                                    ),
                                  ),
                                ),
                                overlayColor: const MaterialStatePropertyAll(
                                  primaryColor,
                                ),
                              ),
                              child: Text(
                                "Zarejestruj",
                                style:
                                    Theme.of(context).textTheme.displayMedium,
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: TextButton(
                          onPressed: () =>
                              context.read<AuthBloc>().navigateToLoginPage(),
                          child: Text(
                            "Masz już konto ? Zaloguj się",
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall
                                ?.copyWith(color: blackColor),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 1,
                        width: 70,
                        color: primaryColor,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: Text(
                          "LUB",
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall
                              ?.copyWith(color: blackColor),
                        ),
                      ),
                      Container(
                        height: 1,
                        width: 70,
                        color: primaryColor,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          FontAwesomeIcons.google,
                          color: seedColor,
                        ),
                        splashRadius: 0.1,
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          FontAwesomeIcons.facebook,
                          color: seedColor,
                        ),
                        splashRadius: 0.1,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
