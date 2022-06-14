import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:mqtt_client/mqtt_client.dart';
import 'package:mqtt_client/mqtt_server_client.dart';
import 'package:signalr_netcore/signalr_client.dart';

class AzurePoc extends StatefulWidget {
  const AzurePoc({super.key});

  @override
  State<AzurePoc> createState() => _AzurePocState();
}

class _AzurePocState extends State<AzurePoc> {
  @override
  void initState() {
    super.initState();
  }

  void connectViaMQTT() {
    // Connect to Azure Iot Hub via MQTT6
    final client = MqttServerClient('ok.azure-devices.net', '')
      ..useWebSocket = false
      ..port = 8883
      ..autoReconnect = true
      ..keepAlivePeriod = 3600;

    const user = '<hubname>.azure-devices.net/<your device id>';
    const username = '$user:<your device key>';
    const password = '<your device key>';
    final connMess = MqttConnectMessage().withClientIdentifier('testdevice').startClean();
    client.connectionMessage = connMess;
    client.connect(username, password).then((connack) {
      log('Connected to Azure IoT Hub');
      client.subscribe('devices/<your device id>/messages/devicebound/#', MqttQos.atLeastOnce);
      client.updates?.listen((message) {
        log('Received message: ${message.length}');
      });
    });
  }

  late Logger _logger;
  HubConnection? _hubConnection;

  Future<HubConnection?> _getHubConnection() async {
    // The location of the SignalR Server.
    const serverUrl = 'https://192.168.10.50:51001';
// Creates the connection by using the HubConnectionBuilder.
    final hubConnection =
        HubConnectionBuilder().withUrl(Uri.parse(serverUrl).toString()).withAutomaticReconnect().build();
    await hubConnection.start();
    hubConnection.stream('messages', []).listen((message) {
      log('Received message: $message');
    });
// When the connection is closed, print out a message to the console.
    // hubConnection.onclose(( error = Error?) {
    //   log('Connection closed: $error');
    // });
    return null;

//     _logger = Logger('AzurePoc');
//     if (_hubConnection == null) {
//       final headers = MessageHeaders();
//       headers.setHeaderValue('api-key', 'my-top-secret-api-key');
//       final httpOptions = HttpConnectionOptions(logger: _logger, headers: headers);
//       //final httpOptions = new HttpConnectionOptions(logger: logger, transport: HttpTransportType.ServerSentEvents);
//       //final httpOptions = new HttpConnectionOptions(logger: logger, transport: HttpTransportType.LongPolling);
// // The location of the SignalR Server.
//       const serverUrl = 'http://api.openweathermap.org/data/2.5/weather';
//       _hubConnection = HubConnectionBuilder()
//           .withUrl(serverUrl, options: httpOptions)
//           /* Configure the Hub with msgpack protocol */
//           //.withHubProtocol(MessagePackHubProtocol())
//           .withAutomaticReconnect()
//           .configureLogging(_logger)
//           .build();
//       _hubConnection?.onclose(({error}) => _logger.info('Connection Closed'));
//     }

//     if (_hubConnection?.state != HubConnectionState.Connected) {
//       await _hubConnection?.start();
//       _logger.info("Connection state '${_hubConnection?.state}'");
//     }

//     return _hubConnection;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[800],
        title: const Text(
          'Azure IoT Hub',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
        ),
        elevation: 0,
        centerTitle: true,
      ),
      body: Center(
        child: ElevatedButton(onPressed: _getHubConnection, child: const Text('Send message to Azure IoT Hub')),
      ),
    );
  }
}
