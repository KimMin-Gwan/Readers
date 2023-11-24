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
        body: Stack(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/background.png'),
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
              bottom: 100,
              left: 0,
              right: 0,
              child: Text(
                'Readers',
                style: TextStyle(fontSize: 40, color: Colors.white),
                textAlign: TextAlign.center,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
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
          Row(
            children: <Widget>[
              Checkbox(
                value: _isChecked,
                onChanged: (bool? value) {
                  setState(() {
                    _isChecked = value!;
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
                    ); // validate 메서드가 true를 반환, 입력필드 유효(null return 띄우는 역할도 함.)
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
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ForgotPasswordPage()),
                );
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
              onPressed: () {},
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
  // 아이디/비밀번호 찾기 페이지
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