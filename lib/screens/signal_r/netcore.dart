import 'dart:developer';
import 'dart:io';

import 'package:cip/screens/azure_poc.dart';
import 'package:http/http.dart';
import 'package:logging/logging.dart';
import 'package:signalr_netcore/ihub_protocol.dart';
import 'package:signalr_netcore/signalr_client.dart';

void _httpClientCreateCallback(Client httpClient) {
  HttpOverrides.global = HttpOverrideCertificateVerificationInDev();
}

Future<HubConnection?> getNetcoreConnection() async {
  Logger logger = Logger('AzurePoc');
  final headers = MessageHeaders()..setHeaderValue('AccessKey', 'FTSNhcCNXwRB1cRqmCs+NCpB8vkNpX5wVG8jRNVjqig=');
  final httpOptions = HttpConnectionOptions(
    logger: logger,
    headers: headers,
    accessTokenFactory: () => Future.value('FTSNhcCNXwRB1cRqmCs+NCpB8vkNpX5wVG8jRNVjqig='),
    logMessageContent: true,
    httpClient: WebSupportingHttpClient(logger, httpClientCreateCallback: _httpClientCreateCallback),
  );
  // The location of the SignalR Server.

  // Creates the connection by using the HubConnectionBuilder.
  final hubConnection = HubConnectionBuilder()
      .withUrl(serverUrl, options: httpOptions)
      .withAutomaticReconnect(retryDelays: [2000, 5000, 10000, 20000]).build();
  if (hubConnection.state != HubConnectionState.Connected) {
    log('Connecting to SignalR Netcore Server...');
    await hubConnection.start();
  }
  await hubConnection.start();
  hubConnection.on('telemetry', (data) {
    log('Received telemetry: $data');
  });
  hubConnection.stream('messages', []).listen((message) {
    log('Received message: $message');
  });
  hubConnection.onclose(({error}) => log('Connection closed: $error'));
  // When the connection is closed, print out a message to the console.
  // hubConnection.onclose((error) {
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
