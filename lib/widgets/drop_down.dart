import 'package:chatgpt_course/constants/constants.dart';
import 'package:chatgpt_course/services/api_services.dart';
import 'package:chatgpt_course/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class DropDownWidget extends StatefulWidget {
  const DropDownWidget({super.key});

  @override
  State<DropDownWidget> createState() => _DropDownWidgetState();
}

class _DropDownWidgetState extends State<DropDownWidget> {
  String currentModel = "text-davinci-003";
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: ApiService.getModels(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: TextWidget(label: snapshot.error.toString()),
            );
          }
          return snapshot.data == null || snapshot.data!.isEmpty
              ? const SizedBox.shrink()
              : FittedBox(
                child: DropdownButton(
                    dropdownColor: scaffoldBackgroundColor,
                    iconEnabledColor: Colors.white,
                    items: List<DropdownMenuItem<String>>.generate(
          snapshot.data!.length,
          (index) => DropdownMenuItem(
                value: snapshot.data![index].id,
                child: TextWidget(
                  label: snapshot.data![index].id,
                  fontSize: 15,
                ))),
                    value: currentModel,
                    onChanged: (value) {
                      setState(() {
                        currentModel = value.toString();
                      });
                    },
                  ),
              );
        });
  }
}
