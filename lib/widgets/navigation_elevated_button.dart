import 'package:flutter/material.dart';

class NavigationElevatedButton extends StatelessWidget {
  const NavigationElevatedButton({
    super.key,
    required String title,
    required Widget screenWidget,
  })  : _screenWidget = screenWidget,
        _title = title;

  final String _title;
  final Widget _screenWidget;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => _screenWidget),
          );
        },
        child: Text(_title),
      ),
    );
  }
}
