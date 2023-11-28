/* 사용하지 않음

import "package:flutter/material.dart";
import "./search.dart" as search;
import "./bookInfo.dart";


class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemCount: 3, itemBuilder: (c, i){
      return Column(
        children: [
          Container(
            margin: EdgeInsets.all(20),
            child: Container(
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(color: Colors.grey.withOpacity(0.3)),
                  bottom: BorderSide(color: Colors.grey.withOpacity(0.3)),
                )
              ),
              padding: EdgeInsets.all(14),
              height:190,
              child: Row(
                children:[
                  ClipRRect(
                    borderRadius: BorderRadius.circular(5.0),
                    child:Image.network('https://marketplace.canva.com/EAD12irp-Wk/1/0/1003w/canva-%EC%9D%BC%EB%AA%B0-%EB%A1%9C%EB%A7%A8%EC%8A%A4-%EC%A0%84%EC%9E%90%EC%B1%85-%ED%91%9C%EC%A7%80-rhOetH7hcqE.jpg'),
                  ),
                  //Expanded(
                    //child: Container(
                  Container(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children:[
                          Text("출판사", style: TextStyle( fontSize: 10, fontWeight: FontWeight.w100)),
                          Text("제목", style: TextStyle( fontSize: 25, fontWeight: FontWeight.w800)),
                        Row(
                          children:[
                              Container(
                                child: Column(
                                  children:[
                                    Container(
                                      padding: EdgeInsets.all(1),
                                      child:Row (
                                          children: [
                                            Icon(Icons.account_balance_outlined),
                                            TextButton(
                                                onPressed: (){Navigator.push(context,
                                                  MaterialPageRoute(builder: (context) => search.SearchAuthor()),
                                                );
                                                },
                                                child: Text("저자"))
                                          ]
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.all(1),
                                      child:Row (
                                          children: [
                                            Icon(Icons.speaker_notes),
                                            TextButton(
                                                onPressed: (){Navigator.push(context,
                                                  MaterialPageRoute(builder: (context) => search.SearchAuthor()),
                                                );
                                                },
                                                child: Text("리뷰수"))
                                          ]
                                      ),
                                    ),
                                  ]
                                )
                              ),
                              Container(
                                  child: Column(
                                      children:[
                                        Container(
                                          padding: EdgeInsets.all(1),
                                          child:Row (
                                              children: [
                                                Icon(Icons.calendar_month),
                                                TextButton(
                                                    onPressed: (){Navigator.push(context,
                                                      MaterialPageRoute(builder: (context) => search.SearchAuthor()),
                                                    );
                                                    },
                                                    child: Text("2021년 08월 26일"))
                                              ]
                                          ),
                                        ),
                                        Container(
                                          padding: EdgeInsets.all(1),
                                          child:Row (
                                              children: [
                                                Icon(Icons.share_location),
                                                TextButton(
                                                    onPressed: (){Navigator.push(context,
                                                      MaterialPageRoute(builder: (context) => search.SearchAuthor()),
                                                    );
                                                    },
                                                    child: Text("판매처"))
                                              ]
                                          ),
                                        ),
                                      ]
                                  )
                              ),
                            ]
                          ),
                          Container(
                              padding: EdgeInsets.all(1),
                              child: ElevatedButton(
                                onPressed: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>const BookInfo()));
                                },
                                child: Text("상세 정보"),
                              )
                          ),
                        ],
                      )
                    )
                  //)
                ]
              )
            )
          )
        ],
      );
    });
  }
}
*/