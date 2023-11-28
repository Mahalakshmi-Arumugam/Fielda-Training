void main() {
  Map<String, String> personalInfo = {
    'Name': 'Mahalakshmi',
    'Country': 'India',
    'Gender': 'Female'
  };
  print(personalInfo);

  //Access Value From Key
  print(personalInfo['Name']);

  //Map Properties In Dart
  print(personalInfo.keys);
  print(personalInfo.values);
  print(personalInfo.isEmpty);
  print(personalInfo.isNotEmpty);
  print(personalInfo.length);

  //Adding Element To Map
  personalInfo['District'] = 'Coimbatore';
  print(personalInfo);

  //Updating An Element Of Map
  personalInfo['District'] = 'Trippur';
  print(personalInfo);

  //Map Methods In Dart

  //Convert Maps Keys & Values To List
  print(personalInfo.keys.toList());
  print(personalInfo.values.toList());

  //Check Map Contains Specific Key/Value Or Not?
  print(personalInfo.containsKey('District'));
  print(personalInfo.containsValue('Female'));
  print(personalInfo.containsValue('male'));

  //Removing Items From Map
  personalInfo.remove('District');
  print(personalInfo);

  //Clearing the Map
  personalInfo.clear();
  print(personalInfo);
}
