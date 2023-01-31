import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';


dynamic customAdvanceNetworkImage(String path) {
  return CachedNetworkImageProvider(path);
}

//USING THIS - NOTE ignore: non_constant_identifier_names
void navigateTo(context, nameRoute) => Navigator.pushNamed(context, nameRoute);


