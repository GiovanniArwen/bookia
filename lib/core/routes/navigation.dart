import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

Future PushTo(BuildContext context, String route, [Object? extra]) {
  // return Navigator.push(context, MaterialPageRoute(builder: (context) => page));
  return context.push(route, extra: route);
}

pushWithRelacement(BuildContext context, String route) {
  return context.pushReplacement(route);
}

PushAndRemoveUntil(BuildContext context, String route) {
  return context.go(route);
}

Pop(BuildContext context) {
  return context.pop();
}
