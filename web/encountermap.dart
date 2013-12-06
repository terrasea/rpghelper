import "package:hangouts_api/hangouts_api.dart";

import 'package:polymer/polymer.dart';

import "dart:html";

@CustomTag('encounter-map')
class EncounterMap extends PolymerElement {
  CanvasElement canvas;

  EncounterMap.created() : super.created();

  @override
  void enteredView() {
    super.enteredView();
    var hapi = new Hangout();
    hapi.onApiReady.add((ApiReadyEvent event) {
      if (event.isApiReady) {
        // you can start using the API now
      }
    });
    canvas = this.querySelector("#encountermap");

  }


  void onUpload() {

    CanvasRenderingContext context = canvas.getContext("map");
  }
}

