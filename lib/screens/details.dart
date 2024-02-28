import 'package:flutter/material.dart';
import 'package:hyrule/controllers/dao_controller.dart';
import 'package:hyrule/domain/models/entry.dart';

class Details extends StatelessWidget {
  Details({Key? key, required this.entry}) : super(key: key);
  final Entry entry;

  final DaoController daoController = DaoController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Detalhes"),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            daoController.saveEntry(entry: entry);
          },
          child: const Icon(Icons.bookmark),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: Text(
                  entry.name.toUpperCase(),
                  style: const TextStyle(
                    fontSize: 21,
                  ),
                ),
              ),
              Wrap(
                children: entry
                    .commonLocationsConverter()
                    .map((e) => Padding(
                          padding: const EdgeInsets.only(right: 8),
                          child: Chip(
                              label: Text(
                            e,
                            style: const TextStyle(fontSize: 14),
                          )),
                        ))
                    .toList(),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 16, 0, 16),
                child: Container(
                  height: 220,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Image.network(entry.image, fit: BoxFit.cover),
                ),
              ),
              Text(entry.description),
            ],
          ),
        ),
      ),
    );
  }
}
