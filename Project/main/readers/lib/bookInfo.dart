import 'package:flutter/material.dart';
import './reviewPage.dart';

class BookInfo extends StatelessWidget {
  const BookInfo ({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: bodyMenu(),
        //bottomNavigationBar:Bmenu(),
      )
    );
  }
}

class bodyMenu extends StatelessWidget {
  const bodyMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //사진과 제목 출력부분.
        Expanded(flex:2,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Flexible(flex:6,child: Container(
              child:Image.asset('camera.jpeg')
            )),
            Flexible(flex:1,child: Container(
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('출판사',style: TextStyle(fontSize: 15),),
                    Text('제목',style: TextStyle(fontSize: 20),),
                    Row(
                      children: [
                        Icon(Icons.perm_identity_rounded),Text('저자',style:TextStyle(fontSize: 10)),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.receipt_long),
                        Text('리뷰수',style:TextStyle(fontSize: 10)),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(Icons.date_range),
                        Text('날짜',style:TextStyle(fontSize: 10)),
                        Spacer(),
                        ElevatedButton(onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>const ReviewPage()));
                        }, child: Text('리뷰 보기')),
                      ],
                    )
                  ],
                ),
              ),
            ))
          ]
          )
        ),
        //내용 요약 부분
        Expanded(flex:2,child: Container(
          decoration: BoxDecoration(
          border: Border(
              top: BorderSide(color: Colors.grey, width: 3), // 위쪽 경계선
              bottom: BorderSide(color: Colors.grey, width: 3)), // 아래쪽에만 경계선 추가
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text('내용 요약')
                ],
              ),
              Text('dkdldldkdlkd',)
            ],
          )
        )),
        //책이 속한 분야 부분.
        Expanded(flex:3,child: Container(
          decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.grey, width: 3)), // 아래쪽에만 경계선 추가
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text('이 책이 속한 분야')
                ],
              ),
              Text('국내도서 > ...',)
            ],
          ),
        )),
        //마지막 내용 요약 부분
        Expanded(flex:2,child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text('내용 요약')
                ],
              ),
              Text('동물 친구...',)
            ],
          ),
        )),
      ],

    );
  }
}

class Bmenu extends StatelessWidget {
  const Bmenu({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.white70,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Icon(Icons.menu_book_outlined),
          Icon(Icons.share),
          Icon(Icons.camera_alt),
          Icon(Icons.settings),
          Icon(Icons.perm_identity_rounded)
        ],
      ),
    );
  }
}

