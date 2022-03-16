import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
 class UserDetails extends StatefulWidget {
   const UserDetails({Key? key}) : super(key: key);

   @override
   _UserDetailsState createState() => _UserDetailsState();
 }

 class _UserDetailsState extends State<UserDetails> {
   @override
   Widget build(BuildContext context) {
     return StreamBuilder<QuerySnapshot>(
       stream: FirebaseFirestore.instance.collection("user").snapshots(),
       builder: (context, snapshot) {
         if (!snapshot.hasData) {
           return const Center(
             child:CircularProgressIndicator(),
           );
         };
         return ListView(
           children: snapshot.data!.docs.map((document) {
             return Container(
               child: Column(
                  children: [
                    Text(document['name']),
                    Text(document['password']),
                    Text(document['email'])
                  ],
               )

             );
           }).toList(),
         );
       },
     );
   }
 }
