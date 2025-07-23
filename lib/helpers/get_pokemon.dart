import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pokeapitarea/models/Pokemon.dart';

Future<Pokemon> fetchPokemon(int id) async {
  final response = await http.get(Uri.parse('https://pokeapi.co/api/v2/pokemon/$id'));

  if (response.statusCode == 200) {
    return Pokemon.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Error al cargar el pokemon soplaverga');
  }
}
