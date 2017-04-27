react-universal-audio
==========

html Audio class polyfill for react-native.
You can use Audio for android,ios without modification to browser code.	

## Usage

```javascript
import Audio from 'react-universal-audio'

const sound = new Audio('./test.mp3')
sound.play()
```

## update context

For native, you must call `context.update()` to repaint.

## Install

`npm install react-universal-audio`

## Add it to your project

`$ react-native link react-universal-audio`

or do it manually as described below:

### iOS

#### Cocoapods

add the following line to your Podfile:
`pod 'UniversalAudio', :path => '../node_modules/react-universal-audio'`

or:

#### Manually

1. Open your project in XCode, right click on `Libraries` and click `Add Files to "Your Project Name"`	
	 Look under `node_modules/react-universal-audio` and add `UniversalAudio.xcodeproj`.
2. Add `libUniversalAudio.a` to `Build Phases -> Link Binary With Libraries`.
3. Click on `UniversalAudio.xcodeproj` in `Libraries` and go the `Build Settings` tab.
	 Double click the text to the right of `Header Search Paths`
	 and verify that it has `$(SRCROOT)/../react-native/React` - if it isn't, then add it.	
	 This is so XCode is able to find the headers that the `UniversalAudio` source files
	 are referring to by pointing to the header files
	 installed within the `react-native` `node_modules` directory.

### Android

1. in `android/settings.gradle`
	 ```gradle
	 ...
	 include ':react-universal-audio'
	 project(':react-universal-audio').projectDir = new File(rootProject.projectDir, '../node_modules/react-universal-audio/android')
	 ```

2. in `android/app/build.gradle` add:
	 ```gradle
	 dependencies {
			 ...
			 compile project(':react-universal-audio')
	 }
	 ```

3. and finally, in `android/src/main/java/com/{YOUR_APP_NAME}/MainActivity.java` for react-native < 0.29,
	 or `android/src/main/java/com/{YOUR_APP_NAME}/MainApplication.java` for react-native >= 0.29 add:
	 ```java
	 //...
	 import io.fata.universal.audio.UniversalAudioPackage; // <--- This!
	 //...
	 @Override
	 protected List<ReactPackage> getPackages() {
		 return Arrays.<ReactPackage>asList(
			 new MainReactPackage(),
			 new UniversalAudioPackage() // <---- and This!
		 );
   ```

## License

MIT
