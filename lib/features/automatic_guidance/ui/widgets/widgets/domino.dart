import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DominoPice extends StatelessWidget {
  DominoPice({super.key, required this.n1, required this.n2});
  int n1;
  int n2;
  List<Widget> DominoList = [];
  Border _border = Border.fromBorderSide(BorderSide.none);
  List<double> _margin = [10.h, 0];
  void dominoList(setState, context) {
    int i = 0;
    int b = 0;
    for (i; i <= 6; i++) {
      for (b; b <= 6; b++) {
        DominoList.add(
          showDomino(number1: i, number2: b, context: context, setState),
        );
      }
      b = 0;
      //i + 1;
    }
  }

  Future<dynamic> show(context, setState) async {
    dominoList(setState, context);
    return await showDialog(
      context: context,
      builder: (context) => GridView(
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
        ),
        children: DominoList,
      ),
    );
  }

  Widget showDomino(setState, {number1, number2, context}) {
    return GestureDetector(
      onTap: () async {
        setState(() {
          Navigator.pop(context);
          this.n1 = number1;
          this.n2 = number2;
        });
      },
      child: Domino(n1: number1, n2: number2),
    );
  }

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
      builder: (BuildContext context, setState) {
        return InkWell(
          onTap: () async {
            setState(() {
              _margin[0] = 30.h;
              _margin[1] = 20.h;
              _border = Border.all(
                width: 3,
                color: Colors.green,
                strokeAlign: BorderSide.strokeAlignOutside,
              );
              show(context, setState);
            });
          },
          child: Container(
            margin: EdgeInsets.only(bottom: _margin[0], top: _margin[1]),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              border: _border,
              boxShadow: [
                BoxShadow(
                  offset: Offset(6, 3),
                  blurRadius: 6,
                  spreadRadius: 1,
                  blurStyle: BlurStyle.normal,
                ),
              ],
            ),
            child: Domino(n1: n1, n2: n2),
          ),
        );
      },
    );
  }
}

class Domino extends StatelessWidget {
  Domino({super.key, required this.n1, required this.n2}) {
    switch (n1) {
      case 0:
        break;

      case 1:
        dominoPointList[3] = true;
        break;
      case 2:
        dominoPointList[1] = true;
        dominoPointList[5] = true;
        break;
      case 3:
        dominoPointList[1] = true;
        dominoPointList[3] = true;
        dominoPointList[5] = true;
        break;
      case 4:
        dominoPointList[1] = true;
        dominoPointList[5] = true;
        dominoPointList[0] = true;
        dominoPointList[6] = true;
        break;
      case 5:
        dominoPointList[1] = true;
        dominoPointList[5] = true;
        dominoPointList[0] = true;
        dominoPointList[6] = true;
        dominoPointList[3] = true;
        break;
      case 6:
        dominoPointList[1] = true;
        dominoPointList[5] = true;
        dominoPointList[0] = true;
        dominoPointList[6] = true;
        dominoPointList[2] = true;
        dominoPointList[4] = true;
        break;
      default:
        return;
    }
    switch (n2) {
      case 0:
        break;

      case 1:
        dominoPointList[3 + 6] = true;
        break;
      case 2:
        dominoPointList[1 + 6] = true;
        dominoPointList[5 + 6] = true;
        break;
      case 3:
        dominoPointList[1 + 6] = true;
        dominoPointList[3 + 6] = true;
        dominoPointList[5 + 6] = true;
        break;
      case 4:
        dominoPointList[1 + 6] = true;
        dominoPointList[5 + 6] = true;
        dominoPointList[7 + 6] = true;
        dominoPointList[6 + 6] = true;
        break;
      case 5:
        dominoPointList[1 + 6] = true;
        dominoPointList[5 + 6] = true;
        dominoPointList[7 + 6] = true;
        dominoPointList[6 + 6] = true;
        dominoPointList[3 + 6] = true;
        break;
      case 6:
        dominoPointList[1 + 6] = true;
        dominoPointList[5 + 6] = true;
        dominoPointList[7 + 6] = true;
        dominoPointList[6 + 6] = true;
        dominoPointList[2 + 6] = true;
        dominoPointList[4 + 6] = true;
        break;
      default:
        return;
    }
  }
  final int n1;
  final int n2;
  List<bool> dominoPointList = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
  ];
  Color bgColor = Colors.white;
  Border _border = Border.fromBorderSide(BorderSide.none);
  List<double> _margin = [10.h, 0];

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
      builder: (BuildContext context, setState) {
        return Column(
          children: [
            Container(
              padding: EdgeInsets.all(15.r),
              height: 200.r,
              width: 200.r,
              decoration: BoxDecoration(
                color: bgColor,
                //border: Border.all(),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(6),
                  topRight: Radius.circular(6),
                ),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        DominoPoint(enabel: dominoPointList[0]),
                        DominoPoint(enabel: false),
                        DominoPoint(enabel: dominoPointList[1]),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        DominoPoint(enabel: dominoPointList[2]),
                        DominoPoint(enabel: dominoPointList[3]),
                        DominoPoint(enabel: dominoPointList[4]),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        DominoPoint(enabel: dominoPointList[5]),
                        DominoPoint(enabel: false),
                        DominoPoint(enabel: dominoPointList[6]),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(15.r),
              height: 200.r,
              width: 200.r,
              decoration: BoxDecoration(
                color: bgColor,
                border: BoxBorder.fromLTRB(top: BorderSide()),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(6),
                  bottomRight: Radius.circular(6),
                ),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        DominoPoint(enabel: dominoPointList[7 + 6]),
                        DominoPoint(enabel: false),
                        DominoPoint(enabel: dominoPointList[1 + 6]),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        DominoPoint(enabel: dominoPointList[2 + 6]),
                        DominoPoint(enabel: dominoPointList[3 + 6]),
                        DominoPoint(enabel: dominoPointList[4 + 6]),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        DominoPoint(enabel: dominoPointList[5 + 6]),
                        DominoPoint(enabel: false),
                        DominoPoint(enabel: dominoPointList[6 + 6]),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

class DominoPoint extends StatelessWidget {
  DominoPoint({super.key, required this.enabel});
  final bool enabel;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 45.r,
      height: 45.r,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: enabel ? Colors.black : Colors.white,
      ),
    );
  }
}
//  [
//           for (int i = 0; i <= 6; i++)
//             for (int b = 0; b <= 6; b++)
//               showDomino(number1: i, number2: i == 0 ? b : b + 1),

//           // showDomino(number1: 0, number2: 0),
//           // showDomino(number1: 0, number2: 1),
//           // showDomino(number1: 0, number2: 2),
//           //  showDomino(number1: 0, number2: 3),
//           //   showDomino(number1: 0, number2: 4),
//           //    showDomino(number1: 0, number2: 5),
//           //     showDomino(number1: 0, number2: 6),
//           //      showDomino(number1: 1, number2: 1),
//           //       showDomino(number1: 1, number2: 2),
//           //        showDomino(number1: 1, number2: 3),
//           //         showDomino(number1: 1, number2: 4),
//           //          showDomino(number1: 1, number2: 5),
//           //           showDomino(number1: 1, number2: 6),
//           //            showDomino(number1: 2, number2: 2),
//           //            showDomino(number1: 2, number2: 3),
//           //            showDomino(number1: 2, number2: 4),
//           //            showDomino(number1: 2, number2: 5),
//           //            showDomino(number1: 2, number2: 6),
//         ]
