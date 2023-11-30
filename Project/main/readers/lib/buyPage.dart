import "package:flutter/material.dart";
import "./search.dart" as search;
import "./sellingInfo.dart";
import "./bookInfo.dart";


class BuyPage extends StatefulWidget {
  const BuyPage ({super.key});

  @override
  State<BuyPage> createState() => _BuyPageState();
}

class _BuyPageState extends State<BuyPage> {

  var buyPageData =[];

  getData() async {
    var result = await http.get(Uri.http('127.0.0.1:8000', '/homePage'));
    if (result.statusCode == 200) {
      print(utf8.decode(result.bodyBytes));
      setState(() {
        this.buyPageData = jsonDecode(utf8.decode(result.bodyBytes));
      });
      print( this.buyPageData );
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
    print(this.buyPageData);
    return SubBuyPage(buyPageData: this.buyPageData);

  }
}
class SubBuyPage extends StatelessWidget {
  const SubBuyPage({super.key, this.buyPageData});
  final buyPageData;

  @override
  Widget build(BuildContext context) {
    print(buyPageData);

    if(this.buyPageData.isNotEmpty){
      return ListView.builder(itemCount: this.buyPageData.length, itemBuilder: (c, i){
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
                                  //Text("출판사"))
                                  Text(this.buyPageData[i]["publisher"], style: TextStyle( fontSize: 10, fontWeight: FontWeight.w100)),
                                  //Text("제목"))
                                  Text(this.buyPageData[i]["title"], style: TextStyle( fontSize: 25, fontWeight: FontWeight.w800)),
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
                                                              //child: Text("저자"))
                                                              child:Text(this.buyPageData[i]["writer"])
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
                                      ]
                                  ),
                                  Row(
                                      children: [
                                        Container(
                                            padding: EdgeInsets.all(1),
                                            child: ElevatedButton(
                                              onPressed: (){
                                                Navigator.push(context, MaterialPageRoute(builder: (context)=>const SellingInfo()));
                                              },
                                              child: Text("판매 정보"),
                                            )
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
                                      ]
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
    else{
      return Text("로딩중");
    }
  }
}
