import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:shopo_app/root/my_validators.dart';
import 'package:shopo_app/root/root_colors.dart';
import 'package:shopo_app/screens/auth/register.dart';
import 'package:shopo_app/services/assets_manager.dart';
import 'package:shopo_app/widgets/app_name.dart';
import 'package:shopo_app/widgets/subtitle_text.dart';
import 'package:shopo_app/widgets/title_text.dart';

class LoginScreen extends StatefulWidget {
  static const routName = "/loginScreen";
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  late final FocusNode _emailFocusNode;
  late final FocusNode _passwordFocusNode;
  final _formKey = GlobalKey<FormState>();
  bool obscureText = true;

  @override
  void initState() {
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _emailFocusNode = FocusNode();
    _passwordFocusNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }

  Future<void> _loginFct() async {
    final isValid = _formKey.currentState!.validate();
    FocusScope.of(context).unfocus();
    if (isValid) {}
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: const AppNameTextWidget(),
          leading: Image.asset(AssetsManager.shoppingCart),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 16.0),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: TitleTextWidget(label: "เข้าสู่ระบบ"),
                ),
                const SizedBox(height: 16.0),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _emailController,
                        focusNode: _emailFocusNode,
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                          hintText: "อีเมล์",
                          prefixIcon: Icon(IconlyLight.message),
                        ),
                        validator: (value) {
                          return MyValidators.emailValidator(value) ?? "กรุณากรอกอีเมล์ที่ถูกต้อง";
                        },
                        onFieldSubmitted: (value) {
                          FocusScope.of(context).requestFocus(_passwordFocusNode);
                        },
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        controller: _passwordController,
                        focusNode: _passwordFocusNode,
                        textInputAction: TextInputAction.done,
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: obscureText,
                        decoration: InputDecoration(
                          hintText: "**********",
                          prefixIcon: const Icon(IconlyLight.lock),
                          suffixIcon: IconButton(
                            icon: Icon(obscureText ? Icons.visibility_off : Icons.visibility),
                            onPressed: () {
                              setState(() {
                                obscureText = !obscureText;
                              });
                            },
                          ),
                        ),
                        validator: (value) {
                          return MyValidators.passwordValidator(value) ?? "กรุณากรอกรหัสผ่านที่ถูกต้อง";
                        },
                        onFieldSubmitted: (value) {
                          _loginFct();
                        },
                      ),
                      const SizedBox(height: 16.0),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: root_colors.light1,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          onPressed: _loginFct,
                          icon: const Icon(
                            IconlyLight.login,
                            color: Colors.white,
                          ),
                          label: const Text(
                            "เข้าสู่ระบบ",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      const SizedBox(height: 16),
                      const SizedBox(height: 16.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SubtitleTextWidget(
                            label: "เพิ่งเคยเข้ามาใน Shopoo ใช่หรือไม่ ?",
                            fontSize: 16,
                            color: Color.fromARGB(131, 0, 0, 0),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, RegisterScreen.routeName);
                            },
                            child: const SubtitleTextWidget(
                              label: "สมัครเลย",
                              fontSize: 16,
                              color: Colors.orange,
                              textDecoration: TextDecoration.underline,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
