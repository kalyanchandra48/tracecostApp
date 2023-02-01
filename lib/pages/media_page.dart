import 'package:flutter/material.dart';
import 'package:tracecost_app/models/media.dart';
import 'package:tracecost_app/pages/custom_textfield.dart';
import 'package:tracecost_app/services/hive_storage.dart';
import 'package:uuid/uuid.dart';

class NewMediaPage extends StatelessWidget {
  NewMediaPage({super.key});
  TextEditingController titleController = TextEditingController();
  TextEditingController mediaIdController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'ADD',
      child: Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          leading: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Padding(
                padding: EdgeInsets.only(left: 8.0),
                child: Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                  size: 30,
                ),
              )),
          actions: const [
            Padding(
              padding: EdgeInsets.only(right: 15),
              child: Icon(
                Icons.tune,
                color: Colors.white,
                size: 30,
              ),
            )
          ],
          title: const Text(
            'Add new Media',
          ),
          centerTitle: true,
        ),
        resizeToAvoidBottomInset: false,
        body: Container(
          margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              CustomTextField(
                  controller: titleController, hintName: 'Media Title'),
              CustomTextField(
                  controller: mediaIdController, hintName: 'Media Id'),
              GestureDetector(
                onTap: () {
                  var uid = const Uuid();
                  String createdAt = DateTime.now().toIso8601String();

                  Media media = Media(
                      mediaId: mediaIdController.text,
                      createdAt: createdAt,
                      mediaTitle: titleController.text,
                      mid: uid.v1());
                  HiveStorage.saveMediaData(media);
                  Navigator.pop(context);
                  titleController.clear();
                  mediaIdController.clear();
                },
                child: Container(
                  margin: const EdgeInsets.only(top: 40),
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.blue,
                  ),
                  child: const Center(
                      child: Text(
                    'ADD YOUR MEDIA',
                  )),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
