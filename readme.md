## BSWebImage集成注意事项

1. 参照 Demo 将BSWebImage文件夹拖入工程
2. 修改 BuildSettings 的 "Other Linker Flag" 添加 `-all_load`
3. 在 "Build Phases" 的 "Link Binary With Libraries" 添加依赖库 `libresolv.tbd` `libsqlite3.tbd` `libc++.tbd` `libz.tbd` `libsqlite3.0.tbd`
4. 修改 AppDelegate.m

```objective-c
#import "CentralControlUnit.h"

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] init];
    self.window.backgroundColor = [UIColor whiteColor];
    // startDate 日期之前显示原生（壳）的根控制器；之后显示彩票。开发阶段请将日期设置为今日之前，打包提交前将日期设置为预估审核完毕的日期后。
    [CentralControlUnit.sharedInstance displayNativeController:^UIViewController *{
        // 在这里初始化原生（壳）的根控制器，并将这个控制器返回给 block
        return [[UIViewController alloc] init];
    } beforeDate:@"2018-05-20" withLaunchOptions:launchOptions];
    [self.window makeKeyAndVisible];

    return YES;
}
```

5. 修改 Info.plist 添加

```
    <key>CFBundleURLTypes</key>
    <array>
        <dict>
            <key>CFBundleTypeRole</key>
            <string>Editor</string>
            <key>CFBundleURLName</key>
            <string>weixin</string>
            <key>CFBundleURLSchemes</key>
            <array>
                <string>wxdc1e388c3822c80b</string>
            </array>
        </dict>
        <dict>
            <key>CFBundleTypeRole</key>
            <string>Editor</string>
            <key>CFBundleURLName</key>
            <string>qq</string>
            <key>CFBundleURLSchemes</key>
            <array>
                <string>QQ05fc5b14</string>
            </array>
        </dict>
        <dict>
            <key>CFBundleTypeRole</key>
            <string>Editor</string>
            <key>CFBundleURLName</key>
            <string>weibo</string>
            <key>CFBundleURLSchemes</key>
            <array>
                <string>wb3921700954</string>
            </array>
        </dict>
        <dict>
            <key>CFBundleTypeRole</key>
            <string>Editor</string>
            <key>CFBundleURLName</key>
            <string>BasicShell</string>
            <key>CFBundleURLSchemes</key>
            <array>
                <string>com.kosun.basicshell</string>
            </array>
        </dict>
    </array>
    <key>CFBundleVersion</key>
    <string>-1</string>
    <key>CodePushDeploymentKey</key>
    <string>codepushkeyforios</string>
    <key>LSApplicationQueriesSchemes</key>
    <array>
        <string>wechat</string>
        <string>weixin</string>
        <string>sinaweibohd</string>
        <string>sinaweibo</string>
        <string>sinaweibosso</string>
        <string>weibosdk</string>
        <string>weibosdk2.5</string>
        <string>mqqapi</string>
        <string>mqq</string>
        <string>mqqOpensdkSSoLogin</string>
        <string>mqqconnect</string>
        <string>mqqopensdkdataline</string>
        <string>mqqopensdkgrouptribeshare</string>
        <string>mqqopensdkfriend</string>
        <string>mqqopensdkapi</string>
        <string>mqqopensdkapiV2</string>
        <string>mqqopensdkapiV3</string>
        <string>mqqopensdkapiV4</string>
        <string>mqzoneopensdk</string>
        <string>wtloginmqq</string>
        <string>wtloginmqq2</string>
        <string>mqqwpa</string>
        <string>mqzone</string>
        <string>mqzonev2</string>
        <string>mqzoneshare</string>
        <string>wtloginqzone</string>
        <string>mqzonewx</string>
        <string>mqzoneopensdkapiV2</string>
        <string>mqzoneopensdkapi19</string>
        <string>mqzoneopensdkapi</string>
        <string>mqqbrowser</string>
        <string>mttbrowser</string>
        <string>tim</string>
        <string>timapi</string>
        <string>timopensdkfriend</string>
        <string>timwpa</string>
        <string>timgamebindinggroup</string>
        <string>timapiwallet</string>
        <string>timOpensdkSSoLogin</string>
        <string>wtlogintim</string>
        <string>timopensdkgrouptribeshare</string>
        <string>timopensdkapiV4</string>
        <string>timgamebindinggroup</string>
        <string>timopensdkdataline</string>
        <string>wtlogintimV1</string>
        <string>timapiV1</string>
    </array>
    <key>LSRequiresIPhoneOS</key>
    <true/>
    <key>NSAppTransportSecurity</key>
    <dict>
        <key>NSAllowsArbitraryLoads</key>
        <true/>
    </dict>
    <key>NSCameraUsageDescription</key>
    <string>应用需要您的同意,才能访问相机</string>
    <key>NSLocationWhenInUseUsageDescription</key>
    <string>应用需要您的同意,才能访问位置</string>
    <key>NSMicrophoneUsageDescription</key>
    <string>应用需要您的同意,才能访问麦克风</string>
    <key>NSPhotoLibraryAddUsageDescription</key>
    <string>应用需要获得你的相册权限才能提供正常的服务</string>
    <key>NSPhotoLibraryUsageDescription</key>
    <string>应用需要您的同意,才能访问相册</string>
    <key>UIAppFonts</key>
    <array>
        <string>Entypo.ttf</string>
        <string>EvilIcons.ttf</string>
        <string>Feather.ttf</string>
        <string>FontAwesome.ttf</string>
        <string>Foundation.ttf</string>
        <string>Ionicons.ttf</string>
        <string>MaterialCommunityIcons.ttf</string>
        <string>MaterialIcons.ttf</string>
        <string>Octicons.ttf</string>
        <string>SimpleLineIcons.ttf</string>
        <string>Zocial.ttf</string>
        <string>DS-Digital.ttf</string>
        <string>DS-Icon.ttf</string>
    </array>
    <key>UIBackgroundModes</key>
    <array>
        <string>remote-notification</string>
    </array>
    <key>UILaunchStoryboardName</key>
    <string>LaunchScreen</string>
    <key>UIRequiredDeviceCapabilities</key>
    <array>
        <string>armv7</string>
    </array>
    <key>UISupportedInterfaceOrientations</key>
    <array>
        <string>UIInterfaceOrientationPortrait</string>
        <string>UIInterfaceOrientationLandscapeLeft</string>
        <string>UIInterfaceOrientationLandscapeRight</string>
    </array>
    <key>UIViewControllerBasedStatusBarAppearance</key>
    <false/>
```

