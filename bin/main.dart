import 'dart:io';
import 'package:route/server.dart';
import 'utils.dart' show serveFile;

main(args) {
  var portEnv = Platform.environment['PORT'];
  var port = portEnv == null ? 9999 : int.parse(portEnv);

  HttpServer.bind('0.0.0.0', port).then((HttpServer server) {
    print("Listening on address ${server.address.address}:${port}" );
    String baseDir = "";
    new Directory('out').exists().then((exists) {
      if(exists) {
        new Router(server)
          ..serve('/').listen(serveFile('out/web/rpghelper.xml'))
          ..serve('out/web/rpghelper.css').listen(serveFile('out/web/rpghelper.xml'));
      } else {
        new Router(server)
        ..serve('/').listen(serveFile('../out/web/rpghelper.xml'))
        ..serve('../out/web/rpghelper.css').listen(serveFile('../out/web/rpghelper.xml'));
      }
    });
  });
}

