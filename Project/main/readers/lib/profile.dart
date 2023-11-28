import 'package:flutter/material.dart';



class Profile extends StatelessWidget {
  const Profile ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          appBar: AppBar(title: Text('Readers'),
          ),
          body: Column(
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(20, 10, 0, 15),
                color: Color(0xfff2f2f2),
                child: Row(
                  children: [
                    Padding(padding: EdgeInsets.only(top:5),
                      child: Icon(Icons.account_circle,
                        size: 75,
                        color: Color(0xff6c6c6c),
                      ),
                    ),
                    SizedBox(width: 10),
                    _info(),
                  ],
                ),
              ),
              Container(
                child: _profiles(),
              ),
              Container(
                child:  _current(),
              ),
              Container(
                child: _ect(),
              ),

              Container(
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerRight,
                      child: Padding( // 패딩을 추가
                        padding: const EdgeInsets.symmetric(vertical: 5), //수직 패딩 넣음
                        child: Builder( //Builder->새 BuildContext 생성->MaterialApp 접근(접근못해서 오류 발생하기에 추가)
                          builder: (BuildContext context) {
                            return ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: Colors.red, //버튼색
                                shape: RoundedRectangleBorder( //버튼 둥글게
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                              onPressed: (){
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context){
                                    return AlertDialog(
                                      title: Text('회원탈퇴 하시겠습니까?'),
                                      actions: [
                                        TextButton(
                                          child: Text('예'),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                            ScaffoldMessenger.of(context).showSnackBar(
                                                SnackBar(content: Text('탈퇴되었습니다.'))
                                            );
                                          },
                                        ),
                                        TextButton(
                                          child: Text('아니오'),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                            ScaffoldMessenger.of(context).showSnackBar(
                                                SnackBar(content: Text('취소되었습니다.'))
                                            );
                                          },
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                              child: Text('회원탈퇴'),
                            );
                          },
                        ),
                      ),
                    ),



                  ],
                ),
              ),
            ],
          ),
          bottomNavigationBar: BottomAppBar(), //추후에 넣을 것
        ),
    );
  }

  Widget _info(){
    return const Column(
      children: [
        SizedBox(
          width: 100, //width를 통해 특정 너비 지정해야 Text가 공간 내에서 위치 결정 / Align 사용도 ok
          child: Text(
            '안녕하세요!',
            style: TextStyle(
              fontSize: 15,
            ),
          ),
        ),
        SizedBox(
          child: Text(
          'User name',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        ),
      ],
    );
  }

  Widget _profiles(){
    return Column(
      children: [
        SizedBox(
          height: 60,
          child: Align(
            alignment: Alignment(-0.6, 0.0),
            child:  Text('- 회원 정보 조회/수정',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            ),
          ),
        ),
        Container(
          height: 1.5,
          color: Colors.black,
        ),
        Container(
          height: 6.0,
          color: Color(0xffdbdbdb),
        ),
      ],
    );
  }

  Widget _current(){
    return Column(
      children: [
        Container(
          color: Colors.grey,
          height: 250, //안에 이미지를 넣어도 좋을 듯...?
        ),
      ],
    );
  }

  Widget _ect(){
    return Column(
      children: [
        Container(
          height: 1.5,
          color: Colors.black,
        ),
        SizedBox(
          height: 60,
          child: Padding(
              padding:  EdgeInsets.only(left: 20),
              child: Align(
                child: Row(children: [
                  Icon(Icons.question_answer),
                  SizedBox(width: 10,),
                  Text('문의하기',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
                ),
              )
          ),
        ),

        Container(
          height: 1.5,
          color: Colors.black,
        ),
        SizedBox(
          height: 60,
          child: Padding(
            padding:  EdgeInsets.only(left: 20),
              child: Align(
                child: Row(children: [
                  Icon(Icons.article),
                  SizedBox(width: 10,),
                  Text('공지사항',
                    style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                ],
                ),
            )
          ),
        ),

        Container(
          height: 6.0,
          color: Color(0xffdbdbdb),
        ),
        Container(
          height: 1.5,
          color: Colors.black,
        ),
      ],
    );
  }

}
