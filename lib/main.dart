import 'package:flutter/material.dart';

void main() => runApp(
  const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomePage()
  ) // MaterialApp
);

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 30),
        width: double.infinity,
        decoration: BoxDecoration(
           gradient: LinearGradient(
             begin: Alignment.topCenter,
             colors: [
               Colors.orange[400],
               Colors.orange[300],
               Colors.orange[200]
             ]
           )
       ),
       child: Column(
         crossAxisAlignment: CrossAxisAlignment.start,
         children: <Widget>[
           const SizedBox(height: 80,),
           const Padding(
             padding: EdgeInsets.all(20),
             child: Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: <Widget>[
                 Text("Login", style: TextStyle(color: Colors.white, fontSize: 40),),
                 SizedBox(height: 10,),
                 Text("Welcome Back", style: TextStyle(color: Colors.white, fontSize: 40),),
               ],
             ),
           ),
           const SizedBox(height: 20,),
           Expanded(
               child: Container(
                 decoration: const BoxDecoration(
                   color: Colors.white,
                   borderRadius: BorderRadius.only(topLeft: Radius.circular(60), topRight: Radius.circular(60))
                 ),
                 child: Padding(
                   padding: const EdgeInsets.all(30),
                   child: Column(
                     children: <Widget>[
                           const SizedBox(height: 60,),
                           Container(
                             decoration: BoxDecoration(
                               color: Colors.white,
                               borderRadius: BorderRadius.circular(10),
                               boxShadow: const [BoxShadow(
                                 color: Color.fromRGBO(225, 95, 27, .3),
                                 blurRadius: 20,
                                 offset: Offset(0,10)
                               )]
                             ),
                             child: Column(
                               children: <Widget>[
                                 Container(
                                   padding: const EdgeInsets.all(10),
                                   decoration: BoxDecoration(
                                     border: Border(bottom: BorderSide(color: Colors.grey[200]))
                                   ),
                                   child: const TextField(
                                     decoration: InputDecoration(
                                       hintText: "Email or Phone number",
                                       hintStyle: TextStyle(color: Colors.grey),
                                       border: InputBorder.none
                                     ),
                                   ),
                                 ),
                                 Container(
                                   padding: const EdgeInsets.all(10),
                                   decoration: BoxDecoration(
                                       border: Border(bottom: BorderSide(color: Colors.grey[200]))
                                   ),
                                   child: const TextField(
                                     decoration: InputDecoration(
                                         hintText: "Password",
                                         hintStyle: TextStyle(color: Colors.grey),
                                         border: InputBorder.none
                                     ),
                                   ),
                                 ),
                               ],
                             ),
                           ),
                           const SizedBox(height: 40,),
                           const Text("Forgot Password?", style: TextStyle(color: Colors.grey),),
                           const SizedBox(height: 40,),
                           Container(
                             height: 50,
                             margin: const EdgeInsets.symmetric(horizontal: 50),
                             decoration: BoxDecoration(
                               borderRadius: BorderRadius.circular(50),
                               color: Colors.orange[900]
                             ),
                             child: const Center(
                               child: Text("Login", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                             ),
                           ),
                           const SizedBox(height: 50,),
                           Row(
                             children: <Widget>[
                               Expanded(
                                 child: Container(
                                   height: 50,
                                   decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                      color: Colors.blue
                                   ),
                                 ),
                               ),
                               Container(
                                 height: 50,
                                 decoration: BoxDecoration(
                                     borderRadius: BorderRadius.circular(50),
                                     color: Colors.black
                                 ),
                               )
                             ],
                           )
                     ],
                   ),
                 )
               ),
           )
         ],

       )
     ),
    );
  }
}