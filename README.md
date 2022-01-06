# cordova-plugin-privacy-screen
This plugin flags your app so that it doesn't show your users' sensitive data in the task switcher. It sets the [FLAG_SECURE](http://developer.android.com/reference/android/view/WindowManager.LayoutParams.html#FLAG_SECURE) flag in Android (which also prevents manual screenshots from being taken) and hides the window in iOS.

## Adding the plugin to your project
`cordova plugin add https://github.com/tkou15/cordova-plugin-privacy-screen`

## Supported Platforms
- Android
- iOS

## License
MIT