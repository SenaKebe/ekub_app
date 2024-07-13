import 'package:flutter/material.dart';
import 'package:mobileapp/input_validator.dart';
import 'package:mobileapp/screens/user/home_layout.dart';
import 'package:mobileapp/services/api/auth_service.dart';
import 'package:mobileapp/services/local/message_service.dart';
import 'package:mobileapp/utils/shared_preferences.dart';
import 'package:mobileapp/utils/util.dart';
import 'package:mobileapp/widgets/button_wiget.dart';
import 'package:mobileapp/widgets/email_field.dart';
import 'package:mobileapp/widgets/loading_indicator.dart';
import 'package:mobileapp/widgets/password_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  CustomInputValidator _validator = CustomInputValidator();
  bool _isLoading = false;
  @override
  void initState() {
    super.initState();
    _check();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ekub"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 10),
            EmailInputFieldWidget(inputController: _emailController),
            SizedBox(height: 10),
            PasswordInput(
                textEditingController: _passwordController, hintText: '***'),
            SizedBox(height: 10),
            _isLoading
                ? GestureDetector(
                    onTap: () {
                      setState(() {
                        _isLoading = !_isLoading;
                      });
                    },
                    child: DottedCircularProgressIndicatorWidget(
                      currentDotColor: Colors.green,
                      defaultDotColor: const Color.fromARGB(164, 158, 158, 158),
                      numDots: 15,
                    ),
                  )
                : CustomButtonWidget(text: 'Login', onPressed: _handleLogin),
            SizedBox(height: 10),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  // handle login
  _handleLogin() async {
    // validate
    if (_formValidator()) {
      setState(() {
        _isLoading = !_isLoading;
      });
      Map<String, dynamic> jsonData = {
        'email': _emailController.text,
        'password': _passwordController.text
      };
      Map<String, dynamic> _reposne = await AuthService().login(jsonData);
      setState(() {
        _isLoading = !_isLoading;
      });
      SnackBarService.showSnackBar(context, _reposne['message'],
          _reposne['success'] ? Colors.greenAccent : Colors.redAccent);
      if (_reposne['success']) {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (_) => HomeScreen(),
          ),
          (route) => false,
        );
      }
    }
  }

  // validate form
  bool _formValidator() {
    if (_emailController.text == '' || _passwordController.text == '') {
      SnackBarService.showSnackBar(
          context, "all field are required", Colors.redAccent);
      return false;
    }
    if (!_validator.emailValidator(_emailController.text)) {
      SnackBarService.showSnackBar(context, "invalid email", Colors.redAccent);
      return false;
    }
    if (!_validator.passwordValidator(_passwordController.text)) {
      SnackBarService.showSnackBar(
          context, 'invalid password', Colors.redAccent);
      return false;
    }
    return true;
  }

  // check
  _check() async {
    bool isLogged = await checkLoginBefore('token');
    if (isLogged) {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
            builder: (_) => HomeScreen(),
          ),
          (route) => false);
    }
  }
}
