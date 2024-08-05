class FavoritesAndAdsParams {
  bool isAds;
  bool isUser;
  bool isShowPayment;
  String type ;

  FavoritesAndAdsParams({
    required this.isAds,
    required this.isUser,
     this.type='user',
    this.isShowPayment = false,
  });
}
