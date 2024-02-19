class FavoritesAndAdsParams {
  bool isAds;
  bool isUser;
  bool isShowPayment;

  FavoritesAndAdsParams({
    required this.isAds,
    required this.isUser,
    this.isShowPayment = false,
  });
}
