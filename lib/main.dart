import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_exam_l/details.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Подбор варианта на экнамен'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class SelectableRow extends StatefulWidget {
  @override
  _SelectableRowState createState() => _SelectableRowState();
}

class _SelectableRowState extends State<SelectableRow> {
  int? selectedIndex;

  void selectButton(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        5,
            (index) => TextButton(
          onPressed: () {
            selectButton(index);
          },
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.resolveWith<Color>((states) {
              // Подсвечиваем выбранную кнопку
              return selectedIndex == index ? Colors.blue : Colors.grey;
            }),
          ),
          child: Text('Button $index'),
        ),
      ),
    );
  }
}

class _MyHomePageState extends State<MyHomePage> {

  final String criteria = """1) 0 баллов – работа не сделана
  2) 1-3 балла – генерация не работает, но интерфейс отрисован
  3) 4-5 балла – отрисован интерфейс одного экрана в заданном цвете
  4) 6-7 баллов – отрисован интерфейс экрана и показ результата
  5) 8-9 баллов – отрисован интерфейс двух экранов с кастомным переходом в соответствии с заданием и показ результата
  6) 10 баллов – все выполнено и комбинации заданий не повторяются (каждый раз уникальный набор, пока не закончится)""";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: ListView(
        children: <Widget>[
          // make title bigger and bold
          Title(
              color: Colors.black,
              child: const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  'Основной цвет',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.all(1.0),
                child: TextButton(
                  onPressed: () {
                  },
                  child: Text('Розовый'),
                ),
              ),
              Spacer(),
              Padding(
                padding: EdgeInsets.all(1.0),
                child: TextButton(
                  onPressed: () {
                  },
                  child: Text('Желтый'),
                ),
              ),
              Spacer(),
              Padding(
                padding: EdgeInsets.all(1.0),
                child: TextButton(
                  onPressed: () {
                  },
                  child: Text('Зеленый'),
                ),
              ),
              Spacer(),
            ],
          ),
          Title(
              color: Colors.black,
              child: const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  'Показ результата',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.all(1.0),
                child: TextButton(
                  onPressed: () {
                  },
                  child: Text('Dialog'),
                ),
              ),
              Spacer(),
              Padding(
                padding: EdgeInsets.all(1.0),
                child: TextButton(
                  onPressed: () {
                  },
                  child: Text('Shackbar'),
                ),
              ),
              Spacer(),
            ],
          ),
          Title(
              color: Colors.black,
              child: const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  'Переход между экранами',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.all(1.0),
                child: TextButton(
                  onPressed: () {
                  },
                  child: Text('Сверху вниз'),
                ),
              ),
              Spacer(),
              Padding(
                padding: EdgeInsets.all(1.0),
                child: TextButton(
                  onPressed: () {
                  },
                  child: Text('Снизу вверх'),
                ),
              ),
              Spacer(),
              Padding(
                padding: EdgeInsets.all(1.0),
                child: TextButton(
                  onPressed: () {
                  },
                  child: Text('Справа налево'),
                ),
              ),
              Spacer(),
            ],
          ),
          Row(children: [
            Spacer(),
            ElevatedButton(onPressed: () {
              Random random = Random();
              var index1 = random.nextInt(3);
              var index2 = random.nextInt(2);
              var index3 = random.nextInt(3);
              String l = "";
              if (index1 == 0) {
                l = "Розовый ";
              } else if (index1 == 1) {
                l = "Желтый ";
              } else {
                l = "Зеленый ";
              }
              if (index2 == 0) {
                l += " Dialog ";
              } else {
                l += " Snackbar ";
              }
              if (index3 == 0) {
                l += " сверху вниз";
              } else if (index3 == 1) {
                l += " снизу вверх";
              } else {
                l += " справа налево";
              }
              Navigator.push(
                context,
                PageRouteBuilder(
                  transitionDuration: Duration(milliseconds: 500),
                  pageBuilder: (_, __, ___) =>
                      DetailsWidget(info: l),
                  transitionsBuilder: (_, animation, __, child) {
                    return SlideTransition(
                      position: Tween(begin: Offset(0.0, -1.0), end: Offset.zero)
                          .animate(animation),
                      child: child,
                    );
                  },
                ),
              );
            }, child: Text('Подобрать вариант')),
            Spacer(),
            ElevatedButton(onPressed: () {
              Random random = Random();
              var index1 = random.nextInt(3);
              var index2 = random.nextInt(2);
              var index3 = random.nextInt(3);
              String l = "";
              if (index1 == 0) {
                l = "Розовый ";
              } else if (index1 == 1) {
                l = "Желтый ";
              } else {
                l = "Зеленый ";
              }
              if (index2 == 0) {
                l += " Dialog ";
              } else {
                l += " Snackbar ";
              }
              if (index3 == 0) {
                l += " сверху вниз";
              } else if (index3 == 1) {
                l += " снизу вверх";
              } else {
                l += " справа налево";
              }
              Navigator.push(
                context,
                PageRouteBuilder(
                  transitionDuration: Duration(milliseconds: 500),
                  pageBuilder: (_, __, ___) =>
                      DetailsWidget(info: criteria),
                  transitionsBuilder: (_, animation, __, child) {
                    return SlideTransition(
                      position: Tween(begin: Offset(0.0, -1.0), end: Offset.zero)
                          .animate(animation),
                      child: child,
                    );
                  },
                ),
              );
            }, child: Text('Критерии оценки')),
            Spacer(),]),
        ],
      ),
    );
  }
}
