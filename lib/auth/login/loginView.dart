// import 'package:daddysroad_clone/auth/signup/signupView.dart';
// import 'package:daddysroad_clone/helper/loginheading.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';

// class LoginPage extends StatelessWidget {
//   const LoginPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: ListView(children: [
//         Container(height: 250, child: DaddyHead()),
//         _form(context)
//       ]),
//     );
//   }

//   _form(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.all(20),
//       child: Column(
//         children: [
//           TextFormField(
//             // controller: _controller,
//             // focusNode: _focusNode,

//             decoration: const InputDecoration(
//                 hintText: "Mobile Number",
//                 prefixIcon: Icon(
//                   Icons.phone_iphone_rounded,
//                   color: Colors.black,
//                   size: 30,
//                 )),
//           ),
//           SizedBox(
//             height: 10,
//           ),
//           TextFormField(
//             obscureText: true,
//             decoration: const InputDecoration(
//                 hintText: 'Password',
//                 prefixIcon: Icon(
//                   Icons.key,
//                   color: Colors.black,
//                   size: 30,
//                 )),
//           ),
//           SizedBox(
//             height: 20,
//           ),
//           ElevatedButton(
//             onPressed: () {
//               print("tapeeeeeeddd........");
//             },
//             child: Text(
//               "login",
//               style: TextStyle(color: Colors.black, fontSize: 16),
//             ),
//             style: ElevatedButton.styleFrom(
//                 shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(3)),
//                 backgroundColor: Colors.amber,
//                 minimumSize: Size.fromHeight(50)),
//           ),
//           SizedBox(
//             height: 20,
//           ),
//           Container(
//             height: 50,
//             width: 370,
//             decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(3),
//                 border: const Border(
//                   bottom: BorderSide(color: Colors.amber, width: 1.0),
//                   left: BorderSide(color: Colors.amber, width: 1.0),
//                   right: BorderSide(color: Colors.amber, width: 1.0),
//                   top: BorderSide(color: Colors.amber, width: 1.0),
//                 )),
//             child: GestureDetector(
//               onTap: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => SignupPage(),
//                   ),
//                 );
//                 print("tapeeeeeeddd........");
//               },
//               child: const Center(
//                   child: Text(
//                 'Don\'t have an Account? Click to signup',
//                 style: TextStyle(color: Colors.amber),
//               )),
//             ),
//           ),
//           SizedBox(
//             height: 20,
//           ),
//           Container(
//             height: 50,
//             width: 370,
//             decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(3),
//                 border: const Border(
//                   bottom: BorderSide(color: Colors.amber, width: 1.0),
//                   left: BorderSide(color: Colors.amber, width: 1.0),
//                   right: BorderSide(color: Colors.amber, width: 1.0),
//                   top: BorderSide(color: Colors.amber, width: 1.0),
//                 )),
//             child: GestureDetector(
//               onTap: () {
//                 print("tapeeeeeeddd........");
//               },
//               child: const Center(
//                   child: Text(
//                 'Forgot Password click to here',
//                 style: TextStyle(color: Colors.amber),
//               )),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
import 'package:daddysroad_clone/auth/login/controller/auth_bloc.dart';
import 'package:daddysroad_clone/auth/login/controller/auth_event.dart';
import 'package:daddysroad_clone/auth/login/controller/auth_state.dart';
import 'package:daddysroad_clone/auth/signup/signupView.dart';
import 'package:daddysroad_clone/core/Presentation/view/home_page.dart';
import 'package:daddysroad_clone/helper/loginheading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 10,
        backgroundColor: Colors.amber,
      ),
      body: BlocProvider<AuthBloc>(
        create: (_) => AuthBloc(),
        child: ListView(
          children: [
            Container(height: 250, child: AppHeading()),
            _form(context),
            _signupPrompt(context),
            _forgotPasswordPrompt(context)
          ],
        ),
      ),
    );
  }

  Widget _form(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          TextFormField(
            controller: _mobileController,
            decoration: const InputDecoration(
              hintText: "Mobile Number",
              prefixIcon: Icon(Icons.phone_iphone_rounded,
                  color: Colors.black, size: 30),
            ),
          ),
          const SizedBox(height: 10),
          TextFormField(
            controller: _passwordController,
            obscureText: true,
            decoration: const InputDecoration(
              hintText: 'Password',
              prefixIcon: Icon(Icons.key, color: Colors.black, size: 30),
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomePage(),
                  ));
            },
            // =>
            // BlocProvider.of<AuthBloc>(context).add(
            //   LoginSubmitted(
            //     // mobileNumber: _mobileController.text,
            //     // password: _passwordController.text,

            //   ),
            // ),
            child: const Text("Login",
                style: TextStyle(color: Colors.black, fontSize: 16)),
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(3)),
              backgroundColor: Colors.amber,
              minimumSize: Size.fromHeight(50),
            ),
          ),
          BlocBuilder<AuthBloc, AuthState>(
            builder: (context, state) {
              if (state is AuthLoading) {
                return const CircularProgressIndicator();
              } else if (state is AuthFailure) {
                return Text(state.error,
                    style: const TextStyle(color: Colors.red));
              }
              return const SizedBox.shrink();
            },
          ),
        ],
      ),
    );
  }

  Widget _signupPrompt(BuildContext context) {
    return Container(
      height: 50,
      width: 370,
      margin: const EdgeInsets.only(top: 0, bottom: 20, left: 20, right: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(3),
        border: const Border.fromBorderSide(
            BorderSide(color: Colors.amber, width: 1.0)),
      ),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SignupPage()),
          );
        },
        child: const Center(
          child: Text(
            "Don't have an Account? Click to signup",
            style: TextStyle(color: Colors.amber),
          ),
        ),
      ),
    );
  }

  Widget _forgotPasswordPrompt(BuildContext context) {
    return Container(
      height: 50,
      width: 370,
      margin: const EdgeInsets.only(top: 0, bottom: 20, left: 20, right: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(3),
        border: const Border.fromBorderSide(
            BorderSide(color: Colors.amber, width: 1.0)),
      ),
      child: GestureDetector(
        onTap: () {
          print("Forgot Password tapped");
        },
        child: const Center(
          child: Text(
            "Forgot Password? Click here",
            style: TextStyle(color: Colors.amber),
          ),
        ),
      ),
    );
  }
}
