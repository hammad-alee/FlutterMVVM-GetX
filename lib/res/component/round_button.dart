import 'package:flutter/material.dart';

class RoundButton extends StatelessWidget {
  const RoundButton(
      {super.key, required this.title, this.onTap, required this.loading});
  final String title;
  final void Function()? onTap;
  final bool loading;

  @override
  Widget build(BuildContext context) {
    return loading
        ? const Center(
            child: CircularProgressIndicator(
              color: Colors.black,
            ),
          )
        : MaterialButton(
            minWidth: MediaQuery.of(context).size.width,
            color: Colors.black,
            height: 50,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            onPressed: onTap,
            child: Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
          );
  }
}
