//String rootUrl = 'http://10.0.2.2/realfitzapi/src/Api';
String rootUrl = 'http://192.168.176.134:3150/src/Api';
//String rootUrl = 'https://realfitz.loptymobile.com/realfitzapi/src/Api';
String createAccountUrl = '$rootUrl/User/CreateUser.php';
String loginUrl = '$rootUrl/User/LoginUser.php';
String getLastSyncTimeUrl = '$rootUrl/Step/GetLastSyncDate.php?id=';
String syncStepsUrl = '$rootUrl/Step/SyncSteps.php';
String getAccountBalanceUrl = '$rootUrl/Account/GetAccountBalance.php?id=';
String getAvailableChallengeUrl =
    '$rootUrl/Challenge/GetAvailableChallenges.php?id=';
String getChallengeHistoriesUrl =
    '$rootUrl/Challenge/GetChallengeHistories.php?id=';
String addParticipationUrl = '$rootUrl/Participation/AddParticipant.php';
String getAllRewardsUrl = '$rootUrl/Reward/GetRewards.php?id=';
String addUserRewardUrl = '$rootUrl/Reward/AddUserReward.php';
String getAdImageUrls = '$rootUrl/Images/GetAdImages.php';
String getUserRedeemedRewardsUrl =
    '$rootUrl/Reward/GetUserRedeemedRewards.php?id=';
String whatsAppLoginUrl = '$rootUrl/User/WhatsAppLogin.php?phone=';
String updateUserUrl = '$rootUrl/User/UpdateUser.php';
String getWhatsAppSupportNumberUrl =
    '$rootUrl/Settings/GetWhatsAppSupportNumber.php';
String getUserStepTargetUrl = '$rootUrl/Step/GetUserStepTarget.php?id=';
String updateUserStepTargetUrl = '$rootUrl/Step/UpdateUserStepTarget.php';
String getChallengeParticipantsUrl =
    '$rootUrl/Participation/GetChallengeParticipants.php?challenge_id=';
