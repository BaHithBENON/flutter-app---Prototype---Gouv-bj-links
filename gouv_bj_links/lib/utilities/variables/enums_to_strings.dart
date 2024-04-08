import 'enums.dart';
import 'enums_values_strings.dart';

class EnumsToStrings {
  // StatusValue to String
  static String transactionValue(TransactionTypes value) {
    String converted = EnumsValuesStrings.ANOTHER;
    switch (value) {
      case TransactionTypes.Deposit:
        converted = EnumsValuesStrings.DEPOSIT;
        break;
      case TransactionTypes.Transfert:
        converted = EnumsValuesStrings.TRANSFERT;
        break;
      case TransactionTypes.Withdraw:
        converted = EnumsValuesStrings.WITHDRAW;
        break;
      case TransactionTypes.Receive:
        converted = EnumsValuesStrings.RECEIVE;
        break;
      default:
        converted = EnumsValuesStrings.ANOTHER;
    }
    return converted;
  }

  static String chatsTypesValue(ChatsTypes value) {
    String converted;
    switch (value) {
      case ChatsTypes.OneToOne:
        converted = EnumsValuesStrings.ONE_TO_ONE;
        break;
      case ChatsTypes.Group:
        converted = EnumsValuesStrings.GROUP;
        break;
      case ChatsTypes.Business:
        converted = EnumsValuesStrings.BUSINESS;
        break;
      default:
        converted = EnumsValuesStrings.ONE_TO_ONE;
    }
    return converted;
  }

  static String appDirectoriesValue(AppDirectories value) {
    String converted;
    switch (value) {
      case AppDirectories.Covers:
        converted = EnumsValuesStrings.COVERS;
        break;
      case AppDirectories.Publications:
        converted = EnumsValuesStrings.PUBLICATIONS;
        break;
      case AppDirectories.Documents:
        converted = EnumsValuesStrings.DOCUMENTS;
        break;
      case AppDirectories.Profils:
        converted = EnumsValuesStrings.PROFILS;
        break;
      case AppDirectories.Vocals:
        converted = EnumsValuesStrings.VOCALS;
        break;
      case AppDirectories.Stories:
        converted = EnumsValuesStrings.STORIES;
        break;
      case AppDirectories.FlashInfos:
        converted = EnumsValuesStrings.FLASH_INFOS;
        break;
      default:
        converted = EnumsValuesStrings.PUBLICATIONS;
    }
    return converted;
  }

  //
  static String reactionValue(ReactionsTypes value) {
    String converted = EnumsValuesStrings.OKAY;

    switch (value) {
      case ReactionsTypes.Happy:
        converted = EnumsValuesStrings.HAPPY;
        break;
      case ReactionsTypes.Laugh:
        converted = EnumsValuesStrings.LAUGH;
        break;
      case ReactionsTypes.Tongue:
        converted = EnumsValuesStrings.TONGUE;
        break;
      case ReactionsTypes.Confuzed:
        converted = EnumsValuesStrings.CONFUZED;
        break;
      case ReactionsTypes.Question:
        converted = EnumsValuesStrings.QUESTION;
        break;
      case ReactionsTypes.Love:
        converted = EnumsValuesStrings.LOVE;
        break;
      case ReactionsTypes.Cry:
        converted = EnumsValuesStrings.CRY;
        break;
      case ReactionsTypes.Amazement:
        converted = EnumsValuesStrings.AMAZEMENT;
        break;
      case ReactionsTypes.Okay:
        converted = EnumsValuesStrings.OKAY;
        break;
      case ReactionsTypes.Please:
        converted = EnumsValuesStrings.PLEASE;
        break;
      case ReactionsTypes.Sad:
        converted = EnumsValuesStrings.SAD;
        break;
      case ReactionsTypes.Smile:
        converted = EnumsValuesStrings.SMILE;
        break;
      default:
        converted = EnumsValuesStrings.OKAY;
    }
    return converted;
  }

  // 

  // 

  static String premiumsTypeValue(PremiumsTypes value) {
    String converted;
    switch (value) {
      case PremiumsTypes.Stickers_30_J:
        converted = EnumsValuesStrings.STICKERS_30_J;
        break;
      case PremiumsTypes.Stickers_364_J:
        converted = EnumsValuesStrings.STICKERS_364_J;
        break;
      case PremiumsTypes.Ads_30_J:
        converted = EnumsValuesStrings.ADS_30_J;
        break;
      case PremiumsTypes.Ads_364_J:
        converted = EnumsValuesStrings.ADS_364_J;
        break;
      case PremiumsTypes.AdUnique_01:
        converted = EnumsValuesStrings.ADS_UNIQUE_01;
        break;
      case PremiumsTypes.AdUnique_05:
        converted = EnumsValuesStrings.ADS_UNIQUE_05;
        break;
      case PremiumsTypes.AdUnique_10:
        converted = EnumsValuesStrings.ADS_UNIQUE_10;
        break;
      case PremiumsTypes.AdUnique_30:
        converted = EnumsValuesStrings.ADS_UNIQUE_30;
        break;
      case PremiumsTypes.PackFull_30_J:
        converted = EnumsValuesStrings.PACK_FULL_30_J;
        break;
      case PremiumsTypes.PackFull_364_J:
        converted = EnumsValuesStrings.PACK_FULL_364_J;
        break;
      default:
        converted = EnumsValuesStrings.STICKERS_30_J;
    }
    return converted;
  }


  static String notificationValue(NotificationsTypes value) {
    String converted = EnumsValuesStrings.ANY;
    switch (value) {
      case NotificationsTypes.FlashInfos:
        converted = EnumsValuesStrings.FLASH_INFOS;
        break;
      case NotificationsTypes.FriendshipAccepted:
        converted = EnumsValuesStrings.FRIENDSHIP_ACCEPTED;
        break;
      case NotificationsTypes.NewFriendshipRequest:
        converted = EnumsValuesStrings.NEW_FRIENDSHIP_REQUEST;
        break;
      case NotificationsTypes.NewMessage:
        converted = EnumsValuesStrings.NEW_MESSAGE;
        break;
      case NotificationsTypes.NewMessageForAds:
        converted = EnumsValuesStrings.NEW_MESSAGE_FOR_ADS;
        break;
      default:
        converted = EnumsValuesStrings.ANY;
    }
    return converted;
  }
}
