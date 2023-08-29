import 'package:flutter/material.dart';
import 'package:horoscope/dto/sign_dto.dart';
import 'package:horoscope/extension/string_extension.dart';

class Sign extends StatefulWidget {
  const Sign({super.key, required this.signDTO, required this.viewForecast});
  final SignDTO signDTO;
  final Function viewForecast;
  @override
  State<StatefulWidget> createState() {
    return _SignState();
  }
}

class _SignState extends State<Sign> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        widget.viewForecast(widget.signDTO);
      },
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(
                width: 1, color: const Color.fromARGB(255, 124, 123, 123)),
            gradient: const LinearGradient(colors: [
              Color.fromARGB(255, 48, 48, 48),
              Color.fromARGB(255, 71, 70, 70)
            ], begin: Alignment.topLeft, end: Alignment.bottomRight),
            borderRadius: const BorderRadius.all(Radius.circular(10))),
        child: Center(
          child: Text(
            widget.signDTO.signName.capitalize(),
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(color: Theme.of(context).colorScheme.onBackground),
          ),
        ),
      ),
    );
  }
}
