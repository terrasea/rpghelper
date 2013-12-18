import 'dart:io';

Function serveFile(String filename) {

  return (HttpRequest request) {
    request.response.headers.contentType = new ContentType(getType(filename), getSubtype(filename));
    new File(filename).openRead().pipe(request.response);
  };
}


String getType(String filename) {
  if(filename.endsWith('xml')) {
    return 'application';
  }
  return "text";
}


String getSubtype(String filename) {
  String type = "plain";

  if(filename.endsWith('html')) {
    type = "html";
  }

  if(filename.endsWith('css')) {
    type = 'css';
  }

  if(filename.endsWith('xml')) {
    type = "xml";
  }

  return type;
}