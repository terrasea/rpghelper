import 'dart:io';
import 'package:route/server.dart';
import 'utils.dart' show serveFile;

main(args) {
  var portEnv = Platform.environment['PORT'];
  var port = portEnv == null ? 9999 : int.parse(portEnv);

  HttpServer.bind('0.0.0.0', port).then((HttpServer server) {
    print("Listening on address ${server.address.address}:${port}" );
    new Router(server).serve("/", method: "GET")
      ..listen((request) {
        new File('../out/web/rpghelper.xml').readAsString().then((val) {
          request.response
          ..write("${val}")
          ..close();
        }, onError: (e) {
          request.response
            ..write("${e.toString()}")
            ..close();
        });

        /*openRead().pipe(request.response).then((T) {
          request.response
          //..write("Hello World")
          ..close();
        });*/

      });
    /*new Router(server)
      ..serve('/').listen(serveFile('../out/web/rpghelper.xml'))
      ..serve('../out/web/rpghelper.css').listen(serveFile('../out/web/rpghelper.xml'));
    */
  });
}

