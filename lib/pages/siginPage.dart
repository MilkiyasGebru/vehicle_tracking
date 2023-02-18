import 'package:flutter/material.dart';
import 'package:vehicle_tracking/constants/TextDecorationFile.dart';

import '../services/auth.dart';

class SignInPage extends StatefulWidget {

  @override
  State<SignInPage> createState() => _SignInPageState();

}

class _SignInPageState extends State<SignInPage> {


  final _formkey = GlobalKey<FormState>();
  bool _ishidden = true;
  String email = "";
  String error = "";
  String password = "";
  final AuthService _auth = AuthService();


  @override
  Widget build(BuildContext context) {


    return Scaffold(

      // appBar: AppBar(
      //   title: Text("Sign In Page"),
      //   actions: [
      //     TextButton.icon(
      //       label: Text("Regiseter",style: TextStyle(
      //         color: Colors.red
      //       ),),
      //       icon:Icon(Icons.person),
      //       onPressed: (){
      //         Navigator.pushNamed(context, '/register');
      //       },
      //
      //     )
      //   ],
      //
      // ),
      body: Center(

        // padding: EdgeInsets.all(15.0),
        child:SingleChildScrollView(

            child: Form(
              key: _formkey,
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [

                    Image(image: AssetImage("assets/6387974.jpg")),

                    Padding(
                      padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                      child: Text("Welcome",style: TextStyle(
                        fontSize: 35, fontWeight: FontWeight.bold,
                      ),),
                    ),

                    Padding(
                      padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
                      child: Text("Back", style: TextStyle(
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
                        decoration: textInputDecoration.copyWith(hintText: "Email",prefixIcon: Icon(Icons.email,color: Colors.black,)),
                        validator: (val)=>(val == null || val.isEmpty)? "Enter an Email":null,
                        onChanged: (val){
                          setState(() {
                            email=val;
                          });
                        },

                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: Text("Password", style: TextStyle(
                          fontSize: 18,fontWeight: FontWeight.bold
                      ),),
                    ),


                    Padding(
                      padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
                      child: TextFormField(
                        decoration: textInputDecoration.copyWith(hintText: "Password",prefixIcon: Icon(Icons.key,color: Colors.black,),suffix: InkWell(
                          onTap: (){
                            setState(() {
                              // print("$_ishidden is the value" );
                              _ishidden = !_ishidden;
                            });
                          }

                          ,child: Icon(_ishidden? Icons.visibility: Icons.visibility_off),

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
                        print("I am pressed ");
                        if (_formkey.currentState!.validate())  {
                          dynamic result = await _auth.signWithEmailandPassword(email, password);
                          print("Hello User");
                          if (result == null){
                            setState(() {
                              error = "Wrong email or Password";
                            });
                          }


                        }




                        }, child: Text("Sign In ",style: TextStyle(color: Colors.white)),style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.black))),
                      ),
                    ),

                    Text(error,style: TextStyle(
                      color: Colors.red
                    ),),

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(

                        children: [

                          Text("      Don't have an account?",style: TextStyle(color: Colors.black,fontSize: 15),),

                          SizedBox(width: 10,),

                          TextButton(onPressed: (){
                            Navigator.pushNamed(context, '/register');
                          }, child: Text("Sign Up"))

                        ],

                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        // error,style: TextStyle(
        //         color: Colors.red
              ),);
            // ],
          // )

        // )



      // )


    // );

  }



}


// Scaffold(
//
//
// body: Center(
// child: SingleChildScrollView(
// child: Container(
// child: Column(
//
// crossAxisAlignment: CrossAxisAlignment.start,
// mainAxisAlignment: MainAxisAlignment.start,
//
// children: [
//
// Image(image: AssetImage("assets/6387974.jpg")),
//
// // SizedBox(height: 10,),
//
//
// Padding(
// padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
// child: Text("Welcome",style: TextStyle(
// fontSize: 35, fontWeight: FontWeight.bold,
// ),),
// ),
//
// Padding(
// padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
// child: Text("Back", style: TextStyle(
// fontSize: 35,fontWeight: FontWeight.bold
// ),),
// ),
//
// SizedBox(height: 6,),
// Padding(
// padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
// child: Text("Email", style: TextStyle(
// fontSize: 18,fontWeight: FontWeight.bold
// ),),
// ),
//
// // ,prefixIcon: Icon(Icons.email,color: Colors.black,)
// Padding(
// padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
// child: TextFormField(
// decoration:inpDecoration.copyWith(hintText: "Email")
// ,),
// ),
// // SizedBox(height: 5,),
// Padding(
// padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
// child: Text("Password", style: TextStyle(
// fontSize: 18,fontWeight: FontWeight.bold
// ),),
// ),
// Padding(
// padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
// child: TextFormField(
// decoration:inpDecoration.copyWith(hintText: "Password")
// ,),
// ),
//
// SizedBox(height: 20),
//
// Padding(
// padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
// child: SizedBox(height: 60,child: TextButton(onPressed: (){}, style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.black)),child: Center(child: Text("Sign In",style: TextStyle(color: Colors.white),)),))),
//
// Padding(
// padding: const EdgeInsets.all(8.0),
// child: Row(
//
// children: [
//
// Text("      Don't have an account?",style: TextStyle(color: Colors.black,fontSize: 15),),
//
// SizedBox(width: 10,),
//
// TextButton(onPressed: (){}, child: Text("Login"))
//
// ],
//
// ),
// )
//
//
//
// ],
//
// ),
// ),
// ),
// ),
//
//
//
//
// );




// return Scaffold(
//
// appBar: AppBar(
// title: Text("Sign In Page"),
// actions: [
// TextButton.icon(
// label: Text("Regiseter",style: TextStyle(
// color: Colors.red
// ),),
// icon:Icon(Icons.person),
// onPressed: (){
// Navigator.pushNamed(context, '/register');
// },
//
// )
// ],
//
// ),
// body: Padding(
//
// padding: EdgeInsets.all(15.0),
// child:Form(
// key: _formkey,
// child: Column(
// children: [
// SizedBox(height: 10.0,),
// TextFormField(
// decoration: textInputDecoration.copyWith(labelText: "Password",hintText: "Email",prefixIcon: Icon(Icons.email)),
// validator: (val)=>(val == null || val.isEmpty)? "Enter an Email":null,
// onChanged: (val){
// setState(() {
// email=val;
// });
// },
//
// ),
// SizedBox(height: 10.0,),
// TextFormField(
// decoration: textInputDecoration.copyWith(labelText: "Password",hintText: "Password",prefixIcon: Icon(Icons.key),suffix: InkWell(
// onTap: (){
// setState(() {
// _ishidden = !_ishidden;
// });
// }
//
// ,child: Icon(_ishidden? Icons.visibility: Icons.visibility_off),
//
// )),
// validator: (val)=> (val == null || val.length < 8)? "Password Should be greater than 8 characters":null,
// obscureText: _ishidden,
// onChanged: (val){
// setState(() {
// password = val;
// });
// },
//
// ),
// SizedBox(height: 10.0,),
// ElevatedButton(onPressed: ()async{
//
// if (_formkey.currentState!.validate())  {
// dynamic result = await _auth.signWithEmailandPassword(email, password);
// if (result == null){
// setState(() {
// error = "Wrong email or Password";
// });
// }
//
//
// }
//
//
//
//
// }, child: Text("Sign In ")),
// Text(error,style: TextStyle(
// color: Colors.red
// ),)
// ],
// )
//
// )
//
//
//
// )
//
//
// );


