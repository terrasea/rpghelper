import 'dart:io';
import 'package:route/server.dart';
import 'utils.dart' show serveFile;

main() {
  String portEnv = Platform.environment['PORT'];
  int port = portEnv == null ? 8080 : int.parse(portEnv);
  HttpServer.bind(InternetAddress.LOOPBACK_IP_V4, port).then((server) {
    new Router(server)
      ..serve('/').listen(serveFile('../out/web/rpghelper.xml'))
      ..serve('../out/web/rpghelper.css').listen(serveFile('../out/web/rpghelper.xml'));
  });
}