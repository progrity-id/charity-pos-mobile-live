import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(11.r),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: 1.sw,
              child: ElevatedButton(
                onPressed: () {},
                child: Text(
                  "Log In",
                  style:
                      TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w500),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Don’t have an account?"),
                TextButton(onPressed: () {}, child: Text("Sign Up"))
              ],
            )
          ],
        ),
      ),
      body: Container(
        width: 1.sw,
        padding: EdgeInsets.all(16.r),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Column(
                children: [
                  Text(
                    "CHARITY CASHIER",
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff19AFF9),
                    ),
                  ),
                  SizedBox(height: 2.h),
                  Text(
                    "Powered by Progrity.id",
                    style: TextStyle(
                      fontSize: 10.sp,
                    ),
                  ),
                  SizedBox(height: 2.h),
                  Text(
                    "Efficiency at Every Sale",
                    style: TextStyle(
                      fontSize: 12.sp,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 21.h),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Log in to",
                  style: TextStyle(
                    fontSize: 32.sp,
                  ),
                ),
                Text(
                  "your account",
                  style:
                      TextStyle(fontSize: 32.sp, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(height: 21.h),
            Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    hintText: "Enter Email",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.r),
                        borderSide: const BorderSide(color: Color(0xffA4A4A4))),
                  ),
                ),
                SizedBox(height: 16.h),
                const InputPassword(),
                SizedBox(height: 4.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                        onPressed: () {},
                        child: const Text("Forgot your password ?")),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class InputPassword extends StatefulWidget {
  const InputPassword({super.key});

  @override
  State<InputPassword> createState() => _InputPasswordState();
}

class _InputPasswordState extends State<InputPassword> {
  bool isSecure = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: isSecure,
      decoration: InputDecoration(
        hintText: "Enter Password",
        suffixIcon: IconButton(
          icon: isSecure
              ? Icon(Icons.remove_red_eye_sharp)
              : Icon(Icons.remove_red_eye_outlined),
          onPressed: () {
            setState(() {
              isSecure = !isSecure;
            });
          },
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: const BorderSide(color: Color(0xffA4A4A4)),
        ),
      ),
    );
  }
}
