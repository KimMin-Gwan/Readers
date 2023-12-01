import 'package:flutter/material.dart';
import './find.dart' as find;
import './main.dart' as main;
import './register.dart' as register;

class loginPage extends StatelessWidget {
  const loginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Stack(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('./background.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Align(
              alignment: Alignment(0, -0.5), //로그인 box 화면 위치 조정 위해 Align 사용
              child: Container(
                width: 350,
                height: MediaQuery.of(context).size.height *
                    0.70, //화면의 일정 비율 높이를 가지기 위해 MediaQuery 사용
                padding: EdgeInsets.all(40),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.9),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    Text(
                      'Login',
                      style: TextStyle(fontSize: 25),
                    ),
                    Container(
                      margin:
                          EdgeInsets.fromLTRB(0, 30, 0, 0), //LoginForm의 margin
                      child: LoginForm(),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 60,
              left: 0,
              right: 15,
              child: Text(
                'Readers',
                style: TextStyle(
                    fontFamily: "Smooch",
                    fontSize: 60,
                    color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
            )
          ],
        ),
      ),
    );
  }
}

//로그인폼을 생성하기 위한 위젯, 상태를 가질 수 있게-
class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

//로그인폼 위젯 상태 관리한다.
class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>(); //폼 상태 관리. 현상태 액세스, 유효성 검사 등 위해
  bool _isChecked = false; //ID저장 체크박스 위해

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          TextFormField(
            decoration: InputDecoration(
              labelText: 'ID 입력',
            ),
            validator: (value) {
              //null&isEmpty는 다르다.
              if (value == null || value.isEmpty) {
                return '사용자 이름을 입력해주세요';
              }
              return null;
            },
          ),
          TextFormField(
            decoration: InputDecoration(
              labelText: 'PW 입력',
            ),
            obscureText: true,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return '비밀번호를 입력해주세요';
              }
              return null;
            },
          ),

          ///수평배치
          Row(
            children: <Widget>[
              Checkbox(
                value: _isChecked, //체크박스 현재 상태
                onChanged: (bool? value) {
                  //체크박스 클릭될 때 호출
                  setState(() {
                    _isChecked = value!; //상태 변경, UI 다시 그린다.
                  });
                },
              ),
              Text('로그인 상태 유지')
            ],
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
            child: Container(
              width: double.infinity,
              height: 45,
              child: ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('처리 중...')),
                    );// validate 메서드가 true를 반환, 입력필드 유효(null return 띄우는 역할도 함.)
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const main.MyApp())
                    );
                  }
                },
                child: const Text('로그인'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.deepPurpleAccent,
                ),
              ),
            ),
          ),
          TextButton(
              onPressed: () {
                //새로운 화면으로 이동(새 화면 푸쉬)
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => find.FindIDPW()),
                ); //아이디/비밀번호 찾는 화면으로 빌드
              },
              child: Text('> 아이디/비밀번호 찾기')),
          SizedBox(
            height: 10,
            width: 150,
            child: Divider(
              color: Colors.grey,
              thickness: 2.0,
            ),
          ),
          Text('아직 가입을 하지 않으셨나요?'),
          SizedBox(
            height: 5,
          ),
          SizedBox(
            width: double.infinity,
            height: 45,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                MaterialPageRoute(builder: (context) => register.Register()),
                );
              }, //필요하면 추가구현
              child: Text('회원가입'),
              style: ElevatedButton.styleFrom(
                primary: Colors.deepPurple,
              ),
            ),
          )
        ],
      ),
    );
  }
}

class ForgotPasswordPage extends StatelessWidget {
  // 아이디/비밀번호 찾기 페이지(로 이동했을 때. 필요하면 추가 구현)
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('아이디/비밀번호 찾기'),
      ),
      body: Center(
        child: Text('아이디/비밀번호 찾기 페이지입니다.'),
      ),
    );
  }
}

//error 기록 
//1. TextFormField로 인해 pixel 넘어감 -> 높이 조정으로 pixel 맞춤.
//Coment
//1. 설명이 있으면 좋을 것 같아 주석 추가 작성. 오류 발생시 주석 삭제할 것.