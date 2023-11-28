import "package:flutter/material.dart";
import 'package:camera/camera.dart';

// --------------------------------

class CameraPage extends StatefulWidget {
  const CameraPage({super.key, required this.camera,});

  final CameraDescription camera;

  @override
  State<CameraPage> createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;

  Future<void> camera() async {
    // 비동기 데이터 다룸으로 아래 코드 추가
    // 다음에 호출되는 함수 모두 실행 끝날 때까지 기다림
    WidgetsFlutterBinding.ensureInitialized();

    // 기기에서 사용 가능한 카메라 목록 불러오기
    final cameras = await availableCameras();

    // 사용 가능한 카메라 중 첫 번째 카메라 사용
    final firstCamera = cameras.first;
    
  }

  @override
  void initState() {
    super.initState();
    // 카메라 관리하는 컨트롤러 생성
    _controller = CameraController(
      widget.camera,
      ResolutionPreset.medium,
    );
    _initializeControllerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FutureBuilder<void>(
          future: _initializeControllerFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              // 미리보기
              return CameraPreview(_controller);
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ],
    );
  }
}

