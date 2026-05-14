import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {

  bool isLoading = false;
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  String selectedRole = 'owner';

  final List<String> roles = [
    'owner',
    'slaughterhouse',
    'warehouse',
  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor: const Color(0xFF020817),

      body: SafeArea(

        child: Center(

          child: SingleChildScrollView(

            padding: EdgeInsets.all(24.w),

            child: Container(

              width: 420,

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

                  Center(

                    child: Text(
                      "Create Account",

                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  SizedBox(height: 36.h),

                  _field(
                    controller: nameController,
                    hint: "Full Name",
                    icon: Icons.person_outline,
                  ),

                  SizedBox(height: 18.h),

                  _field(
                    controller: emailController,
                    hint: "Email Address",
                    icon: Icons.email_outlined,
                  ),

                  SizedBox(height: 18.h),

                  _field(
                    controller: passwordController,
                    hint: "Password",
                    icon: Icons.lock_outline,
                    obscure: true,
                  ),

                  SizedBox(height: 18.h),

                  Container(

                    width: double.infinity,

                    padding: EdgeInsets.symmetric(
                      horizontal: 18,
                    ),

                    decoration: BoxDecoration(

                      color: const Color(0xFF1E293B),

                      borderRadius: BorderRadius.circular(18.r),
                    ),

                    child: DropdownButtonHideUnderline(

                      child: DropdownButton<String>(

                        value: roles.contains(selectedRole)
                            ? selectedRole
                            : roles.first,

                        isExpanded: true,

                        dropdownColor: const Color(0xFF1E293B),

                        iconEnabledColor: Colors.white,

                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                        ),

                        items: List<DropdownMenuItem<String>>.generate(

                          roles.length,

                              (index) {

                            final role = roles[index];

                            return DropdownMenuItem<String>(

                              value: role,

                              child: Text(
                                role.toUpperCase(),
                                overflow: TextOverflow.ellipsis,
                              ),
                            );
                          },
                        ),

                        onChanged: (value) {

                          if (value == null) return;

                          setState(() {

                            selectedRole = value;
                          });
                        },
                      ),
                    ),
                  ),

                  SizedBox(height: 28.h),

                  SizedBox(

                    width: double.infinity,
                    height: 64,

                    child: ElevatedButton(

                      onPressed: isLoading
                          ? null
                          : () async {

                        setState(() {
                          isLoading = true;
                        });

                        try {

                          final credential =
                          await FirebaseAuth.instance
                              .createUserWithEmailAndPassword(

                            email:
                            emailController.text.trim(),

                            password:
                            passwordController.text.trim(),
                          );

                          await FirebaseFirestore.instance
                              .collection('users')
                              .doc(credential.user!.uid)
                              .set({

                            'name':
                            nameController.text.trim(),

                            'email':
                            emailController.text.trim(),

                            'role':
                            selectedRole,

                            'createdAt':
                            Timestamp.now(),
                          });

                          if (!mounted) return;

                          Navigator.pop(context);

                          ScaffoldMessenger.of(context)
                              .showSnackBar(

                            const SnackBar(
                              content: Text(
                                'Account created successfully',
                              ),
                            ),
                          );

                        } on FirebaseAuthException catch (e) {

                          ScaffoldMessenger.of(context)
                              .showSnackBar(

                            SnackBar(
                              content: Text(
                                e.message ??
                                    'Signup failed',
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

                        child:
                        CircularProgressIndicator(
                          strokeWidth: 2,
                          color: Colors.white,
                        ),
                      )

                          : const Text(

                        "Create Account",

                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 24.h),

                  Center(

                    child: TextButton(

                      onPressed: () {
                        Navigator.pop(context);
                      },

                      child: Text(
                        "Already have an account? Login",

                        style: TextStyle(
                          color: const Color(0xFF3B82F6),
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
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

        style: TextStyle(
          color: Colors.white,
          fontSize: 16,
        ),

        decoration: InputDecoration(

          border: InputBorder.none,

          contentPadding: EdgeInsets.symmetric(
            vertical: 20,
          ),

          hintText: hint,

          hintStyle: TextStyle(
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