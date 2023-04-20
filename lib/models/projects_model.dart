class ProjectModel {
  String? title;
  String? url;
  String? playStore;

  ProjectModel({this.title, this.url, this.playStore});

  ProjectModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    url = json['url'];
    playStore = json['playstore'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['url'] = url;
    data['playstore'] = playStore;
    return data;
  }
}
