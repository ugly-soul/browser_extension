
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:math' as math;
import 'colorUtils.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('颜色转换器'),
        ),
        body: const MyBody(),
      ),
    )
  );
}


class MyBody extends StatefulWidget {
  const MyBody({super.key});

  @override
  State<MyBody> createState() => _MyBodyState();
}

class _MyBodyState extends State<MyBody> {
  double jz16X = 0;
  double rgbX = 0;
  bool isClick = false;
  String inputStr = '';
  String transStr = '';
  @override
  Widget build(BuildContext context) {
  List<Widget> list = [
      AnimatedContainer(
        duration: const Duration(milliseconds: 350),
        transform: Matrix4.translationValues(jz16X, 0, 0),
        transformAlignment: Alignment.center,
        child: SvgPicture.asset(
          'svg/jz16.svg',
          width: 50,
          height: 50,
        ),
      ),
      GestureDetector(
        onTap: () {
          isClick = !isClick;
          if (isClick) {
            jz16X = MediaQuery.of(context).size.width / 4 * 3 - 48;
            rgbX = -MediaQuery.of(context).size.width / 4 * 3 + 48;
          } else {
            jz16X = 0;
            rgbX = 0;
          }
          setState(() {
          });
        },
        child: Container(
          transform: Matrix4.rotationZ(math.pi / 2),
          transformAlignment: Alignment.center,
          child: SvgPicture.asset(
            'svg/top_arrow.svg',
            width: 36,
            height: 36,
          ),
        ), 
      ),
      AnimatedContainer(
        duration: const Duration(milliseconds: 350),
        transform: Matrix4.translationValues(rgbX, 0, 0),
        transformAlignment: Alignment.center,
        child: SvgPicture.asset(
          'svg/RGB.svg',
          width: 50,
          height: 50,
        ),
      ),
    ];
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: list,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width - 48,
            child: TextField(
              onChanged: (value) {
                inputStr = value;
              },
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                label: Text('${isClick ? 'rgb' : '16进制'}色值')
              ),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width - 48,
            child: TextField(
              controller: TextEditingController.fromValue(TextEditingValue(
                text: transStr
              )),
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                helperText: '转换结果'
              ),
            ),
          ),
          SizedBox(
            height: 44,
            width: MediaQuery.of(context).size.width - 48,
            child: CupertinoButton(
              borderRadius: BorderRadius.circular(44),
              padding: EdgeInsets.zero,
              color: Colors.deepPurple[300],
              onPressed: () {
                if (isClick) {
                  transStr = setRgbTo16(inputStr) ?? '色值格式有误！';
                } else {
                  transStr = set16ToRgb(inputStr) ?? '色值格式有误！';
                }
                setState(() {
                  
                });
              },
              child: const Text('转换'),
            ),
          )
        ],
      )
    );
  }
}