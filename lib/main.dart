import 'package:flutter/material.dart';
import 'package:network_http/model/post.dart';
import 'package:network_http/servic/http.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String data = "";

  void _apiGEt() {
    Network.GET(Network.Api_list, Network.paramsNotempty())
        .then((response) => {print(response), _showprint(response!)});
  }

  void _apiPost(Post post) {
    Network.POST(Network.Api_create, Network.paramsCreate(post))
        .then((response) => {print(response), _showprint(response!)});
  }

  void _apiPut(Post post) {
    Network.PUT(Network.Api_updata, Network.paramsUpdata(post))
        .then((response) => {print(response), _showprint(response!)});
  }

  void _apiDel(Post post) {
    Network.DEL(Network.Api_delete, Network.paramsNotempty())
        .then((response) => {print(response), _showprint(response!)});
  }

  void _showprint(String response) {
    setState(() {
      data = response;
    });
  }

  @override
  void initState() {
    super.initState();
    var post = Post(name: 'test', salary: '123', age: '23', id: '25');
    _apiDel(post);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text(data != null ? data : "No data")),
    );
  }
}
