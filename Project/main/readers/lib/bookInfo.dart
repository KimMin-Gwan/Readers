import 'package:flutter/material.dart';
import './reviewPage.dart';

class BookInfo extends StatefulWidget {
  const BookInfo ({super.key});

  @override
  State<BookInfo> createState() => _BookInfoState();
}

class _BookInfoState extends State<BookInfo> {

  var bookInfoData =[];

  getData() async {
    var result = await http.get(Uri.http('127.0.0.1:8000', '/homePage'));
    if (result.statusCode == 200) {
      print(utf8.decode(result.bodyBytes));
      setState(() {
        this.bookInfoData = jsonDecode(utf8.decode(result.bodyBytes));
      });
      print( this.bookInfoData );
    } else {
      throw Exception('Data Fail to Get');
    }
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    print(this.bookInfoData);
    return SubBookINfo(bookInfoData: this.bookInfoData);
  }
}

class SubBookINfo extends StatelessWidget {
  const SubBookINfo({super.key,this.bookInfoData});
  final bookInfoData;

  @override
  Widget build(BuildContext context) {
    print(bookInfoData);
    if(this.bookInfoData.isNotEmpty){
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
                            Text(this.bookInfoData["publisher"],style: TextStyle(fontSize: 15),),
                            Text(this.bookInfoData["title"],style: TextStyle(fontSize: 20),),
                            Row(
                              children: [
                                Icon(Icons.perm_identity_rounded),
                                Text(this.bookInfoData["author"],
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
                                    Text(this.bookInfoData["publishedDate"],style:TextStyle(fontSize: 10)),
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

                        Text("내용 요약")
                      ],
                    ),//소개
                    Text(this.bookInfoData["introduction"])
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

                        Text("장르")
                      ],
                    ),//장르
                    Text(this.bookInfoData["genre"])
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
                        //내용
                        Text("줄거리")
                      ],
                    ),
                    Text(this.bookInfoData["contents"])
                  ],
                ),
              )),
        ],
      );
      );
    }
    else{
      return Text("로딩중");
    }
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
