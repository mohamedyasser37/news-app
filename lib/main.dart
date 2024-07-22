import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/cache_helper.dart';
import 'cubit/news_cubit.dart';
import 'dio_helper.dart';
import 'news_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  await CacheHelper.init();
  bool isDark = CacheHelper.getData(key: 'isDark');
  runApp( NewsLayout(isDark: isDark));
}

class NewsLayout extends StatelessWidget {
  const NewsLayout({super.key, required this.isDark});
final bool isDark;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
      NewsCubit()..changeMode(fromShared: isDark)
        ..getSportsNews()
        ..getBusinessNews()
        ..getScienceNews(),
      child: BlocConsumer< NewsCubit, NewsState>(
        listener: (context, state) {
        },
        builder: (context, state) {
          return MaterialApp(
            title: 'Flutter Demo',
            debugShowCheckedModeBanner: false,
            home: const NewsScreen(),
            theme: ThemeData(
              primarySwatch: Colors.deepOrange,
              indicatorColor: Colors.deepOrange,
              scaffoldBackgroundColor: Colors.white,
              appBarTheme: const AppBarTheme(
                  backgroundColor: Colors.deepOrange,
                  elevation: 0,
                  systemOverlayStyle: SystemUiOverlayStyle(
                    statusBarColor: Colors.deepOrange,
                    statusBarIconBrightness: Brightness.light,
                    statusBarBrightness: Brightness.light,
                  )
              ),
            ),


            darkTheme: ThemeData(
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                backgroundColor: Colors.blueGrey.shade900,
                unselectedItemColor: Colors.white
              ),
              textTheme: const TextTheme(
                bodyMedium: TextStyle(color: Colors.white),
              ),
              primarySwatch: Colors.deepOrange,
              indicatorColor: Colors.deepOrange,
              scaffoldBackgroundColor: Colors.blueGrey.shade900,
              appBarTheme: const AppBarTheme(
                  backgroundColor: Colors.deepOrange,
                  elevation: 0,
                  systemOverlayStyle: SystemUiOverlayStyle(
                    statusBarColor: Colors.deepOrange,
                    statusBarIconBrightness: Brightness.light,
                    statusBarBrightness: Brightness.light,
                  )
              ),
            ),
            themeMode: NewsCubit.get(context).isDark ? ThemeMode.dark : ThemeMode.light,
          );
        },
      ),
    );
  }
}

