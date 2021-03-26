# Geepney

Geepney is a hybrid contactless payment and turnstile system for eJeepneys. The contactless payment feature of the system reduces the risk of virus transmission. Also, it tackles a long-term problem of the country which is passenger overloading.

## Installation (Tested only on Android 10 as of now)
### Prebuilt APK for Android 10
#### 1) Clone Directory
```
git clone https://github.com/EcoBay/Geepney.git
```
#### 2) Install APK 
Install prebuilt APK file `geepney/build/app/outputs/fluter-apk/apk-release.apk`

### Compile Source
#### 1) Get all dependendecies
- Android Platform 29
- Android SDK
- Android SDK Build Tools
- Android SDK Platform Tools
- Flutter
- (Optional) Android Emulator

#### 2) Install and Setup Flutter
Folow Google's guide on [Installing Flutter](https://flutter.dev/docs/get-started/install)

#### 3) Update flutter and Get Pub.dev dependencies
```
flutter upgrade && flutter pub get
```

#### 4) Build and Install geepney
```
cd geepney
flutter install
```
