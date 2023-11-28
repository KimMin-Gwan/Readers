import 'package:flutter/material.dart';


class Setting extends StatefulWidget {
  const Setting({super.key});

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  bool _alarm = false;
  bool _nightAlarm = false;
  bool _darkMode = false;

  @override
  Widget build(BuildContext context) {
    return Column(
          children: [
            SizedBox(
              height: 60,
              child: Container(
                decoration: BoxDecoration(
                    border: Border(
                      bottom : BorderSide(color: Colors.black.withOpacity(0.5))
                    ),
                  color: Colors.white,
                ),
                alignment: Alignment(-0.9, 0.0),
                child:  Text('앱 설정',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Container(
              //padding: EdgeInsets.all(20),
              color: Colors.white,
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        border: Border(
                          top: BorderSide(color: Colors.black.withOpacity(0.3)),
                          bottom : BorderSide(color: Colors.black.withOpacity(0.3)),
                        )
                      ),
                    child: Column(
                      children: [
                        Container(
                            child: Row(
                                children: [
                                  Expanded(
                                    child : Container(
                                      child: Text("야간 푸쉬 알림 동의",
                                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                                    ),
                                    flex: 6,
                                  ),
                                  Expanded(
                                    child: Switch(
                                        value: _alarm,
                                        onChanged: (value){
                                          setState(() {
                                            _alarm = value;
                                          });
                                        }
                                    ),
                                    flex: 2,
                                  )
                                ]
                            )
                        ),
                        Container(
                            child: Row(
                                children: [
                                  Expanded(
                                    child : Container(
                                      child: Text("광고성 알림 동의",
                                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                                    ),
                                    flex: 6,
                                  ),
                                  Expanded(
                                    child: Switch(
                                        value: _nightAlarm,
                                        onChanged: (value){
                                          setState(() {
                                            _nightAlarm = value;
                                          });
                                        }
                                    ),
                                    flex: 2,
                                  )
                                ]
                            )
                        ),
                      ],
                    )
                  ),
                  Container(
                      height: 100,
                      decoration: BoxDecoration(
                          border: Border(
                            top: BorderSide(color: Colors.black.withOpacity(0.3)),
                            bottom: BorderSide(color: Colors.black.withOpacity(0.3)),
                          )
                      ),
                      child: Row(
                          children: [
                            Expanded(
                              child : Container(
                                child: Text("다크 모드",
                                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                              ),
                              flex: 6,
                            ),
                            Expanded(
                              child: Switch(
                                  value: _darkMode,
                                  onChanged: (value){
                                    setState(() {
                                      _darkMode= value;
                                    });
                                  }
                              ),
                              flex: 2,
                            )
                          ]
                      )
                  ),
                  Container(
                    alignment: Alignment.center,
                    height: 80,
                    child : Text("이용 약관",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))
                  )
                ]
              )
            )
          ]
    );
  }
}
