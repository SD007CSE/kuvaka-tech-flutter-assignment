import 'package:application/common/widgets/common_button.dart';
import 'package:application/common/widgets/common_textfield.dart';
import 'package:application/common/widgets/square_tile.dart';
import 'package:application/home/pages/home_page.dart';
import 'package:flutter/material.dart';

class LoginWidget extends StatefulWidget {
  const LoginWidget({super.key});
  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  checkLoginDetails(username, password) {
    MaterialPageRoute(builder: (context) => HomePage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                //
                //LOGO
                //
                const SizedBox(height: 50),
                Icon(Icons.delivery_dining, size: 100),
                //
                //Welcome Back, what you have missed
                //
                const SizedBox(height: 50),
                Text(
                  'Welcome back you\'ve been missed!',
                  style: TextStyle(color: Colors.grey[700], fontSize: 16),
                ),

                //
                //USERNAME TEXTFIELD
                //
                const SizedBox(height: 25),
                CommonTextfield(
                  controller: usernameController,
                  hintText: 'Username',
                  obscureText: false,
                ),

                //
                //PASSWORD TEXTFIELD
                //
                const SizedBox(height: 10),
                CommonTextfield(
                  controller: passwordController,
                  hintText: 'Password',
                  obscureText: true,
                ),

                //
                //FORGET PASSWORD (DUMMY)
                //
                const SizedBox(height: 10),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "Forget Password?",
                        style: TextStyle(color: Colors.grey[600]),
                      ),
                    ],
                  ),
                ),
                //
                //SIGNIN BUTTON
                //
                const SizedBox(height: 25),
                GestureDetector(
                  onTap: () {
                    checkLoginDetails(
                      usernameController.text,
                      passwordController.text,
                    );
                  },
                  child: CommonButton(
                    onTap: () {
                      if (usernameController.text == "a@b.com" &&
                          passwordController.text == "12345") {
                        debugPrint("Function Called");
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => HomePage()),
                        );
                      }
                    },
                  ),
                ),

                const SizedBox(height: 50),

                // OR CONTINUE WITH
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Divider(thickness: 0.5, color: Colors.grey[400]),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Text(
                          "Or continue with",
                          style: TextStyle(color: Colors.grey[700]),
                        ),
                      ),
                      Expanded(
                        child: Divider(thickness: 0.5, color: Colors.grey[400]),
                      ),
                    ],
                  ),
                ),
                //
                //GOOGLE + APPLE AUTH SIGN IN (DUMMY)
                //
                const SizedBox(height: 50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //GOOGLE LOGO
                    SquareTile(imgPath: 'assets/images/google1.png'),
                    const SizedBox(width: 25),
                    //APPLE LOGO
                    SquareTile(imgPath: 'assets/images/apple1.png'),
                  ],
                ),
                //
                //NOT A MEMBER, REGISTER NOW.(DUMMY)
                //
                SizedBox(height: 50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Not a member?"),
                    const SizedBox(width: 4),
                    Text("Register Now", style: TextStyle(color: Colors.blue)),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