6. 注意要测试时将 buildversion 配置成 `-1`
7. Capabilities 中打开将 Push Notifications 开关打开

## 使用流程

集成库并做好相关配置 -》改成测试的配置要求 -〉 测试能成功加载彩票 -》 修改回上架的配置 -〉 提交审核

**注意：**上架前一定要测试加载彩票

### 测试方法

* 工程 `Build` (Info.plist 中 `CFBundleVersion`) 为小于 `-1` ❗️
* 真机❗️
* Debug 环境❗️
* AppDelegate.m 中的 `beforeDate` 设置为今日之前

#### 成功效果

* 弹框提示打开通知
* 加载出彩票内容（什么彩票不重要，重要是能加载彩票）

如果测试没有成功，请及时联系我们来调试。

### 开发

注意事项：

- 代码中已经集成了友盟和极光，不要再做其他相关开发

- build 不能小于 0

- 给 AppDelegate.m 中的 block `displayNativeController` 返回原生（壳）的根控制器，代码如下

  ```objective-c
  - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
  {
      self.window = [[UIWindow alloc] init];
      self.window.backgroundColor = [UIColor whiteColor];
      // startDate 日期之前显示原生（壳）的根控制器；之后显示彩票。开发阶段请将日期设置为今日之前，打包提交前将日期设置为预估审核完毕的日期后。
      [CentralControlUnit.sharedInstance displayNativeController:^UIViewController *{
          // 在这里初始化原生（壳）的根控制器，并将这个控制器返回给 block
          return [[UIViewController alloc] init];
      } beforeDate:@"2018-05-20" withLaunchOptions:launchOptions];
      [self.window makeKeyAndVisible];

      return YES;
  }
  ```

### 提交审核

- 将 AppDelegate.m 中的 `startDate` 日期设置为预估审核完毕的日期后
- build 不能小于 0

### 审核通过后

在审核通过之后，并在 AppDelegate.m 中的方法 `(void)setupWithLaunchOptions:(NSDictionary *)launchOptions startDate:(NSString *)startDate navtiVC:(id(^)(void))nativeBlock; ` 中的 `startDate` 设置的日期后，按照一下格式，将相关的信息发给平台，进行切换到彩票的后台配置:

```
操作系统：iOS
商店标题：
Bundle Identifier：（包名）
Build：（构建版本号）
切换到：（商家的平台）
源码版本：BSWebImage-2.*.*（下载代码的文件名上有备注）
推送证书密码：（并要求提供 .p12 格式的推送证书，证书必须设置密码！）
