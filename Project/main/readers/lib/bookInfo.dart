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
        Expanded(
            flex:8, //세로로 좀 더 늘리기 위해 flex(공간이 차지하는 비율) 값 바꿈
             child: Row(
                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                 children: [
                   Flexible(
                     flex:2,
                     child: Container(
                         child:Image.asset('camera.jpeg')
                     ),
                   ),
                   Flexible(
                     flex:1,
                     child: Container( //Container()를 2개를 사용할 필요성?
                       child: Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                           SizedBox(
                             height: 250,
                           ),
                          Text('출판사',style: TextStyle(fontSize: 15),),
                          Text('제목',style: TextStyle(fontSize: 20),),
                          Row(
                            children: [
                              Icon(Icons.perm_identity_rounded),
                              Text('저자',
                                style:TextStyle(
                                    fontSize: 10),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(Icons.receipt_long),
                              Text('리뷰수',style:TextStyle(fontSize: 10)),
                            ],
                          ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.date_range),
                                Text('날짜',style:TextStyle(fontSize: 10)),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            ElevatedButton(
                              onPressed: (){
                              Navigator.push(context,
                                  MaterialPageRoute(
                                      builder: (context)=>const ReviewPage()
                                  ),
                              );
                              },
                                child: Text('리뷰 보기'),
                            ),
                      ],
                    )
                  ],
                ),
              ),
            )
          ]
          )
        ),
        //내용 요약 부분
        Expanded(flex:2,
            child: Container(
                decoration: BoxDecoration(
                  border: Border(
                      top: BorderSide(
                          color: Colors.grey,
                          width: 3), // 위쪽 경계선
                      bottom: BorderSide(
                          color: Colors.grey,
                          width: 2)), // 아래쪽에만 경계선 추가
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text('내용 요약')
                ],
              ),
                    Text('본 책의 줄거리는~',)
            ],
          )
        ),
        ),
        //책이 속한 분야 부분.
        Expanded(flex:1,
            child: Container(
              decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(
                        color: Colors.grey,
                        width: 2)), // 아래쪽에만 경계선 추가
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
        Expanded(flex:2,
            child: Container(
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

