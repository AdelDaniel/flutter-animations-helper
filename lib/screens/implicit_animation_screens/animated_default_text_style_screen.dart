import 'package:flutter/material.dart';

class AnimatedDefaultTextStyleScreen extends StatefulWidget {
  const AnimatedDefaultTextStyleScreen({super.key});

  @override
  State<AnimatedDefaultTextStyleScreen> createState() =>
      _AnimatedDefaultTextStyleScreenState();
}

class _AnimatedDefaultTextStyleScreenState
    extends State<AnimatedDefaultTextStyleScreen> {
  bool _isPasswordVisible = false;
  bool _hasMinLength = false;
  bool _hasUpperCase = false;
  bool _hasLowerCase = false;
  bool _hasNumber = false;
  bool _hasSpecialChar = false;

  void _validatePassword(String password) {
    setState(() {
      _hasMinLength = password.length >= 8;
      _hasUpperCase = password.contains(RegExp(r'[A-Z]'));
      _hasLowerCase = password.contains(RegExp(r'[a-z]'));
      _hasNumber = password.contains(RegExp(r'[0-9]'));
      _hasSpecialChar = password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animated Default Text Style'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              obscureText: !_isPasswordVisible,
              onChanged: _validatePassword,
              decoration: InputDecoration(
                labelText: 'Password',
                hintText: 'Enter your password',
                suffixIcon: IconButton(
                  icon: Icon(
                    _isPasswordVisible
                        ? Icons.visibility
                        : Icons.visibility_off,
                  ),
                  onPressed: () {
                    setState(() {
                      _isPasswordVisible = !_isPasswordVisible;
                    });
                  },
                ),
                border: const OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a password';
                }
                if (!_hasMinLength ||
                    !_hasUpperCase ||
                    !_hasLowerCase ||
                    !_hasNumber ||
                    !_hasSpecialChar) {
                  return 'Password does not meet all requirements';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            Text(
              'Password must contain:',
              style: Theme.of(context).textTheme.titleSmall,
            ),
            const SizedBox(height: 8),
            Column(
              children: <Widget>[
                BuildCriteriaRow(
                  text: 'At least 8 characters',
                  isMet: _hasMinLength,
                ),
                BuildCriteriaRow(
                  text: 'At least one uppercase letter',
                  isMet: _hasUpperCase,
                ),
                BuildCriteriaRow(
                  text: 'At least one lowercase letter',
                  isMet: _hasLowerCase,
                ),
                BuildCriteriaRow(
                  text: 'At least one number',
                  isMet: _hasNumber,
                ),
                BuildCriteriaRow(
                  text: 'At least one special character',
                  isMet: _hasSpecialChar,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class BuildCriteriaRow extends StatelessWidget {
  const BuildCriteriaRow({
    super.key,
    required this.text,
    required this.isMet,
  });

  final String text;
  final bool isMet;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Icon(
            isMet ? Icons.check_circle : Icons.check_circle_outline,
            color: isMet ? Colors.green : Colors.grey,
            size: 20,
          ),
          const SizedBox(width: 8),
          AnimatedDefaultTextStyle(
            duration: const Duration(seconds: 2),
            style: TextStyle(
              color: isMet ? Colors.green : Colors.grey,
              fontSize: isMet ? 16 : 12,
              fontWeight: isMet ? FontWeight.bold : FontWeight.normal,
            ),
            child: Text(text),
          ),
        ],
      ),
    );
  }
}
