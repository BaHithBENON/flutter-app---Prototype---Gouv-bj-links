import 'enums.dart';
import 'enums_values_strings.dart';

class StringsToEnums {
  // Transaction
  static TransactionTypes transactionValue(String value) {
    TransactionTypes converted = TransactionTypes.Another;
    switch (value) {
      case EnumsValuesStrings.DEPOSIT:
        converted = TransactionTypes.Deposit;
        break;
      case EnumsValuesStrings.TRANSFERT:
        converted = TransactionTypes.Transfert;
        break;
      case EnumsValuesStrings.WITHDRAW:
        converted = TransactionTypes.Withdraw;
        break;
      case EnumsValuesStrings.RECEIVE:
        converted = TransactionTypes.Receive;
        break;
      default:
        converted = TransactionTypes.Another;
    }
    return converted;
  }

  static ChatsTypes chatsTypesValue(String value) {
    ChatsTypes converted;
    switch (value) {
      case EnumsValuesStrings.ONE_TO_ONE:
        converted = ChatsTypes.OneToOne;
        break;
      case EnumsValuesStrings.GROUP:
        converted = ChatsTypes.Group;
        break;
      case EnumsValuesStrings.BUSINESS:
        converted = ChatsTypes.Business;
        break;
      default:
        converted = ChatsTypes.OneToOne;
    }
    return converted;
  }

  static AppDirectories appDirectoriesValue(String value) {
    AppDirectories converted;
    switch (value) {
      case EnumsValuesStrings.COVERS:
        converted = AppDirectories.Covers;
        break;
      case EnumsValuesStrings.PUBLICATIONS:
        converted = AppDirectories.Publications;
        break;
      case EnumsValuesStrings.DOCUMENTS:
        converted = AppDirectories.Documents;
        break;
      case EnumsValuesStrings.PROFILS:
        converted = AppDirectories.Profils;
        break;
      case EnumsValuesStrings.VOCALS:
        converted = AppDirectories.Vocals;
        break;
      case EnumsValuesStrings.STORIES:
        converted = AppDirectories.Stories;
        break;
      case EnumsValuesStrings.FLASH_INFOS:
        converted = AppDirectories.FlashInfos;
        break;
      default:
        converted = AppDirectories.Publications;
    }
    return converted;
  }

  //
  static ReactionsTypes reactionValue(String value) {
    ReactionsTypes converted;
    switch (value) {
      case EnumsValuesStrings.HAPPY:
        converted = ReactionsTypes.Happy;
        break;
      case EnumsValuesStrings.LAUGH:
        converted = ReactionsTypes.Laugh;
        break;
      case EnumsValuesStrings.TONGUE:
        converted = ReactionsTypes.Tongue;
        break;
      case EnumsValuesStrings.CONFUZED:
        converted = ReactionsTypes.Confuzed;
        break;
      case EnumsValuesStrings.QUESTION:
        converted = ReactionsTypes.Question;
        break;
      case EnumsValuesStrings.LOVE:
        converted = ReactionsTypes.Love;
        break;
      case EnumsValuesStrings.CRY:
        converted = ReactionsTypes.Cry;
        break;
      case EnumsValuesStrings.AMAZEMENT:
        converted = ReactionsTypes.Amazement;
        break;
      case EnumsValuesStrings.OKAY:
        converted = ReactionsTypes.Okay;
        break;
      case EnumsValuesStrings.PLEASE:
        converted = ReactionsTypes.Please;
        break;
      case EnumsValuesStrings.SAD:
        converted = ReactionsTypes.Sad;
        break;
      case EnumsValuesStrings.SMILE:
        converted = ReactionsTypes.Smile;
        break;
      default:
        converted = ReactionsTypes.Okay;
    }
    return converted;
  }

  // 

  static PremiumsTypes premiumsTypeValue(String value) {
    PremiumsTypes converted;
    switch (value) {
      case EnumsValuesStrings.STICKERS_30_J:
        converted = PremiumsTypes.Stickers_30_J;
        break;
      case EnumsValuesStrings.STICKERS_364_J:
        converted = PremiumsTypes.Stickers_364_J;
        break;
      case  EnumsValuesStrings.ADS_30_J:
        converted = PremiumsTypes.Ads_30_J;
        break;
      case EnumsValuesStrings.ADS_364_J:
        converted = PremiumsTypes.Ads_364_J;
        break;
      case EnumsValuesStrings.ADS_UNIQUE_01:
        converted = PremiumsTypes.AdUnique_01;
        break;
      case EnumsValuesStrings.ADS_UNIQUE_05:
        converted = PremiumsTypes.AdUnique_05;
        break;
      case EnumsValuesStrings.ADS_UNIQUE_10:
        converted = PremiumsTypes.AdUnique_10;
        break;
      case EnumsValuesStrings.ADS_UNIQUE_30:
        converted = PremiumsTypes.AdUnique_30;
        break;
      case EnumsValuesStrings.PACK_FULL_30_J:
        converted = PremiumsTypes.PackFull_30_J;
        break;
      case EnumsValuesStrings.PACK_FULL_364_J:
        converted = PremiumsTypes.PackFull_364_J;
        break;
      default:
        converted = PremiumsTypes.Stickers_30_J;
    }
    return converted;
  }


  static NotificationsTypes notificationValue(String value) {
    NotificationsTypes converted = NotificationsTypes.Any;
    switch (value) {
      case EnumsValuesStrings.NEW_MESSAGE_FOR_ADS:
        converted = NotificationsTypes.NewMessageForAds;
        break;
      case EnumsValuesStrings.NEW_MESSAGE:
        converted = NotificationsTypes.NewMessage;
        break;
      case EnumsValuesStrings.NEW_FRIENDSHIP_REQUEST:
        converted = NotificationsTypes.NewFriendshipRequest;
        break;
      case EnumsValuesStrings.FRIENDSHIP_ACCEPTED:
        converted = NotificationsTypes.FriendshipAccepted;
        break;
      case EnumsValuesStrings.FLASH_INFOS:
        converted = NotificationsTypes.FlashInfos;
        break;
      default:
        converted = NotificationsTypes.Any;
    }
    return converted;
  }
}
