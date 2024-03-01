// To parse this JSON data, do
//
//     final patient = patientFromJson(jsonString);

import 'dart:convert';

Patient patientFromJson(String str) => Patient.fromJson(json.decode(str));

String patientToJson(Patient data) => json.encode(data.toJson());

class Patient {
    PatientClass patient;
    String message;

    Patient({
        required this.patient,
        required this.message,
    });

    factory Patient.fromJson(Map<String, dynamic> json) => Patient(
        patient: PatientClass.fromJson(json["patient"]),
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "patient": patient.toJson(),
        "message": message,
    };
}

class PatientClass {
    String id;
    String hospitalNumber;
    String firstName;
    String lastName;
    String gender;
    String phoneNumber;

    PatientClass({
        required this.id,
        required this.hospitalNumber,
        required this.firstName,
        required this.lastName,
        required this.gender,
        required this.phoneNumber,
    });

    factory PatientClass.fromJson(Map<String, dynamic> json) => PatientClass(
        id: json["_id"],
        hospitalNumber: json["hospitalNumber"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        gender: json["gender"],
        phoneNumber: json["phone_number"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "hospitalNumber": hospitalNumber,
        "firstName": firstName,
        "lastName": lastName,
        "gender": gender,
        "phone_number": phoneNumber,
    };
}
