import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          appBar:AppBar(
            shape: Border(
                bottom: BorderSide(
                  color: Colors.black,
                  width: 1,
                )
            ),
            //READERS 제목 출력부분
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('READERS',style: TextStyle(fontWeight: FontWeight.bold),),
                Text('판매정보',style: TextStyle(fontWeight: FontWeight.bold),),

              ],
            ),
            actions: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(width: 500),
                  Icon(Icons.chrome_reader_mode),
                ],
              )
            ],
          ) ,
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(child: Container(height: 300,
                color: Colors.pink,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset('camera.jpeg'),
                    VerticalDivider(thickness: 3,color: Colors.black,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Spacer(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text('출판사',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20)),
                            Container(
                              margin: EdgeInsets.only(left: 8),
                              child: Text('우리집'),

                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text('제목',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                            Container(
                              margin: EdgeInsets.only(left: 8),
                              child:Text('너의 이름은 뭐니?')
                            )
                          ],
                        ),
                        Spacer(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(Icons.perm_identity_rounded),
                            Text('저자',style: TextStyle(fontSize: 10)),
                            Container(
                              margin: EdgeInsets.only(left: 8),
                              child: Text('정현'),
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(Icons.reviews),
                            Text('리뷰',style:TextStyle(fontSize: 10)),
                            Container(
                              margin: EdgeInsets.only(left: 8), // 원하는 간격으로 조절
                              child: ElevatedButton(
                                onPressed: () {},
                                child: Text('상세 보기'),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(Icons.date_range),
                            Text('날짜',style:TextStyle(fontSize: 10)),
                            Container(
                              margin: EdgeInsets.only(left: 8), // 원하는 간격으로 조절
                              child: ElevatedButton(
                                onPressed: () {
                                  // Navigator.push(context, MaterialPageRoute(builder: (context)=>const ReviewPage()));
                                },
                                child: Text('리뷰 보기'),
                              ),
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),),
              Divider(thickness: 3,color: Colors.black,),
              Container(
                  decoration: BoxDecoration(border: Border.all(color: Colors.red)),
                  child: ListView(
                  shrinkWrap: true,
                  children: [
                    ListTile(title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('교보문고'),
                        Text('8000원')
                      ],
                    ),),
                    ListTile(title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('교보문고'),
                        Text('8000원')
                      ],
                    ),),
                  ],
                )),
            ],
          ),
        bottomNavigationBar:Bmenu(),
          )
    );
  }
}

/*class bodyMenu extends StatelessWidget {
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
                          Spacer(),
                          Text('출판사',style: TextStyle(fontSize: 15),),
                          Text('제목',style: TextStyle(fontSize: 20),),
                          Spacer(),
                          Row(
                            children: [
                              Icon(Icons.perm_identity_rounded),
                              Text('저자',style:TextStyle(fontSize: 10),),
                              ElevatedButton(onPressed: (){
                              }, child: Text('상세 정보',style: TextStyle(color: Colors.deepOrange),))
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
                                // Navigator.push(context, MaterialPageRoute(builder: (context)=>const ReviewPage()));
                              }, child: Text('리뷰 보기')),
                            ],
                          ),
                          Container(
                            height: 100,
                            decoration: BoxDecoration(
                              border: Border(
                                top: BorderSide(color: Colors.black, width: 3), // 위쪽 경계선
                                bottom: BorderSide(color: Colors.black, width: 3), // 아래쪽에만 경계선 추가
                              ),
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  '교보문고',
                                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                                ),
                                VerticalDivider(
                                  color: Colors.black,
                                  thickness: 3, // VerticalDivider의 두께
                                ),
                                Text('가격'),
                              ],
                            ),
                          ),

                        ],
                      ),
                    ),
                  ))
                ]
            )
        ),
      ],

    );
  }
}
*/
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
