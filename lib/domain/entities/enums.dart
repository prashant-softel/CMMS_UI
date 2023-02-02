// coverage:ignore-file

/// A set of enums use all over the

/// RequestType
enum Request {
  get,
  getMultiparts,
  post,
  postMultiparts,
  put,
  patch,
  delete,
  awsUpload,
}

/// MQTT Enums
enum MQTTConnectionState {
  Connected,
  disconnected,
  subscribed,
  unsubscribed,
  connecting
}

/// type of class status
enum MyClassStatus {
  Ongoing,
  Completed,
  Cancelled,
  Expired,
}

/// Type of message.
enum MessageType {
  error,
  success,
  information,
}

enum PostCategory { popular, latest, userProfile }

enum CollectionType { all, addToCollection, select, edit }

enum LearningObjective { tense, adjectives, nouns, punctuations }

enum FindTutorSubject {
  preferredSubject,
  allSubject,
}

enum Countrys { india, uk }

enum Durations { now, later }

/// LoginType
///
///   email -> 1
///
///  facebook -> 2
///
///  google -> 3
///
///  twitter -> 4
///
///  phoneNumber -> 5
enum LoginType {
  email,
  facebook,
  google,
  twitter,
  phoneNumber,
  apple,
}

/// UserType
///
/// User -> Teacher -> 1
///
/// model -> Parent -> 2
///
/// guest -> Student -> 3
enum UserType {
  user,
  model,
  guest,
}

/// Email Or PhoneNumber Type
///
/// phoneNumber -> 1
///
/// email -> 2
enum EmailOrPhoneNoType {
  phoneNumber,
  email,
}

/// Type of entry
///
/// Login -> 1
///
/// Signup -> 2
enum TypeOfEntry {
  login,
  signup,
}

/// Social Trigger
enum SocialTrigger { facebook, google, apple }

/// Token type guest, auth
enum TokenType {
  guest,
  auth,
}

enum ContentType { termsAndConditions, privacyPoliciy, nsfw }

/// Types of Buttons
enum ButtonType {
  cancelled,
  continued,
}

/// trigger is For 1-register, 2-forgotpassword, 3-change number
enum VerifyOtpTrigger {
  register,
  forgotPassword,
  changeNumber,
}

/// Types of Subscription
enum Subscription {
  active,
  cancelled,
}

/// Types of Gender.
enum Gender {
  male,
  female,
  other,
}

/// html type

enum HtmlType {
  editProfile,
  termsAndCondition,
  privacyPolicy,
  signUp,
}

enum MatchType { phone, email, link, none }

/// Bottom nav bar type
enum NavBarType {
  home,
  feeds,
  trending,
  search,
  reels,
  chatview,
  profile,
}

/// add post upload
enum UploadPost {
  uploadPhoto,
  uploadPhotoFromCamera,
  uploadVdo,
  uploadText,
  uploadAProduct,
}

enum PostTo {
  story,
  feed,
}

enum HomeTabMenus {
  tvshows,
  movies,
  home,
  category,
}

enum AllCategories {
  allCategories,
  availableForDownload,
  indian,
  us,
  british,
  european,
  asian,
  family,
  realityAndTalk,
  action,
  dramas,
  comedies,
}

enum SortBy {
  priceHighLow,
  priceLowHigh,
  noOfReviews,
  newest,
  alphabetical,
}

/// Types of Doc.
enum ChangeDoc {
  aadharCard,
}

/// Types of Languages.
enum Languages {
  english,
  hindi,
}

enum Transactions {
  allTransactions,
  debitTransactions,
  creditTransactions,
  pendingTransactions,
}

enum CrmUpload {
  uploadPhoto,
  uploadVideo,
}

enum SelectDuration {
  fiveMins,
  tenMins,
  fifteenMins,
  twentyMins,
  thirtyMins,
  sixtyMins,
}

enum SocialType {
  LINK,
  UNLINK,
}

enum SignUpType {
  Email,
  Fb,
  Google,
  Twitter,
  PhoneNumber,
  Apple,
}

enum AppFlavor {
  PROD,
  DEV,
}

enum ProfileBody {
  Collection,
  Favourites,
  Posts,
}
