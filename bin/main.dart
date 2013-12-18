import 'dart:io';
import 'package:route/server.dart';
import 'utils.dart' show serveFile;

main(args) {
  HttpServer.bind(InternetAddress.LOOPBACK_IP_V4, int.parse(Platform.environment['PORT'])).then((server) {
    new Router(server)
      ..serve('/').listen(serveFile('../out/web/rpghelper.xml'))
      ..serve('../out/web/rpghelper.css').listen(serveFile('../out/web/rpghelper.xml'));
  });
}