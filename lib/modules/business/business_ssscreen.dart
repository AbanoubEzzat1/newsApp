import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/shared/components/components.dart';
import 'package:news_app/shared/cubit/cubit.dart';
import 'package:news_app/shared/cubit/states.dart';
import 'package:responsive_builder/responsive_builder.dart';

class BusinessScreen extends StatelessWidget {
  const BusinessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var list = NewsCubit.get(context).business;
          var index = NewsCubit.get(context).selectbusinessItem;
          return ScreenTypeLayout(
            mobile: Builder(builder: (context) {
              NewsCubit.get(context).setDesktop(false);
              return articleBulider(list, context);
            }),
            desktop: Builder(builder: (context) {
              NewsCubit.get(context).setDesktop(true);

              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Container(
                      child: articleBulider(list, context),
                    ),
                  ),
                  if (list.length > 0)
                    Expanded(
                      child: Container(
                        color: Colors.grey[300],
                        height: double.infinity,
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Container(
                            child: Text(
                              //"${list[NewsCubit.get(context).selectbusinessItem]['description']}"
                              //"${list[index]['description']}",
                              "${list[index]['description']}",
                              //"ergrtg}",
                            ),
                          ),
                        ),
                      ),
                    )
                ],
              );
            }),
            breakpoints: const ScreenBreakpoints(
              desktop: 600,
              tablet: 300,
              watch: 200,
            ),
          );
        });
  }
}
