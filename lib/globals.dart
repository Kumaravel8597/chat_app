import 'package:location/location.dart';
import 'package:intl/intl.dart';
import 'dart:ui';

var name = "";
String email = '';
String password = '';
const appThemeColor = Color(0xFFB1D7F0);
double userLat = 0.0;
double userLon = 0.0;
late var startTime;
late var endTime;
var Map_Key = "AIzaSyDA0TtY3bP3OI0X7VleHangXsh2nBq7kKQ";
late Location locations;
String location = 'Null, Press Button';
String Address = 'search';
String formattedDate = DateFormat('EEE, MMM d').format(DateTime.now());
String netWorkImage = "https://unsplash.com/photos/s9CC2SKySJM/download?ixid=MnwxMjA3fDB8MXxzZWFyY2h8Mjh8fG5ldHdvcmt8ZW58MHx8fHwxNjQyNTg1MTY1&force=true&w=640";
String netWorkImage1 = "https://media.istockphoto.com/id/1388253782/photo/positive-successful-millennial-business-professional-man-head-shot-portrait.webp?s=612x612&w=is&k=20&c=acQ7V92QEYwAs6ojhpTSCRR3m8eCePNiJihHcu4jjoU=";
String netWorkImage2 = "https://media.istockphoto.com/id/1406197730/photo/portrait-of-a-young-handsome-indian-man.webp?b=1&s=170667a&w=0&k=20&c=KtmKHyOE6MJV0w2DiGX8P4399KHNbZ3p8lCjTEabGcY=";
String netWorkImage3 = "https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTh8fHByb2ZpbGV8ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=900&q=60";