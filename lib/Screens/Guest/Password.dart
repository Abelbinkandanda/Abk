import 'dart:html';

import 'package:flutter/material.dart';

class PasswordScreen extends StatefulWidget {
  final Function(int) onChangedStep;
  const PasswordScreen({Key? key, required this.onChangedStep})
      : super(key: key);

  @override
  State<PasswordScreen> createState() => _PasswordScreenState();
}

class _PasswordScreenState extends State<PasswordScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _isSecret = true;
  String _password = "";
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          titleSpacing: 0.0,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            color: Colors.black,
            onPressed: () => widget.onChangedStep(0),
          ),
        ),
        body: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: [
                Text(
                  "Password".toUpperCase(),
                  style: TextStyle(fontSize: 30.0),
                ),
                SizedBox(
                  height: 30.0,
                ),
                Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text('Enter your Password'),
                        SizedBox(
                          height: 20.0,
                        ),
                        TextFormField(
                          onChanged: (value) =>
                              setState(() => _password = value),
                          validator: (value) => value!.length < 6
                              ? 'Enter a passwords. 6 caracters min required.'
                              : null,
                          obscureText: _isSecret,
                          decoration: InputDecoration(
                              suffixIcon: InkWell(
                                onTap: () =>
                                    setState(() => _isSecret = !_isSecret),
                                child: Icon(!_isSecret
                                    ? Icons.visibility
                                    : Icons.visibility_off),
                              ),
                              hintText: 'Ex: abel16',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(0.0),
                                borderSide: BorderSide(color: Colors.grey),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(0.0),
                                borderSide: BorderSide(color: Colors.grey),
                              )),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        RaisedButton(
                          color: Theme.of(context).primaryColor,
                          elevation: 0,
                          padding: EdgeInsets.symmetric(vertical: 15.0),
                          onPressed: _password.length < 6
                              ? null
                              : () => {
                                    if (_formKey.currentState!.validate())
                                      {
                                        print(_password),
                                      }
                                  },
                          child: Text(
                            'continue'.toUpperCase(),
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        )
                      ],
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
