import "package:hangouts_api/hangouts_api.dart";

import 'package:polymer/polymer.dart';

import "dart:html";

@CustomTag('encounter-map')
class EncounterMap extends PolymerElement {
  CanvasElement canvas;
  ImageElement imgSource;


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
  }


  void onUpload(Event e, var detail, var target) {
    FileUploadInputElement input = e.currentTarget;
    FileList files = input.files;
    if(files.length > 0) {
      File file = files.item(0);
      FileReader reader = new FileReader();
      reader.addEventListener('load', (e) {
        imgSource.src = reader.result.toString();
        CanvasRenderingContext2D context = canvas.context2D;

        num destX = 0;
        num destY = 0;
        canvas.width = imgSource.width;
        canvas.height = imgSource.height;
        imgSource.onLoad.listen((e) {
          context.drawImage(imgSource, destX, destY);
          context.stroke();
        });

      });
      reader.readAsDataUrl(file);
    }
  }
}

