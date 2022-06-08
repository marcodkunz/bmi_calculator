# create generated files, for example [dto].g.dart
generate_code:
	flutter packages pub run build_runner build --delete-conflicting-outputs

# continuously update generated files
watch_generate_code:
	flutter packages pub run build_runner watch --delete-conflicting-outputs