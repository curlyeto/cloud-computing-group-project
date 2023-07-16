import 'package:dio/dio.dart';
import 'package:space_news/model/reports/report.dart';
import 'package:space_news/model/reports/reports.dart';

class ReportService{
  Future<List<Report>> getReports() async{
    try{
      Dio dio = new Dio();
      var response = await dio.get("https://api.spaceflightnewsapi.net/v4/reports");
      print("Response ${response.data}");
      Reports adresList=Reports.fromJson(response.data);
      return adresList.results!;
    }catch(e){
      print(e.toString());
      return [];
    }
  }
}