import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_gym_app/app/cubit/root_cubit.dart';

class LoginPage extends StatefulWidget {
  LoginPage({
    Key? key,
  }) : super(key: key);

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var errorMessage = '';
  var isCreatingAccount = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            opacity: 0.3,
            image: AssetImage("images/login_page_wallpaper.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        alignment: Alignment.center,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(40.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                    style: GoogleFonts.robotoSlab(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    isCreatingAccount == true
                        ? 'Zarejestruj się'
                        : 'Zaloguj się'),
                const SizedBox(height: 10),
                TextField(
                  style: const TextStyle(color: Colors.black),
                  controller: widget.emailController,
                  decoration: const InputDecoration(
                    hintText: 'E-mail',
                    filled: true,
                    fillColor: Colors.grey,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  style: const TextStyle(color: Colors.black),
                  controller: widget.passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    hintText: 'Hasło',
                    filled: true,
                    fillColor: Colors.grey,
                  ),
                ),
                const SizedBox(height: 20),
                Text(errorMessage),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () async {
                    if (isCreatingAccount == true) {
                      try {
                        context.read<RootCubit>().logIn(
                              email: widget.emailController.text,
                              password: widget.passwordController.text,
                            );
                      } catch (error) {
                        setState(() {
                          errorMessage = error.toString();
                        });
                      }
                    } else {
                      try {
                        context.read<RootCubit>().signIn(
                              email: widget.emailController.text,
                              password: widget.passwordController.text,
                            );
                      } catch (error) {
                        setState(() {
                          errorMessage = error.toString();
                        });
                      }
                    }
                  },
                  child: Text(isCreatingAccount == true
                      ? 'Zarejestruj się'
                      : 'Zaloguj się'),
                ),
                const SizedBox(height: 20),
                if (isCreatingAccount == false) ...[
                  TextButton(
                    onPressed: () {
                      setState(() {
                        isCreatingAccount = true;
                      });
                    },
                    child: const Text('Utwórz konto'),
                  ),
                ],
                if (isCreatingAccount == true) ...[
                  TextButton(
                    onPressed: () {
                      setState(() {
                        isCreatingAccount = false;
                      });
                    },
                    child: const Text('Masz już konto?'),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
