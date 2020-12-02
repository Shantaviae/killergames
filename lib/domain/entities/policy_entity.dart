class AppPolicy {
  final String policyName;
  final List<String> policyDescriptions;
  final DateTime dateCreated;
  final DateTime dateUpdated;
  final List<PolicySection> sections;

  AppPolicy({
    required this.policyName,
    required this.policyDescriptions,
    required this.dateCreated,
    required this.dateUpdated,
    required this.sections,
  }) : assert(sections.isNotEmpty, 'Each policy should contain a section.');
}

class PolicySection {
  PolicySection({
    required this.title,
    required this.subsections,
  }) : assert(subsections.isNotEmpty,
            'Each section should contain a subsection.');

  final String title;
  final List<PolicySubsection> subsections;
}

class PolicySubsection {
  PolicySubsection({
    this.title,
    required this.content,
  }) : assert(content.isNotEmpty, 'Each section should contain content.');

  final String? title;
  final List<PolicyContent> content;
}

abstract class PolicyContent {
  PolicyContent(this.content);
  final String content;
}

class ContentParagrah extends PolicyContent {
  ContentParagrah(String paragraph) : super(paragraph);
}

class ContentList extends PolicyContent {
  ContentList(String paragraph, {this.title}) : super(paragraph);
  final String? title;
}
