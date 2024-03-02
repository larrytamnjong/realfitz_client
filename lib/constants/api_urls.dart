//String rootUrl = 'http://10.0.2.2/realfitzapi/src/Api';
String rootUrl = 'http://192.168.219.134:3150/src/Api';
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
String getUserRedeemedRewardsUrl =
    '$rootUrl/Reward/GetUserRedeemedRewards.php?id=';
String whatsAppLoginUrl = '$rootUrl/User/WhatsAppLogin.php?phone=';
