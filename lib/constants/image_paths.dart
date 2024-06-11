import 'dart:math';

class ImagePaths {
  static String fitnessStart = "assets/images/fitness_start.png";
  static String fitnessTracker = "assets/images/fitness_tracker.png";
  static String warning = "assets/images/warning.png";
  static String synchronize = "assets/images/synchronize.png";
  static String womanJogging = "assets/images/woman_jogging.png";
  static String womanRunning = "assets/images/woman_running.png";
  static String manWomanJogging = "assets/images/man_woman_jogging.png";
  static String manWomanStretching = "assets/images/man_woman_stretching.png";
  static String smileyWomanJogging = "assets/images/smiley_woman_running.jpg";
  static String startingStretching = "assets/images/starting_page.jpg";
  static String logo = "assets/images/logo.png";

  static String getRandomPath() {
    List<String> paths = [
      "assets/images/man_woman_jogging.png",
      "assets/images/woman_running.png",
      "assets/images/woman_jogging.png"
    ];
    final Random random = Random();
    return paths[random.nextInt(paths.length)];
  }
}
