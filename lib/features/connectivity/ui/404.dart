import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meneani/features/connectivity/bloc/connectivity_bloc.dart';

class InternetConnectionsCheker extends StatelessWidget {
  InternetConnectionsCheker({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ConnectivityBloc, ConnectivityState>(
      builder: (context, state) {
        if (state is ConnectivityHasConnectionsState) {
          return this.child;
        } else {
          return Page404();
        }
      },
    );
  }
}

class Page404 extends StatelessWidget {
  const Page404({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Center(
          child: Column(
            children: [
              Expanded(
                child: Center(
                  child: RichText(
                    text: TextSpan(
                      text: "404",
                      style: TextStyle(
                        fontSize: 250.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
