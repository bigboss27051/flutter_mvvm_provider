import 'package:flutter/material.dart';
import 'package:poc_mvvm/models/apis/api_response.dart';
import 'package:poc_mvvm/models/magazine_model.dart';
import 'package:poc_mvvm/view_model/magazine_view_model.dart';
import 'package:poc_mvvm/widgets/card_item.dart';
import 'package:provider/provider.dart';

class MagazineListScreen extends StatefulWidget {
  const MagazineListScreen({super.key});

  @override
  State<MagazineListScreen> createState() => _MagazineListScreenState();
}

class _MagazineListScreenState extends State<MagazineListScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<MagazineViewModel>(context, listen: false)
          .setSelectedMagazine([]);
      Provider.of<MagazineViewModel>(context, listen: false)
          .fetchMagazineListData();
    });
    super.initState();
  }

  Widget getMagazineListWidget(BuildContext context, ApiResponse apiResponse) {
    final magazineList = apiResponse.data as List<Magazine>?;

    switch (apiResponse.status) {
      case Status.LOADING:
        return const Center(
            child: CircularProgressIndicator(
          key: Key('loadingIndicator'),
        ));
      case Status.COMPLETED:
        return magazineList != null
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: magazineList.map((e) {
                  return CardItem(title: e.name ?? '');
                }).toList())
            : const SizedBox();
      case Status.ERROR:
        return const Center(
          child: Text('Please try again latter!!!'),
        );
      case Status.INITIAL:
      default:
        return const Center(
          child: Text('Open Application !!!'),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    final apiResponse = Provider.of<MagazineViewModel>(context).response;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Text('Flutter App'),
        ),
        body: Container(
          padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
          child: SingleChildScrollView(
              child: getMagazineListWidget(context, apiResponse)),
        ));
  }
}
