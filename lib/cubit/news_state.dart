part of 'news_cubit.dart';

@immutable
sealed class NewsState {}

final class NewsInitial extends NewsState {}


final class NewsChangeBottomNavBar extends NewsState {}
final class NewsGetSportsLoadingState extends NewsState {}
final class NewsGetSearchLoadingState extends NewsState {}
final class NewsGetSearchSuccessState extends NewsState {}
final class NewsGetSearchErrorState extends NewsState {
  final String error;
  NewsGetSearchErrorState(this.error);
}
final class NewsGetScienceLoadingState extends NewsState {}
final class NewsGetBusinessLoadingState extends NewsState {}

final class NewsGetBusinessSuccessState extends NewsState {}
final class NewsGetScienceSuccessState extends NewsState {}
final class NewsGetSportsSuccessState extends NewsState {}
final class NewsChangeModeState extends NewsState {}
final class NewsGetBusinessErrorState extends NewsState {
  final String error;
  NewsGetBusinessErrorState(this.error);
}
final class NewsGetSportsErrorState extends NewsState {
  final String error;
  NewsGetSportsErrorState(this.error);
}
final class NewsGetScienceErrorState extends NewsState {
  final String error;
  NewsGetScienceErrorState(this.error);
}

