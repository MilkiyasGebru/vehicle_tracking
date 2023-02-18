import 'package:flutter/material.dart';
import 'package:vehicle_tracking/constants/TextDecorationFile.dart';

import '../services/auth.dart';

class RegisterPage extends StatefulWidget {

  @override
  State<RegisterPage> createState() => _RegisterPageState();

}

class _RegisterPageState extends State<RegisterPage> {


  final _formkey = GlobalKey<FormState>();
  bool _ishidden = true;
  String email = "";
  String error = "";
  String password = "";
  String vert = "";
  final AuthService _auth = AuthService();


  @override

  Widget build(BuildContext context) {
    print("I am in register Page");
    return Scaffold(

        // appBar: AppBar(
        //   title: Text("Register "),
        //   actions: [
        //     TextButton.icon(
        //       label: Text("SignIn"),
        //       icon:Icon(Icons.person),
        //       onPressed: (){
        //         Navigator.pop(context);
        //         // Navigator.popAndPushNamed(context, '/signIn');
        //       },
        //
        //     )
        //   ],
        //
        // ),
        body: Center(
          child: SingleChildScrollView(
            child: Form(
                key: _formkey,
                child: Container(

                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image(image: AssetImage('assets/6383307.jpg')),
                      SizedBox(height: 10.0,),
                      Padding(
                        padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                        child: Text("Create Your",style: TextStyle(
                          fontSize: 35, fontWeight: FontWeight.bold,
                        ),),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
                        child: Text("Account", style: TextStyle(
                            fontSize: 35,fontWeight: FontWeight.bold
                        ),),
                      ),
                      SizedBox(height: 6,),

                      Padding(
                        padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
                        child: Text("Email", style: TextStyle(
                            fontSize: 18,fontWeight: FontWeight.bold
                        ),),
                      ),

                      Padding(
                        padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
                        child: TextFormField(

                          decoration: textInputDecoration.copyWith(hintText: "Email",prefixIcon: Icon(Icons.email),labelText: "Email"),
                          validator: (val)=>(val == null || val.isEmpty)? "Enter an Email":null,
                          onChanged: (val){
                            setState(() {
                              email=val;
                            });
                          },

                        ),
                      ),
                      // SizedBox(height: 10.0,),
                      Padding(
                        padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                        child: Text("Password", style: TextStyle(
                            fontSize: 18,fontWeight: FontWeight.bold
                        ),),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
                        child: TextFormField(
                          decoration: textInputDecoration.copyWith(hintText: "Password",labelText: "Password",prefixIcon: Icon(Icons.key),suffix: InkWell(
                            onTap: (){
                              setState(() {
                                _ishidden = !_ishidden;
                              });
                            },
                            child: Icon(_ishidden? Icons.visibility : Icons.visibility_off),


                          )),
                          validator: (val)=> (val == null || val.length < 8)? "Password Should be greater than 8 characters":null,
                          obscureText: _ishidden,
                          onChanged: (val){
                            setState(() {
                              password = val;
                            });
                          },

                        ),
                      ),
                      SizedBox(height: 20.0,),
                      Padding(
                        padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
                        child: SizedBox(
                          height: 60,width: 400,
                          child: ElevatedButton(onPressed: ()async{

                            if (_formkey.currentState!.validate())  {
                              dynamic result = await _auth.registerWithEmailandPassword(email, password);
                              if (result == null){
                                setState(() {

                                  error = "Invalid email";
                                });
                              }
                              else{
                                print("result is not null");
                                if (result.user == null){
                                  print("Has been sent");
                                  setState(() {
                                    vert = result.waitMessage;
                                  });
                                }
                                else{
                                  print("I have verified");
                                  Navigator.pop(context);
                                }
                                // while(Navigator.)

                              }
                            }




                          }, child: Text("Sign Up",style: TextStyle(color: Colors.white),),style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.black))),
                        ),
                      ),
                      Text(error,style: TextStyle(
                          color: Colors.red
                      ),),
                      Text(vert,style: TextStyle(color: Colors.black,fontSize: 18),),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(

                          children: [

                            Text("      Already have an account?",style: TextStyle(color: Colors.black,fontSize: 15),),

                            SizedBox(width: 10,),

                            TextButton(onPressed: (){
                              // Navigator.pushNamed(context, '/register');
                              Navigator.pop(context);
                            }, child: Text("Sign In"))

                          ],

                        ),
                      )
                    ],
                  ),
                )

            ),
          ),
        )


    );
  }
}


// Widget build(BuildContext context) {
//   print("I am in register Page");
//   return Scaffold(
//
//       appBar: AppBar(
//         title: Text("Register "),
//         actions: [
//           TextButton.icon(
//             label: Text("SignIn"),
//             icon:Icon(Icons.person),
//             onPressed: (){
//               Navigator.pop(context);
//               // Navigator.popAndPushNamed(context, '/signIn');
//             },
//
//           )
//         ],
//
//       ),
//       body: Padding(
//
//           padding: EdgeInsets.all(15.0),
//           child:Form(
//               key: _formkey,
//               child: Column(
//                 children: [
//                   SizedBox(height: 10.0,),
//
//                   TextFormField(
//
//                     decoration: textInputDecoration.copyWith(hintText: "Email",prefixIcon: Icon(Icons.email),labelText: "Email"),
//                     validator: (val)=>(val == null || val.isEmpty)? "Enter an Email":null,
//                     onChanged: (val){
//                       setState(() {
//                         email=val;
//                       });
//                     },
//
//                   ),
//                   SizedBox(height: 10.0,),
//                   TextFormField(
//                     decoration: textInputDecoration.copyWith(hintText: "Password",labelText: "Password",prefixIcon: Icon(Icons.key),suffix: InkWell(
//                       onTap: (){
//                         setState(() {
//                           _ishidden = !_ishidden;
//                         });
//                       },
//                       child: Icon(_ishidden? Icons.visibility : Icons.visibility_off),
//
//
//                     )),
//                     validator: (val)=> (val == null || val.length < 8)? "Password Should be greater than 8 characters":null,
//                     obscureText: true,
//                     onChanged: (val){
//                       setState(() {
//                         password = val;
//                       });
//                     },
//
//                   ),
//                   SizedBox(height: 10.0,),
//                   ElevatedButton(onPressed: ()async{
//
//                     if (_formkey.currentState!.validate())  {
//                       dynamic result = await _auth.registerWithEmailandPassword(email, password);
//                       if (result == null){
//                         setState(() {
//
//                           error = "Invalid email";
//                         });
//                       }
//                       else{
//                         print("result is not null");
//                         if (result.user == null){
//                           print("Has been sent");
//                           setState(() {
//                             vert = result.waitMessage;
//                           });
//                         }
//                         else{
//                           print("I have verified");
//                           Navigator.pop(context);
//                         }
//                         // while(Navigator.)
//
//                       }
//                     }
//
//
//
//
//                   }, child: Text("Register")),
//                   Text(error,style: TextStyle(
//                       color: Colors.red
//                   ),),
//                   Text(vert,style: TextStyle(color: Colors.black,fontSize: 18),)
//                 ],
//               )
//
//           )
//
//
//
//       )
//
//
//   );
// }
