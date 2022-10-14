class IconModel {
  String getIcon(int? condition) {
    if (condition! < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return 'weather is unavailable';
    }
  }
}

class TodayIconModel {
  String getIcon(int? condition) {
    if (condition! < 300) {
      return 'assets/images/thunderstorm.png';
    } else if (condition < 400) {
      return 'assets/images/drizzle.png';
    } else if (condition < 600) {
      return 'assets/images/rain.png';
    } else if (condition < 700) {
      return 'assets/images/snow.png';
    } else if (condition < 800) {
      return 'assets/images/atmosphere.png';
    } else if (condition == 800) {
      return 'assets/images/sunny.png';
    } else if (condition <= 804) {
      return 'assets/images/clouds.png';
    } else {
      return 'weather is unavailable';
    }
  }
}
