class MetaReponse {
  final int hits;
  final int offset;
  final int time;

  MetaReponse({this.hits = 0, this.offset = 0, this.time = 0});
}

class ErrorResponse {
  final int code;
  final String messages;

  ErrorResponse({required this.code, required this.messages});
}

class RepositoryResponse<T> {
  final T docs;
  final MetaReponse meta;

  RepositoryResponse({required this.docs, required this.meta});
}
