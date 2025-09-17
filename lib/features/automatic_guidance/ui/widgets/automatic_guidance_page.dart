import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:naji/core/widgets/custom_page_route.dart';
import 'package:naji/features/automatic_guidance/ui/widgets/domino_test.dart';

class AutomaticGuidancePage extends StatelessWidget {
  AutomaticGuidancePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: PageView(
          scrollDirection: Axis.horizontal,
          children: [
            Container(
              padding: EdgeInsets.all(40.r),
              child: Center(
                child: Column(
                  children: [
                    Image.asset("assets/images/brean.jpeg"),
                    SizedBox(height: 100.h),
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        text: "هذا الاختبار أدائي \n",
                        style: GoogleFonts.cairo(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                        children: [
                          TextSpan(text: "ماذا يقيس هذا الاختبار? \n"),
                          TextSpan(
                            text:
                                "هواختبار نفس عصبي يقيس القدرات القلية للأفرد:.مبني أساسا باللغة العربية مراعيا خصوصيتها وخصوصية البيئة الجزائرية بالتحديد.",
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(40.r),
              child: Center(
                child: Column(
                  children: [
                    Image.asset("assets/images/brean.jpeg"),
                    SizedBox(height: 100.h),
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        text: " يتألف الاختبار من أسئلة حول : \n",
                        style: GoogleFonts.cairo(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                        children: [
                          TextSpan(
                            text:
                                "التركيز الانتباه، اللغة، القدرات التنفيذية والمعرفة الاجتماعية، حيث تتدرج من السهل إلى الصعب باستعمال مثيرا سمعية وبصرية. ويختار المجيبون إجابات لهذه الأسئلة.",
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(40.r),
              child: Center(
                child: Column(
                  children: [
                    Image.asset("assets/images/brean.jpeg"),
                    SizedBox(height: 100.h),
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        text: " يتألف الاختبار من أسئلة حول : \n",
                        style: GoogleFonts.cairo(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                        children: [
                          TextSpan(
                            text:
                                "يتم تحديد نتيجة الاختبار بناء على عدد الإجابات الصحيحة، نوع المواد المستهلكة إذا كان مدمنا، وسن  المجيب.",
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 30.h),
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(
                          Colors.lightGreen,
                        ),
                      ),
                      onPressed: () {
                        Navigator.of(
                          context,
                        ).push(CustomPageRoute(child: DominoTestPage()));
                      },
                      child: Text(
                        "ابدأ الاختبار الآن",
                        style: GoogleFonts.cairo(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
