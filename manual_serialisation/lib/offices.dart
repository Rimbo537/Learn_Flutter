import 'dart:convert';

import 'package:http/http.dart' as http;


class OfficesList {
  List<Office> offices; // хранение офисов
  OfficesList({required this.offices}); //конструктор

// фабричный конструктор

  factory OfficesList.fromJson(Map<String, dynamic> json) {
    var officesJson = json['offices'] as List; // получает список офисов из json

// .map принимает елемент данных и применяет функцию и возвращает результат
// получаем json и преобразовываем в список данных office
// помещаем в список оfficesList

    List<Office> officesList =
        officesJson.map((i) => Office.fromJson(i)).toList();

    return OfficesList(
      offices: officesList,
    );
  }
}

class Office {
  final String name;
  final String address;
  final String image;

// конструктор принимает 3 поля
  Office({required this.name, required this.address, required this.image});

// фабричный конструктор отвечает за дессериализацию данных из
// джейсон в данные класса Office

  factory Office.fromJson(Map<String, dynamic> json) {
    return Office(
      // ключи, которые содержит json
      name: json['name'] as String,
      address: json['address'] as String,
      image: json['image'] as String,
    );
  }
}

// метод выполняет гет запрос на сервер и запускает десериализацию класса данных

Future<OfficesList> getOfficesList() async {
  const url = 'https://about.google/static/data/locations.json';
  final response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    return OfficesList.fromJson(json.decode(response.body));
  } else {
    throw Exception('Error: ${response.reasonPhrase}');
  }
}