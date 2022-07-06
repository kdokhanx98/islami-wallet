class Link {
  String name = '';
  String url = '';

  Link.fromJson(Map<String, dynamic> data) {
    name = data["name"];
    url = data["url"];
  }
}
