enum Environment { DEV, PROD }

class ConstantEnvironment {
  static Map<dynamic, dynamic>? config;

  static void setEnvironment(Environment env) {
    switch (env) {
      case Environment.DEV:
        config = Config.dev;
        break;
      case Environment.PROD:
        config = Config.prod;
        break;
    }
  }

  static get BASE_URL {
    return config![Config.baseURL];
  }

  // static get cacheOnlineCourseMinutes {
  //   return config![Config.clearCacheOnlineCourseMinutes];
  // }
  //
  // static get cacheMeditationMinutes {
  //   return config![Config.clearCacheMeditationMinutes];
  // }
  //
  // static get clearCacheHypnosisMinutes {
  //   return config![Config.clearCacheHypnosisMinutes];
  // }
  //
  // static get cachePodcastMinutes {
  //   return config![Config.clearCachePodcastMinutes];
  // }
  //
  // static get cacheExtraMaterialMinutes {
  //   return config![Config.clearCacheExtraMaterialMinutes];
  // }
  //
  // static get cacheCalendarNoteMinutes {
  //   return config![Config.clearCacheCalendarNoteMinutes];
  // }
}

class Config {
  static const baseURL = "http://18.188.14.183/bingo_api/public/api/";

  // // Hypnosis API refresh after 3 days 72*3 = 4320
  // static const clearCacheOnlineCourseMinutes = "clearCacheOnlineCourseMinutes";
  // // Hypnosis API refresh after 3 days 72*3 = 4320
  // static const clearCacheHypnosisMinutes = "clearCacheHypnosisMinutes";
  // static const clearCacheMeditationMinutes = "clearCacheMeditationMinutes";
  // static const clearCachePodcastMinutes = "clearCachePodcastMinutes";
  // static const clearCacheExtraMaterialMinutes =
  //     "clearCacheExtraMaterialMinutes";
  // static const clearCacheCalendarNoteMinutes = "clearCacheCalendarNoteMinutes";

  static Map<dynamic, dynamic> dev = {
    baseURL: "http://18.188.14.183/bingo_api/public/api/",
  };

  static Map<dynamic, dynamic> prod = {
    baseURL: "https://die-friedliche-geburt.de/wp-json/wp/v2",
  };
}
