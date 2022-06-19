import 'package:flutter/material.dart';
import 'package:test_flutter/utils/local_storge.dart';

import 'home.dart';

class Login extends StatefulWidget {
  @override
  State<Login> createState() => LoginState();
}

class LoginState extends State<Login> {
  void login() {
    setValueToLocalStorage('token', 'tokenFake');
    Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Flutter Demo"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "SIGN IN",
                    style: Theme.of(context).textTheme.headline4,
                  ),
                ],
              ),
              const SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.only(bottom: 30),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    Padding(
                      padding: EdgeInsets.only(right: 16),
                      child: Icon(
                        Icons.alternate_email,
                        color: Colors.red,
                      ),
                    ),
                    Expanded(
                      child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Email Address',
                          ),
                          style: TextStyle(color: Colors.white)),
                    ),
                  ],
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  Padding(
                    padding: EdgeInsets.only(right: 16),
                    child: Icon(
                      Icons.lock,
                      color: Colors.red,
                    ),
                  ),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                          hintText: 'Password', fillColor: Colors.white),
                      style: TextStyle(color: Colors.white),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 20),
              // const Spacer(),
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.white.withOpacity(.5),
                        ),
                      ),
                      child: Icon(
                        Icons.facebook_sharp,
                        color: Colors.white.withOpacity(.5),
                      ),
                    ),
                    const SizedBox(width: 20),
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.white.withOpacity(.5),
                        ),
                      ),
                      child: Icon(
                        Icons.discord_sharp,
                        color: Colors.white.withOpacity(.5),
                      ),
                    ),
                    const Spacer(),
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.red,
                      ),
                      child: IconButton(
                        icon: const Icon(Icons.arrow_forward),
                        color: Colors.black,
                        onPressed: () {
                          login();
                        },
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
