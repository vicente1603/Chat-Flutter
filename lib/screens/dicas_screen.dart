import 'package:micro_news/models/dicas_data.dart';
import 'package:micro_news/tiles/dicas_tile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:micro_news/widgets/page_transformer.dart';

class DicasScreen extends StatelessWidget {
  final DocumentSnapshot snapshot;

  DicasScreen(this.snapshot);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(snapshot.data["title"]),
          backgroundColor: Colors.blueAccent,
          centerTitle: true,
          elevation: 0,
        ),
        body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
            Colors.blueAccent,
            Colors.white,
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
          child: FutureBuilder<QuerySnapshot>(
              future: Firestore.instance
                  .collection("dicas")
                  .document(snapshot.documentID)
                  .collection("items")
                  .getDocuments(),
              builder: (context, snapshot) {
                if (!snapshot.hasData)
                  return Center(child: CircularProgressIndicator());
                else
                  return PageTransformer(
                    pageViewBuilder: (context, visibilityResolver) {
                      return PageView.builder(
                          controller: PageController(viewportFraction: 0.85),
                          itemCount: snapshot.data.documents.length,
                          itemBuilder: (context, index) {
                            final pageVisibility =
                                visibilityResolver.resolvePageVisibility(index);

                            return DicasTile(
                                "list",
                                DicasData.fromDocument(
                                    snapshot.data.documents[index]),
                                pageVisibility);
                          });
                    },
                  );
              }),
        ));
  }
}
