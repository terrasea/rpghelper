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
          ..serve('/').listen(serveFile('out/web/rpghelper.html'))
          ..serve('/rpghelper.css').listen(serveFile('out/web/rpghelper.css'))
          ..serve('/packages/shadow_dom/shadow_dom.debug.js').listen(serveFile('packages/shadow_dom/shadow_dom.debug.js'))
          ..serve('/packages/custom_element/custom-elements.debug.js').listen(serveFile('packages/custom_element/custom-elements.debug.js'))
          ..serve('/packages/browser/interop.js').listen(serveFile('packages/browser/interop.js'))
          ..serve('/rpghelper.html_bootstrap.dart.js').listen(serveFile('out/web/rpghelper.html_bootstrap.dart.js'))
          ;
      } else {
        new Router(server)
        ..serve('/').listen(serveFile('../out/web/rpghelper.xml'))
        ..serve('/rpghelper.css').listen(serveFile('../out/web/rpghelper.xml'));
      }
    });
  });
}

