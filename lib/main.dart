import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  late StreamSubscription subscription;
  Future checkConnection()async{
    var connectivityResult = await(Connectivity().checkConnectivity());
    if (connectivityResult==ConnectivityResult.wifi){
      Fluttertoast.showToast(msg: 'Connected with Mobile');
    }
    else if (connectivityResult==ConnectivityResult.mobile){
      Fluttertoast.showToast(msg: 'Connected with Mobile');
    }
    else{
      Fluttertoast.showToast(msg: 'Not Connected');
    }
  }
  @override
  void initState() {
    subscription=Connectivity().onConnectivityChanged.listen((event) { checkConnection();
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage('https://images.pexels.com/photos/1209843/pexels-photo-1209843.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),
              radius: 50,
            ),
            Positioned(
              top: -10,
              left: 10,
              child: Text('MD:Shakib Sikder',style: TextStyle(fontSize: 30),),
            ),
            SizedBox(
              child: Divider(thickness: 10,color: Colors.black,),
            ),
            Card(
              color: Colors.white,
              margin: EdgeInsets.all(20),
              child: ListTile(
                onTap: (){},
                title: Text('shakib996@gmail.com'),
                leading: Icon(Icons.email),
              ),
            ),
            Card(
              color: Colors.white,
              margin: EdgeInsets.all(20),
              child: ListTile(
                onTap: (){},
                title: Text('Password'),
                leading: Icon(Icons.password),
              ),
            ),
            FlatButton(onPressed: checkConnection,color: Colors.green,
              child: Text('log in',style: TextStyle(fontSize: 20),),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        child: Icon(Icons.home),
      ),
    );
  }
}

