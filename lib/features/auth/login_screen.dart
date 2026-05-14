import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'signup_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  bool isLoading = false;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor: const Color(0xFF020817),

      body: SafeArea(

        child: SingleChildScrollView(

          child: ConstrainedBox(

            constraints: BoxConstraints(
              minHeight: MediaQuery.of(context).size.height,
            ),

            child: Center(

              child: Padding(

                padding: EdgeInsets.all(24.w),

                child: Container(

                  constraints: const BoxConstraints(
                    maxWidth: 420,
                  ),

                  padding: EdgeInsets.all(28.w),

                  decoration: BoxDecoration(

                    color: const Color(0xFF0F172A),

                    borderRadius: BorderRadius.circular(28.r),

                    border: Border.all(
                      color: Colors.white.withValues(alpha: 0.05),
                    ),
                  ),

                  child: Column(

                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [

                      /// LOGO + TITLE
                      Center(

                        child: Column(

                          children: [

                            Container(

                              width: 72,
                              height: 72,

                              decoration: BoxDecoration(
                                color: const Color(0xFF2563EB),
                                borderRadius: BorderRadius.circular(20.r),
                              ),

                              child: const Icon(
                                Icons.inventory_2_rounded,
                                color: Colors.white,
                                size: 36,
                              ),
                            ),

                            const SizedBox(height: 20),

                            const Text(

                              "MeatTrace",

                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 40),

                      /// EMAIL
                      _field(
                        controller: emailController,
                        hint: "Email Address",
                        icon: Icons.email_outlined,
                      ),

                      const SizedBox(height: 18),

                      /// PASSWORD
                      _field(
                        controller: passwordController,
                        hint: "Password",
                        icon: Icons.lock_outline_rounded,
                        obscure: true,
                      ),

                      const SizedBox(height: 28),

                      /// LOGIN BUTTON
                      SizedBox(

                        width: double.infinity,
                        height: 58,

                        child: ElevatedButton(

                          onPressed: isLoading
                              ? null
                              : () async {

                            setState(() {
                              isLoading = true;
                            });

                            try {

                              await FirebaseAuth.instance
                                  .signInWithEmailAndPassword(

                                email: emailController.text.trim(),
                                password: passwordController.text.trim(),
                              );

                            } on FirebaseAuthException catch (e) {

                              if (!mounted) return;

                              ScaffoldMessenger.of(context)
                                  .showSnackBar(

                                SnackBar(
                                  content: Text(
                                    e.message ?? 'Login failed',
                                  ),
                                ),
                              );

                            } finally {

                              if (mounted) {

                                setState(() {
                                  isLoading = false;
                                });
                              }
                            }
                          },

                          style: ElevatedButton.styleFrom(

                            backgroundColor:
                            const Color(0xFF2563EB),

                            shape: RoundedRectangleBorder(
                              borderRadius:
                              BorderRadius.circular(18.r),
                            ),
                          ),

                          child: isLoading

                              ? const SizedBox(

                            height: 22,
                            width: 22,

                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              color: Colors.white,
                            ),
                          )

                              : const Text(

                            "Login",

                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 24),

                      /// CREATE ACCOUNT
                      Row(

                        mainAxisAlignment:
                        MainAxisAlignment.center,

                        children: [

                          const Text(

                            "Don't have an account?",

                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 14,
                            ),
                          ),

                          TextButton(

                            onPressed: () {

                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) =>
                                  const SignupScreen(),
                                ),
                              );
                            },

                            child: const Text(

                              "Create Account",

                              style: TextStyle(
                                color: Color(0xFF3B82F6),
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _field({
    required TextEditingController controller,
    required String hint,
    required IconData icon,
    bool obscure = false,
  }) {

    return Container(

      height: 64,

      decoration: BoxDecoration(

        color: const Color(0xFF1E293B),

        borderRadius: BorderRadius.circular(20.r),

        border: Border.all(
          color: Colors.white.withValues(alpha: 0.05),
        ),
      ),

      child: TextField(

        controller: controller,
        obscureText: obscure,

        style: const TextStyle(
          color: Colors.white,
          fontSize: 16,
        ),

        decoration: InputDecoration(

          border: InputBorder.none,

          contentPadding: const EdgeInsets.symmetric(
            vertical: 20,
          ),

          hintText: hint,

          hintStyle: const TextStyle(
            color: Colors.white54,
            fontSize: 15,
          ),

          prefixIcon: Icon(
            icon,
            color: Colors.white70,
            size: 22,
          ),
        ),
      ),
    );
  }
}