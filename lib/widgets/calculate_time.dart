class CalculateTime { 

  static String calculateTime(String publishedAt){
    final dateTime = DateTime.parse(publishedAt).toLocal();
    final difference = DateTime.now().difference(dateTime);

    if(difference.inSeconds<60){
      return 'Now';
    }else if(difference.inMinutes<60){
      return '${difference.inMinutes}m ago';
    }else if(difference.inHours<24){
      return '${difference.inHours}h ago';
    }else if(difference.inDays<7){
      return '${difference.inDays}d ago';
    }
    else{
      return 'for a long time ago';
    }
  }
}