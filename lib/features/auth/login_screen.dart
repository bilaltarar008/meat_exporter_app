import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/auth/auth_provider.dart';
import '../../core/auth/user_model.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Center(
        child: Container(
          width: 320.w,
          padding: EdgeInsets.all(24.w),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16.w),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "MeatTrace",
                style: TextStyle(
                  fontSize: 24.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20.h),
              Text("Select Role", style: TextStyle(fontSize: 16.sp)),
              SizedBox(height: 20.h),

              _btn("Login as Owner", () {
                ref.read(authProvider.notifier).state = User(
                  id: "1",
                  name: "Amir",
                  role: UserRole.owner,
                );
              }),

              _btn("Login as Slaughterhouse", () {
                ref.read(authProvider.notifier).state = User(
                  id: "2",
                  name: "Slaughterhouse",
                  role: UserRole.slaughterhouse,
                );
              }),

              _btn("Login as Warehouse", () {
                ref.read(authProvider.notifier).state = User(
                  id: "3",
                  name: "Warehouse",
                  role: UserRole.warehouse,
                );
              }),
            ],
          ),
        ),
      ),
    );
  }

  Widget _btn(String text, VoidCallback onPressed) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: onPressed,
          child: Text(text, style: TextStyle(fontSize: 14.sp)),
        ),
      ),
    );
  }
}