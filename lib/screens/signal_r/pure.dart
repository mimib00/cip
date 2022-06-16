// import 'dart:developer';

// import 'package:signalr_pure/signalr_pure.dart';

// import '../azure_poc.dart';

// getPureConnection() async {
//   final builder = HubConnectionBuilder()
//     ..url = serverUrl
//     ..logLevel = LogLevel.information
//     ..reconnect = true;
//   final connection = builder.build();
//   log('Connecting to SignalR Pure Server...');

//   connection.on('send', (args) => print(args));
//   await connection.startAsync();
//   await connection.sendAsync('send', ['Hello', 123]);
//   final obj = await connection.invokeAsync('send', ['Hello', 'World']);
// }
