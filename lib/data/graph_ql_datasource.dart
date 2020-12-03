import 'package:flutter/foundation.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:graphql/client.dart';
import 'package:killergames/core/core.dart';

typedef Converter<X> = X Function(dynamic data);

class GraphQLDatasource {
  GraphQLDatasource({required this.query, required this.root});
  final String query;
  final String root;

  @protected
  Future<List<T>> fetchData<T>({
    required Converter<T> converter,
    List<Map<String, dynamic>>? testData,
  }) async {
    List<dynamic> data;
    if (testData == null) {
      final httpLink = HttpLink(uri: GRAPH_CMS_ENDPOINT);
      final client = GraphQLClient(cache: InMemoryCache(), link: httpLink);
      final result = await client.query(QueryOptions(documentNode: gql(query)));
      if (result.hasException) {
        return <T>[];
      } else {
        data = result.data[root];
      }
    } else {
      data = testData;
    }

    return <T>[for (final json in data) converter(json)];
  }
}
