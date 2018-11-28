# Add project specific ProGuard rules here.
# By default, the flags in this file are appended to flags specified
# in D:\SDK/tools/proguard/proguard-android.txt
# You can edit the include path and order by changing the proguardFiles
# directive in build.gradle.
#
# For more details, see
#   http://developer.android.com/guide/developing/tools/proguard.html

# Add any project specific keep options here:

# If your project uses WebView with JS, uncomment the following
# and specify the fully qualified class name to the JavaScript interface
# class:
#-keepclassmembers class fqcn.of.javascript.interface.for.webview {
#   public *;
#}
-keep class com.taobao.weex.bridge.**{*;}
-keep class com.taobao.weex.dom.**{*;}
-keep class com.taobao.weex.adapter.**{*;}
-keep class com.taobao.weex.common.**{*;}
-keep class * implements com.taobao.weex.IWXObject{*;}
-keep class com.taobao.weex.ui.**{*;}
-keep class com.taobao.weex.ui.component.**{*;}
-keep class com.taobao.weex.utils.**{
    public <fields>;
    public <methods>;
    }
-keep class com.taobao.weex.view.**{*;}
-keep class com.taobao.weex.module.**{*;}
-keep public class * extends com.taobao.weex.common.WXModule{*;}
-keep public class com.taobao.weex.WXDebugTool{*;}

-dontwarn com.taobao.weex.bridge.**
-dontwarn com.taobao.weex.dom.**
-dontwarn com.taobao.weex.adapter.**
-dontwarn com.taobao.weex.common.**
-dontwarn com.taobao.weex.ui.**
-dontwarn com.taobao.weex.ui.component.**
-dontwarn com.taobao.weex.utils.**
-dontwarn com.taobao.weex.view.**
-dontwarn com.taobao.weex.module.**


#混淆时不会产生形形色色的类名
-dontusemixedcaseclassnames
-verbose
#指定不去忽略包可见的库类的成员
-dontskipnonpubliclibraryclassmembers
#指定不去忽略非公共的库类
-dontskipnonpubliclibraryclasses

#保护指定的整个类不混淆（类名、类的成员的名称和实现主体等）
-keep class android.**{*;}
-keep class com.android.**{*;}
-keep class java.**{*;}
-keep class android.support.v4.**{*;}
-keep class com.activeandroid.**{*;}
-keep class com.alibaba.**{*;}
-keep class com.ta.**{*;}
-keep class com.umeng.**{*;}
-keep class com.nostra13.universalimageloader.**{*;}
#-keep class com.aliyun.odps.udf.UDF.**{*;}
-keep class org.apache.**{*;}
-keep class org.codehaus.jackson.**{*;}
-keep class org.simple.eventbus.**{*;}
-keep class org.android.eventbus.**{*;}
-keep class org.codehaus.**{*;}
-keep class com.igexin.**{*;}
-keep class com.igexin.getuiext.**{*;}
-keep class org.webrtc.**{*;}
-keep class u.aly.**{*;}
-keep class com.baidu.**{*;}
-keep class com.github.**{*;}
-keep class com.mob.**{*;}
-keep class cn.sharesdk.**{*;}
-keep class com.sina.**{*;}
-keep class com.artifex.**{*;}
-keep class com.squareup.okhttp.**{*;}
-keep class okhttp3.**{*;}
-keep interface okhttp3.** { *; }
-keep class okio.**{*;}


#800li
-keep class b00li.**{*;}
-keep class p2pproxy.**{*;}
-keep class p2psvideo.**{*;}

#EventBus的配置，https://github.com/hehonghui/AndroidEventBus
#-keep interface org.android.eventbus.** { *; }
#-keep interface org.simple.** { *; }
-keepclassmembers class * {
    @org.simple.eventbus.Subscriber <methods>;
    @org.android.eventbus.eventbus.Subcriber <methods>;
}
-keepattributes *Annotation*

#忽略警告消息
-dontwarn android.**
-dontwarn com.android.**
-dontwarn java.**
-dontwarn android.support.**
-dontwarn com.activeandroid.**
-dontwarn com.alibaba.**
-dontwarn com.ta.**
-dontwarn com.umeng.**
-dontwarn com.nostra13.universalimageloader.**
#-dontwarn com.aliyun.odps.udf.UDF.**
-dontwarn javax.microedition.**
-dontwarn org.apache.**
-dontwarn org.codehaus.jackson.**
-dontwarn org.codehaus.**
-dontwarn org.simple.eventbus.**
-dontwarn org.android.eventbus.**
-dontwarn com.igexin.**
-dontwarn com.igexin.getuiext.**
-dontwarn org.webrtc.**
-dontwarn u.aly.**
-dontwarn com.baidu.**
-dontwarn com.github.**
-dontwarn com.mob.**
-dontwarn cn.sharesdk.**
-dontwarn com.sina.**
-dontwarn com.artifex.**
-dontwarn java.lang.invoke**
-dontwarn com.squareup.okhttp.**
-dontwarn okhttp3.**
-dontwarn okio.**
#800li
-dontwarn b00li.**
-dontwarn p2pproxy.**
-dontwarn p2psvideo.**

-keep public class * extends android.app.Activity
-keep public class * extends android.app.FragmentActivity
-keep public class * extends android.app.Fragment
-keep public class * extends android.support.v4.app.FragmentActivity
-keep public class * extends android.support.v4.app.Fragment
-keep public class * extends android.app.Application
-keep public class * extends android.app.Service
-keep public class * extends android.view.View
-keep public class * extends android.content.BroadcastReceiver
-keep public class * extends android.content.ContentProvider
-keep public class * extends android.app.backup.BackupAgentHelper
-keep public class * extends android.preference.Preference
-keep class * implements android.os.Parcelable {
  public static final android.os.Parcelable$Creator *;
}
-keep public class **.R
-keep public class **.R$*

#保护指定的类和类的成员的名称不混淆，可指定具体的属性public\private\protected
-keepnames public class com.hb.cas.net.**{public *;private *;protected *;}
-keepnames public class com.hb.cas.model.**{public *;private *;protected *;}
-keepnames public class * extends android.app.Activity{public *;}
-keepnames public class * extends android.app.FragmentActivity{public *;}
-keepnames public class * extends android.app.Fragment{public *;}
-keepnames public class * extends android.support.v4.app.FragmentActivity{public *;}
-keepnames public class * extends android.support.v4.app.Fragment{public *;}
-keepnames public class * extends android.app.Application{public *;}
-keepnames public class * extends android.app.Service{public *;}
-keepnames public class * extends android.view.View{public *;}
-keepnames public class * extends com.activeandroid.Model{public *;}
-keepnames public class **.net.model.**{public *;private *;protected *;}
-keepnames public class **.net.interfaces.impl.**{public *;}
-keepnames public class * implements java.io.Serializable{public *;private *;protected *;}
#保护成员函数是public类型,不被混淆
-keepclassmembers class * {
  public <methods>;
}
#保护带native的函数,不被混淆
-keepclasseswithmembernames class * {
    native <methods>;
}

-keepclassmembers enum * {
    public static **[] values();
    public static ** valueOf(java.lang.String);
}

#保护Android资源标识R文件,不被混淆
-keepclassmembers class **.R {
    public static <fields>;
}
-keepclassmembers class **.R$* {
    public static <fields>;
}
#保持第三方包
#-libraryjars libs

#保护给定的可选属性，
#例如LineNumberTable, LocalVariableTable, SourceFile, Deprecated, Synthetic, Signature, and InnerClasses.
-keepattributes Signature
#保持注解不被混淆
-keepattributes *Annotation*