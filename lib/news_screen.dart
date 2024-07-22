import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/search_screen.dart';

import 'cubit/news_cubit.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsState>(
      listener: (context, state) {},
      builder: (context, state) {
        NewsCubit cubit = NewsCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: Text(
              cubit.titles[cubit.currentIndex],
            ),
            actions: [
              IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SearchScreen()));
                  },
                  icon: const Icon(
                    Icons.search,
                    size: 35,
                  )),
              const SizedBox(
                width: 12.0,
              ),
              IconButton(
                  onPressed: () {
                    cubit.changeMode();
                  },
                  icon: const Icon(
                    Icons.brightness_4_outlined,
                    size: 35,
                  )),
              const SizedBox(
                width: 10.0,
              )
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: cubit.currentIndex,
            onTap: (index) {
              cubit.changeBottomNavBar(index);
            },
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Colors.amber[800],
            elevation: 20,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.sports),
                label: 'Sports',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.business),
                label: 'Business',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.science),
                label: 'Science',
              ),
            ],
          ),
          body: cubit.screens[cubit.currentIndex],
        );
      },
    );
  }
}
