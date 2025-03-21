import 'package:flutter/material.dart';  

class ContactInfoScreen extends StatelessWidget {  
  static const String routeName = '/contactInfo';  

  @override  
  Widget build(BuildContext context) {  
    return Scaffold(  
      appBar: AppBar(title: Text('Contact Info')),  
      body: Center(  
        child: Text('This is the Contact Info screen.'),  
      ),  
    );  
  }  
}  