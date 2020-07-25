

class Amimal {
  String name;
  Amimal(this.name);
  // Amimal.fromJson(Map json) {
  //   this.name = json['name'];
  // }
  String eat(int ab, {String c = 'abdddd'}) {
     print(ab);
     print(c);
     print(this.name);
     return c;
   }


  }

  class Human extends Amimal {
  String bba;


   Human(name, this.bba):super(name);

    @override
    String eat(int ab, {String c = 'abdddd'}) {
    // TODO: implement eat
    return this.name + c + this.bba;
  }
  }
  
  main() {
var list = <String>['a', '32434'];
var set1 = <String>{'a', '32434'};
var am = new Amimal('hw');
var am2 = new Amimal('hw2');
var map = <Amimal, String>{am:'a', am2:'b'};
print(list is List);
print(set1 is Set);
print(map is Map);
print(map[am]);
}