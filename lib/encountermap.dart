//import "package:hangouts_api/hangouts_api.dart";

import 'package:polymer/polymer.dart';

import "dart:html";

@CustomTag('encounter-map')
class EncounterMap extends PolymerElement {
  CanvasElement canvas;
  ImageElement imgSource;
  FileUploadInputElement uploader;


  EncounterMap.created() : super.created();

  @override
  void enteredView() {
    super.enteredView();
    /*var hapi = new Hangout();
    hapi.onApiReady.add((ApiReadyEvent event) {
      if (event.isApiReady) {
        // you can start using the API now

      }
    });*/
    imgSource = $['source'];
    canvas = $['encountermap'];
    uploader = $['chooser'];
  }


  void onUpload(Event e, var details, var parent) {
    FileUploadInputElement input = e.target;
    FileList files = input.files;
    if(files.length > 0) {
      File file = files.item(0);
      FileReader reader = new FileReader();
      reader.addEventListener('load', (e) {
        imgSource.src = reader.result.toString();
        imgSource.onLoad.listen((e) {
          CanvasRenderingContext2D context = canvas.context2D;
          canvas.width = imgSource.width;
          canvas.height = imgSource.height;
          context.drawImage(imgSource, 0, 0);
          context.stroke();
        });

      });
      reader.readAsDataUrl(file);
    }
  }
}

