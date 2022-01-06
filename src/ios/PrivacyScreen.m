#import "PrivacyScreen.h"

static UIImageView *imageView;

@implementation PrivacyScreen

- (void)pluginInitialize {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(applicationDidBecomeActive:)
                                                 name:UIApplicationDidBecomeActiveNotification object:nil];

    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(applicationDidEnterBackground:)
                                                 name:UIApplicationDidEnterBackgroundNotification object:nil];
}


/// アプリのフォアグラウンド
- (void)applicationDidBecomeActive:(UIApplication *)application {
    if (imageView == NULL) {
        self.viewController.view.window.hidden = NO;
    } else {
        [imageView removeFromSuperview];
    }
}

/// アプリのバックグラウンド
- (void)applicationDidEnterBackground:(UIApplication *)application {
    // imageNameがNullの場合黒背景になる
    NSString *imgName = [self getImageName];
    UIImage *splash = [UIImage imageNamed:imgName];
    if (splash == NULL) {
        imageView = NULL;
        self.viewController.view.window.hidden = YES;
    } else {
        imageView = [[UIImageView alloc]initWithFrame:[self.viewController.view bounds]];
        [imageView setImage:splash];

        if ([self isUsingCDVLaunchScreen]) {
            imageView.contentMode = UIViewContentModeScaleAspectFill;
        }

        [[UIApplication sharedApplication].keyWindow addSubview:imageView];
    }
}

/// cordova-plugin-splashscreenを使用しているか判定
- (BOOL) isUsingCDVLaunchScreen {
    NSString* launchStoryboardName = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"UILaunchStoryboardName"];
    if (launchStoryboardName) {
        return ([launchStoryboardName isEqualToString:@"CDVLaunchScreen"]);
    } else {
        return NO;
    }
}

/// プライバシースクリーンで表示する画像取得
- (NSString*)getImageName {
    // 仕様変更以外でimageNameがNullになることはない
    NSString* imageName = [self isUsingCDVLaunchScreen] ? @"LaunchStoryboard" : NULL;
    return imageName;
}

@end
