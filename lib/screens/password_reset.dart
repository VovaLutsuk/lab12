import 'package:flutter/material.dart';
import '../services/api_service.dart';

class PasswordResetScreen extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final ApiService _apiService = ApiService(); // Ініціалізуємо ApiService

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Відновлення паролю')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(labelText: 'Логін або Email'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Поле обов’язкове для заповнення';
                    } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                      return 'Неправильний формат email';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      try {
                        final response = await _apiService.resetPassword(
                          _emailController.text,
                        );
                        if (response.statusCode == 200) {
                          // Логіка після успішного відновлення паролю
                          print("Password reset successful");
                        } else {
                          // Логіка для обробки помилки
                          print("Password reset failed");
                        }
                      } catch (e) {
                        print("Error: $e");
                      }
                    }
                  },
                  child: Text('Відновити пароль'),
                ),
                SizedBox(height: 10),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Повернутись до авторизації'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
