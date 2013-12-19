import 'package:unittest/unittest.dart';
import 'package:unittest/html_config.dart';
import 'dart:html';
import 'dart:async';
import 'package:polymer/polymer.dart';

main() {
  // Ensure Polymer is looking for bound variables...
  addXParent();
  initPolymer();
  removeXParent();

  setUp(addXParent);
  tearDown(removeXParent);

  group("encountermap", (){
    test('has canvas element', (){
      new Timer(
        new Duration(milliseconds: 2500),
        expectAsync0((){
          expect(
            querySelector('encounter-map').shadowRoot.querySelector('canvas'),
            isNotNull
          );
        })
      );
    });

    test("contains file input element", (){
      new Timer(
        new Duration(milliseconds: 2500),
        expectAsync0((){
          expect(
            querySelector('encounter-map').shadowRoot.querySelector('input').attributes['type'],
            contains('file')
          );
        })
      );
    });
  });
}

addXParent() {
  document.body.append(createElement('<encounter-map></encounter-map>'));
}

removeXParent() {
  querySelectorAll('encounter-map').forEach((el)=> el.remove());
}

createElement(String html) =>
  new Element.html(html, treeSanitizer: new NullTreeSanitizer());

class NullTreeSanitizer implements NodeTreeSanitizer {
  void sanitizeTree(node) {}
}