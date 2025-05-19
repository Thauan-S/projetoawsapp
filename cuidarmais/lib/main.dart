import 'package:cuidarmais/pages/chatbot.dart';
import 'package:cuidarmais/pages/createAccountPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

void main() => runApp(const CuidarApp());

class CuidarApp extends StatelessWidget {
  const CuidarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Chatbot(),
      debugShowCheckedModeBanner: false,
    );
  }
}

const double border_radius = 20;

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    if (kIsWeb) {
      // Layout para Web
      return Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              stops: [0.6, 0.8],
              colors: [Color(0xFFF2F2F2), Color(0xFF9933CC)],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
          ),
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: Image.asset(
                  'assets/mobile.png',
                  height: 500,
                  fit: BoxFit.contain,
                ),
              ),
              Expanded(
                flex: 2,
                child: Center(
                  child: Container(
                    padding: const EdgeInsets.all(32),
                    width: 400,
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(189, 174, 193, 1),
                      borderRadius: BorderRadius.circular(32),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text(
                          'Login',
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 20),
                        _textField('Email:'),
                        const SizedBox(height: 16),
                        _textField('Senha:', isPassword: true),
                        const SizedBox(height: 24),
                        _googleButton(),
                        const SizedBox(height: 16),
                        _outlinedButton('Não tenho conta ainda', context),
                        const SizedBox(height: 24),
                        _buildPrimaryButton('Entrar',context),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      );
    } else {
      // Layout para Mobile
      return Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              stops: [0.5, 0.9],
              colors: [Color(0xFFF2F2F2), Color(0xFF9933CC)],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
          ),
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(25),
              child: Column(children: [
                Container(
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(189, 174, 193, 1),
                    borderRadius: BorderRadius.circular(32),
                  ),
                  child: Container(
                    padding: const EdgeInsets.all(25),
                    child: Column(
                      children: [
                        SizedBox(
                          child: Column(
                            children: [
                              const Text(
                                'Login',
                                style: TextStyle(
                                    fontSize: 28,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 20),
                              _textField('Email:'),
                              const SizedBox(height: 16),
                              _textField('Senha:', isPassword: true),
                              const SizedBox(height: 24),
                              _googleButton(),
                              const SizedBox(height: 16),
                              _outlinedButton('Não tenho conta ainda', context),
                              const SizedBox(height: 24),
                              _buildPrimaryButton('Entrar',context),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  child: Image.asset(
                    'assets/mobile.png',
                    height: 250,
                    fit: BoxFit.contain,
                  ),
                )
              ]),
            ),
          ),
        ),
      );
    }
  }

  _textField(String label, {bool isPassword = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(color: Colors.white)),
        const SizedBox(height: 8),
        TextField(
          obscureText: isPassword,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            suffixIcon: isPassword
                ? const Icon(Icons.visibility, color: Colors.grey)
                : null,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(border_radius),
            ),
          ),
        ),
      ],
    );
  }

  _googleButton() {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        minimumSize: const Size(double.infinity, 48),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(border_radius),
        ),
      ),
      onPressed: () {},
      icon: Image.network(
        'https://img.icons8.com/color/48/000000/google-logo.png',
        height: 24,
      ),
      label: const Text('Entre com o Google'),
    );
  }

  _outlinedButton(String text, BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        backgroundColor: const Color(0xFF9933CC),
        foregroundColor: Colors.white,
        side: const BorderSide(color: Colors.white),
        minimumSize: const Size(double.infinity, 48),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(border_radius),
        ),
      ),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SignUpPage()),
        );
      },
      child: Text(text),
    );
  }

  Widget _buildPrimaryButton(String text,BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF9933CC),
        foregroundColor: Colors.white,
        minimumSize: const Size(double.infinity, 48),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(border_radius),
        ),
      ),
      onPressed: () {
         Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const Chatbot()));
      },
      child: Text(text),
    );
  }
}
