import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:project1/day1/login_page.dart';

class Registration extends StatefulWidget {
  const Registration({Key? key}) : super(key: key);

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  bool _checkbox =false;
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmpasswordController = TextEditingController();

  var name = '', email = ' ', password = '', confirmpassword = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('Hey there,',
                  textScaleFactor: 2,
                  style: TextStyle(fontWeight: FontWeight.normal)),
              Text(
                'Create Account',
                textScaleFactor: 3,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                      label: Text('Name'), border: OutlineInputBorder()),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                      label: Text('Email'), border: OutlineInputBorder()),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                      label: Text('Password'), border: OutlineInputBorder()),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextField(
                  controller: confirmpasswordController,
                  obscureText: true,
                  decoration: InputDecoration(
                      label: Text('Confirm Password'),
                      border: OutlineInputBorder()),
                ),
              ),
              Row(
                children: [
                  Checkbox(value: _checkbox, onChanged: (value) {
                    setState(() {
                      _checkbox =! _checkbox;
                    });
                  },),
                  SizedBox(
                    width: 300,
                      child: Text('By creating an account,you agree to Use and Privacy Notice')),
                ],
              ),
              TextButton(onPressed: () {}, child: Text('Read privacy policy')),
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      name = nameController.text;
                      email = emailController.text;
                      password = passwordController.text;
                      confirmpassword = confirmpasswordController.text;

                      if (name.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text('Enter your name '),
                        ));
                      } else if (email.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text('Enter your mail'),
                        ));
                      } else if (password.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text('Enter your password'),
                        ));
                      } else if (confirmpassword.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text('Confirm your password'),
                        ));
                      } else if (password != confirmpassword) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Passwords dont match')));
                      } else {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoginPage(),
                            ));
                      }
                    });
                  },
                  child: Text('Register')),
              TextButton(onPressed: () {}, child: Text('Login +')),
              Text(name),
            ],
          )
        ],
      ),
    );
  }
}
