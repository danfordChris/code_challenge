# Makefile for Flutter project
# Usage:
# make <target> eg. make clean, make install, make create_apk, make ipf_gen

# Clean the project and get dependencies
clean:
	flutter clean
	flutter pub get

# Install the app on a connected device or emulator
install:
	flutter clean
	flutter pub get
	flutter build apk
	flutter install apk

# Create an APK and open the folder containing the APK
apk:
	flutter clean
	flutter pub get
	flutter build apk
	open build/app/outputs/flutter-apk/

apk_debug:
	flutter clean
	flutter pub get
	flutter build apk --debug
	open build/app/outputs/flutter-apk/

# Run IPF generator file to generate models, services, repositories, etc.
code_gen:
	flutter test code_generator.dart