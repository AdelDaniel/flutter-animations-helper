import 'package:flutter/material.dart';

enum ButtonType {
  implicitAnimation(color: Colors.blue),
  explicitAnimation(color: Colors.blueGrey),
  pageTransation(color: Colors.green);

  const ButtonType({required this.color});
  final Color color;
}

class NavigationElevatedButton extends StatelessWidget {
  const NavigationElevatedButton({
    super.key,
    required String title,
    required Widget screenWidget,
    required ButtonType buttonType,
    this.route,
  })  : _screenWidget = screenWidget,
        _buttonType = buttonType,
        _title = title;

  factory NavigationElevatedButton.customRoute({
    Key? key,
    required String title,
    required ButtonType buttonType,
    required PageRouteBuilder route,
  }) {
    return NavigationElevatedButton(
      key: key,
      title: title,
      screenWidget: const SizedBox.shrink(),
      buttonType: buttonType,
      route: route,
    );
  }

  final String _title;
  final Widget _screenWidget;
  final ButtonType _buttonType;
  final PageRouteBuilder? route;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: _buttonType.color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onPressed: () {
          Navigator.push(
            context,
            route ?? MaterialPageRoute(builder: (context) => _screenWidget),
          );
        },
        child: Text(
          _title,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
