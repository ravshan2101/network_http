class Post {
  String? name;
  String? salary;
  String? age;
  String? id;

  Post({this.name, this.salary, this.age, this.id});

  Post.fromjson(Map<String, dynamic> json)
      : name = json['name'],
        salary = json['salary'],
        age = json['age'],
        id = json['id'];

  Map<String, dynamic> tojson() =>
      {'name': name, 'salary': salary, 'age': age, 'id': id};
}
