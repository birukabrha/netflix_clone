import 'package:flutter/material.dart';

List<Map<String, dynamic>> profileData = [
  {
    'name': 'Biruk',
    'profile':
        'https://i.pinimg.com/474x/44/78/1b/44781ba4ac0c63f2ecf0793a533bf8dc.jpg',
    'isLocked': true,
  },
  {
    'name': 'Nati',
    'profile':
        'https://upload.wikimedia.org/wikipedia/commons/0/0b/Netflix-avatar.png',
    'isLocked': false,
  },
  {
    'name': 'Nati 1',
    'profile':
        'https://i.pinimg.com/originals/fb/8e/8a/fb8e8a96fca2f049334f312086a6e2f6.png',
    'isLocked': true,
  },
  {
    'name': 'Kids',
    'profile':
        'https://mir-s3-cdn-cf.behance.net/project_modules/disp/bb3a8833850498.56ba69ac33f26.png',
    'isLocked': false,
  },
  {
    'name': 'Family',
    'profile':
        'https://mir-s3-cdn-cf.behance.net/project_modules/disp/84c20033850498.56ba69ac290ea.png',
    'isLocked': false,
  },
];

List<Map<String, dynamic>> moreData = [
  {
    'title': 'Episodes and info',
    'icon': Icon(
      Icons.info_outline,
      color: Colors.grey.shade400,
      size: 32,
    ),
  },
  {
    'title': 'Download Next Episode',
    'icon': Icon(
      Icons.download_outlined,
      color: Colors.grey.shade400,
      size: 32,
    ),
  },
  {
    'title': 'Not for me',
    'icon': Icon(
      Icons.thumb_down_outlined,
      color: Colors.grey.shade400,
      size: 32,
    ),
  },
  {
    'title': 'I like this',
    'icon': Icon(
      Icons.thumb_up_outlined,
      color: Colors.grey.shade400,
      size: 32,
    ),
  },
  {
    'title': 'Love this!',
    'icon': Icon(
      Icons.heart_broken_outlined,
      color: Colors.grey.shade400,
    ),
  },
  {
    'title': 'Remove From Row',
    'icon': Icon(
      Icons.close,
      color: Colors.grey.shade400,
      size: 32,
    ),
  }
];
