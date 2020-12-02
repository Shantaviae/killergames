class AppReview {
  AppReview({
    required this.userFullname,
    required this.appReviewDescription,
    required this.rating,
  }) : assert(1 <= rating && rating <= 5,
            'Rating must be between 1 and 5 inclusively.');

  final String userFullname;
  final String appReviewDescription;
  final int rating;
}
