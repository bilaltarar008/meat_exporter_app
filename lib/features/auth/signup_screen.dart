import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final nameController = TextEditingController(); // ✅ FIX ADDED
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  String selectedRole = 'owner';
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

  Future<void> _signup() async {
    // ✅ VALIDATION
    if (nameController.text.trim().isEmpty ||
        emailController.text.trim().isEmpty ||
        passwordController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("All fields are required")),
      );
      return;
    }

    setState(() => isLoading = true);

    try {
      final cred = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );

      final uid = cred.user!.uid;

      /// ✅ SAVE USER USING UID (CORRECT)
      await FirebaseFirestore.instance
          .collection('users')
          .doc(uid)
          .set({
        'email': emailController.text.trim(),
        'name': nameController.text.trim(),
        'role': selectedRole,
      });

      if (!mounted) return;

      Navigator.pop(context);

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Account created. Please login.")),
      );

    } on FirebaseAuthException catch (e) {
      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.message ?? "Signup failed")),
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
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
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
                "Sign Up",
                style: TextStyle(
                  fontSize: 22.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),

              SizedBox(height: 20.h),

              /// NAME
              TextField(
                controller: nameController,
                style: const TextStyle(color: Colors.white),
                decoration: _input("Name"),
              ),

              SizedBox(height: 12.h),

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

              SizedBox(height: 12.h),

              /// ROLE DROPDOWN
              DropdownButtonFormField<String>(
                value: selectedRole,
                dropdownColor: const Color(0xFF1F2937),
                items: const [
                  DropdownMenuItem(value: 'owner', child: Text("Owner")),
                  DropdownMenuItem(value: 'slaughter', child: Text("Slaughter")),
                  DropdownMenuItem(value: 'manager', child: Text("Manager")),
                ],
                onChanged: (value) {
                  setState(() {
                    selectedRole = value!;
                  });
                },
                decoration: _input("Select Role"),
              ),

              SizedBox(height: 20.h),

              /// SIGNUP BUTTON
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: isLoading ? null : _signup,
                  child: isLoading
                      ? const CircularProgressIndicator()
                      : const Text(
                    "Create Account",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),

              SizedBox(height: 10.h),

              /// BACK TO LOGIN
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text("Already have an account? Login"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}