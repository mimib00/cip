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
  final headers = MessageHeaders()
    ..setHeaderValue('AccessKey',
        'eyJhbGciOiJIUzI1NiIsImtpZCI6IjUxMDk4ODE1NyIsInR5cCI6IkpXVCJ9.eyJuYmYiOjE2NTUzNzg1NTEsImV4cCI6MTY1NTM4MjE1MSwiaWF0IjoxNjU1Mzc4NTUxLCJhdWQiOiJodHRwczovL3JrMTgwLWRldi10ZWxlbWV0cnkuc2VydmljZS5zaWduYWxyLm5ldC9jbGllbnQvP2h1Yj1ub3RpZmljYXRpb24ifQ.kvHPm5nOvaw4sgVDRp878UtU-q6at3CjPLr48WpBS1g');
  final httpOptions = HttpConnectionOptions(
    logger: logger,
    headers: headers,
    accessTokenFactory: () => Future.value(
        'eyJhbGciOiJIUzI1NiIsImtpZCI6IjUxMDk4ODE1NyIsInR5cCI6IkpXVCJ9.eyJuYmYiOjE2NTUzNzg1NTEsImV4cCI6MTY1NTM4MjE1MSwiaWF0IjoxNjU1Mzc4NTUxLCJhdWQiOiJodHRwczovL3JrMTgwLWRldi10ZWxlbWV0cnkuc2VydmljZS5zaWduYWxyLm5ldC9jbGllbnQvP2h1Yj1ub3RpZmljYXRpb24ifQ.kvHPm5nOvaw4sgVDRp878UtU-q6at3CjPLr48WpBS1g'),
    logMessageContent: true,
    httpClient: WebSupportingHttpClient(logger, httpClientCreateCallback: _httpClientCreateCallback),
  );
  // The location of the SignalR Server.

  // Creates the connection by using the HubConnectionBuilder.
  final hubConnection = HubConnectionBuilder()
      .withUrl(serverUrl, options: httpOptions)
      .withAutomaticReconnect(retryDelays: [2000, 5000, 10000, 20000]).build();
  if (hubConnection.state != HubConnectionState.Connected) {
    //await hubConnection.stop();
    log('Connecting to SignalR Netcore Server...');
    await hubConnection.start();

    log(hubConnection.state.toString());
  }
  // await hubConnection.start();
  hubConnection.on('notify', (data) {
    log('Received telemetry: $data');
  });
  // hubConnection.stream('notify', []).listen((message) {
  //   log('Received message: $message');
  // });
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
