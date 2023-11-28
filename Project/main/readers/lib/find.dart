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
              Container(
                child: _findID(),
              ),
              Center(
                child: _findPW(),
              ),
            ],
          )
        ),
      ),

    );


  }

  Widget _findID(){
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 50),
      child: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          const Text('아이디를 찾으려면 이름과 이메일을 입력하세요.'),
          SizedBox(
            height: 20,
          ),
          TextFormField(
            decoration: const InputDecoration(
              labelText: '이름',
            ),
          ),
          TextFormField(
            decoration: const InputDecoration(
              labelText: '이메일',
            ),
          ),
          SizedBox(
            height: 30,
          ),
          ElevatedButton(
            onPressed: (){},
            style: ElevatedButton.styleFrom(
              primary: Colors.indigoAccent,
            ),
              child: const Text('아이디 찾기'),
          ),
        ],
      ),
    );
  }

  Widget _findPW(){
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 50),
      child: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          const Text('비밀번호를 찾으려면 아이디와 이름, 이메일을 입력하세요.'),
          SizedBox(
            height: 20,
          ),
          TextFormField(
            decoration: const InputDecoration(
              labelText: '아이디',
            ),
          ),
          TextFormField(
            decoration: const InputDecoration(
              labelText: '이름',
            ),
          ),
          TextFormField(
            decoration: const InputDecoration(
              labelText: '이메일',
            ),
          ),
          SizedBox(
            height: 30,
          ),
          ElevatedButton(
            onPressed: (){},
            style: ElevatedButton.styleFrom(
              primary: Colors.indigoAccent,
            ),
            child: const Text('비밀번호 찾기'),
          ),
        ],
      ),
    );
  }
}
