import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class MovieSearchScreen extends StatefulWidget {
  const MovieSearchScreen({super.key});

  @override
  State<MovieSearchScreen> createState() => _MovieSearchScreenState();
}

class _MovieSearchScreenState extends State<MovieSearchScreen> {
  final TextEditingController _controller = TextEditingController();
  Map<String, dynamic>? _movie;
  bool _isLoading = false;
  String _errorMessage = '';

  Future<void> _searchMovie(String title) async {
    if (title.isEmpty) return;

    setState(() {
      _isLoading = true;
      _errorMessage = '';
      _movie = null;
    });

    const apiKey ='390ca0fb';
    final url = Uri.parse('https://www.omdbapi.com/?t=$title&apikey=$apiKey');

    try {
      final response = await http.get(url);
      final data = json.decode(response.body);

      if (data['Response'] == 'True') {
        setState(() {
          _movie = data;
        });
      } else {
        setState(() {
          _errorMessage = data['Error'] ?? 'Movie not found.';
        });
      }
    } catch (e) {
      setState(() {
        _errorMessage = 'Network error: $e';
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('🎥 Movie Search')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              onSubmitted: _searchMovie,
              decoration: InputDecoration(
                labelText: 'Enter movie title',
                suffixIcon: IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () => _searchMovie(_controller.text),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            const SizedBox(height: 20),
            if (_isLoading)
              const Center(child: CircularProgressIndicator())
            else if (_errorMessage.isNotEmpty)
              Text(
                _errorMessage,
                style: const TextStyle(color: Colors.red, fontSize: 18),
              )
            else if (_movie != null)
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        if (_movie!['Poster'] != null &&
                            _movie!['Poster'] != 'N/A')
                          ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.network(
                              _movie!['Poster'],
                              height: 400,
                              fit: BoxFit.cover,
                            ),
                          ),
                        const SizedBox(height: 20),
                        Text(
                          _movie!['Title'] ?? '',
                          style: const TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          '${_movie!['Year']} • ${_movie!['Genre']}',
                          style:
                          const TextStyle(fontSize: 16, color: Colors.grey),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          _movie!['Plot'] ?? '',
                          style:
                          const TextStyle(fontSize: 16, height: 1.5),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 10),
                        Text(
                          '⭐ ${_movie!['imdbRating']} / 10',
                          style: const TextStyle(
                            fontSize: 20,
                            color: Colors.amber,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
          ],
        ),
      ),
    );
  }
}
