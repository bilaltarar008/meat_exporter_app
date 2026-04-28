import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../core/auth/user_service.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool isLoading = false;

  InputDecoration _input(String hint) {
    return InputDecoration(
      hintText: hint,
      hintStyle: const TextStyle(color: Colors.white54),
      filled: true,
      fillColor: const Color(0xFF1F2937),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.r),
        borderSide: BorderSide.none,
      ),
    );
  }

  Future<void> _login() async {
    if (emailController.text.trim().isEmpty ||
        passwordController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Email and password required")),
      );
      return;
    }

    setState(() => isLoading = true);

    try {
      final cred = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );

      final email = cred.user!.email!;

      final userData = await UserService().getUserByEmail(email);

      if (userData == null) {
        throw Exception("User not found in DB");
      }

      final role = userData['role'];

      if (!mounted) return;

      if (role == 'owner') {
        Navigator.pushReplacementNamed(context, '/owner');
      } else if (role == 'slaughter') {
        Navigator.pushReplacementNamed(context, '/slaughter');
      } else if (role == 'manager') {
        Navigator.pushReplacementNamed(context, '/manager');
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Invalid role")),
        );
      }

    } on FirebaseAuthException catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.message ?? "Login failed")),
      );
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.toString())),
      );
    }

    if (mounted) {
      setState(() => isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0B1220),
      body: Center(
        child: Container(
          width: 340.w,
          padding: EdgeInsets.all(24.w),
          decoration: BoxDecoration(
            color: const Color(0xFF111827),
            borderRadius: BorderRadius.circular(16.r),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "MeatTrace",
                style: TextStyle(
                  fontSize: 22.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),

              SizedBox(height: 20.h),

              /// EMAIL
              TextField(
                controller: emailController,
                style: const TextStyle(color: Colors.white),
                decoration: _input("Email"),
              ),

              SizedBox(height: 12.h),

              /// PASSWORD
              TextField(
                controller: passwordController,
                style: const TextStyle(color: Colors.white),
                decoration: _input("Password"),
                obscureText: true,
              ),

              SizedBox(height: 20.h),

              /// LOGIN BUTTON
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: isLoading ? null : _login,
                  child: isLoading
                      ? const CircularProgressIndicator()
                      : const Text("Login", style: TextStyle(
                    color: Colors.black, // Change this to your desired color
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}