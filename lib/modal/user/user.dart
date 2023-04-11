class User {
  int _status;
  String _message;
  Data _data;

  int get status => _status;

  String get message => _message;

  Data get data => _data;

  User({int status, String message, Data data}) {
    _status = status;
    _message = message;
    _data = data;
  }

  User.fromJson(dynamic json) {
    _status = json["status"];
    _message = json["message"];
    _data = json["data"] != null ? Data.fromJson(json["data"]) : null;
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["status"] = _status;
    map["message"] = _message;
    if (_data != null) {
      map["data"] = _data.toJson();
    }
    return map;
  }
}

class Data {
  int _userId;
  String _fullName;
  String _userName;
  String _userEmail;
  String _userMobileNo;
  String _userProfile;
  String _loginType;
  String _identity;
  int _platform;
  String _deviceToken;
  int _isVerify;
  int _totalReceived;
  int _totalSend;
  int _myWallet;
  int _spenInApp;
  int _checkIn;
  int _uploadVideo;
  int _fromFans;
  int _purchased;
  String _bio;
  String _fbUrl;
  String _instaUrl;
  String _youtubeUrl;
  int _status;
  int _blockOrNot;
  int _freezOrNot;
  String _token;
  String _streamToken;
  int _followersCount;
  int _followingCount;
  int _myPostLikes;
  int _isFollowing;
  String _profileCategoryName;

  int get userId => _userId;

  String get fullName => _fullName;

  String get userName => _userName;

  String get userEmail => _userEmail;

  String get userMobileNo => _userMobileNo;

  String get userProfile => _userProfile;

  String get loginType => _loginType;

  String get identity => _identity;

  int get platform => _platform;

  String get deviceToken => _deviceToken;

  int get isVerify => _isVerify;

  int get totalReceived => _totalReceived;

  int get totalSend => _totalSend;

  int get myWallet => _myWallet;

  int get spenInApp => _spenInApp;

  int get checkIn => _checkIn;

  int get uploadVideo => _uploadVideo;

  int get fromFans => _fromFans;

  int get purchased => _purchased;

  String get bio => _bio;

  String get fbUrl => _fbUrl;

  String get instaUrl => _instaUrl;

  String get youtubeUrl => _youtubeUrl;

  int get status => _status;

  int get blockOrNot => _blockOrNot;

  int get freezOrNot => _freezOrNot;

  String get token => _token;
  String get streamToken => _streamToken;

  int get followersCount => _followersCount;

  int get followingCount => _followingCount;

  int get myPostLikes => _myPostLikes;

  int get isFollowing => _isFollowing;

  String get profileCategoryName => _profileCategoryName;

  Data(
      {int userId,
      String fullName,
      String userName,
      String userEmail,
      String userMobileNo,
      String userProfile,
      String loginType,
      String identity,
      int platform,
      String deviceToken,
      int isVerify,
      int totalReceived,
      int totalSend,
      int myWallet,
      int spenInApp,
      int checkIn,
      int uploadVideo,
      int fromFans,
      int purchased,
      String bio,
      int profileCategory,
      String fbUrl,
      String instaUrl,
      String youtubeUrl,
      int status,
      int blockOrNot,
      int freezOrNot,
      String token,
      String streamToken,
      int followersCount,
      int followingCount,
      int myPostLikes,
      int isFollowing,
      String profileCategoryName}) {
    _userId = userId;
    _fullName = fullName;
    _userName = userName;
    _userEmail = userEmail;
    _userMobileNo = userMobileNo;
    _userProfile = userProfile;
    _loginType = loginType;
    _identity = identity;
    _platform = platform;
    _deviceToken = deviceToken;
    _isVerify = isVerify;
    _totalReceived = totalReceived;
    _totalSend = totalSend;
    _myWallet = myWallet;
    _spenInApp = spenInApp;
    _checkIn = checkIn;
    _uploadVideo = uploadVideo;
    _fromFans = fromFans;
    _purchased = purchased;
    _bio = bio;
    _fbUrl = fbUrl;
    _instaUrl = instaUrl;
    _youtubeUrl = youtubeUrl;
    _status = status;
    _blockOrNot = blockOrNot;
    _freezOrNot = freezOrNot;
    _token = token;
    _streamToken = streamToken;
    _followersCount = followersCount;
    _followingCount = followingCount;
    _myPostLikes = myPostLikes;
    _profileCategoryName = profileCategoryName;
    _isFollowing = isFollowing;
  }

  Data.fromJson(dynamic json) {
    _userId = json["user_id"];
    _fullName = json["full_name"];
    _userName = json["user_name"];
    _userEmail = json["user_email"];
    _userMobileNo = json["user_mobile_no"];
    _userProfile = json["user_profile"];
    _loginType = json["login_type"];
    _identity = json["identity"];
    _platform = json["platform"];
    _deviceToken = json["device_token"];
    _isVerify = json["is_verify"];
    _totalReceived = json["total_received"];
    _totalSend = json["total_send"];
    _myWallet = json["my_wallet"];
    _spenInApp = json["spen_in_app"];
    _checkIn = json["check_in"];
    _uploadVideo = json["upload_video"];
    _fromFans = json["from_fans"];
    _purchased = json["purchased"];
    _bio = json["bio"];
    _fbUrl = json["fb_url"];
    _instaUrl = json["insta_url"];
    _youtubeUrl = json["youtube_url"];
    _status = json["status"];
    _blockOrNot = json["block_or_not"];
    _freezOrNot = json["freez_or_not"];
    _token = json["token"];
    _streamToken = json["stream_token"];
    _followersCount = json["followers_count"];
    _followingCount = json["following_count"];
    _myPostLikes = json["my_post_likes"];
    _isFollowing = json["is_following"];
    _profileCategoryName = json["profile_category_name"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["user_id"] = _userId;
    map["full_name"] = _fullName;
    map["user_name"] = _userName;
    map["user_email"] = _userEmail;
    map["user_mobile_no"] = _userMobileNo;
    map["user_profile"] = _userProfile;
    map["login_type"] = _loginType;
    map["identity"] = _identity;
    map["platform"] = _platform;
    map["device_token"] = _deviceToken;
    map["is_verify"] = _isVerify;
    map["total_received"] = _totalReceived;
    map["total_send"] = _totalSend;
    map["my_wallet"] = _myWallet;
    map["spen_in_app"] = _spenInApp;
    map["check_in"] = _checkIn;
    map["upload_video"] = _uploadVideo;
    map["from_fans"] = _fromFans;
    map["purchased"] = _purchased;
    map["bio"] = _bio;
    map["fb_url"] = _fbUrl;
    map["insta_url"] = _instaUrl;
    map["youtube_url"] = _youtubeUrl;
    map["status"] = _status;
    map["block_or_not"] = _blockOrNot;
    map["freez_or_not"] = _freezOrNot;
    map["token"] = _token;
    map["stream_token"] = _streamToken;
    map["followers_count"] = _followersCount;
    map["following_count"] = _followingCount;
    map["my_post_likes"] = _myPostLikes;
    map["is_following"] = _isFollowing;
    map["profile_category_name"] = _profileCategoryName;
    return map;
  }

  void setToken(String accessToken) {
    _token = accessToken;
  }

  void setChatToken(String accessToken) {
    _streamToken = accessToken;
  }

  void addFollowerCount() {
    _followersCount++;
  }

  void removeFollowerCount() {
    _followersCount--;
  }
}
