import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pokeapitarea/models/Pokemon.dart';

class Pokeapiservice {
  final String _baseUrl = 'https://pokeapi.co/api/v2';

  Future<Pokemon> getPokemon(int id) async {
    final response = await http.get(Uri.parse('$_baseUrl/pokemon/$id'));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return Pokemon.fromJson(data);
    } else {
      throw Exception('Failed to load Pokemon');
    }
  }

  Future<List<Pokemon>> pokemonrango(int iniciopokemon, int finalpokemon) async {
    List<Pokemon> pokemons = [];
    for (int i = iniciopokemon; i <= finalpokemon; i++) {
      try {
        final pokemon = await getPokemon(i);
        debugPrint('Buscando Pokemon: ${pokemon.name}');
        pokemons.add(pokemon);
      } catch (e) {
        print('Error fetching Pokemon $i: $e');
      }
    }
    return pokemons;
  }
}
