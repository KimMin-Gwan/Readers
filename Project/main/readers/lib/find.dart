import 'package:flutter/material.dart';

class FindIDPW extends StatelessWidget {
  const FindIDPW({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
            appBar: AppBar(
              title: const Text('아이디/비밀번호 찾기'),
              backgroundColor: Colors.indigoAccent,
              bottom: const TabBar(
                tabs: [
                  Tab(text: '아이디 찾기'),
                  Tab(text: '비밀번호 찾기'),
                ],
                indicatorColor: Colors.white,
              ),
            ),
            body: TabBarView(
              children: [
                FindIdForm(),
                FindPwForm(),
              ],
            )),
      ),
    );
  }
}

class FindIdForm extends StatefulWidget {
  @override
  _FindIdFormState createState() => _FindIdFormState();
}

class _FindIdFormState extends State<FindIdForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? name, email, verificationCode, foundId;
  bool codeSent = false;

  void findId() {
    if (_formKey.currentState?.validate() == true) {
      // 아이디 찾기 로직 구현

      setState(() {
        codeSent = true; // 코드 전송 완료
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('작성하지 않은 칸이 있습니다..'),
        ),
      );
    }
  }

  void verifyCode(String enteredCode) {
    if (verificationCode == enteredCode) {
      // 이메일과 입력코드 코드 일치
      // 데베에서 아이디 가져오는 로직

      // 아이디 정보를 표시
      setState(() {
        foundId = '사용자 아이디'; // 실제로는 서버에서 받아온 아이디 표시해야~
      });
    } else {
      // 코드 불일치
      // 오류메세지 표시
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('인증 코드가 일치하지 않습니다.'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 50),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: '이름',
              ),
              validator: (value) {
                if (value?.isEmpty ?? true) {
                  return '이름을 입력하십시오.';
                }
                return null;
              },
              onChanged: (value) {
                name = value;
              },
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: '이메일',
              ),
              validator: (value) {
                if (value?.isEmpty ?? true) {
                  return '이메일을 입력하십시오.';
                }
                return null;
              },
              onChanged: (value) {
                email = value;
              },
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: findId,
              child: Text('아이디 찾기'),
            ),
            if (codeSent) // 코드가 전송되었을 경우에만 인증 코드 입력 필드를 표시
              Column(
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  Divider(
                    thickness: 1.5,
                    color: Colors.indigo,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: '인증 코드',
                    ),
                    validator: (value) {
                      if (value?.isEmpty ?? true) {
                        return '인증 코드를 입력해주세요.';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      verificationCode = value;
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState?.validate() == true) {
                        verifyCode(
                            verificationCode!); // 코드 확인 버튼을 누를 때만 코드 일치 검증
                      }
                    },
                    child: Text('코드 확인'),
                  ),
                ],
              ),
            SizedBox(
              height: 20,
            ),
            if (foundId != null) // 아이디를 찾았을 경우에만 표시
              Text('아이디: $foundId'),
          ],
        ),
      ),
    );
  }
}

// 비밀번호 찾기 클래스~~~~~

class FindPwForm extends StatefulWidget {
  @override
  _FindPwFormState createState() => _FindPwFormState();
}

class _FindPwFormState extends State<FindPwForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? id, name, email, verificationCode, foundPassword;
  bool codeSent = false;
  bool passwordFound = false;

  void findPassword() {
    if (_formKey.currentState?.validate() == true) {
      // 비밀번호 찾기 로직 구현
      // 이메일에 코드를 전송하는 로직

      setState(() {
        codeSent = true;
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('작성하지 않은 칸이 있습니다.'),
        ),
      );
    }
  }

  void verifyCode(String enteredCode) {
    //코드 검증
    if (verificationCode == enteredCode) {
      setState(() {
        foundPassword = '비밀번호'; // 실제로는 서버에서 받아온 비밀번호 정보를 표시해야 합니다.
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('인증 코드가 일치하지 않습니다.'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 50),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: '아이디',
              ),
              validator: (value) {
                if (value?.isEmpty ?? true) {
                  return '아이디를 입력하십시오.';
                }
                return null;
              },
              onChanged: (value) {
                id = value;
              },
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: '이름',
              ),
              validator: (value) {
                if (value?.isEmpty ?? true) {
                  return '이름을 입력하십시오.';
                }
                return null;
              },
              onChanged: (value) {
                name = value;
              },
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: '이메일',
              ),
              validator: (value) {
                if (value?.isEmpty ?? true) {
                  return '이메일을 입력하십시오.';
                }
                return null;
              },
              onChanged: (value) {
                email = value;
              },
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: findPassword,
              child: Text('비밀번호 찾기'),
            ),
            if (codeSent) // 코드가 전송된 경우에만 코드 입력 필드 표시
              Column(
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  Divider(
                    thickness: 1.5,
                    color: Colors.indigo,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: '인증 코드',
                    ),
                    validator: (value) {
                      if (value?.isEmpty ?? true) {
                        return '인증 코드를 입력하십시오.';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      verificationCode = value;
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState?.validate() == true) {
                        verifyCode(
                            verificationCode!); // 코드 확인 버튼을 누를 때만 코드 일치 검증
                      }
                    },
                    child: Text('코드 확인'),
                  ),
                ],
              ),
            SizedBox(
              height: 10,
            ),
            if (foundPassword != null) // 비밀번호를 찾은 경우에만 비밀번호 표시
              Text('비밀번호: $foundPassword'),
          ],
        ),
      ),
    );
  }
}

//작동확인 위해 DB에서 가져오는 로직 및 코드 확인 등의 구체적인 것은 구현X