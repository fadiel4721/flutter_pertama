import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart'; // Import Lottie
import '../bloc/register/register_bloc.dart';
import '../utils/constants.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});
  final TextEditingController nameC = TextEditingController();
  final TextEditingController emailC = TextEditingController();
  final TextEditingController passC = TextEditingController();
  final TextEditingController confirmPassC =
      TextEditingController(); // Controller untuk confirm password

  // Default role is set to 'user'
  final String _role = 'user'; 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (_) => RegisterBloc(),
        child: Stack(
          fit: StackFit.expand,
          children: [
            // Background (SVG Image)
            SvgPicture.asset(
              "assets/svg/bg.svg",
              fit: BoxFit.fitWidth, // Sama seperti di LoginPage
            ),
            SafeArea(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20), // Spasi awal

                      // Lottie Animation
                      Center(
                        child: Lottie.asset(
                          'assets/gif/hello_gif.json', // Ubah animasi sesuai kebutuhan
                          width: 150,
                          height: 150,
                        ),
                      ),
                      const SizedBox(height: 20),

                      // Welcome Text
                      Text(
                        "Create Account",
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium!
                            .copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'NeonLight',
                            ),
                      ),
                      const Text(
                        "Isi form untuk membuat akun baru",
                        style: TextStyle(
                            color: Colors.white, fontFamily: 'NeonLight'),
                      ),
                      const SizedBox(height: 20),

                      // Name Field
                      TextFormField(
                        controller: nameC,
                        decoration: InputDecoration(
                          labelText: 'Name',
                          labelStyle: const TextStyle(
                            fontFamily: 'NeonLight',
                            color: Colors.black,
                          ),
                          prefixIcon: const Icon(Icons.person),
                          filled: true,
                          fillColor: Colors.grey[200],
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),

                      // Email Field
                      TextFormField(
                        controller: emailC,
                        decoration: InputDecoration(
                          labelText: 'Email',
                          labelStyle: const TextStyle(
                            fontFamily: 'NeonLight',
                            color: Colors.black,
                          ),
                          prefixIcon: const Icon(Icons.email),
                          filled: true,
                          fillColor: Colors.grey[200],
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),

                      // Password Field
                      TextFormField(
                        controller: passC,
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          labelStyle: const TextStyle(
                            fontFamily: 'NeonLight',
                            color: Colors.black,
                          ),
                          prefixIcon: const Icon(Icons.lock),
                          filled: true,
                          fillColor: Colors.grey[200],
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),

                      // Confirm Password Field
                      TextFormField(
                        controller: confirmPassC,
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: 'Confirm Password',
                          labelStyle: const TextStyle(
                            fontFamily: 'NeonLight',
                            color: Colors.black,
                          ),
                          prefixIcon: const Icon(Icons.lock),
                          filled: true,
                          fillColor: Colors.grey[200],
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),

                      const SizedBox(height: 30),

                      // Register Button
                      BlocConsumer<RegisterBloc, RegisterState>(
                        listener: (context, state) {
                          if (state is RegisterSuccess) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Registrasi berhasil!'),
                                duration: Duration(seconds: 3),
                              ),
                            );
                            Future.delayed(const Duration(seconds: 1), () {
                              context.goNamed('login');
                            });
                          } else if (state is RegisterFailure) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(state.message),
                                duration: const Duration(seconds: 3),
                              ),
                            );
                          }
                        },
                        builder: (context, state) {
                          return Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              gradient: kPrimaryGradient,
                              borderRadius: const BorderRadius.all(
                                Radius.circular(12),
                              ),
                            ),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                padding: const EdgeInsets.all(
                                    kDefaultPadding * 0.75),
                                backgroundColor: Colors.transparent,
                                shadowColor: Colors.transparent,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              onPressed: state is! RegisterLoading
                                  ? () {
                                      // Check if password and confirm password match
                                      if (passC.text != confirmPassC.text) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          const SnackBar(
                                            content:
                                                Text('Passwords do not match!'),
                                          ),
                                        );
                                      } else {
                                        context.read<RegisterBloc>().add(
                                              RegisterSubmitted(
                                                name: nameC.text,
                                                email: emailC.text,
                                                password: passC.text,
                                                role:
                                                    _role, // Role is fixed as 'user'
                                              ),
                                            );
                                      }
                                    }
                                  : null,
                              child: state is RegisterLoading
                                  ? const Text(
                                      'Loading...',
                                      style: TextStyle(
                                        fontFamily:
                                            'NeonLight', // Update font family for loading text
                                      ),
                                    )
                                  : Text(
                                      'Register',
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelLarge!
                                          .copyWith(
                                            color: Colors.black,
                                            fontFamily:
                                                'NeonLight', // Font Family NeonLight
                                          ),
                                    ),
                            ),
                          );
                        },
                      ),
                      const SizedBox(height: 20),

                      // Link ke Login Page
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Already have an account?",
                            style: TextStyle(
                                color: Colors.white, fontFamily: 'NeonLight'),
                          ),
                          TextButton(
                            onPressed: () {
                              context.goNamed('login');
                            },
                            child: const Text(
                              "Login",
                              style: TextStyle(
                                  color: Colors.blue, fontFamily: 'NeonLight'),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
