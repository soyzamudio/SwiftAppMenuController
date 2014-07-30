SwiftAppMenuController
======================

![demo](https://imageshack.com/a/img633/7603/UdASmR.gif)

## How To Use

In your **AppDelegate.swift** add:

```
var window: UIWindow?
var backWindow: UIWindow?

  func application(application: UIApplication!, didFinishLaunchingWithOptions launchOptions: NSDictionary!) -> Bool {
        
    var str:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
    var _back:BackViewController = str.instantiateViewControllerWithIdentifier("back") as BackViewController
        
    self.backWindow = UIWindow(frame: UIScreen.mainScreen().bounds)
    self.backWindow!.rootViewController = _back
    backWindow?.makeKeyAndVisible()
        
    var _front:SwiftAppMenuController = str.instantiateViewControllerWithIdentifier("front") as SwiftAppMenuController
        
    self.window = UIWindow(frame: UIScreen.mainScreen().bounds)
    self.window!.rootViewController = _front
    self.window!.makeKeyAndVisible()
        
    return true
  }
```

In your **FrontViewController.swift** declare the following property:

```
var navController = SwiftAppMenuController()
```

and add the following to your `viewDidLoad()`

```
navController = self.navigationController as SwiftAppMenuController
navController.setNavigationBarHidden(false, animated: false)
```

and add the following function:

```
func menuPressed() -> Void {
  navController.openAndCloseMenu()
}
```

Please make sure you check how the **Main.storyboard** is set up in the Demo app.

## Contact

Jose Zamudio
- <a href="http://twitter.com/soyzamudio">Twitter</a>
- <a href="mailto:zamudio@outlook.com">zamudio@outlook.com</a>

## Credits

Gianluca Tursi for <a href="https://github.com/gianlucatursi/GTAppMenuController">GTAppMenuController</a>
- <a href="http://www.gianlucatursi.com">Web Site</a>
- <a href="mailto:gian.tursi@gmail.com">gian.tursi@gmail.com</a>