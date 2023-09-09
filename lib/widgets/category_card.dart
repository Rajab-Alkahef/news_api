import 'package:flutter/material.dart';

class CategortyCard extends StatelessWidget {
  const CategortyCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110,
      width: 165,
      decoration: BoxDecoration(
        image: DecorationImage(
          opacity: 0.7,
          image: AssetImage('assets/sport.jpg'),
          fit: BoxFit.fill,
        ),
        color: Colors.black,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Text(
          'Sport',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
