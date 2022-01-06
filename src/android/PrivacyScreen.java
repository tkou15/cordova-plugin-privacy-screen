package tkou15.cordova.plugins.privacyscreen;

import org.apache.cordova.CordovaPlugin;

import android.app.Activity;
import android.view.WindowManager;


public class PrivacyScreen extends CordovaPlugin {
  @Override
  public void onPause(boolean multitasking) {
    super.onPause(multitasking);
    Activity activity = this.cordova.getActivity();
    activity.getWindow().addFlags(WindowManager.LayoutParams.FLAG_SECURE);
  }

  @Override
  public void onResume(boolean multitasking) {
    super.onResume(multitasking);
    Activity activity = this.cordova.getActivity();
    activity.getWindow().clearFlags(WindowManager.LayoutParams.FLAG_SECURE);
  }
}
