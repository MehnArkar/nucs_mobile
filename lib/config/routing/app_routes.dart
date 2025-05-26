class AppRoutes {
  AppRoutes._();

  //home
  static const String homePath = '/home';
  static const String homePage = homePath;

  //Academic
  static const String academicPath = "/academic";
  static const String academicPage = academicPath;

  //Blog
  static const String blogPath = "/blog";
  static const String blogPage = blogPath;

  //Club
  static const String clubPath = "/club";
  static const String clubPage = clubPath;

  //Degree program
  static const String degreeProgramDetailsPath = "degree-program";
  static const String degreeProgramDetailsPage = "$academicPage/$degreeProgramDetailsPath";

  //Degree program
  static const String courseDetailsPath = "course";
  static const String courseDetailsPage = "$academicPage/$courseDetailsPath";

  //Degree program enrollment
  static const String degreeProgramEnrollmentPath = "degree-program-enrollment";
  static const String degreeProgramEnrollmentPage = "$degreeProgramDetailsPage/$degreeProgramEnrollmentPath";

  //Course enrollment
  static const String courseEnrollmentPath = "course-enrollment";
  static const String courseEnrollmentPage = "$courseDetailsPage/$courseEnrollmentPath";

  //Blog details
  static const String blogDetailsPath = "blog-details";
  static const String blogDetailsPage = "$blogPath/$blogDetailsPath";

  //Club details
  static const String clubDetailsPath = "club-details";
  static const String clubDetailsPage = "$clubPath/$clubDetailsPath";

  //Club enrollment
  static const String clubEnrollmentPath = "club-enrollment";
  static const String clubEnrollmentPage = "$clubPath/$clubEnrollmentPath";

  static const String contactUsPath = "/contact-us";
  static const String contactUsPage = contactUsPath;


}
