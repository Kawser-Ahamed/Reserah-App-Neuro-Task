import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:research_app/backend/signUp_backend.dart';
import 'package:research_app/routes/route.dart';

class SignUP extends StatefulWidget {
  const SignUP({super.key});

  @override
  State<SignUP> createState() => _SignUPState();
}

class _SignUPState extends State<SignUP> {

TextEditingController email = TextEditingController();
TextEditingController password = TextEditingController();
TextEditingController firstName = TextEditingController();
TextEditingController lastName = TextEditingController();
TextEditingController birthDay = TextEditingController();
TextEditingController diagnosis = TextEditingController();

List<String> items = ["","","BasketBall","Cycling","Boxing","Drumming","None","",""];
String _selectedItem = "Boxing";

final ScrollController _scrollController = ScrollController();

final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      int middleIndex = (_scrollController.offset + (0.5 * ScreenUtil().setHeight(500))) ~/ ScreenUtil().setHeight(100);
      middleIndex = middleIndex.clamp(0, items.length - 1);
      setState(() {
        _selectedItem = items[middleIndex];
      });
    });
  }
Future signUP() async {

    final FirebaseAuth auth = FirebaseAuth.instance;
    try{
      UserCredential registration = await auth.createUserWithEmailAndPassword(email: email.text, password: password.text);
      var reg = registration.user;
      if(reg!.uid.isNotEmpty){
        String userName = "${firstName.text} ${lastName.text}";
        SignUpBackend().sendUserData(
          userName, firstName.text.toString(), lastName.text.toString(),
          birthDay.text.toString(), diagnosis.text.toString(),_selectedItem
        );
        // SharedPreferences preferences = await SharedPreferences.getInstance();
        // preferences.setString('email', email.text);
        // ignore: use_build_context_synchronously
        Navigator.pushNamed(context, MyRoute.homePage);
      }
    }on FirebaseAuthException catch(error){
      if(error.code=="weak-password"){
          myDialog("Weak Password");
      }
      else if(error.code == "email-already-in-use"){
        myDialog("Email Is Already Used");
      }
      else{
        myDialog("Server Under Maintaince");
      }
    }
    catch(error){
      myDialog('$error');
    } 
  }
  


@override
  void dispose() {
    firstName.dispose();
    lastName.dispose();
    birthDay.dispose();
    diagnosis.dispose();
    
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          height: ScreenUtil().screenHeight,
          width: ScreenUtil().screenWidth,
          color: Colors.transparent,
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Neuro Task",
                 style: TextStyle(
                  fontSize: 80.sp,
                  fontWeight: FontWeight.bold,
                 ),
                ),
                Text("Sign Up",
                 style: TextStyle(
                  fontSize: 80.sp,
                  fontWeight: FontWeight.normal,
                 ),
                ),
                SizedBox(height: 40.h),
                myCustomTextFormField(email, "Email",false),
                myCustomTextFormField(password, "Password",true),
                myCustomTextFormField(firstName, "First Name",false),
                myCustomTextFormField(lastName, "Last Name",false),
                myCustomTextFormField(birthDay, "Birth Day (DD-MM-YYYY)",false),
                myCustomTextFormField(diagnosis, "Diagnosis",false),
                SizedBox(height: 30.h),
                Text("Activities",
                 style: TextStyle(
                  fontSize: 50.sp,
                  fontWeight: FontWeight.normal,
                 ),
                ),
                SizedBox(height: 30.h,),
                SizedBox(
                 height: ScreenUtil().setHeight(500),
                 width: ScreenUtil().setWidth(800),
                  child: ListView.builder(
                   controller: _scrollController,
                   itemCount: items.length,
                   itemBuilder: (BuildContext context, int index) {
                   return Container(
                    height: ScreenUtil().setHeight(100),
                    color: _selectedItem == items[index] ? Colors.grey : Colors.transparent,
                    child: Center(
                      child: Text(
                        items[index],
                        style: TextStyle(
                          fontSize: 50.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    );
                   },
                 ),
               ),
              //  /SizedBox(height:10.h),
               TextButton(
                onPressed: () async{
                  if(formKey.currentState!.validate()){
                    signUP();                     
                  }
                },
                child: Text("Start",
                style: TextStyle(
                  fontSize: 60.sp,
                ),
               ),
              ),
             ],
            ),
          ),
        ),
      )
    );
  }

  Widget myCustomTextFormField(TextEditingController controller,String title,bool check){
    return Container(
      height: 150.h,
      width: 800.w,
      margin: EdgeInsets.only(top:ScreenUtil().setHeight(30)),
      color: Colors.transparent,
      child: TextFormField(
          controller: controller,
          obscureText: check,
          decoration: InputDecoration(
            hintText: title,
            hintStyle: TextStyle(
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
          icon: const Icon(Icons.warning),
          title: Text(msg),
          actions: [
            TextButton(
              onPressed: (){
                Navigator.pop(context);
              },
               child: const Text("Ok")
            )
          ],
        );
      },
    );
  }
}