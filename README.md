# flutterCode
flutterCode

flutter_show_demo1 文件夹方的放的是flutter项目可单独运行但需要修改flutter_show_demo1/lib/main.dart中代码 直接返回switch中任意一个..App()即可

FlutterShowDemoFolder 文件夹放的是iOS的工程  包含调用flutter_show_demo1功能  使用时flutter_show_demo1/lib/main.dart中代码不可调整

Flutter简介

Flutter 是 Google推出并开源的移动应用开发框架，主打跨平台、高保真、高性能。开发者可以通过 Dart语言开发 App，一套代码同时运行在 iOS 和 Android平台。 Flutter提供了丰富的组件、接口，开发者可以很快地为 Flutter添加 native扩展。同时 Flutter还使用 Native引擎渲染视图，这无疑能为用户提供良好的体验。


Flutter的目的

主流平台：iOS  Android

iOS主流开发：通过Objective-C或Swift语言直接调用iOS SDK开发

Android主流开发：使用Java或Kotlin语言直接调用Android SDK开发

优点：速度快、性能高、可以实现复杂动画及绘制，整体用户体验最好，可访问平台全部功能（GPS、摄像头）

缺点：平台特定，开发成本高；不同平台必须维护不同代码，人力成本随之变大；内容固定，动态化弱，大多数情况下，有新功能更新时只能发版；

 

然后广大有智慧的劳动人民就针对原生开发的缺点制定了一系列的实现安卓和iOS平台开发大统一的解决方案

NO1. H5+原生（Cordova、Ionic、微信小程序）

优点：动态内容是H5，web技术栈，社区及资源丰富

缺点：性能不好，对于复杂用户界面或动画，webview不堪重任

 

NO2. JavaScript开发+原生渲染的方式

React Native

优点：

1.采用Web开发技术栈，社区庞大、上手快、开发成本相对较低。

2.原生渲染，性能相比H5提高很多。

3.动态化较好，支持热更新。

缺点：

1.渲染时需要JavaScript和原生之间通信，在有些场景如拖动可能会因为通信频繁导致卡顿。

2.JavaScript为脚本语言，执行时需要JIT，执行效率和AOT代码仍有差距。

3.由于渲染依赖原生控件，不同平台的控件需要单独维护，并且当系统更新时，社区控件可能会滞后；除此之外，其控件系统也会受到原生UI系统限制，例如，在Android中，手势冲突消歧规则是固定的，这在使用不同人写的控件嵌套时，手势冲突问题将会变得非常棘手。

AOT （Ahead of time）即 “提前编译”，静态编译的程序在执行前全部被翻译为机器码

JIT（Just-in-time）即“即时编译”，一句一句边编译边运行

 

NO3. 自绘UI+原生

Flutter

Flutter高性能主要靠两点来保证

1.Flutter APP采用Dart语言开发。Dart在 JIT（即时编译）模式下，速度与 JavaScript基本持平。但是 Dart支持 AOT，当以 AOT模式运行时，JavaScript便远远追不上了。速度的提升对高帧率下的视图数据计算很有帮助。

2.Flutter使用自己的渲染引擎来绘制UI，布局数据等由Dart语言直接控制，所以在布局过程中不需要像RN那样要在JavaScript和Native之间通信，这在一些滑动和拖动的场景下具有明显优势，因为在滑动和拖动过程往往都会引起布局发生变化，所以JavaScript需要和Native之间不停的同步布局信息，这和在浏览器中要JavaScript频繁操作DOM所带来的问题是相同的，都会带来比较可观的性能开销。



