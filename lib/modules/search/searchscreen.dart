import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/shared/components/components.dart';
import 'package:news_app/shared/cubit/cubit.dart';
import 'package:news_app/shared/cubit/states.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({Key? key}) : super(key: key);
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        List<dynamic> list = NewsCubit.get(context).search;
        return Scaffold(
          appBar: AppBar(),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: deffaultFormField(
                  controller: searchController,
                  labelText: "Search",
                  prefixIcon: Icons.search,
                  onChanged: (value) {
                    NewsCubit.get(context).getSearch(value: value);
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Search Must Not Be Empty';
                    }
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Ther Is ",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    "${NewsCubit.get(context).totalResults} ",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.blue,
                    ),
                  ),
                  const Text(
                    "Results Found",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  )
                ],
              ),
              Expanded(child: articleBulider(list, context)),
            ],
          ),
        );
      },
    );
  }
}

//https://newsapi.org/v2/everything?q=tesla&apiKey=c7cfbee96c2f47d2a7b758fa87def9d4