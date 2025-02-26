import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/quote_model.dart';

class ApiService {
  static const String apiUrl = "https://zenquotes.io/api/random";

  Future<Quote> fetchRandomQuote() async {
    try {
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        print("Response Body: ${response.body}");


        List<dynamic> jsonData = json.decode(response.body);
        Map<String, dynamic> quoteData = jsonData[0];

        Quote quote = Quote.fromJson(quoteData);
        print("Quote: \"${quote.content}\" - ${quote.author}");

        return quote;
      } else {
        throw Exception("Failed to load quote");
      }
    } catch (e) {
      print("Error fetching quote: $e");
      throw Exception("Error fetching quote: $e");
    }
  }
}
