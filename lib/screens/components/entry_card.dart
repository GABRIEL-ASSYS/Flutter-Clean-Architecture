import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hyrule/controllers/dao_controller.dart';
import 'package:hyrule/domain/models/entry.dart';
import 'package:hyrule/screens/details.dart';

class EntryCard extends StatelessWidget {
  EntryCard({Key? key, required this.entry, required this.isSaved})
      : super(key: key);
  final Entry entry;
  final bool isSaved;

  final DaoController daoController = DaoController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Container(
        width: 328,
        height: 300,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Card(
          child: Dismissible(
            direction:
                isSaved ? DismissDirection.endToStart : DismissDirection.none,
            key: ValueKey<int>(entry.id),
            onDismissed: (direction) {
              daoController.deleteEntry(entry: entry);
            },
            child: Column(
              children: <Widget>[
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Details(entry: entry),
                        ));
                  },
                  child: Ink(
                    child: Padding(
                      padding: EdgeInsets.all(16),
                      child: Row(
                        children: <Widget>[
                          Container(
                            width: 112,
                            height: 180,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child:
                                Image.network(entry.image, fit: BoxFit.cover),
                          ),
                          SizedBox(
                            width: 184,
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    entry.name.toUpperCase(),
                                    style: TextStyle(fontSize: 21),
                                  ),
                                  Text(
                                    entry.description,
                                    style: TextStyle(fontSize: 12),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Wrap(
                  children: entry
                      .commonLocationsConverter()
                      .map(
                        (e) => Chip(
                          label: Text(e),
                        ),
                      )
                      .toList(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
