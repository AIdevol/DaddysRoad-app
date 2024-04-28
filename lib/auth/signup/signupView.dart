import 'package:daddysroad_clone/auth/login/loginView.dart';
import 'package:daddysroad_clone/helper/loginheading.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 10,
        backgroundColor: Colors.amber,
      ),
      body: ListView(children: [
        const SizedBox(height: 250, child: AppHeading()),
        _form(context)
      ]),
    );
  }

  _form(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          TextFormField(
            decoration: const InputDecoration(
                hintText: 'Name',
                prefixIcon: Icon(
                  Icons.person,
                  color: Colors.black,
                  size: 30,
                )),
          ),
          SizedBox(
            height: 10,
          ),
          TextFormField(
            decoration: const InputDecoration(
                hintText: 'Mobile Number',
                prefixIcon: Icon(
                  Icons.phone_iphone_rounded,
                  color: Colors.black,
                  size: 30,
                )),
          ),
          SizedBox(
            height: 10,
          ),
          TextFormField(
            obscureText: true,
            decoration: const InputDecoration(
                hintText: 'One Time Password',
                prefixIcon: Icon(
                  Icons.key,
                  color: Colors.black,
                  size: 30,
                )),
          ),
          SizedBox(
            height: 10,
          ),
          TextFormField(
            obscureText: true,
            decoration: const InputDecoration(
                hintText: 'Password',
                prefixIcon: Icon(
                  Icons.key,
                  color: Colors.black,
                  size: 30,
                )),
          ),
          SizedBox(
            height: 10,
          ),
          TextFormField(
            obscureText: true,
            decoration: const InputDecoration(
                hintText: 'Repeat Password',
                prefixIcon: Icon(
                  Icons.key,
                  color: Colors.black,
                  size: 30,
                )),
          ),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: () {
              print("tapeeeeeeddd........");
            },
            child: Text(
              "SignUp",
              style: TextStyle(color: Colors.black, fontSize: 16),
            ),
            style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(3)),
                backgroundColor: Colors.amber,
                minimumSize: Size.fromHeight(50)),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            height: 50,
            width: 370,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(3),
                border: const Border(
                  bottom: BorderSide(color: Colors.amber, width: 1.0),
                  left: BorderSide(color: Colors.amber, width: 1.0),
                  right: BorderSide(color: Colors.amber, width: 1.0),
                  top: BorderSide(color: Colors.amber, width: 1.0),
                )),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LoginPage(),
                  ),
                );
                print("tapeeeeeeddd........");
              },
              child: const Center(
                  child: Text(
                'Already have an Account? Login',
                style: TextStyle(color: Colors.amber),
              )),
            ),
          ),
        ],
      ),
    );
  }
}
