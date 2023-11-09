import 'package:flutter/material.dart';

import 'Widgets/Dare.dart';
import 'Widgets/Truth.dart';

class TruthDareScreen extends StatefulWidget {
  @override
  State<TruthDareScreen> createState() => _TruthDareScreenState();
}

class _TruthDareScreenState extends State<TruthDareScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Truth/Dare',),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(opacity: 0.8,
            image: NetworkImage('assets/images/back.jpg'), // Replace 'assets/background.jpg' with your actual background image path
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
           child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {

                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Truth()));
                  // Handle button 2 press
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.white,
                    fixedSize: Size(200, 60),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)
                    )
                ),
                child: Text('Truth',style: TextStyle(fontSize: 25),),
              ),
              SizedBox(height: 30,),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Dare()));
                  // Handle button 2 press
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.white,
                    fixedSize: Size(200, 60),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)
                    )
                ),
                child: Text('Dare',style: TextStyle(fontSize: 25),),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

