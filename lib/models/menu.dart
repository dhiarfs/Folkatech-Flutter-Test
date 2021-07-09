part of 'models.dart';

class Menu {
  int id;
  String name;
  String cover;
  String desc;
  int price;

  Menu({this.id, this.cover, this.name, this.desc, this.price});

  //Memasukkan nilai kedalam variabel baru dari JSON yang diambil
  Menu.fromJson(json) {
    id = json['id'];
    name = json['name'];
    cover = json['cover'];
    desc = json['desc'];
    price = json['price'];
  }
}
