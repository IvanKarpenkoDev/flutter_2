import 'package:apiapp/dj/service.dart';
import 'package:apiapp/features/home/domain/entity/cat_entity.dart';
import 'package:apiapp/features/home/presentation/controller/home_controller.dart';
import 'package:apiapp/features/home/presentation/ui/byName.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => service<HomeController>()..init(),
      child: _Home()
    );
  }
}

class _Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _search = TextEditingController();
    List<CatEntity> catEntity = context.watch<HomeController>().catList;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(8.0),
              child: TextField(
                controller: _search,
                decoration: InputDecoration(
                  labelText: 'Поиск по имени',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                context.read<HomeController>().initSearch(_search.text);
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ), backgroundColor: Colors.blue, // Цвет кнопки "Найти"
              ),
              child: Text(
                'Найти',
                style: TextStyle(color: Colors.white), // Цвет текста кнопки "Найти"
              ),
            ),
            ElevatedButton(
              onPressed: () {
                context.read<HomeController>().init();
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ), backgroundColor: Colors.green, // Цвет кнопки "Вернуть"
              ),
              child: Text(
                'Вернуть',
                style: TextStyle(color: Colors.white), // Цвет текста кнопки "Вернуть"
              ),
            ),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // Количество колонок
                  childAspectRatio: 1, // Соотношение сторон квадрата
                ),
                itemCount: context.watch<HomeController>().catList.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ByName(cat: catEntity[index])),
                        );
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(context.watch<HomeController>().catList[index].name),
                          SizedBox(height: 8.0),
                          Text("${context.watch<HomeController>().catList[index].min_max_life_expectancy}"),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