Flutter安装
 参考[Flutter中文网](https://flutterchina.club/setup-macos/)


1. 使用镜像



sudo vi ~/.bash_profile //编辑环境变量
echo $PATH  //查看环境变量
环境变量修改内容

export PUB_HOSTED_URL=https://pub.flutter-io.cn    
export FLUTTER_STORAGE_BASE_URL=https://storage.flutter-io.cn


2. 下载Flutter SDK


[官网下载](https://flutter.dev/docs/development/tools/sdk/releases?tab=macos#macos)
[Github下载](https://github.com/flutter/flutter)


3. 修改环境变量

export PATH=`密码`/Users/minzhe/flutter/bin:$PATH

4. flutter doctor

5. 编辑器设置

(Android Studio使用：1.右上角绿色的run按钮和虫子按钮一个是运行一个是debug debug运行起来的才可以打断点 2.底部各个控制台位置可通过拖动调节)



Flutter使用

两种方式

屏幕快照 2019-03-21 下午4.42.55.png

 

1.直接从0开始只用一个flutter项目

2.创建flutter项目作为第三方，类似于一个第三方的库用cocoapods导入iOS已有项目、用gradle导入安卓项目作为单页面或者模块直接调用


Flutter加入到iOS已有项目

参考[Add-Flutter-to-existing-apps](https://github.com/flutter/flutter/wiki/Add-Flutter-to-existing-apps)   

1.创建flutter项目

选择已有项目根目录之外的位置执行



$ flutter create -t module my_flutter


2.给iOS项目pods文件添加



#../是指定flutter项目的位置按自己创建的调整
flutter_application_path = '../my_flutter/'   
eval(File.read(File.join(flutter_application_path, '.ios', 'Flutter', 'podhelper.rb')), binding)


执行pod install

3.Build Settings->Build Options->Enable Bitcode 设置为NO

4.Build Phases 添加脚本



"$FLUTTER_ROOT/packages/flutter_tools/bin/xcode_backend.sh" build
"$FLUTTER_ROOT/packages/flutter_tools/bin/xcode_backend.sh" embed


5.编译 没报错则没问题

6.修改AppDelegate  

7.添加调用flutterVC的代码

运行项目看效果



Flutter与iOS交互platform channel

参考：[平台通道简介](https://book.flutterchina.club/chapter11/platform-channel.html)   

MethodChannel: 传递方法调用

EventChannel: 数据流的通信

BasicMessageChannel: 主要是传递字符串和一些半结构体的数据

都是双向的 前两个有测试



Flutter widget库
Material：安卓风格

Cupertino：iOS风格



Flutter布局和容器

布局

1.线性布局

按顺序排列，不重叠

Column:纵向

Row：横向

Flex：Column和Row继承自Flex，Flex的direction设置为水平则为Row设置为竖直则为Column

2.流式布局

Wrap：类似于线性布局的Flex,区别是流式布局会自动换行并且多出两个设置间距的属性

3.层叠布局

会重叠

Stack

可配合Positioned设置left、top、 right、 bottom、 width、 height实现frame效果



容器

1.Padding ： 可设置外边距

2.ConstrainedBox和SizedBox：可设置子widget的宽高及宽高范围

3.DecoratedBox：可设置装饰Decoration（如背景、边框、圆角等）

4.Transform：可设置子widget的平移旋转缩放

5.Container：包含1.2.3.4的所有功能



Flutter对打包大小影响



新建项目  直接打包ipa  20k

22k.png



pod install flutter项目后 15M

 15M.png

Flutter使用Skia作为其2D渲染引擎，Skia是Google的一个2D图形处理函数库，包含字型、坐标转换，以及点阵图都有高效能且简洁的表现，Skia是跨平台的，并提供了非常友好的API，目前Google Chrome浏览器和Android均采用Skia作为其绘图引擎，值得一提的是，由于Android系统已经内置了Skia，所以Flutter在打包APK(Android应用安装包)时，不需要再将Skia打入APK中，但iOS系统并未内置Skia，所以构建iPA时，也必须将Skia一起打包，这也是为什么Flutter APP的Android安装包比iOS安装包小的主要原因。



Flutter调用原生功能
[Flutter for iOS 开发者](https://flutterchina.club/flutter-for-ios/)   


插件开发参考 [链接](https://book.flutterchina.club/chapter11/)   

