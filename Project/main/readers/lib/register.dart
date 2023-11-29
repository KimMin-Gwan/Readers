import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title:Text('회원가입',
          style: TextStyle(color:Colors.black,
                  fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.white,
        ),
        body: Container(
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              SignInForm(),
            ],
          )
        ),
      ),
    );
  }
}

class SignInForm extends StatefulWidget{
  @override
  _SignInFormState createState()=> _SignInFormState();
}

class _SignInFormState extends State<SignInForm>{
  final _formKey = GlobalKey<FormState>();

  String? _userId, _password, _name, _phone, _email; //null safety 때문에~

  @override
  Widget build(BuildContext context){
    return Form(
      key: _formKey,
      child: Padding(
            padding: EdgeInsets.symmetric(horizontal:50),
            child: Column(
              children: <Widget>[
                TextFormField(
                  decoration: InputDecoration(labelText: '아이디'),
                  onSaved: (value)=>_userId=value,
                  validator: (value) => (value == null || value.isEmpty) ? '아이디를 입력해주세요' : null,
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: '비밀번호'),
                  obscureText: true,
                  onSaved: (value)=>_password=value,
                  validator: (value) => (value == null || value.isEmpty) ? '비밀번호를 입력해주세요' : null,
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: '휴대폰 번호'),
                  onSaved: (value)=>_phone=value,
                  validator: (value) => (value == null || value.isEmpty) ? '휴대폰번호를 입력해주세요' : null,
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: '이메일'),
                  onSaved: (value)=>_email=value,
                  validator: (value) => (value == null || value.isEmpty) ? '이메일을 입력해주세요' : null,
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  width: 250,
                  height: 45,
                  child: ElevatedButton(
                    onPressed: _submit,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepPurple,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      )
                    ),
                    child: Text('회원가입'),
                  ),
                ),

              ],
            ),
      ),
    );
  }

  void _submit(){
    if(_formKey.currentState?.validate()??false){ //null일 수도 있다는 점 고려할 것
      _formKey.currentState?.save();
      //데베로 회원정보 저장코드
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('회원가입이 완료되었습니다!'),
        ),
      );
    }
  }
  
}