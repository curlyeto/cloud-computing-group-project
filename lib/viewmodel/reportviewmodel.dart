import 'package:flutter/material.dart';
import 'package:space_news/get_it.dart';
import 'package:space_news/model/reports/report.dart';
import 'package:space_news/service/reportservice.dart';

class ReportViewModel with ChangeNotifier{
  ReportService homeService=locator<ReportService>();

  Future<List<Report>> getReports()async{
    List<Report>? reports= await homeService.getReports();
    return reports;
  }

}