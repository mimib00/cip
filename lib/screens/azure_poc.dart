import 'dart:developer';
import 'dart:io';

import 'package:cip/screens/signal_r/netcore.dart';
import 'package:flutter/material.dart';
import 'package:mqtt_client/mqtt_client.dart';
import 'package:mqtt_client/mqtt_server_client.dart';

const serverUrl = 'https://rk180-dev-telemetry.service.signalr.net/client/?hub=notification';
const String endpoint = 'https://rk180-dev-telemetry.service.signalr.net';
const String hostname = 'rk180-dev-telemetry.service.signalr.net';

class HttpOverrideCertificateVerificationInDev extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port) => true;
  }
}

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
        child: ElevatedButton(
            onPressed: () {
              getNetcoreConnection();
              // getPureConnection();
              // getFlutterConnection();
            },
            child: const Text('Send message to Azure IoT Hub')),
      ),
    );
  }
}
