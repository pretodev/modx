import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modx/modx.dart';

extension MaterialAppExtension on MaterialApp {
  GetMaterialApp modularize({
    required String initialRoute,
    required List<ModxPage> pages,
    SmartManagement smartManagement = SmartManagement.full,
    ThemeMode themeMode = ThemeMode.system,
    Locale? fallbackLocale,
    TextDirection? textDirection,
    Map<LogicalKeySet, Intent>? shortcuts,
    CustomTransition? customTransition,
    Translations? translations,
    Map<String, Map<String, String>>? translationsKeys,
    VoidCallback? onInit,
    VoidCallback? onDispose,
    VoidCallback? onReady,
    ValueChanged<Routing?>? routingCallback,
    Transition? defaultTransition,
    bool? opaqueRoute,
    bool? enableLog,
    LogWriterCallback? logWriterCallback,
    bool? popGesture,
    Bindings? initialBinding,
    Duration? transitionDuration,
    bool? defaultGlobalState,
    ModxPage? unknownRoute,
  }) {
    final getPages = pages.map((page) => page.page).toList();
    return GetMaterialApp(
      key: key,
      title: title,
      scaffoldMessengerKey: scaffoldMessengerKey,
      builder: builder,
      highContrastTheme: highContrastTheme,
      highContrastDarkTheme: highContrastDarkTheme,
      actions: actions,
      onGenerateTitle: onGenerateTitle,
      color: color,
      theme: theme,
      darkTheme: darkTheme,
      localeResolutionCallback: localeResolutionCallback,
      localizationsDelegates: localizationsDelegates,
      localeListResolutionCallback: localeListResolutionCallback,
      locale: locale,
      scrollBehavior: scrollBehavior,
      supportedLocales: supportedLocales,
      navigatorObservers: navigatorObservers ?? const <NavigatorObserver>[],
      debugShowMaterialGrid: debugShowMaterialGrid,
      showPerformanceOverlay: showPerformanceOverlay,
      checkerboardRasterCacheImages: checkerboardRasterCacheImages,
      checkerboardOffscreenLayers: checkerboardOffscreenLayers,
      showSemanticsDebugger: showSemanticsDebugger,
      debugShowCheckedModeBanner: debugShowCheckedModeBanner,
      smartManagement: smartManagement,
      themeMode: themeMode,
      fallbackLocale: fallbackLocale,
      textDirection: textDirection,
      shortcuts: shortcuts,
      customTransition: customTransition,
      translationsKeys: translationsKeys,
      translations: translations,
      onInit: onInit,
      onReady: onReady,
      onDispose: onDispose,
      routingCallback: routingCallback,
      defaultTransition: defaultTransition,
      getPages: getPages,
      opaqueRoute: opaqueRoute,
      enableLog: enableLog,
      logWriterCallback: logWriterCallback,
      popGesture: popGesture,
      transitionDuration: transitionDuration,
      defaultGlobalState: defaultGlobalState,
      initialBinding: initialBinding,
      unknownRoute: unknownRoute?.page,
      initialRoute: initialRoute,
    );
  }
}

extension CupertinoAppExtension on CupertinoApp {
  GetCupertinoApp modularize({
    required String initialRoute,
    required List<ModxPage> pages,
    SmartManagement smartManagement = SmartManagement.full,
    ThemeMode themeMode = ThemeMode.system,
    Locale? fallbackLocale,
    TextDirection? textDirection,
    Map<LogicalKeySet, Intent>? shortcuts,
    CustomTransition? customTransition,
    Translations? translations,
    Map<String, Map<String, String>>? translationsKeys,
    VoidCallback? onInit,
    VoidCallback? onDispose,
    VoidCallback? onReady,
    ValueChanged<Routing?>? routingCallback,
    Transition? defaultTransition,
    bool? opaqueRoute,
    bool? enableLog,
    LogWriterCallback? logWriterCallback,
    bool? popGesture,
    Bindings? initialBinding,
    Duration? transitionDuration,
    bool? defaultGlobalState,
    ModxPage? unknownRoute,
    ThemeData? highContrastTheme,
    ThemeData? highContrastDarkTheme,
  }) {
    final getPages = pages.map((page) => page.page).toList();
    return GetCupertinoApp(
      key: key,
      title: title,
      highContrastTheme: highContrastTheme,
      highContrastDarkTheme: highContrastDarkTheme,
      builder: builder,
      actions: actions,
      onGenerateTitle: onGenerateTitle,
      color: color,
      theme: theme,
      localeResolutionCallback: localeResolutionCallback,
      localizationsDelegates: localizationsDelegates,
      localeListResolutionCallback: localeListResolutionCallback,
      locale: locale,
      supportedLocales: supportedLocales,
      showPerformanceOverlay: showPerformanceOverlay,
      checkerboardRasterCacheImages: checkerboardRasterCacheImages,
      checkerboardOffscreenLayers: checkerboardOffscreenLayers,
      showSemanticsDebugger: showSemanticsDebugger,
      debugShowCheckedModeBanner: debugShowCheckedModeBanner,
      smartManagement: smartManagement,
      fallbackLocale: fallbackLocale,
      textDirection: textDirection,
      shortcuts: shortcuts,
      customTransition: customTransition,
      translationsKeys: translationsKeys,
      translations: translations,
      onInit: onInit,
      onReady: onReady,
      onDispose: onDispose,
      routingCallback: routingCallback,
      defaultTransition: defaultTransition,
      getPages: getPages,
      initialRoute: initialRoute,
      opaqueRoute: opaqueRoute,
      enableLog: enableLog,
      logWriterCallback: logWriterCallback,
      popGesture: popGesture,
      transitionDuration: transitionDuration,
      defaultGlobalState: defaultGlobalState,
      initialBinding: initialBinding,
      unknownRoute: unknownRoute?.page,
    );
  }
}

abstract class ModxApp<AppController extends ModxController>
    extends WidgetModule {
  const ModxApp({Key? key}) : super(key: key);

  List<ModxPage> get pages;

  Widget get appWidget;

  @override
  Widget get view {
    if (appWidget is MaterialApp) {
      final app = appWidget as MaterialApp;
      return app.modularize(
        pages: pages,
        initialRoute: app.initialRoute ?? initialRoute,
      );
    }
    if (appWidget is CupertinoApp) {
      final app = appWidget as CupertinoApp;
      return app.modularize(
        pages: pages,
        initialRoute: app.initialRoute ?? initialRoute,
      );
    }
    throw Exception('view must be MaterialApp or CupertinoApp');
  }
}
