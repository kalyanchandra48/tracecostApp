import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:tracecost_app/pages/media_page.dart';
import 'package:tracecost_app/services/hive.dart';
import 'package:tracecost_app/services/hive_storage.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          centerTitle: true,
          title: const Text('MediaData'),
        ),
        backgroundColor: Colors.blue,
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.orange,
          heroTag: 'ADD',
          child: const Icon(
            Icons.add,
            size: 25,
          ),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => NewMediaPage(),
                ));
          },
        ),
        body: Center(
          child: ValueListenableBuilder(
              valueListenable: Global.boxes[BOXNAME.mediadata]!.listenable(),
              builder: (context, value, child) => FutureBuilder(
                    future: HiveStorage.getMediasData(),
                    builder: (context, snapshot) => RefreshIndicator(
                      onRefresh: () async {
                        const CupertinoActivityIndicator();
                      },
                      child: ListView.separated(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        itemCount: snapshot.data?.length ?? 0,
                        separatorBuilder: (context, index) => const SizedBox(
                          height: 10,
                        ),
                        itemBuilder: (context, index) => Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 5),
                          height: 80,
                          color: Colors.white,
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Text(
                                      '${snapshot.data?[index].createdAt.substring(0, 10)}')
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  Text('ID:${snapshot.data?[index].mediaId}'),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  SizedBox(
                                      width: 90,
                                      child: Text(
                                        '${snapshot.data?[index].mediaTitle}',
                                        style: const TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w600),
                                      )),
                                  const Spacer(),
                                  GestureDetector(
                                      onTap: () {
                                        HiveStorage.deleteMediaData(
                                            snapshot.data![index]);
                                      },
                                      child: const Icon(Icons.delete)),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  )),
        ));
  }
}
