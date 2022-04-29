import 'package:flutter/material.dart';
import 'dart:core';

class StationData{
  String title;
  String subtitle;
  String code;
  String address;
  int lat;
  int lag;

  String chargerType;
  String imgUrl;



  StationData({
    required this.title,
    required this.subtitle,
    required this.code,
    required this.address,
    required this.lat,
    required this.lag,
    required this.chargerType,
    required this.imgUrl,
  });

}