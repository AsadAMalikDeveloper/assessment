# assesment

After successfully clone from version control you have to add configuration

1. click on edit configuration
2.Click on + button on left side of dialog box
3. choose flutter
4. enter name like Staging,QA,Prodution
5. Enter Dart Entrypoint 
for Production:
~~projectFolder\lib\flavors\production_main.dart
for QA:
~~projectFolder\lib\flavors\qa_main.dart
for Staging:
~~projectFolder\lib\flavors\staging_main.dart


FOR APK generate
Run this command on project Terminal

For Production APK:

flutter build apk --flavor production -t lib/flavors/production_main.dart

For QA APK:

flutter build apk --flavor qa -t lib/flavors/qa_main.dart

For Staging APK:

flutter build apk --flavor staging -t lib/flavors/staging_main.dart
