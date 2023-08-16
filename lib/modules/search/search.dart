import 'package:flutter/material.dart';
import 'package:news_app/shared/components/components.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/shared/cubit/cubit.dart';
import 'package:news_app/shared/cubit/states.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  var searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) => NewsCubit(),
      builder: (context, state) {
        var list = NewsCubit.get(context).search;
        return Scaffold(
          appBar: AppBar(),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextField(
                  controller: searchController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.search),
                    hintText: 'Search',
                  ),
                  onChanged: (value) {
                    NewsCubit.get(context).getSearch(value);
                  },
                  keyboardType: TextInputType.text,
                ),
              ),
              Expanded(
                child: articleBuilder(list,isSearch: true),
              ),
            ],
          ),
        );
      },
    );
  }
}
