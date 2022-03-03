// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, duplicate_ignore, avoid_print

import 'package:barberapp/ui/theme.dart';
import 'package:barberapp/ui/widgets/input_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class AddSchedule extends StatefulWidget {
  const AddSchedule({Key? key}) : super(key: key);

  @override
  State<AddSchedule> createState() => _AddScheduleState();
}

class _AddScheduleState extends State<AddSchedule> {
  DateTime _selectedDate = DateTime.now();
  String _startTime = DateFormat("hh:mm a").format(DateTime.now()).toString();
  String _endTime = "00:00";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      appBar: _appBar(context),
      body: Container(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                "Cadastre Seu Horário",
                style: headingStyle,
              ),
              InputField(
                  title: "Nome", label: "Digite o nome de quem será agendado"),
              InputField(
                title: "Data do agendamento",
                label: DateFormat(DateFormat.YEAR_MONTH_DAY, 'pt_Br')
                    .format(_selectedDate),
                widget: IconButton(
                  icon: Icon(
                    Icons.calendar_month_outlined,
                  ),
                  onPressed: () {
                    _getDateUser();
                  },
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: InputField(
                      title: "Horário Inicial",
                      label: _startTime,
                      widget: IconButton(
                        onPressed: () {
                          _getTimeUser(isStartTime: true);
                        },
                        icon: Icon(Icons.access_time_rounded),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  Expanded(
                    child: InputField(
                      title: "Horário de Termino",
                      label: _endTime,
                      widget: IconButton(
                        onPressed: () {
                          _getTimeUser(isStartTime: false);
                        },
                        icon: Icon(Icons.access_time_rounded),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  _appBar(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: context.theme.backgroundColor,

      leading: GestureDetector(
        onTap: () {
          Get.back();
        },
        child: Icon(
          Icons.arrow_back_ios,
          size: 20,
          color: Get.isDarkMode ? Colors.white : Colors.black,
        ),
      ), //Inclui itens no inicio da appBar
      // ignore: prefer_const_literals_to_create_immutables
      actions: [
        CircleAvatar(
          backgroundImage: AssetImage(
            "images/222.jpg",
          ),
        ),
        SizedBox(
          width: 20,
        )
      ],
    );
  }

  _getDateUser() async {
    DateTime? _pickerDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2001),
        lastDate: DateTime(2199));

    if (_pickerDate != null) {
      setState(() {
        _selectedDate = _pickerDate;
      });
    } else {
      print("Ops Problema ao salvar a data");
    }
  }

  _getTimeUser({required bool isStartTime}) async {
    var pickedTime = await _showTimePicker();
    String _formatedTime = pickedTime.format(
        context); //Passando somento o contexto e possivel tranformar em string o valor recebido
    if (pickedTime == null) {
      print("Cancelado");
    } else if (isStartTime == true) {
      setState(() {
        _startTime = _formatedTime;
      });
    } else if (isStartTime == false) {
      setState(() {
        _endTime = _formatedTime;
      });
    }
  }

  _showTimePicker() {
    return showTimePicker(
      initialEntryMode: TimePickerEntryMode.input,
      context: context,
      initialTime: TimeOfDay(
        hour: int.parse(_startTime.split(":")[0]),
        minute: int.parse(_startTime.split(":")[1].split(" ")[0]),
      ),
    );
  }
}
