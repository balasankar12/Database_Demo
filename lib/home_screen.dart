import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:database_semo/userdetails.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    TextEditingController name= TextEditingController();
    TextEditingController password= TextEditingController();
    TextEditingController email= TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title:Text('Database Demo'),
      ),
      body: SafeArea(
          child: Center(
            child:SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                children:[
                  TextField(
                    controller: name,
                    decoration: const InputDecoration(
                      label:Text("NAME"),
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  TextField(
                    controller: password,
                    decoration:const InputDecoration(
                      label:Text("PASSWORD"),
                    )
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),

                  TextField(
                      controller: email,
                      decoration:const InputDecoration(
                        label:Text("EMAIL"),
                      )
                  ),
                  const SizedBox(
                    height: 20.0
                  ),
                  ElevatedButton(onPressed: (){
                    String mail=email.text;
                    String n=name.text;
                    String pass=password.text;
                     FirebaseFirestore.instance.collection('user').doc(mail).set({'name':n,'password':pass,'email':mail});
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>UserDetails()));
                  }, child: Text('Store'))
                ]
              )
          )
            )
      )),
    );
  }
}

