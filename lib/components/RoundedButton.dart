import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
 final String label;
 final VoidCallback onPress;
 final Color color;
   const RoundedButton(
      {Key? key, required this.color, required this.label, required this.onPress}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        color: color,
        borderRadius: BorderRadius.circular(30.0),
        elevation: 5.0,
        child: MaterialButton(
          onPressed: onPress,
          minWidth: 200.0,
          height: 42.0,
          child: Text(label,style: const TextStyle(color: Colors.white),),
        ),
      ),
    );
  }
}

// Widget RoundedButton(
//       String label,
//   VoidCallback onPress,
//   Color color,
//
//
//
//     )=>
//     Padding(
//       padding: EdgeInsets.symmetric(vertical: 16.0),
//       child: Material(
//         color: color,
//         borderRadius: BorderRadius.circular(30.0),
//         elevation: 5.0,
//         child: MaterialButton(
//           onPressed: onPress,
//           minWidth: 200.0,
//           height: 42.0,
//           child: Text(label),
//         ),
//       ),
//     );