

import 'package:flutter/material.dart';

//help to change the loading state throughout the app
class Loader extends StatelessWidget{
  const Loader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }}