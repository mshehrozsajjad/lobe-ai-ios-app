# Lobe.ai Sample iOS App with CoreML
A sample app to test your trained model extracted from lobe.ai. Simply replace your model file and start building  and testing your app on your device or simulator. You can use images from both library and camera.


![Home Screen](https://github.com/mshehrozsajjad/lobe-ai-ios-app/blob/main/Example/image1.png?raw=true)
![Result](https://github.com/mshehrozsajjad/lobe-ai-ios-app/blob/main/Example/image2.png?raw=true)


### Features

- [x] Simple Clean & Modern UI
- [x] Library & Camera Usage
- [x] Custom image picker with permission checking
- [x] Get instant result from Model
- [x] Includes confidence %age of result.

### Installation & Requirements
This project requires Xcode 9 to run and compiles with swift 4
> Note: This library makes use of the AVFoundation camera API's which are unavailable on the iOS simulator. You'll need a real device to run it.

CocoaPods:
Add the following to your Podfile:

```ruby
pod 'ALCameraViewController'
```
> For swift 3.2 support

```ruby
pod 'ALCameraViewController', '~> 2.0.3'
```

Carthage:

```ruby
github "alexlittlejohn/ALCameraViewController"
```


### Privacy (iOS 10) ###
If you are building your app with iOS 10 or newer, you need to add two privacy keys to your app to allow the usage of the camera and photo library, or your app will crash.

Add the keys below to your `Info.plist`, adding strings with the description you want to provide when prompting the user.

```
    NSPhotoLibraryUsageDescription
    NSCameraUsageDescription
```

### Usage
Just drag and drop your trained model SaveModel.mlmodel file generated from Lobe.ai or any other source into the Example folder and build your App. Yes, it is that simple.

![Usage](https://github.com/mshehrozsajjad/lobe-ai-ios-app/blob/main/Example/image.png?raw=true)


### Credits
[ALCameraViewController](https://github.com/AlexLittlejohn/ALCameraViewController) was used a base for this project. This project is made to test out your model trained using Lobe.ai. Although you can try any other trained CoreML model too.

### Future Work
In future I would like to load the model realtime and then publish this app to iOS so that removes the requirement to have XCode and make it fully code free experience.
