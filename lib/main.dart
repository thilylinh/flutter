import 'package:flutter/material.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:intro_slider/slide_object.dart';
import 'package:test_flutter/enums/status_init_view.dart';
import 'package:test_flutter/home.dart';
import 'package:test_flutter/login.dart';
import 'package:test_flutter/utils/local_storge.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Slide> slides = [];

  @override
  void initState() {
    slides.add(
      Slide(
        title: "screen 1",
        description: "screen 1",
        backgroundColor: Colors.red,
      ),
    );
    slides.add(
      Slide(
        title: "screen 2",
        description: "screen 2",
        backgroundColor: Colors.yellow,
      ),
    );
    slides.add(
      Slide(
        title: "screen 3",
        description: "screen 3",
        backgroundColor: Colors.green,
      ),
    );
  }

  Future<int> checkDoneIntro() async {
    bool isDone = false;
    String token = '';
    if (await checkExistingKeyInLocalStorage('isDone')) {
      isDone = await getValueFromLocalStorageByKey('isDone');
    }

    if (await checkExistingKeyInLocalStorage('token')) {
      token = await getValueFromLocalStorageByKey('token');
    }

    if (token.isNotEmpty) {
      return StatusInitView.home.index;
    } else if (isDone && token.isEmpty) {
      return StatusInitView.login.index;
    } else {
      return StatusInitView.intro.index;
    }
  }

  void onDonePress() async {
    setValueToLocalStorage('isDone', true);

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Login()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: checkDoneIntro(),
        builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
          if (snapshot.data == StatusInitView.home.index) {
            return Home();
          } else if (snapshot.data == StatusInitView.login.index) {
            return Login();
          } else {
            return IntroSlider(
              slides: slides,
              onDonePress: onDonePress,
            );
          }
        });
  }
}
