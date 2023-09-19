import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

        appBar: AppBar(
        title: const Text("login"),
    centerTitle: true,
    elevation: 0,
    ),
    body: SingleChildScrollView(
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    const SizedBox(height: 20),
    // const Padding(
    // padding: EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 0),
    // child: Text(
    // "Name",
    // style: TextStyle(fontSize: 18),
    // ),
    // ),
   //  Padding(
   //  padding: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 0),
   //  child: TextField(
   //  controller: nameCont,
   //  decoration: InputDecoration(
   //  border: OutlineInputBorder(
   //  borderRadius: BorderRadius.circular(12.0)),
   //  hintText: 'Enter your name',
   //  ),
   //  ),
   //  ),
    const SizedBox(height: 20),
    const Padding(
    padding: EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 0),
    child: Text(
    "E-mail",
    style: TextStyle(fontSize: 18),
    ),
    ),
    Padding(
    padding: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 0),
    child: TextField(
    //controller: emailCont,
    decoration: InputDecoration(
    border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(12.0)),
    hintText: 'Enter your e-mail',
    ),
    ),
    ),
    const SizedBox(height: 20),
    const Padding(
    padding: EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 0),
    child: Text(
    "Password",
    style: TextStyle(fontSize: 18),
    ),
    ),
    Padding(
    padding: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 0),
    child: TextField(
    //controller: passCont,
    decoration: InputDecoration(
    border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(12.0)),
    hintText: 'Enter your password',
    suffixIcon: Icon(Icons.remove_red_eye),
    ),
    ),
    ),
    const SizedBox(height: 50),
    Center(
    child: Padding(
    padding: const EdgeInsets.all(16.0),
    child: Container(
    padding: const EdgeInsets.all(8.0),
    decoration: BoxDecoration(
    color: Colors.blue,
    borderRadius: BorderRadius.circular(12.0)),
    child: MaterialButton(
    onPressed: () {},
    child: const Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
    Text(
    "Sign Up",
    style: TextStyle(fontSize: 18, color: Colors.white),
    )
    ],
    ),
    ),
    ),
    ),
    ),
    //const SizedBox(height: 20.0),
    Padding(
    padding: const EdgeInsets.all(16.0),
    child: Row(
    children: [
    Expanded(
    child: Container(
    margin: const EdgeInsets.only(right: 8.0),
    height: 1.0, // Adjust the height as needed
    color: Colors.grey[600], // Color of the dashes
    ),
    ),
    Text(
    "or",
    style: TextStyle(
    color: Colors.grey[800],
    fontSize: 18,
    ),
    ),
    Expanded(
    child: Container(
    margin: const EdgeInsets.only(left: 8.0),
    height: 1.0, // Adjust the height as needed
    color: Colors.grey[600], // Color of the dashes
    ),
    ),
    ],
    ),
    ),
    Center(
    child: Padding(
    padding: const EdgeInsets.all(16.0),
    child: Container(
    padding: const EdgeInsets.all(8.0),
    decoration: BoxDecoration(
    border: Border.all(
    color: Colors.grey.shade300, // Border color
    width: 2.0, // Border width
    ),
    borderRadius: BorderRadius.circular(12.0)),
    child: MaterialButton(
    onPressed: () {},
    child: Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
    Container(
    width: 50.0,
    height: 50.0,
    // padding: EdgeInsets.all(10.0),
    alignment: Alignment.center,
    child: Image.asset("assets/images/google.png"),
    ),
    const Text(
    "Register with Google",
    style: TextStyle(fontSize: 18),
    )
    ],
    ),
    ),
    ),
    ),
    ),
    const SizedBox(height: 10),
    Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
    Text(
    "Already signed up ?",
    style: TextStyle(
    fontSize: 15,
    color: Colors.grey[600],
    ),
    ),
    TextButton(
    onPressed: () {},
    child: const Text("Login"),
    ),
    ],
    ),
    ],
    ),
    ),
    );
  }


}
