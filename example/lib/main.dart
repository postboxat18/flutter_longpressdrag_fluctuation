import 'package:flutter/material.dart';
import 'package:flutter_longpressdrag_fluctuation/flutter_longpressdrag_fluctuation.dart';

import 'Model/ListDragModel.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late List<ListDragModel> listDragModel = [];

  @override
  void initState() {
    for (int i = 0; i < 10; i++) {
      listDragModel.add(
        ListDragModel("Name $i", "Good or Bad Like This 😁", "${25 + i + 5}",
            (i + 1).toString(), "25${i}0"),
      );
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "LongPressDragFluctuation",
        ),
        shape: RoundedRectangleBorder(side: BorderSide(color: Colors.black)),
      ),
      body: Center(
        child: ListView.builder(
          itemCount: listDragModel.length,
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            return LongPressDragFluctuation(
              axis: Axis.horizontal,
              onChanged: (value) {
                listDragModel[listDragModel.indexWhere(
                  (element) => element.name == listDragModel[index].name,
                )] = ListDragModel(
                    listDragModel[index].name.toString(),
                    listDragModel[index].description.toString(),
                    listDragModel[index].qty.toString(),
                    value.toString(),
                    listDragModel[index].price.toString());
                setState(() {
                  listDragModel;
                });
              },
              fadeContainer: Container(
                margin: EdgeInsets.all(12),
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      blurRadius: 8,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      "",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '',
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          '',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              count: int.parse(listDragModel[index].selectQty.toString()),
              maxCount: int.parse(listDragModel[index].qty.toString()),
              child: Container(
                margin: const EdgeInsets.all(10),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      blurRadius: 8,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      listDragModel[index].name.toString(),
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      listDragModel[index].description.toString(),
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[700],
                      ),
                    ),
                    SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Qty: ${listDragModel[index].selectQty.toString()} /${listDragModel[index].qty.toString()}',
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          listDragModel[index].price.toString(),
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
