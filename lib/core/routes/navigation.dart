import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

Future PushTo(BuildContext context, String route, {Object? extra}) {
  // return Navigator.push(context, MaterialPageRoute(builder: (context) => page));
  return context.push(route, extra: extra);
}

pushWithRelacement(BuildContext context, String route, {Object? extra}) {
  return context.pushReplacement(route);
}

PushAndRemoveUntil(BuildContext context, String route, {Object? extra}) {
  return context.go(route, extra: extra);
}

Pop(BuildContext context) {
  return context.pop();
}
