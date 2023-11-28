import 'package:flutter/material.dart';
import './reviewPage.dart';


class EquipPage extends StatelessWidget {
  const EquipPage ({super.key});

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
                  Expanded(flex:2,child: Container(
                      decoration: BoxDecoration(
                        border: Border(
                            top: BorderSide(color: Colors.black, width: 3), // 위쪽 경계선
                            bottom: BorderSide(color: Colors.black, width: 3)), // 아래쪽에만 경계선 추가
                      ),
                      height: 300,
                      child:Image.asset('camera.jpeg'),
                  )),
                  Expanded(flex:3,child: Container(
                    decoration: BoxDecoration(
                      border: Border(
                          top: BorderSide(color: Colors.black, width: 3), // 위쪽 경계선
                          bottom: BorderSide(color: Colors.black, width: 3)), // 아래쪽에만 경계선 추가
                    ),
                    height: 300,
                    child: Container(
                      child: Column(

                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          Text('출판사',style: TextStyle(fontSize: 15),),
                          Text('제목',style: TextStyle(fontSize: 20),),
                          Spacer(),
                          Row(
                            children: [
                              Icon(Icons.perm_identity_rounded),
                              Text('저자',style:TextStyle(fontSize: 10)),
                              ElevatedButton(onPressed: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>const ReviewPage()));
                              }, child: Text('상세 정보',style: TextStyle(color: Colors.deepOrange),)),
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
        Container(
          height: 100,
          decoration: BoxDecoration(
            border: Border(
                top: BorderSide(color: Colors.black, width: 3), // 위쪽 경계선
                bottom: BorderSide(color: Colors.black, width: 3)), // 아래쪽에만 경계선 추가
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text('교보문고',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
              Text('가격')
            ],
          ),
        ) ,
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

