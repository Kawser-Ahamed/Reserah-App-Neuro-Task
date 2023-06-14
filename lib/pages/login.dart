import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:research_app/routes/route.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  final GlobalKey formKey = GlobalKey<FormState>();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  Future login() async{
    FirebaseAuth auth = FirebaseAuth.instance;
    try{
      await auth.signInWithEmailAndPassword(
      email: email.text, password: password.text,
      );
      // ignore: use_build_context_synchronously
      Navigator.pushNamed(context, MyRoute.homePage);
      // SharedPreferences preferences = await SharedPreferences.getInstance();
      // preferences.setString('email', email.text);
    } on FirebaseAuthException catch(error){
      if(error.code == 'user-not-found'){
        myDialog("Email address is wrong");
      }
      else if(error.code == 'wrong-password'){
        myDialog("Password Is Incorrect");
      }
    }
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          height:ScreenUtil().screenHeight,
          width: ScreenUtil().screenWidth,
          color: Colors.white,
          child: Column(
            children: [
              Image.asset("assets/images/doctor.jpg",
              height: 700.h,
              width: 1400.w,
              ),
              SizedBox(height: 60.h,),
              Text("Neuro Task Login",
              style: TextStyle(
                fontSize: 80.sp,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple,
              ),
              ),
              SizedBox(height: 60.h,),
              Container(
                height: 1179.h,
                width: double.maxFinite.w,
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(0, 152, 153, 0.6),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(100.sp),
                    topRight: Radius.circular(100.sp),
                  )
                ),
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      SizedBox(height: 80.h,),
                      myCustomTextFormField(email, "Email", false),
                      myCustomTextFormField(password, "Password", true),
                      SizedBox(height: 50.h,),
                      ElevatedButton(
                        onPressed: (){
                          login();
                        },
                         child: Text("Login",
                         style: TextStyle(
                          fontSize: 50.sp,
                         ),
                         )
                      ),
                      TextButton(
                        onPressed: (){
                          Navigator.pushNamed(context, MyRoute.signUp);
                        }, 
                        child: Text("Don't Have Any Account? Sign Up",
                        style: TextStyle(
                          fontSize: 50.sp,
                          color: const Color.fromARGB(255, 17, 92, 54),
                        ),
                        )
                      ),
                      SizedBox(height: 50.h,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(Icons.medical_information,
                          size: 90.sp,
                          color: Colors.lime,
                          ),
                          Icon(Icons.local_hospital,
                          size: 90.sp,
                          color: const Color.fromARGB(255, 213, 64, 233),
                          ),
                          Icon(Icons.book,
                          size: 90.sp,
                          color: Colors.blue
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  Widget myCustomTextFormField(TextEditingController controller,String title,bool check){
    return Container(
      height: 150.h,
      width: 800.w,
      margin: EdgeInsets.only(top:ScreenUtil().setHeight(50)),
      color: Colors.transparent,
      child: TextFormField(
          controller: controller,
          obscureText: check,
          style: const TextStyle(
            color: Colors.white,
          ),
          decoration: InputDecoration(
            hintText: title,
            hintStyle: TextStyle(
            color: Colors.white,
            fontSize: 45.sp,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(20.sp)),
            )
          ),
          validator: (value){
            if(value!.isEmpty){
              return 'Please Enter $title';
            }
            return null;
          },
        ),
    );
  }
  myDialog(String msg){
    return showDialog(
      context: context, 
      builder: (context) {
        return AlertDialog(
          title: Text(msg),
          actions: [
            TextButton(
              onPressed: (){
                Navigator.pop(context);
              }, 
              child: const Text("Ok")
            ),
          ],
        );
      },
    );
  }
}