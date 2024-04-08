// ignore_for_file: constant_identifier_names

class ModelsAttributs {

  // ModelLang
  static const String ID = "id";
  static const String NAME = "name";
  static const String LANGUAGE_CODE = "languageCode";
  static const String TITLES = "titles";


  // ModelAppUpdate
  static const String OLD_APP_VERSION = "oldAppVersion";
  static const String NEW_APP_VERSION = "newAppVersion";
  static const String DAY = "day";
  static const String MONTH = "month";
  static const String YEAR = "year";
  static const String IS_FORCED = "isForced";
  static const String BUILD_NUMBER = "buildNumber";

  // ModelAppLink
  static const String LINK_NAME = "linkName";
  static const String LINK_URL = "linkUrl";
  static const String LINK_IMAGES = "linkImages";
  static const String LINK_DETAILS = "linkDetails";

  // ModelClick
  static const String LINK_ID = "linkId";
  static const String CLICK_COUNTER = "clickCounter";

  // ModelWalletReserve
  static const String AMOUNT = "amount";
  static const String MODEL_ID = "modelId";
  static const String WALLET_REFERENCE = "walletReference";
  static const String RESERVE_ID = "reserveId";
  static const String CREATED_TIMESTAMP = "createdTimestamp";
  static const String DETAILS = "details";

  // ModelWallet
  static const String RESERVES = "reserves";
  static const String UPDATED_TIMESTAMP = "updatedTimestamp";
  static const String WALLET_ID = "walletId";
  static const String AUTHOR_REFERENCE = "authorReference";

  // ModelTransaction
  static const String UID = "uid";
  static const String TRANSACTION_TYPE = "transactionType";

  // ModelUser
  static const String PSEUDO = "pseudo";
  static const String PHONE_NUMBER = "phoneNumber";
  static const String PASSWORD = "password";
  static const String WEBSITE = "website";
  static const String PHOTO_URL = "photoUrl";
  static const String USER_URL = "userUrl";
  static const String COUNTRY = "country";
  static const String TOKEN = "token";
  static const String ABOUT = "about";
  static const String USERNAME = "username";
  static const String EMAIL = "email";
  static const String IS_ACTIVE = "isActive";
  static const String AUTO_FRIENDSHIP = "autoFriendship";

  // ModelFriendship
  static const String ENABLED = "enabled";
  static const String REJECTED = "rejected";
  static const String BLOCKED = "blocked";
  static const String TIMESTAMP = "timestamp";
  static const String MEMBER_FROM_REFERENCE = "memberFromReference";
  static const String MEMBER_TO_REFERENCE = "memberToReference";
  static const String ALREADY_NOTIFY = "alreadyNotify";

  // ModelPost
  static const String AUTHOR_UID = "authorUid";
  static const String BLACK_LIST_MEMBERS_UIDS = "blackListMemersUids";
  static const String WHITE_LIST_MEMBERS_UIDS = "whiteListMemersUids";
  static const String VISIBILITY_DAYS = "visibilityDays";
  static const String IMAGES_URLS = "imagesUrls";
  static const String IS_PUBLIC = "isPublic";
  static const String CONTEXT = "context";
  static const String TAG_POST_REFERENCE = "tagPostReference";
  static const String TAG_POST_AUTHOR_REFERENCE = "tagPostAuthorReference";
  static const String REACTIONS = "reactions";

  // ModelAppFile
  static const String FILE_EXTENSION = "fileExtension";
  static const String FILE_NAME = "fileName";
  static const String FILE_TYPE = "fileType";
  static const String FILE_URL = "fileUrl";

  static const String POSTS_FILES = "PostsFiles";

  // ModelComment
  static const String TAG_COMMENT_REFERENCE = "tagCommentReference";
  static const String POST_REFERENCE = "postReference";

  // ModelReaction
  static const String TAG_REFERENCE = "tagReference";
  static const String REACTION_TYPE = "reactionType";

  // ModelChatReference
  static const String CHAT_REFERENCE = "chatReference";
  static const String CHAT_TYPE = "chatType";
  static const String PROFIL_PHOTO = "profilPhoto";
  static const String PINNED = "pinned";
  static const String ARCHIVED = "archived";

  // ModelChatInformation
  static const String MEMBERS_REFERENCES = "membersReferences";
  static const String CHAT_NAME = "chatName";
  static const String CHAT = "chat";

  // ModelMessage
  static const String AUDIOS_URLS = "audiosUrls";
  static const String DOCUMENTS_URLS = "documentsUrls";
  static const String LAST_SEEN_TIMESTAMP = "lastSeenTimestamp";
  static const String SENDER_REFERENCE = "senderReference";
  static const String VIDEOS_URLS = "videosUrls";
  static const String VIEWERS_NAMES = "viewersNames";
  static const String VIEWERS_UIDS = "viewersUids";
  static const String ALREADY_NOTIFIED = "alreadyNotified";

  // ModelSavedMessage
  static const String MESSAGE = "message";
  static const String CHAT_INFORMATIONS = "chatInformations";

  // ModelDeliveryMan
  static const String CITY = "city";
  static const String COUNTRY_CODE = "countryCode";
  static const String DELIVERY_COUNTER = "deliveryCounter";
  static const String IS_VERIFIED = "isVerified";
  static const String SERVICE_PHONE_NUMBER = "servicePhoneNumber";
  static const String PROFIL_URL = "profilUrl";

  // ModelDelivery
  static const String DELIVERY_REFERENCE = "deliveryReference";
  static const String CLIENT_REFERENCE = "clientReference";
  static const String DELIVERY_MAN_REFERENCE = "deliveryManReference";
  static const String IS_FINISHED = "isFinished";
  static const String KEYWORDS = "keyWords";

  // ModelAd
  static const String DELETED_TIMESTAMP = "deletedTimestamp";
  static const String TITLE = "title";
  static const String DEVISE =  "devise";
  static const String SELL = "sell";
  static const String BUY = "buy";
  static const String PRICE = "price";
  static const String CATEGORY = "category";
  static const String ADS_FILES = "AdsFiles";
  static const String WEBSITE_LINK = "websiteLink";

  // ModelAdChat
  static const String AD_REFERENCE = "adReference";
  static const String ANNOUNCER_REFERENCE = "announcerReference";

  // ModelPremium
  static const String VALID_DAYS = "validDays";
  static const String ITEM_COUNTER = "itemCounter";
  static const String PREMIUMS_TYPE = "premiumsType";

  
  static const String PREMIUM_REFERENCE = "premiumReference";

  // ModelBanner
  static const String EXTERNAL_LINK = "externalLink";
  static const String IMAGE_URL = "imageUrl";
  
}
