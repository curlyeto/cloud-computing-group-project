import 'package:get_it/get_it.dart';
import 'package:space_news/service/blogservice.dart';
import 'package:space_news/service/homeservice.dart';
import 'package:space_news/service/reportservice.dart';

GetIt locator = GetIt.instance;
void setuplocater(){
  locator.registerLazySingleton(()=>HomeService());
  locator.registerLazySingleton(()=>BlogService());
  locator.registerLazySingleton(()=>ReportService());
}