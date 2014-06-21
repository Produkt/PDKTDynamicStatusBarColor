PDKTDynamicStatusBarColor
=========================

UIViewController category that allows us to update the status bar color on iOS 7+ , based on the content color.


#How to use

Simply import UIViewController+StatusBarColor.h in your UIViewController subclass and call `adjustStatusBarColor` anythime you want to update the status bar color

```objectivec
  [self adjustStatusBarColor];
```

After that, `preferredStatusBarStyle` method will be called, so you should have it implemented like so:

```objectivec
- (UIStatusBarStyle)preferredStatusBarStyle{
    if (self.hasDarkColorContent) {
        return UIStatusBarStyleLightContent;
    }else{
        return UIStatusBarStyleDefault;
    }
}
```
