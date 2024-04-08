// ignore_for_file: constant_identifier_names

enum AppThemeMode { Light, Dark }

enum ReturnStatus { Success, Failure, Waiting, Nothing }

enum TransactionTypes { Withdraw, Deposit, Transfert, Another, Receive }

enum ReactionsTypes {
  Happy,
  Sad,
  Smile,
  Laugh,
  Tongue,
  Confuzed,
  Question,
  Love,
  Cry,
  Amazement,
  Okay,
  Please
}

enum NotificationsTypes { NewFriendshipRequest, FriendshipAccepted, NewMessage, Any, NewMessageForAds, FlashInfos }

enum ChatsTypes { Group, OneToOne, Business }

enum AppDirectories {
  Stories,
  Covers,
  Publications,
  Profils,
  Vocals,
  Documents,
  FlashInfos,
}

enum ServicesTypes { Premium, Stickers, Marketplace, Ads, Banners }

enum PremiumsTypes { Stickers_30_J, Stickers_364_J, Ads_30_J, Ads_364_J, 
                    AdUnique_01, AdUnique_05, AdUnique_10, AdUnique_30, 
                    PackFull_30_J, PackFull_364_J, Banner_30_J, Banner_364_J }

enum DownloadStatus {NotStarted, Downloading, Started, Completed}


enum PlayingStatus { Pause, Completed, NotStarted, Started, Stream }

enum MenuOptions {
  showUserAgent,
  listCookies,
  clearCookies,
  addToCache,
  listCache,
  clearCache,
  navigationDelegate,
  doPostRequest,
  loadLocalFile,
  loadFlutterAsset,
  loadHtmlString,
  transparentBackground,
  setCookie,
}