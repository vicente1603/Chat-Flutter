import 'package:flutter/material.dart';
import '../models/evento_calendario_model.dart';
import 'detalhes_medicamentos_srceen.dart';

class EventDetailsPage extends StatelessWidget {
  final EventModel event;

  const EventDetailsPage({Key key, this.event}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Colors.blueAccent,
        ),
        centerTitle: true,
        title: Text(
          "Detalhes do evento",
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
          ),
        ),
        elevation: 0.0,
      ),
      body: Container(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              MainSection(event: event),
              SizedBox(
                height: 15,
              ),
              ExtendedSection(event: event),
              Padding(
                padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.height * 0.06,
                  right: MediaQuery.of(context).size.height * 0.06,
                  top: 25,
                ),
                child: Container(
                  height: 50,
                  child: FlatButton(
                    color: Colors.blueAccent,
                    shape: StadiumBorder(),
                    onPressed: () {
//                      openAlertBox(context, _globalBloc, uid);
                    },
                    child: Center(
                      child: Text(
                        "Remover Evento",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MainSection extends StatelessWidget {
  final EventModel event;

  MainSection({
    Key key,
    @required this.event,
  }) : super(key: key);

  Hero makeIcon(double size) {
    return Hero(
      tag: event.titulo + event.titulo,
      child: Icon(
        Icons.calendar_today,
        color: Colors.blueAccent,
        size: size,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          makeIcon(100),
          SizedBox(
            width: 15,
          ),
          Column(
            children: <Widget>[
              Hero(
                tag: event.titulo,
                child: Material(
                  color: Colors.transparent,
                  child: MainInfoTab(
                    fieldTitle: "Título",
                    fieldInfo: event.titulo,
                  ),
                ),
              ),
              MainInfoTab(
                fieldTitle: "Data",
                fieldInfo: event.data.toString(),
              )
            ],
          )
        ],
      ),
    );
  }
}

class ExtendedSection extends StatelessWidget {
  final EventModel event;

  ExtendedSection({Key key, @required this.event}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        shrinkWrap: true,
        children: <Widget>[
          ExtendedInfoTab(
            fieldTitle: "Descrição",
            fieldInfo: event.descricao,
          ),
          ExtendedInfoTab(
            fieldTitle: "Local",
            fieldInfo: event.local,
          ),
          ExtendedInfoTab(fieldTitle: "Horário", fieldInfo: event.horario),
        ],
      ),
    );
  }
}