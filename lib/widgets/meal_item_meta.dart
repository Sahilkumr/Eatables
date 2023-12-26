import 'package:flutter/material.dart';

class MealItemMetaData extends StatelessWidget {
  const MealItemMetaData({
    super.key,
    required this.icon,
    required this.label,
  });

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon,size: 20,color: Colors.white,),
        const SizedBox(width: 7,),
        Text(label,style: TextStyle(color: Colors.white,fontSize: 18),),
      ],
    );
  }
}
