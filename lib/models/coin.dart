import 'link.dart';

class Coin {
  String? id;
  String name = '';
  String symbol = '';
  String type = '';
  int decimals = 0;
  String description = '';
  String? shortDescription;
  String website = '';
  String explorer = '';
  String? research;
  String status = '';
  String logo = '';
  List<Link> links = [];
  List<String> tags = [];

  Coin.fromJson(Map<String, dynamic> data) {
    id = data['id'];
    name = data['name'];
    symbol = data['symbol'];
    type = data['type'];
    decimals = data['decimals'];
    description = data['description'];
    shortDescription = data['short_description'];
    website = data['website'];

    explorer = data['explorer'];
    research = data['research'];
    status = data['status'];
    logo = data['logo'];
    tags = data['tags'] == null ? [] : List<String>.from(data['tags']);
    links = data['links'] == null
        ? []
        : List<Link>.from(data['links'].map((x) => Link.fromJson(x)));
  }
}
