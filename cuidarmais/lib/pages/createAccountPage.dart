import 'package:cuidarmais/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

void main() => runApp(const CuidarApp());

class CuidarApp extends StatelessWidget {
  const CuidarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: SignUpPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});
  final double borderRadius = 20;

  @override
  Widget build(BuildContext context) {
    if (kIsWeb) {
      return Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              stops: [0.2, 0.4],
              colors: [Color(0xFF5AA4F1), Color.fromARGB(251, 0, 0, 0)],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
          ),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 1000),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 2,
                    child: Card(
                      elevation: 8,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(borderRadius),
                      ),
                      color: const Color.fromRGBO(166, 179, 188, 1.0),
                      child: Padding(
                        padding: const EdgeInsets.all(32),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Text(
                              'Cadastro',
                              style: TextStyle(
                                fontSize: 32,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(251, 255, 255, 255),
                              ),
                            ),
                            const SizedBox(height: 20),
                            _buildTextField('Nome'),
                            const SizedBox(height: 16),
                            _buildTextField('Email'),
                            const SizedBox(height: 16),
                            _buildTextField('Senha', isPassword: true),
                            const SizedBox(height: 16),
                            _buildTextField('Confirme sua senha',
                                isPassword: true),
                            const SizedBox(height: 24),
                            _buildPrimaryButton('Cadastre-se',context),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 40),
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Image.asset(
                        'assets/queue.png',
                        height: 500,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    } else {
      return Scaffold(
        resizeToAvoidBottomInset: true,
        body: LayoutBuilder(
          builder: (context, constraints) {
            bool isWideScreen = constraints.maxWidth > 600;
            return Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  stops: [0.3, 0.5],
                  colors: [Color(0xFF5AA4F1), Color(0xFF1E1E1E)],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
              ),
              child: SafeArea(
                child: SingleChildScrollView(
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                          maxWidth: isWideScreen ? 500 : double.infinity,
                        ),
                        child: Column(
                          children: [
                            const SizedBox(height: 20),
                            Card(
                              elevation: 8,
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(borderRadius),
                              ),
                              color: const Color.fromRGBO(166, 179, 188, 1.0),
                              child: Padding(
                                padding: const EdgeInsets.all(25),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    const Text(
                                      'Cadastro',
                                      style: TextStyle(
                                        fontSize: 32,
                                        fontWeight: FontWeight.bold,
                                        color:
                                            Color.fromARGB(255, 255, 255, 255),
                                      ),
                                    ),
                                    const SizedBox(height: 20),
                                    _buildTextField('Nome'),
                                    const SizedBox(height: 16),
                                    _buildTextField('Email'),
                                    const SizedBox(height: 16),
                                    _buildTextField('Senha', isPassword: true),
                                    const SizedBox(height: 16),
                                    _buildTextField('Confirme sua senha',
                                        isPassword: true),
                                    const SizedBox(height: 24),
                                    _buildPrimaryButton('Cadastre-se',context),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 200,
                              child: Image.asset('assets/queue.png'),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      );
    }
  }

  Widget _buildTextField(String label, {bool isPassword = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(color: Colors.black)),
        const SizedBox(height: 8),
        TextField(
          obscureText: isPassword,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.grey[100],
            suffixIcon: isPassword
                ? const Icon(Icons.visibility, color: Colors.grey)
                : null,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPrimaryButton(String text,BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF5AA4F1),
        foregroundColor: Colors.white,
        minimumSize: const Size(double.infinity, 48),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
      ),
      onPressed: () {
         Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => LoginPage()),
    );
      },
      child: Text(text),
    );
  }
}
