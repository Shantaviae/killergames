import 'package:flutter/foundation.dart';
import 'package:killergames/data/graph_ql_datasource.dart';
import 'package:killergames/domain/entities/entities.dart';

const String _policiesQuery = r'''
  query AllPolicies {
  policies {
    title
    description
    content
    updatedAt
  }
}
''';

class PolicyDatasource extends GraphQLDatasource {
  PolicyDatasource() : super(query: _policiesQuery, root: 'policies');

  Future<Map<String, AppPolicy>> fetchPolicies() async {
    final data = await fetchData<AppPolicy>(
      converter: (data) => toPolicyEntity(data),
      // testData: PlaceholderData.policies,
    );
    return {for (final policy in data) policy.path: policy};
  }

  @visibleForTesting
  static AppPolicy toPolicyEntity(Map<String, dynamic> data) {
    return AppPolicy(
      title: data['title'],
      description: data['description'],
      content: data['content'],
      updatedAt: DateTime.tryParse(data['updatedAt']) ?? DateTime.now(),
    );
  }
}
