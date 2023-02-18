import 'package:flutter/material.dart';
import 'package:point_in_polygon/point_in_polygon.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SingleChildScrollView(

        child: Padding(

          padding: EdgeInsets.all(12.0),
          child: Column(

            children: [
              Image(image: AssetImage('assets/6383307.jpg')),
              Text("Welcome User",style: TextStyle(
                fontSize: 25.0,
              ),),
              Text("Make ur car safe by using this applicatiion"),
              Form(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextFormField(),
                      SizedBox(height: 5,),
                      TextFormField()

                    ],
                  )

              )

            ],

          ),

        ),
      ),

    );
  }
}
