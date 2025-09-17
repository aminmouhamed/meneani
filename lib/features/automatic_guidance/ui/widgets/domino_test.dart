import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:naji/features/automatic_guidance/ui/widgets/widgets/domino.dart';

class DominoTestPage extends StatelessWidget {
  DominoTestPage({super.key});
  List<DominoPice> dominoList = [
    DominoPice(n1: 1, n2: 1),
    DominoPice(n1: 1, n2: 0),
    DominoPice(n1: 0, n2: 0),
    DominoPice(n1: 0, n2: 3),
    DominoPice(n1: 0, n2: 0),
    DominoPice(n1: 1, n2: 6),
    DominoPice(n1: 6, n2: 0),
    DominoPice(n1: 6, n2: 4),
    DominoPice(n1: 2, n2: 2),
    DominoPice(n1: 0, n2: 3),
    DominoPice(n1: 3, n2: 0),
    DominoPice(n1: 5, n2: 6),
    DominoPice(n1: 0, n2: 0),
    DominoPice(n1: 0, n2: 5),
    DominoPice(n1: 5, n2: 5),
    DominoPice(n1: 4, n2: 2),
    DominoPice(n1: 2, n2: 6),
    DominoPice(n1: 4, n2: 3),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage("assets/images/green_tabel.jpeg"),
              ),
            ),
          ),
          SafeArea(
            child: SingleChildScrollView(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 30.h),
                    Column(children: dominoList),
                    ElevatedButton(
                      onPressed: () {
                        for (int i = 0; i < dominoList.length - 1; i++) {
                          if (dominoList[i].n2 == dominoList[i + 1].n1) {
                            print("true");
                          } else {
                            print("false");
                          }
                        }
                      },
                      child: Text("start"),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
