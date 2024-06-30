// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class clinics {
  final String id_names;
  final String clinic_name;
  final String clinic_name_in_english;
  final String clinic_email;

  final String clinics_image;
  final String clinics_place;
  final String clinics_place_in_english;

  final String clinics_reward;
  final String clinics_type;

  clinics(
      {required this.id_names,
      required this.clinic_name,
      required this.clinic_name_in_english,
      required this.clinic_email,
      required this.clinics_image,
      required this.clinics_place,
      required this.clinics_place_in_english,
      required this.clinics_reward,
      required this.clinics_type});
}

class program_Interface {
  final String clinics_image;
  final String clinic_name;

  program_Interface({required this.clinics_image, required this.clinic_name});
}

class specialization_date {
  final int id_specialization;
  final List<String> date;
  specialization_date({required this.id_specialization, required this.date});
}

class clinics_info {
  final String clinics_name;
  final String clinics_image;
  final int clinics_reward;
  final String clinics_specialization;
  final List<String> clinics_date;
  final String clinics_place;
  clinics_info({
    required this.clinics_name,
    required this.clinics_image,
    required this.clinics_reward,
    required this.clinics_specialization,
    required this.clinics_date,
    required this.clinics_place,
  });
}

class Private_Doctor {
  final String Doctor_name;
  final String Doctor_image;
  final int Doctor_reward;
  final String Doctor_specialization;
  final List<String> Doctor_date;
  final String Doctor_place;
  Private_Doctor({
    required this.Doctor_name,
    required this.Doctor_image,
    required this.Doctor_reward,
    required this.Doctor_specialization,
    required this.Doctor_date,
    required this.Doctor_place,
  });
}

class id_And_Specialization {
  final String id;
  final String specialization;
  final String specialization_in_english;

  id_And_Specialization(
      {required this.id,
      required this.specialization,
      required this.specialization_in_english});
}

class allClinics {
  final String id;
  final String relation_clinic_name;
  final String clinics_type;

  final String relation_clinic_specialization;
  final String clinic_level;

  final String day_number;
  final String Clinic_start_time;
  final String Clinic_start_period;
  final String Clinic_end_time;
  final String Clinic_end_period;
  final String clinic_Name;
  final String clinic_name_in_english;
  final String specialization;
  final String specialization_in_english;
  final String clinics_reward;
  final String clinics_place;
  final String clinics_place_in_english;
  final String clinic_Image;
  final String Clinic_Cost;

  allClinics({
    required this.id,
    required this.relation_clinic_name,
    required this.clinics_type,
    required this.relation_clinic_specialization,
    required this.clinic_level,
    required this.day_number,
    required this.Clinic_start_time,
    required this.Clinic_start_period,
    required this.Clinic_end_time,
    required this.Clinic_end_period,
    required this.clinic_Name,
    required this.clinic_name_in_english,
    required this.specialization,
    required this.specialization_in_english,
    required this.clinics_reward,
    required this.clinics_place,
    required this.clinics_place_in_english,
    required this.clinic_Image,
    required this.Clinic_Cost,
  });
}

class all_clinic_name {
  final String clinic_name;
  final String clinic_name_in_english;
  final String clinics_type;

  all_clinic_name(
      {required this.clinic_name,
      required this.clinic_name_in_english,
      required this.clinics_type});
}

class all_Reservations {
  final String Id_Reservations;
  final String Relation_Clinic_Name;
  final String Reservations_Person_Name;
  final String Reservations_Person_Name_inEnglish;
  final String Relation_Clinic_Type;
  final String Reservations_Timing_And_Date;
  all_Reservations({
    required this.Id_Reservations,
    required this.Relation_Clinic_Name,
    required this.Reservations_Person_Name,
    required this.Reservations_Person_Name_inEnglish,
    required this.Relation_Clinic_Type,
    required this.Reservations_Timing_And_Date,
  });
}

//   final String Doctor_name;
//   final String Doctor_image;
//   final int Doctor_reward;
//   final String Doctor_specialization;
//   final String Doctor_date;
//   final String Doctor_place;
//   Private_Doctor({
//     required this.Doctor_name,
//     required this.Doctor_image,
//     required this.Doctor_reward,
//     required this.Doctor_specialization,
//     required this.Doctor_date,
//     required this.Doctor_place,
//   });
// }
//   this.clinics_1,
  //   this.clinics_2,
  //   this.clinics_3,
  //   this.clinics_4,
  //   this.clinics_5,
  //   this.clinics_6,
  //   this.clinics_7,
  //   this.clinics_8,
  //   this.clinics_9,
  //   this.clinics_10,
  //   this.clinics_11,
  //   this.clinics_12,
  //   this.clinics_13,
  //   this.clinics_14,
  //   this.clinics_15, 
  //     final clinics_info clinics_1;
  // final clinics_info clinics_2;
  // final clinics_info clinics_3;
  // final clinics_info clinics_4;
  // final clinics_info clinics_5;
  // final clinics_info clinics_6;
  // final clinics_info clinics_7;
  // final clinics_info clinics_8;
  // final clinics_info clinics_9;
  // final clinics_info clinics_10;
  // final clinics_info clinics_11;
  // final clinics_info clinics_12;
  // final clinics_info clinics_13;
  // final clinics_info clinics_14;
  // final clinics_info clinics_15;