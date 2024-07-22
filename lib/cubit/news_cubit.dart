import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:news_app/business_screen.dart';
import 'package:news_app/dio_helper.dart';
import 'package:url_launcher/url_launcher.dart';

import '../science_screen.dart';
import '../sports_screen.dart';
import 'cache_helper.dart';

part 'news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  NewsCubit() : super(NewsInitial());

  static NewsCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  List<String> titles = ['Sports News', 'Business News', 'Science News'];

  List<Widget> screens = [
    const SportsScreen(),
    const BusinessScreen(),
    const ScienceScreen(),
  ];

  void changeBottomNavBar(int index) {
    currentIndex = index;
    emit(NewsChangeBottomNavBar());
  }

  List<dynamic> business = [];

  List<dynamic> sports = [];
  List<dynamic> science = [];
  List<dynamic> search = [];

  void getBusinessNews() {
    emit(NewsGetBusinessLoadingState());

    DioHelper.getData(url: 'v2/top-headlines', query: {
      'country': 'eg',
      'category': 'business',
      'apiKey': 'b76e8a5b36cc4ea88abee249d15a7cad'
    }).then((value) {
      business = value.data['articles'];
      emit(NewsGetBusinessSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(NewsGetBusinessErrorState(error.toString()));
    });
  }

  void getSportsNews() {
    emit(NewsGetSportsLoadingState());
    DioHelper.getData(url: 'v2/top-headlines', query: {
      'country': 'eg',
      'category': 'sports',
      'apiKey': 'b76e8a5b36cc4ea88abee249d15a7cad'
    }).then((value) {
      sports = value.data['articles'];
      emit(NewsGetSportsSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(NewsGetSportsErrorState(error.toString()));
    });
  }

  void getScienceNews() {
    emit(NewsGetScienceLoadingState());
    DioHelper.getData(url: 'v2/top-headlines', query: {
      'country': 'eg',
      'category': 'science',
      'apiKey': 'b76e8a5b36cc4ea88abee249d15a7cad'
    }).then((value) {
      science = value.data['articles'];

      emit(NewsGetScienceSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(NewsGetScienceErrorState(error.toString()));
    });
  }

  void getSearch(String value) {
    emit(NewsGetSearchLoadingState());

    DioHelper.getData(url: 'v2/everything', query: {
      'q': '$value',
      'apiKey': 'b76e8a5b36cc4ea88abee249d15a7cad'
    }).then((value) {
      search = value.data['articles'];
      emit(NewsGetSearchSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(NewsGetSearchErrorState(error.toString()));
    });
  }

  bool isDark = false;

  changeMode({bool? fromShared}) {
    if (fromShared != null) {
      isDark = fromShared;
      emit(NewsChangeModeState());
    } else {
      isDark = !isDark;
      CacheHelper.putBoolean(key: 'isDark', value: isDark).then((value) {
        emit(NewsChangeModeState());
      });
    }
  }

  launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
