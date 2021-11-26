import 'dart:async';
import 'package:http/http.dart' as http;

class CharacterApi {
  static Future getCharacters() {
    return http.get(Uri.parse("https://deaninstitute.fastrider.co/api/all-category"));
  }
}
class CharacterApi1 {
  static Future getCharacters() {
    return http.get(Uri.parse("https://deaninstitute.fastrider.co/api/all-sub-category"));
  }
}

class CharacterApi2 {
  static Future getCharacters() {
    return http.get(Uri.parse("https://deaninstitute.fastrider.co/api/all-child-category"));
  }
}
class CharacterApi3 {
  static Future getCharacters() {
    return http.get(Uri.parse("https://deaninstitute.fastrider.co/api/course"));
  }
}
class CharacterApi4 {
  static Future getCharacters() {
    return http.get(Uri.parse("https://deaninstitute.fastrider.co/api/course-by-category/{id}"));
  }
}
class CharacterApi5 {
  static Future getCharacters() {
    return http.get(Uri.parse("https://deaninstitute.fastrider.co/api/"));
  }
}
class CharacterApi6 {
  static Future getCharacters() {
    return http.get(Uri.parse("https://deaninstitute.fastrider.co/api/courses-enrolled-by-user/{id}"));
  }
}
class CharacterApi7 {
  static Future getCharacters() {
    return http.get(Uri.parse("https://deaninstitute.fastrider.co/api/course-details/{id}"));
  }
}
class CharacterApi8 {
  static Future getCharacters() {
    return http.get(Uri.parse("https://deaninstitute.fastrider.co/api/reviews/{id}"));
  }
}
class CharacterApi9 {
  static Future getCharacters() {
    return http.get(Uri.parse("https://deaninstitute.fastrider.co/api//course-batch/{id}"));
  }
}
class CharacterApi10 {
  static Future getCharacters() {
    return http.get(Uri.parse("https://deaninstitute.fastrider.co/api/enroll-course/{course_id}"));
  }
}
class CharacterApi11 {
  static Future getCharacters() {
    return http.get(Uri.parse("https://deaninstitute.fastrider.co/api/"));
  }
}
class CharacterApi12 {
  static Future getCharacters() {
    return http.get(Uri.parse("https://deaninstitute.fastrider.co/api/payment-history/{user_id}"));
  }
}