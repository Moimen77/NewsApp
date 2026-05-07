import 'package:newsapp/src/imports/core_imports.dart';

class SessionListenerWrapper extends StatefulWidget {
  final Widget child;
  const SessionListenerWrapper({super.key, required this.child});

  @override
  State<SessionListenerWrapper> createState() => _SessionListenerWrapperState();
}

class _SessionListenerWrapperState extends State<SessionListenerWrapper> {
  // Logic left to implement for vanilla flutter. Ideally pass SessionManager logic.
  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
