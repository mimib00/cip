import 'dart:developer';

import 'package:cip/screens/azure_poc.dart';
import 'package:signalr_flutter/signalr_flutter.dart';

getFlutterConnection() {
  SignalR signalR = SignalR(serverUrl, "<Your hub name here>",
      hubMethods: ["<Your Hub Method Names>"],
      statusChangeCallback: (status) => print(status),
      hubCallback: (methodName, message) => print('MethodName = $methodName, Message = $message'));
  log('Connecting to SignalR Flutter Server...');
  signalR.connect();
}
