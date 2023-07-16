import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:space_news/model/reports/report.dart';
import 'package:space_news/view/webview.dart';
import 'package:space_news/viewmodel/reportviewmodel.dart';

class ReportPage extends StatefulWidget {
  const ReportPage({Key? key}) : super(key: key);

  @override
  State<ReportPage> createState() => _ReportPageState();
}

class _ReportPageState extends State<ReportPage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Reports",style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20
        ),),
      ),
      body: SafeArea(
        child: FutureBuilder<List<Report>>(
            future: context.read<ReportViewModel>().getReports(),
            builder: (context,snapshot){
              if(snapshot.connectionState==ConnectionState.waiting){
                return Center(child: CircularProgressIndicator(),);
              }
              List<Report> reports=snapshot.data!;
              return ListView.separated(
                itemCount: reports.length,
                separatorBuilder: (BuildContext context, int index) => const Divider(thickness: 2,),
                itemBuilder: (context,index){
                  return ListTile(
                    onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => WebViewPage(url: reports[index].url!,title: reports[index].title!,)),
                      );
                    },
                    leading: Image.network(
                      reports[index].imageUrl!,
                      height: 60,
                      width: 60,
                    ),
                    title: Text(reports[index].title!),
                    subtitle: Text(reports[index].summary!),
                  );
                },
              );
            }
        ),
      ),
    );
  }
}
