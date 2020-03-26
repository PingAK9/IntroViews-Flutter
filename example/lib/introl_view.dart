import 'package:flutter/material.dart';
import 'package:intro_views_flutter/Models/page_view_model.dart';
import 'package:intro_views_flutter/intro_views_flutter.dart';

import 'main.dart';

const TextStyle _styleTitle =
TextStyle(fontSize: 30, fontWeight: FontWeight.w800);
const TextStyle _styleBody =
TextStyle(fontSize: 16, fontWeight: FontWeight.normal);

class IntroView extends StatelessWidget {
  final List<PageViewModel> pages = [
    PageViewModel(
      pageColor: Colors.blue,
      title: SizedBox(height: 50,),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: const [
          Text('Chào mừng bạn\nđến với MEC!'),
          Text(
            'Giải pháp chăm sóc sức khỏe tại nhà cho gia đình bạn.',
            style: _styleBody,
          ),
        ],
      ),
      mainImage: Image.asset(
        'assets/group-0.png',
        width: 340,
        alignment: Alignment.center,
      ),
      textStyle: _styleTitle,
    ),
    PageViewModel(
      pageColor: Colors.green,
      title: SizedBox(height: 50,),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: const [
          Text('Chăm sóc\nsức khỏe tại nhà'),
          Text(
            'Các dịch vụ chăm sóc sức khoẻ và xét nghiệm ngay tại nhà riêng.',
            style: _styleBody,
          ),
        ],
      ),
      mainImage: Image.asset(
        'assets/group-1.png',
        width: 340,
        alignment: Alignment.center,
      ),
      textStyle: _styleTitle,
    ),
    PageViewModel(
      pageColor: Colors.orange,
      title: SizedBox(height: 50,),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: const [
          Text('Tư vấn kết quả nhanh nhất'),
          Text(
            'Kết quả xét nghiệm được cập nhật ngay trên ứng dụng trong vòng 24 giờ.',
            style: _styleBody,
          ),
        ],
      ),
      mainImage: Image.asset(
        'assets/group-2.png',
        width: 340,
        alignment: Alignment.center,
      ),
      textStyle: _styleTitle,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          IntroViewsFlutter(
            pages,
            onTapDoneButton: () {
              onFinish(context);
            },
            pageButtonsColor: Colors.white,
            showSkipButton: true,
            skipButtonOnTop: true,
            skipText: const Text('Skip'),
            showBackButton: true,
            showNextButton: true,
            backText: Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            ),
            nextText: Icon(Icons.arrow_forward_ios, color: Colors.white),
            doneText: const Text("Start"),
            pageButtonTextStyles:
            TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height / 6,
            right: 20,
            width: 119,
            height: 93,
            child: Image.asset('assets/pattern-top.png'),
          ),
          Positioned(
            bottom: 250,
            left: 20,
            width: 118,
            height: 94,
            child: Image.asset('assets/pattern-bottom.png'),
          )
        ],
      ),
    );
  }

  void onFinish(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => HomePage(),
      ), //MaterialPageRoute
    );
  }
}
