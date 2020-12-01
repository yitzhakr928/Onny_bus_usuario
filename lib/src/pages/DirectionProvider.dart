// To parse this JSON data, do
//
//     final reqResRespuesta = reqResRespuestaFromJson(jsonString);

import 'dart:convert';

ReqResRespuesta reqResRespuestaFromJson(String str) => ReqResRespuesta.fromJson(json.decode(str));

String reqResRespuestaToJson(ReqResRespuesta data) => json.encode(data.toJson());

class ReqResRespuesta {
    ReqResRespuesta({
        this.status,
        this.data,
    });

    String status;
    List<Datum> data;

    factory ReqResRespuesta.fromJson(Map<String, dynamic> json) => ReqResRespuesta(
        status: json["status"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Datum {
    Datum({
        this.id,
        this.conductor,
    });

    String id;
    Conductor conductor;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["_id"],
        conductor: Conductor.fromJson(json["conductor"]),
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "conductor": conductor.toJson(),
    };
}

class Conductor {
    Conductor({
        this.id,
        this.latitud,
        this.longitud,
    });

    String id;
    double latitud;
    double longitud;

    factory Conductor.fromJson(Map<String, dynamic> json) => Conductor(
        id: json["_id"],
        latitud: json["latitud"].toDouble(),
        longitud: json["longitud"].toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "latitud": latitud,
        "longitud": longitud,
    };
}
