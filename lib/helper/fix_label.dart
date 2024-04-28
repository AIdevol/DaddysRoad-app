import 'package:flutter/material.dart';

class OTPFieldExample extends StatefulWidget {
  @override
  _OTPFieldExampleState createState() => _OTPFieldExampleState();
}

class _OTPFieldExampleState extends State<OTPFieldExample> {
  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  bool _isFocusedOrNotEmpty = false;

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(_updateState);
    _controller.addListener(_updateState);
  }

  @override
  void dispose() {
    _focusNode.removeListener(_updateState);
    _controller.removeListener(_updateState);
    _focusNode.dispose();
    _controller.dispose();
    super.dispose();
  }

  void _updateState() {
    final isFocusedOrNotEmpty = _focusNode.hasFocus || _controller.text.isNotEmpty;
    if (isFocusedOrNotEmpty != _isFocusedOrNotEmpty) {
      setState(() => _isFocusedOrNotEmpty = isFocusedOrNotEmpty);
    }
  }
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }

 
  // Widget build(BuildContext context) {
  //   return TextFormField(
  //     controller: _controller,
  //     focusNode: _focusNode,
  //     obscureText: true,
  //     decoration: InputDecoration(
  //       labelText: _isFocusedOrNotEmpty ? null : 'One Time Password',
  //       prefixIcon: Icon(
  //         Icons.key,
  //         color: Colors.black,
  //         size: 30,
  //       ),
  //     ),
  //   );
  // }
}
