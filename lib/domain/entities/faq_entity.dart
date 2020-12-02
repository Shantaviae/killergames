import 'package:killergames/domain/entities/link_entity.dart';

class FrequentlyAskedQuestion {
  FrequentlyAskedQuestion({
    required this.question,
    required this.answer,
    this.links = const [],
  });
  final String question;
  final String answer;
  final List<Link> links;
}
