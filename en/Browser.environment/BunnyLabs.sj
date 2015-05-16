@STATIC;1.0;p;14;AdminManager.jt;2761;@STATIC;1.0;I;23;Foundation/Foundation.jI;15;AppKit/AppKit.ji;16;SessionManager.ji;21;AdminViewController.ji;13;MenuManager.jt;2629;objj_executeFile("Foundation/Foundation.j", NO);objj_executeFile("AppKit/AppKit.j", NO);objj_executeFile("SessionManager.j", YES);objj_executeFile("AdminViewController.j", YES);objj_executeFile("MenuManager.j", YES);var instance;
{var the_class = objj_allocateClassPair(CPObject, "AdminManager"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("controller"), new objj_ivar("adminItem")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("init"), function $AdminManager__init(self, _cmd)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("AdminManager").super_class }, "init");
    if (self)
    {
        self.controller = objj_msgSend(objj_msgSend(AdminViewController, "alloc"), "init");
        objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "addObserver:selector:name:object:", self, sel_getUid("loginStateChanged"), NOTIFICATION_LOGIN_DATA_UPDATED, nil);
        self.adminItem = objj_msgSend(objj_msgSend(CPMenuItem, "alloc"), "initWithTitle:action:keyEquivalent:", "Admin", sel_getUid("menuItemClicked:"), nil);
        objj_msgSend(self.adminItem, "setTarget:", self);
    }
    return self;
}
,["id"]), new objj_method(sel_getUid("menuItemClicked:"), function $AdminManager__menuItemClicked_(self, _cmd, sender)
{
    if (objj_msgSend(objj_msgSend(DesktopManager, "instance"), "topViewController") !== self.controller)
    {
        objj_msgSend(objj_msgSend(DesktopManager, "instance"), "pushTopViewController:", self.controller);
    }
    else
    {
        objj_msgSend(objj_msgSend(DesktopManager, "instance"), "removeViewController:", self.controller);
    }
    return sender;
}
,["id","id"]), new objj_method(sel_getUid("loginStateChanged"), function $AdminManager__loginStateChanged(self, _cmd)
{
    objj_msgSend(objj_msgSend(objj_msgSend(MenuManager, "instance"), "leftStack"), "removeObject:", self.adminItem);
    if (objj_msgSend(objj_msgSend(SessionManager, "instance"), "isAdmin"))
    {
        objj_msgSend(objj_msgSend(objj_msgSend(MenuManager, "instance"), "leftStack"), "addObject:", self.adminItem);
    }
    else
    {
        objj_msgSend(objj_msgSend(DesktopManager, "instance"), "removeViewController:", self.controller);
    }
    objj_msgSend(objj_msgSend(MenuManager, "instance"), "refreshMenu");
}
,["void"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("instance"), function $AdminManager__instance(self, _cmd)
{
    if (!instance)
    {
        instance = objj_msgSend(objj_msgSend(AdminManager, "alloc"), "init");
    }
    return instance;
}
,["AdminManager"])]);
}p;11;AdminView.jt;3619;@STATIC;1.0;I;23;Foundation/Foundation.jI;15;AppKit/AppKit.jt;3552;objj_executeFile("Foundation/Foundation.j", NO);objj_executeFile("AppKit/AppKit.j", NO);{var the_class = objj_allocateClassPair(CPView, "AdminView"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("menuTableView"), new objj_ivar("scrollTableView"), new objj_ivar("anotherView")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("menuTableView"), function $AdminView__menuTableView(self, _cmd)
{
    return self.menuTableView;
}
,["CPTableView"]), new objj_method(sel_getUid("setMenuTableView:"), function $AdminView__setMenuTableView_(self, _cmd, newValue)
{
    self.menuTableView = newValue;
}
,["void","CPTableView"]), new objj_method(sel_getUid("anotherView"), function $AdminView__anotherView(self, _cmd)
{
    return self.anotherView;
}
,["CPView"]), new objj_method(sel_getUid("setAnotherView:"), function $AdminView__setAnotherView_(self, _cmd, newValue)
{
    self.anotherView = newValue;
}
,["void","CPView"]), new objj_method(sel_getUid("init"), function $AdminView__init(self, _cmd)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("AdminView").super_class }, "initWithFrame:", CGRectMake(0, 0, 500, 500));
    if (self)
    {
        var splitView = objj_msgSend(objj_msgSend(CPSplitView, "alloc"), "initWithFrame:", CGRectMake(0, 0, 500, 500));
        objj_msgSend(splitView, "setDelegate:", self);
        objj_msgSend(splitView, "setAutoresizingMask:", CPViewWidthSizable | CPViewHeightSizable);
        objj_msgSend(self, "addSubview:", splitView);
        self.menuTableView = objj_msgSend(objj_msgSend(CPTableView, "alloc"), "initWithFrame:", CGRectMake(0, 0, 150, 500));
        objj_msgSend(self.menuTableView, "setHeaderView:", nil);
        objj_msgSend(self.menuTableView, "addTableColumn:", objj_msgSend(objj_msgSend(CPTableColumn, "alloc"), "initWithIdentifier:", "menuitems"));
        self.scrollTableView = objj_msgSend(objj_msgSend(CPScrollView, "alloc"), "initWithFrame:", CGRectMake(0, 0, 150, 500));
        objj_msgSend(self.scrollTableView, "setDocumentView:", self.menuTableView);
        objj_msgSend(splitView, "addSubview:", self.scrollTableView);
        self.anotherView = objj_msgSend(objj_msgSend(CPView, "alloc"), "initWithFrame:", CGRectMake(0, 0, 350, 500));
        objj_msgSend(self.anotherView, "setBackgroundColor:", objj_msgSend(CPColor, "grayColor"));
        objj_msgSend(splitView, "addSubview:", self.anotherView);
        objj_msgSend(self, "setAutoresizingMask:", CPViewWidthSizable | CPViewHeightSizable);
    }
    return self;
}
,["id"]), new objj_method(sel_getUid("splitView:constrainSplitPosition:ofSubviewAt:"), function $AdminView__splitView_constrainSplitPosition_ofSubviewAt_(self, _cmd, aSpiltView, proposedPosition, subviewIndex)
{
    if (subviewIndex === 0)
    {
        return 150;
    }
    return proposedPosition;
}
,["float","CPSplitView","float","int"]), new objj_method(sel_getUid("splitView:resizeSubviewsWithOldSize:"), function $AdminView__splitView_resizeSubviewsWithOldSize_(self, _cmd, aSplitView, oldSize)
{
    var splitViewSize = objj_msgSend(aSplitView, "frame").size;
    var leftSize = objj_msgSend(aSplitView, "frame").size;
    leftSize.width = 150;
    objj_msgSend(self.scrollTableView, "setFrameSize:", leftSize);
    objj_msgSend(self.anotherView, "setFrame:", CGRectMake(150 + objj_msgSend(aSplitView, "dividerThickness"), 0, splitViewSize.width - objj_msgSend(aSplitView, "dividerThickness") - 150, splitViewSize.height));
}
,["void","CPSplitView","CGSize"])]);
}p;21;AdminViewController.jt;3078;@STATIC;1.0;I;23;Foundation/Foundation.jI;15;AppKit/AppKit.ji;11;AdminView.ji;25;UserTableViewController.ji;28;SessionTableViewController.jt;2932;objj_executeFile("Foundation/Foundation.j", NO);objj_executeFile("AppKit/AppKit.j", NO);objj_executeFile("AdminView.j", YES);objj_executeFile("UserTableViewController.j", YES);objj_executeFile("SessionTableViewController.j", YES);{var the_class = objj_allocateClassPair(CPViewController, "AdminViewController"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("menuData"), new objj_ivar("view")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("init"), function $AdminViewController__init(self, _cmd)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("AdminViewController").super_class }, "init");
    if (self)
    {
        self.view = objj_msgSend(objj_msgSend(AdminView, "alloc"), "init");
        objj_msgSend(self, "setView:", self.view);
        self.menuData = [{name: "Users", vc: objj_msgSend(objj_msgSend(UserTableViewController, "alloc"), "init")}, {name: "Sessions", vc: objj_msgSend(objj_msgSend(SessionTableViewController, "alloc"), "init")}];
        objj_msgSend(objj_msgSend(self.view, "menuTableView"), "setDelegate:", self);
        objj_msgSend(objj_msgSend(self.view, "menuTableView"), "setDataSource:", self);
        objj_msgSend(objj_msgSend(self.view, "menuTableView"), "reloadData");
    }
    return self;
}
,["id"]), new objj_method(sel_getUid("viewFillsDesktop"), function $AdminViewController__viewFillsDesktop(self, _cmd)
{
    return YES;
}
,["BOOL"]), new objj_method(sel_getUid("numberOfRowsInTableView:"), function $AdminViewController__numberOfRowsInTableView_(self, _cmd, aTableView)
{
    return self.menuData.length;
}
,["int","CPTableView"]), new objj_method(sel_getUid("tableView:objectValueForTableColumn:row:"), function $AdminViewController__tableView_objectValueForTableColumn_row_(self, _cmd, aTableView, aColumn, aRowIndex)
{
    return self.menuData[aRowIndex].name;
}
,["id","CPTableView","CPTableColumn","int"]), new objj_method(sel_getUid("tableViewSelectionDidChange:"), function $AdminViewController__tableViewSelectionDidChange_(self, _cmd, aNotification)
{
    var rowIndex = objj_msgSend(objj_msgSend(self.view, "menuTableView"), "selectedRow");
    if (rowIndex > -1)
    {
        while (objj_msgSend(objj_msgSend(self.view, "anotherView"), "subviews").length != 0)
        {
            objj_msgSend(objj_msgSend(objj_msgSend(self.view, "anotherView"), "subviews")[0], "removeFromSuperview");
        }
        var newView = objj_msgSend(self.menuData[rowIndex].vc, "view");
        var rect = objj_msgSend(objj_msgSend(self.view, "anotherView"), "frame");
        rect.origin.x = 0;
        rect.origin.y = 0;
        objj_msgSend(newView, "setFrame:", rect);
        objj_msgSend(newView, "setAutoresizingMask:", CPViewWidthSizable | CPViewHeightSizable);
        objj_msgSend(objj_msgSend(self.view, "anotherView"), "addSubview:", newView);
    }
}
,["void","CPNotification"])]);
}p;15;AppController.jt;4450;@STATIC;1.0;I;23;Foundation/Foundation.jI;15;AppKit/AppKit.ji;16;DesktopManager.ji;16;SessionManager.ji;13;MenuManager.ji;20;ApplicationManager.ji;14;AdminManager.ji;29;BunnyLabsIconViewController.ji;20;Utils/HashFragment.jt;4220;objj_executeFile("Foundation/Foundation.j", NO);objj_executeFile("AppKit/AppKit.j", NO);objj_executeFile("DesktopManager.j", YES);objj_executeFile("SessionManager.j", YES);objj_executeFile("MenuManager.j", YES);objj_executeFile("ApplicationManager.j", YES);objj_executeFile("AdminManager.j", YES);objj_executeFile("BunnyLabsIconViewController.j", YES);objj_executeFile("Utils/HashFragment.j", YES);{var the_class = objj_allocateClassPair(CPView, "MyWebView"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_iframe")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithFrame:"), function $MyWebView__initWithFrame_(self, _cmd, frame)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("MyWebView").super_class }, "initWithFrame:", frame);
    if (self)
    {
        self._iframe = document.createElement("iframe");
        self._iframe.name = "iframe_" + FLOOR(RAND() * 10000);
        self._iframe.style.width = "100%";
        self._iframe.style.height = "100%";
        self._iframe.style.borderWidth = "0px";
        self._iframe.frameBorder = "0";
        self._DOMElement.appendChild(self._iframe);
    }
    return self;
}
,["id","CGRect"]), new objj_method(sel_getUid("setMainFrameURL:"), function $MyWebView__setMainFrameURL_(self, _cmd, aUrl)
{
    self._iframe.src = aUrl;
}
,["void","CPString"])]);
}{var the_class = objj_allocateClassPair(CPViewController, "BlogViewController"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("init"), function $BlogViewController__init(self, _cmd)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("BlogViewController").super_class }, "init");
    if (self)
    {
        var view = objj_msgSend(objj_msgSend(MyWebView, "alloc"), "initWithFrame:", CGRectMake(0, 0, 100, 100));
        objj_msgSend(view, "setMainFrameURL:", "https://blog.davidsiaw.net");
        objj_msgSend(view, "setAutoresizingMask:", CPViewWidthSizable | CPViewHeightSizable);
        objj_msgSend(self, "setView:", view);
    }
    return self;
}
,["id"]), new objj_method(sel_getUid("viewFillsDesktop"), function $BlogViewController__viewFillsDesktop(self, _cmd)
{
    return YES;
}
,["BOOL"])]);
}{var the_class = objj_allocateClassPair(CPObject, "AppController"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("contentView")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("applicationDidFinishLaunching:"), function $AppController__applicationDidFinishLaunching_(self, _cmd, aNotification)
{
    var theWindow = objj_msgSend(objj_msgSend(CPWindow, "alloc"), "initWithContentRect:styleMask:", CGRectMakeZero(), CPBorderlessBridgeWindowMask);
    self.contentView = objj_msgSend(theWindow, "contentView");
    objj_msgSend(theWindow, "setDelegate:", self);
    objj_msgSend(theWindow, "orderFront:", self);
    objj_msgSend(CPMenu, "setMenuBarVisible:", YES);
    objj_msgSend(objj_msgSend(DesktopManager, "instance"), "pushTopViewController:", objj_msgSend(objj_msgSend(BunnyLabsIconViewController, "alloc"), "init"));
    objj_msgSend(objj_msgSend(MenuManager, "instance"), "rightStack").push(objj_msgSend(objj_msgSend(SessionManager, "instance"), "sessionStatusMenuItem"));
    objj_msgSend(ApplicationManager, "instance");
    objj_msgSend(AdminManager, "instance");
    objj_msgSend(self, "performHash");
}
,["void","CPNotification"]), new objj_method(sel_getUid("performHash"), function $AppController__performHash(self, _cmd)
{
    var hash = objj_msgSend(HashFragment, "fragmentAsObject");
    if (hash.validate)
    {
        objj_msgSend(objj_msgSend(SessionManager, "instance"), "validateUser:withToken:", hash.validateUsername, hash.validate);
    }
    if (hash.forgotPassword)
    {
        objj_msgSend(objj_msgSend(SessionManager, "instance"), "showChangePasswordWindow");
    }
}
,["void"]), new objj_method(sel_getUid("windowDidResize:"), function $AppController__windowDidResize_(self, _cmd, notification)
{
    objj_msgSend(objj_msgSend(DesktopManager, "instance"), "desktopResized");
}
,["void","CPNotification"])]);
}p;17;ApplicationInfo.jt;2180;@STATIC;1.0;I;23;Foundation/Foundation.jI;15;AppKit/AppKit.jt;2113;objj_executeFile("Foundation/Foundation.j", NO);objj_executeFile("AppKit/AppKit.j", NO);{var the_class = objj_allocateClassPair(CPObject, "ApplicationInfo"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("icon"), new objj_ivar("application"), new objj_ivar("bundle")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("icon"), function $ApplicationInfo__icon(self, _cmd)
{
    return self.icon;
}
,["CPImage"]), new objj_method(sel_getUid("setIcon:"), function $ApplicationInfo__setIcon_(self, _cmd, newValue)
{
    self.icon = newValue;
}
,["void","CPImage"]), new objj_method(sel_getUid("application"), function $ApplicationInfo__application(self, _cmd)
{
    return self.application;
}
,["id"]), new objj_method(sel_getUid("setApplication:"), function $ApplicationInfo__setApplication_(self, _cmd, newValue)
{
    self.application = newValue;
}
,["void","id"]), new objj_method(sel_getUid("bundle"), function $ApplicationInfo__bundle(self, _cmd)
{
    return self.bundle;
}
,["CPBundle"]), new objj_method(sel_getUid("setBundle:"), function $ApplicationInfo__setBundle_(self, _cmd, newValue)
{
    self.bundle = newValue;
}
,["void","CPBundle"]), new objj_method(sel_getUid("name"), function $ApplicationInfo__name(self, _cmd)
{
    var name = objj_msgSend(objj_msgSend(self.bundle, "infoDictionary"), "objectForKey:", "CPBundleName");
    return name;
}
,["CPString"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("applicationInfoOf:withBundle:"), function $ApplicationInfo__applicationInfoOf_withBundle_(self, _cmd, anApp, aBundle)
{
    var result = objj_msgSend(objj_msgSend(ApplicationInfo, "alloc"), "init");
    var file = objj_msgSend(aBundle, "pathForResource:", "Images/icon.png");
    var icon = objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", file, CGSizeMake(200.0, 200.0));
    objj_msgSend(result, "setApplication:", anApp);
    objj_msgSend(result, "setIcon:", icon);
    objj_msgSend(result, "setBundle:", aBundle);
    return result;
}
,["ApplicationInfo","CPString","CPBundle"])]);
}p;20;ApplicationManager.jt;2867;@STATIC;1.0;I;23;Foundation/Foundation.jI;15;AppKit/AppKit.ji;16;SessionManager.ji;27;ApplicationViewController.ji;13;MenuManager.jt;2729;objj_executeFile("Foundation/Foundation.j", NO);objj_executeFile("AppKit/AppKit.j", NO);objj_executeFile("SessionManager.j", YES);objj_executeFile("ApplicationViewController.j", YES);objj_executeFile("MenuManager.j", YES);var instance;
{var the_class = objj_allocateClassPair(CPObject, "ApplicationManager"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("controller"), new objj_ivar("applicationItem")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("init"), function $ApplicationManager__init(self, _cmd)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("ApplicationManager").super_class }, "init");
    if (self)
    {
        self.controller = objj_msgSend(objj_msgSend(ApplicationViewController, "alloc"), "init");
        objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "addObserver:selector:name:object:", self, sel_getUid("loginStateChanged"), NOTIFICATION_LOGIN_DATA_UPDATED, nil);
        self.applicationItem = objj_msgSend(objj_msgSend(CPMenuItem, "alloc"), "initWithTitle:action:keyEquivalent:", "Applications", sel_getUid("menuItemClicked:"), nil);
        objj_msgSend(self.applicationItem, "setTarget:", self);
    }
    return self;
}
,["id"]), new objj_method(sel_getUid("menuItemClicked:"), function $ApplicationManager__menuItemClicked_(self, _cmd, sender)
{
    if (objj_msgSend(objj_msgSend(DesktopManager, "instance"), "topViewController") !== self.controller)
    {
        objj_msgSend(objj_msgSend(DesktopManager, "instance"), "pushTopViewController:", self.controller);
    }
    else
    {
        objj_msgSend(objj_msgSend(DesktopManager, "instance"), "removeViewController:", self.controller);
    }
    return sender;
}
,["id","id"]), new objj_method(sel_getUid("loginStateChanged"), function $ApplicationManager__loginStateChanged(self, _cmd)
{
    objj_msgSend(objj_msgSend(objj_msgSend(MenuManager, "instance"), "leftStack"), "removeObject:", self.applicationItem);
    if (objj_msgSend(objj_msgSend(SessionManager, "instance"), "isLoggedIn"))
    {
        objj_msgSend(objj_msgSend(objj_msgSend(MenuManager, "instance"), "leftStack"), "addObject:", self.applicationItem);
    }
    else
    {
        objj_msgSend(objj_msgSend(DesktopManager, "instance"), "removeViewController:", self.controller);
    }
    objj_msgSend(objj_msgSend(MenuManager, "instance"), "refreshMenu");
}
,["void"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("instance"), function $ApplicationManager__instance(self, _cmd)
{
    if (!instance)
    {
        instance = objj_msgSend(objj_msgSend(ApplicationManager, "alloc"), "init");
    }
    return instance;
}
,["ApplicationManager"])]);
}p;17;ApplicationView.jt;3973;@STATIC;1.0;I;23;Foundation/Foundation.jI;15;AppKit/AppKit.ji;17;ApplicationInfo.ji;20;IconCollectionView.ji;32;Applications/TestApp2/TestApp2.ji;32;Applications/TestApp1/TestApp1.ji;38;Applications/DesignerApp/DesignerApp.jt;3742;objj_executeFile("Foundation/Foundation.j", NO);objj_executeFile("AppKit/AppKit.j", NO);objj_executeFile("ApplicationInfo.j", YES);objj_executeFile("IconCollectionView.j", YES);objj_executeFile("Applications/TestApp2/TestApp2.j", YES);objj_executeFile("Applications/TestApp1/TestApp1.j", YES);objj_executeFile("Applications/DesignerApp/DesignerApp.j", YES);{var the_class = objj_allocateClassPair(CPView, "ApplicationView"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("iconsView"), new objj_ivar("scrollView"), new objj_ivar("items")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("iconsView"), function $ApplicationView__iconsView(self, _cmd)
{
    return self.iconsView;
}
,["CPCollectionView"]), new objj_method(sel_getUid("setIconsView:"), function $ApplicationView__setIconsView_(self, _cmd, newValue)
{
    self.iconsView = newValue;
}
,["void","CPCollectionView"]), new objj_method(sel_getUid("init"), function $ApplicationView__init(self, _cmd)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("ApplicationView").super_class }, "initWithFrame:", CGRectMake(0, 0, 500, 500));
    if (self)
    {
        self.items = [];
        self.scrollView = objj_msgSend(objj_msgSend(CPScrollView, "alloc"), "initWithFrame:", objj_msgSend(self, "frame"));
        objj_msgSend(self.scrollView, "setAutoresizingMask:", CPViewWidthSizable | CPViewHeightSizable);
        objj_msgSend(self.scrollView, "setAutohidesScrollers:", YES);
        self.iconsView = objj_msgSend(objj_msgSend(IconCollectionView, "alloc"), "initWithFrame:", objj_msgSend(self, "frame"));
        objj_msgSend(self.iconsView, "setAutoresizingMask:", CPViewWidthSizable | CPViewHeightSizable);
        objj_msgSend(self, "setAutoresizingMask:", CPViewWidthSizable | CPViewHeightSizable);
    {
        var appBundle = objj_msgSend(CPBundle, "bundleWithPath:", "Applications/TestApp2");
        appBundle["_appclass"] = objj_msgSend(TestApp2, "class");
        if (objj_msgSend(appBundle, "isLoaded"))
        {
            objj_msgSend(self, "bundleDidFinishLoading:", appBundle);
        }
        else
        {
            objj_msgSend(appBundle, "loadWithDelegate:", self);
        }
    }
    {
        var appBundle = objj_msgSend(CPBundle, "bundleWithPath:", "Applications/TestApp1");
        appBundle["_appclass"] = objj_msgSend(TestApp1, "class");
        if (objj_msgSend(appBundle, "isLoaded"))
        {
            objj_msgSend(self, "bundleDidFinishLoading:", appBundle);
        }
        else
        {
            objj_msgSend(appBundle, "loadWithDelegate:", self);
        }
    }
    {
        var appBundle = objj_msgSend(CPBundle, "bundleWithPath:", "Applications/DesignerApp");
        appBundle["_appclass"] = objj_msgSend(DesignerApp, "class");
        if (objj_msgSend(appBundle, "isLoaded"))
        {
            objj_msgSend(self, "bundleDidFinishLoading:", appBundle);
        }
        else
        {
            objj_msgSend(appBundle, "loadWithDelegate:", self);
        }
    }
        objj_msgSend(self.scrollView, "setDocumentView:", self.iconsView);
        objj_msgSend(self, "addSubview:", self.scrollView);
    }
    return self;
}
,["id"]), new objj_method(sel_getUid("bundleDidFinishLoading:"), function $ApplicationView__bundleDidFinishLoading_(self, _cmd, appBundle)
{
    var app = objj_msgSend(objj_msgSend(appBundle["_appclass"], "alloc"), "initWithBundle:", appBundle);
    var item = objj_msgSend(ApplicationInfo, "applicationInfoOf:withBundle:", app, appBundle);
    self.items.push(item);
    objj_msgSend(self.iconsView, "setContent:", self.items);
    objj_msgSend(self.iconsView, "reloadContent");
}
,["void","CPBundle"])]);
}p;27;ApplicationViewController.jt;1592;@STATIC;1.0;I;23;Foundation/Foundation.jI;15;AppKit/AppKit.ji;17;ApplicationView.jt;1503;objj_executeFile("Foundation/Foundation.j", NO);objj_executeFile("AppKit/AppKit.j", NO);objj_executeFile("ApplicationView.j", YES);{var the_class = objj_allocateClassPair(CPViewController, "ApplicationViewController"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("menuData"), new objj_ivar("view")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("init"), function $ApplicationViewController__init(self, _cmd)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("ApplicationViewController").super_class }, "init");
    if (self)
    {
        self.view = objj_msgSend(objj_msgSend(ApplicationView, "alloc"), "init");
        objj_msgSend(objj_msgSend(self.view, "iconsView"), "setDelegate:", self);
        objj_msgSend(self, "setView:", self.view);
    }
    return self;
}
,["id"]), new objj_method(sel_getUid("viewFillsDesktop"), function $ApplicationViewController__viewFillsDesktop(self, _cmd)
{
    return YES;
}
,["BOOL"]), new objj_method(sel_getUid("collectionView:didDoubleClickOnItemAtIndex:"), function $ApplicationViewController__collectionView_didDoubleClickOnItemAtIndex_(self, _cmd, collectionView, index)
{
    var app = objj_msgSend(objj_msgSend(objj_msgSend(collectionView, "items")[index], "representedObject"), "application");
    objj_msgSend(objj_msgSend(DesktopManager, "instance"), "pushTopViewController:", objj_msgSend(app, "viewController"));
}
,["void","CPCollectionView","int"])]);
}p;6;main.jt;292;@STATIC;1.0;I;23;Foundation/Foundation.jI;15;AppKit/AppKit.ji;15;AppController.jt;206;objj_executeFile("Foundation/Foundation.j", NO);objj_executeFile("AppKit/AppKit.j", NO);objj_executeFile("AppController.j", YES);main = function(args, namedArgs)
{
    CPApplicationMain(args, namedArgs);
}
p;25;UserTableViewController.jt;4961;@STATIC;1.0;I;23;Foundation/Foundation.jI;15;AppKit/AppKit.ji;16;SessionManager.ji;16;BunnyTableView.jt;4852;objj_executeFile("Foundation/Foundation.j", NO);objj_executeFile("AppKit/AppKit.j", NO);objj_executeFile("SessionManager.j", YES);objj_executeFile("BunnyTableView.j", YES);{var the_class = objj_allocateClassPair(CPViewController, "UserTableViewController"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("tableView"), new objj_ivar("userTable"), new objj_ivar("currentStatusCode"), new objj_ivar("currentData")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("init"), function $UserTableViewController__init(self, _cmd)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("UserTableViewController").super_class }, "init");
    if (self)
    {
        self.tableView = objj_msgSend(objj_msgSend(BunnyTableView, "alloc"), "init");
        objj_msgSend(self.tableView, "setDataSource:", self);
        objj_msgSend(self.tableView, "setDelegate:", self);
        objj_msgSend(self.tableView, "addColumnNamed:", "name");
        objj_msgSend(self.tableView, "addColumnNamed:", "email");
        objj_msgSend(self.tableView, "addColumnNamed:", "password");
        objj_msgSend(self.tableView, "addBooleanColumnNamed:", "validated");
        objj_msgSend(self.tableView, "addColumnNamed:", "validationToken");
        objj_msgSend(self.tableView, "addColumnNamed:", "registrationTime");
        objj_msgSend(self.tableView, "addColumnNamed:", "currentSession");
        objj_msgSend(self.tableView, "addColumnNamed:", "accountType");
        objj_msgSend(self.tableView, "addColumnNamed:", "githubAccessToken");
        objj_msgSend(self.tableView, "addColumnNamed:", "identityId");
        objj_msgSend(self, "reloadData");
        objj_msgSend(self, "setView:", self.tableView);
    }
    return self;
}
,["id"]), new objj_method(sel_getUid("reloadData"), function $UserTableViewController__reloadData(self, _cmd)
{
    objj_msgSend(objj_msgSend(SessionManager, "instance"), "get:andNotify:", "/admin/users", self);
}
,["void"]), new objj_method(sel_getUid("reloadButtonClicked:"), function $UserTableViewController__reloadButtonClicked_(self, _cmd, sender)
{
    objj_msgSend(self, "reloadData");
}
,["void","id"]), new objj_method(sel_getUid("numberOfRowsInTableView:"), function $UserTableViewController__numberOfRowsInTableView_(self, _cmd, aTableView)
{
    if (self.userTable)
    {
        return self.userTable.length;
    }
    return 0;
}
,["int","CPTableView"]), new objj_method(sel_getUid("tableView:objectValueForTableColumn:row:"), function $UserTableViewController__tableView_objectValueForTableColumn_row_(self, _cmd, aTableView, aColumn, aRowIndex)
{
    return self.userTable[aRowIndex][objj_msgSend(aColumn, "identifier")];
}
,["id","CPTableView","CPTableColumn","int"]), new objj_method(sel_getUid("tableView:setObjectValue:forTableColumn:row:"), function $UserTableViewController__tableView_setObjectValue_forTableColumn_row_(self, _cmd, aTableView, anObject, aTableColumn, rowIndex)
{
    var value = anObject;
    if (objj_msgSend(aTableColumn, "identifier") == "validated")
    {
        value = anObject ? true : false;
    }
    objj_msgSend(objj_msgSend(SessionManager, "instance"), "put:withData:andNotify:", "/admin/users/" + self.userTable[rowIndex].identityId + "/" + objj_msgSend(aTableColumn, "identifier"), {value: value}, self);
}
,["void","CPTableView","id","CPTableColumn","int"]), new objj_method(sel_getUid("tableView:shouldEditTableColumn:row:"), function $UserTableViewController__tableView_shouldEditTableColumn_row_(self, _cmd, aTableView, aTableColumn, rowIndex)
{
    if (objj_msgSend(aTableColumn, "identifier") == "name")
    {
        return NO;
    }
    return YES;
}
,["BOOL","CPTableView","CPTableColumn","int"]), new objj_method(sel_getUid("connection:didFailWithError:"), function $UserTableViewController__connection_didFailWithError_(self, _cmd, connection, error)
{
}
,["void","CPURLConnection","id"]), new objj_method(sel_getUid("connection:didReceiveResponse:"), function $UserTableViewController__connection_didReceiveResponse_(self, _cmd, connection, response)
{
    self.currentStatusCode = objj_msgSend(response, "statusCode");
}
,["void","CPURLConnection","CPHTTPURLResponse"]), new objj_method(sel_getUid("connection:didReceiveData:"), function $UserTableViewController__connection_didReceiveData_(self, _cmd, connection, data)
{
    self.currentData = data;
}
,["void","CPURLConnection","CPString"]), new objj_method(sel_getUid("connectionDidFinishLoading:"), function $UserTableViewController__connectionDidFinishLoading_(self, _cmd, connection)
{
    if (self.currentData === "OK")
    {
        objj_msgSend(self, "reloadData");
    }
    else
    {
        self.userTable = JSON.parse(self.currentData);
        objj_msgSend(self.tableView, "reloadData");
    }
}
,["void","CPURLConnection"])]);
}p;20;TextFieldWithLabel.jt;5228;@STATIC;1.0;I;23;Foundation/Foundation.jI;15;AppKit/AppKit.jt;5161;objj_executeFile("Foundation/Foundation.j", NO);objj_executeFile("AppKit/AppKit.j", NO);{var the_class = objj_allocateClassPair(CPView, "TextFieldWithLabel"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("textField"), new objj_ivar("label"), new objj_ivar("target"), new objj_ivar("validator"), new objj_ivar("textChangedSelector")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("textField"), function $TextFieldWithLabel__textField(self, _cmd)
{
    return self.textField;
}
,["CPTextField"]), new objj_method(sel_getUid("setTextField:"), function $TextFieldWithLabel__setTextField_(self, _cmd, newValue)
{
    self.textField = newValue;
}
,["void","CPTextField"]), new objj_method(sel_getUid("target"), function $TextFieldWithLabel__target(self, _cmd)
{
    return self.target;
}
,["id"]), new objj_method(sel_getUid("setTarget:"), function $TextFieldWithLabel__setTarget_(self, _cmd, newValue)
{
    self.target = newValue;
}
,["void","id"]), new objj_method(sel_getUid("validator"), function $TextFieldWithLabel__validator(self, _cmd)
{
    return self.validator;
}
,["SEL"]), new objj_method(sel_getUid("setValidator:"), function $TextFieldWithLabel__setValidator_(self, _cmd, newValue)
{
    self.validator = newValue;
}
,["void","SEL"]), new objj_method(sel_getUid("textChangedSelector"), function $TextFieldWithLabel__textChangedSelector(self, _cmd)
{
    return self.textChangedSelector;
}
,["SEL"]), new objj_method(sel_getUid("setTextChangedSelector:"), function $TextFieldWithLabel__setTextChangedSelector_(self, _cmd, newValue)
{
    self.textChangedSelector = newValue;
}
,["void","SEL"]), new objj_method(sel_getUid("initWithLabel:andPlaceHolder:andWidth:"), function $TextFieldWithLabel__initWithLabel_andPlaceHolder_andWidth_(self, _cmd, aLabel, aPlaceholder, aWidth)
{
    return objj_msgSend(self, "initWithLabel:andPlaceHolder:andWidth:isSecure:", aLabel, aPlaceholder, aWidth, NO);
}
,["id","CPString","CPString","CPInteger"]), new objj_method(sel_getUid("initWithLabel:andPlaceHolder:andWidth:isSecure:"), function $TextFieldWithLabel__initWithLabel_andPlaceHolder_andWidth_isSecure_(self, _cmd, aLabel, aPlaceholder, aWidth, secure)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("TextFieldWithLabel").super_class }, "init");
    if (self)
    {
        self.textField = objj_msgSend(CPTextField, "textFieldWithStringValue:placeholder:width:", "", aPlaceholder, aWidth - 125);
        objj_msgSend(self.textField, "setEditable:", YES);
        objj_msgSend(self.textField, "setDelegate:", self);
        objj_msgSend(self.textField, "setSecure:", secure);
        objj_msgSend(self.textField, "setFrameOrigin:", CGPointMake(125, 0));
        objj_msgSend(self, "addSubview:", self.textField);
        self.label = objj_msgSend(CPTextField, "labelWithTitle:", aLabel);
        objj_msgSend(self.label, "setFrame:", CGRectMake(0, 0, 120, objj_msgSend(self.textField, "bounds").size.height));
        objj_msgSend(self.label, "setVerticalAlignment:", CPCenterVerticalTextAlignment);
        objj_msgSend(self.label, "setAlignment:", CPRightTextAlignment);
        objj_msgSend(self, "addSubview:", self.label);
        objj_msgSend(self, "setFrame:", CGRectMake(0, 0, aWidth, objj_msgSend(self.textField, "bounds").size.height));
        objj_msgSend(self.textField, "setAutoresizingMask:", CPViewWidthSizable);
    }
    return self;
}
,["id","CPString","CPString","CPInteger","BOOL"]), new objj_method(sel_getUid("controlTextDidChange:"), function $TextFieldWithLabel__controlTextDidChange_(self, _cmd, aTextField)
{
    objj_msgSend(self, "validate");
    if (objj_msgSend(self.target, "respondsToSelector:", self.textChangedSelector))
    {
        objj_msgSend(self.target, "performSelector:withObject:", self.textChangedSelector, self.textField);
    }
}
,["void","CPTextField"]), new objj_method(sel_getUid("validate"), function $TextFieldWithLabel__validate(self, _cmd)
{
    if (objj_msgSend(self.target, "respondsToSelector:", self.validator))
    {
        var valid = objj_msgSend(self.target, "performSelector:withObject:", self.validator, objj_msgSend(self.textField, "stringValue"));
        if (!valid)
        {
            objj_msgSend(self.textField, "setBackgroundColor:", objj_msgSend(CPColor, "redColor"));
        }
        else
        {
            objj_msgSend(self.textField, "setBackgroundColor:", objj_msgSend(CPColor, "clearColor"));
        }
        return valid;
    }
    objj_msgSend(self.textField, "setBackgroundColor:", objj_msgSend(CPColor, "clearColor"));
    return true;
}
,["BOOL"]), new objj_method(sel_getUid("controlTextDidEndEditing:"), function $TextFieldWithLabel__controlTextDidEndEditing_(self, _cmd, aTextField)
{
}
,["void","CPTextField"]), new objj_method(sel_getUid("text"), function $TextFieldWithLabel__text(self, _cmd)
{
    return objj_msgSend(self.textField, "stringValue");
}
,["CPString"]), new objj_method(sel_getUid("setText:"), function $TextFieldWithLabel__setText_(self, _cmd, aString)
{
    objj_msgSend(self.textField, "setStringValue:", aString);
}
,["void","CPString"])]);
}p;15;SessionWindow.jt;38125;@STATIC;1.0;I;23;Foundation/Foundation.jI;15;AppKit/AppKit.ji;20;TextFieldWithLabel.jt;38032;objj_executeFile("Foundation/Foundation.j", NO);objj_executeFile("AppKit/AppKit.j", NO);objj_executeFile("TextFieldWithLabel.j", YES);var LOGIN_STATE = 1;
var REGISTRATION_STATE = 2;
var FORGOTPASSWORD_STATE = 3;
var CHANGEPASSWORD_STATE = 4;
var LOGOUT_STATE = 5;
var WAITING_STATE = 6;
var MINIMUM_USERNAME_LENGTH = 4;
var MINIMUM_PASSWORD_LENGTH = 8;
var EMAIL_REGEX = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
var WIDE_MODE_WIDTH = 500;
var NARROW_MODE_WIDTH = 300;
{var the_class = objj_allocateClassPair(CPBox, "SessionWindow"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("delegate"), new objj_ivar("title"), new objj_ivar("currentState"), new objj_ivar("messageField"), new objj_ivar("errorField"), new objj_ivar("usernameField"), new objj_ivar("passwordField"), new objj_ivar("passwordConfirmField"), new objj_ivar("emailField"), new objj_ivar("loginButton"), new objj_ivar("newAccountButton"), new objj_ivar("forgotPasswordButton"), new objj_ivar("registerButton"), new objj_ivar("submitUsernameButton"), new objj_ivar("cancelButton"), new objj_ivar("changePasswordButton"), new objj_ivar("logoutButton"), new objj_ivar("spinnerView"), new objj_ivar("messageSize"), new objj_ivar("errors"), new objj_ivar("message"), new objj_ivar("customMessage"), new objj_ivar("customError"), new objj_ivar("LOGIN_BOX_WIDTH")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("delegate"), function $SessionWindow__delegate(self, _cmd)
{
    return self.delegate;
}
,["id"]), new objj_method(sel_getUid("setDelegate:"), function $SessionWindow__setDelegate_(self, _cmd, newValue)
{
    self.delegate = newValue;
}
,["void","id"]), new objj_method(sel_getUid("title"), function $SessionWindow__title(self, _cmd)
{
    return self.title;
}
,["CPString"]), new objj_method(sel_getUid("setTitle:"), function $SessionWindow__setTitle_(self, _cmd, newValue)
{
    self.title = newValue;
}
,["void","CPString"]), new objj_method(sel_getUid("customMessage"), function $SessionWindow__customMessage(self, _cmd)
{
    return self.customMessage;
}
,["CPString"]), new objj_method(sel_getUid("setCustomMessage:"), function $SessionWindow__setCustomMessage_(self, _cmd, newValue)
{
    self.customMessage = newValue;
}
,["void","CPString"]), new objj_method(sel_getUid("customError"), function $SessionWindow__customError(self, _cmd)
{
    return self.customError;
}
,["CPString"]), new objj_method(sel_getUid("setCustomError:"), function $SessionWindow__setCustomError_(self, _cmd, newValue)
{
    self.customError = newValue;
}
,["void","CPString"]), new objj_method(sel_getUid("init"), function $SessionWindow__init(self, _cmd)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("SessionWindow").super_class }, "init");
    if (self)
    {
        self.errors = objj_msgSend(objj_msgSend(CPSet, "alloc"), "init");
        self.customMessage = "";
        self.customError = "";
        self.LOGIN_BOX_WIDTH = WIDE_MODE_WIDTH;
        objj_msgSend(self, "setFrame:", CGRectMake(0, 0, self.LOGIN_BOX_WIDTH, 100));
        objj_msgSend(self, "center");
        objj_msgSend(self, "setFrameOrigin:", CGPointMake(objj_msgSend(self, "frame").origin.x, objj_msgSend(self, "frame").origin.y - 50));
        self.messageField = objj_msgSend(objj_msgSend(CPTextField, "alloc"), "initWithFrame:", CGRectMake(0, 0, 100, 40));
        objj_msgSend(self.messageField, "setLineBreakMode:", CPLineBreakByWordWrapping);
        objj_msgSend(self.messageField, "setBackgroundColor:", objj_msgSend(CPColor, "colorWithCalibratedRed:green:blue:alpha:", 103.0 / 255.0, 154.0 / 255.0, 205.0 / 255.0, 1.0));
        objj_msgSend(self.messageField, "setTextColor:", objj_msgSend(CPColor, "whiteColor"));
        objj_msgSend(self.messageField, "setValue:forThemeAttribute:", CGInsetMake(9.0, 9.0, 9.0, 9.0), "content-inset");
        objj_msgSend(self, "addSubview:", self.messageField);
        self.errorField = objj_msgSend(objj_msgSend(CPTextField, "alloc"), "initWithFrame:", CGRectMake(0, 0, 100, 0));
        objj_msgSend(self.errorField, "setLineBreakMode:", CPLineBreakByWordWrapping);
        objj_msgSend(self.errorField, "setBackgroundColor:", objj_msgSend(CPColor, "colorWithHexString:", "993333"));
        objj_msgSend(self.errorField, "setTextColor:", objj_msgSend(CPColor, "whiteColor"));
        objj_msgSend(self.errorField, "setValue:forThemeAttribute:", CGInsetMake(9.0, 9.0, 9.0, 9.0), "content-inset");
        objj_msgSend(self, "addSubview:", self.errorField);
        self.loginButton = objj_msgSend(CPButton, "buttonWithTitle:", "Log In");
        objj_msgSend(self.loginButton, "setFrame:", CGRectMake(10, 180, 185, objj_msgSend(self.loginButton, "bounds").size.height));
        objj_msgSend(self.loginButton, "setTarget:", self);
        objj_msgSend(self.loginButton, "setAction:", sel_getUid("loginButtonClicked:"));
        objj_msgSend(self, "addSubview:", self.loginButton);
        self.newAccountButton = objj_msgSend(CPButton, "buttonWithTitle:", "New Account");
        objj_msgSend(self.newAccountButton, "setFrame:", CGRectMake(10, 180, 185, objj_msgSend(self.newAccountButton, "bounds").size.height));
        objj_msgSend(self.newAccountButton, "setTarget:", self);
        objj_msgSend(self.newAccountButton, "setAction:", sel_getUid("newAccountButtonClicked:"));
        objj_msgSend(self, "addSubview:", self.newAccountButton);
        self.forgotPasswordButton = objj_msgSend(CPButton, "buttonWithTitle:", "Forgot Password");
        objj_msgSend(self.forgotPasswordButton, "setFrame:", CGRectMake(10, 180, 185, objj_msgSend(self.forgotPasswordButton, "bounds").size.height));
        objj_msgSend(self.forgotPasswordButton, "setTarget:", self);
        objj_msgSend(self.forgotPasswordButton, "setAction:", sel_getUid("forgotPasswordButtonClicked:"));
        objj_msgSend(self, "addSubview:", self.forgotPasswordButton);
        self.registerButton = objj_msgSend(CPButton, "buttonWithTitle:", "Register");
        objj_msgSend(self.registerButton, "setFrame:", CGRectMake(10, 180, 185, objj_msgSend(self.registerButton, "bounds").size.height));
        objj_msgSend(self.registerButton, "setTarget:", self);
        objj_msgSend(self.registerButton, "setAction:", sel_getUid("registerButtonClicked:"));
        objj_msgSend(self, "addSubview:", self.registerButton);
        self.changePasswordButton = objj_msgSend(CPButton, "buttonWithTitle:", "Change Password");
        objj_msgSend(self.changePasswordButton, "setFrame:", CGRectMake(10, 180, 185, objj_msgSend(self.changePasswordButton, "bounds").size.height));
        objj_msgSend(self.changePasswordButton, "setTarget:", self);
        objj_msgSend(self.changePasswordButton, "setAction:", sel_getUid("changePasswordButtonClicked:"));
        objj_msgSend(self, "addSubview:", self.changePasswordButton);
        self.submitUsernameButton = objj_msgSend(CPButton, "buttonWithTitle:", "Send Recovery E-mail");
        objj_msgSend(self.submitUsernameButton, "setFrame:", CGRectMake(10, 180, 185, objj_msgSend(self.submitUsernameButton, "bounds").size.height));
        objj_msgSend(self.submitUsernameButton, "setTarget:", self);
        objj_msgSend(self.submitUsernameButton, "setAction:", sel_getUid("submitUsernameButtonClicked:"));
        objj_msgSend(self, "addSubview:", self.submitUsernameButton);
        self.logoutButton = objj_msgSend(CPButton, "buttonWithTitle:", "Log out");
        objj_msgSend(self.logoutButton, "setFrame:", CGRectMake(10, 180, 185, objj_msgSend(self.logoutButton, "bounds").size.height));
        objj_msgSend(self.logoutButton, "setTarget:", self);
        objj_msgSend(self.logoutButton, "setAction:", sel_getUid("logoutButtonClicked:"));
        objj_msgSend(self, "addSubview:", self.logoutButton);
        self.cancelButton = objj_msgSend(CPButton, "buttonWithTitle:", "Cancel");
        objj_msgSend(self.cancelButton, "setFrame:", CGRectMake(205, 180, 185, objj_msgSend(self.cancelButton, "bounds").size.height));
        objj_msgSend(self.cancelButton, "setTarget:", self);
        objj_msgSend(self.cancelButton, "setAction:", sel_getUid("cancelButtonClicked:"));
        objj_msgSend(self, "addSubview:", self.cancelButton);
        self.usernameField = objj_msgSend(objj_msgSend(TextFieldWithLabel, "alloc"), "initWithLabel:andPlaceHolder:andWidth:", "Username:", "Username", self.LOGIN_BOX_WIDTH - 20);
        objj_msgSend(self.usernameField, "setFrameOrigin:", CGPointMake(10, 20));
        objj_msgSend(self.usernameField, "setTarget:", self);
        objj_msgSend(self.usernameField, "setTextChangedSelector:", sel_getUid("textChanged:"));
        objj_msgSend(self, "addSubview:", self.usernameField);
        self.passwordField = objj_msgSend(objj_msgSend(TextFieldWithLabel, "alloc"), "initWithLabel:andPlaceHolder:andWidth:isSecure:", "Password:", "Password", self.LOGIN_BOX_WIDTH - 20, YES);
        objj_msgSend(self.passwordField, "setFrameOrigin:", CGPointMake(10, 50));
        objj_msgSend(self.passwordField, "setTarget:", self);
        objj_msgSend(self.passwordField, "setTextChangedSelector:", sel_getUid("textChanged:"));
        objj_msgSend(self, "addSubview:", self.passwordField);
        self.passwordConfirmField = objj_msgSend(objj_msgSend(TextFieldWithLabel, "alloc"), "initWithLabel:andPlaceHolder:andWidth:isSecure:", "Password (again):", "Password (again)", self.LOGIN_BOX_WIDTH - 20, YES);
        objj_msgSend(self.passwordConfirmField, "setFrameOrigin:", CGPointMake(10, 80));
        objj_msgSend(self.passwordConfirmField, "setTarget:", self);
        objj_msgSend(self.passwordConfirmField, "setTextChangedSelector:", sel_getUid("textChanged:"));
        objj_msgSend(self, "addSubview:", self.passwordConfirmField);
        self.emailField = objj_msgSend(objj_msgSend(TextFieldWithLabel, "alloc"), "initWithLabel:andPlaceHolder:andWidth:", "E-mail:", "E-mail", self.LOGIN_BOX_WIDTH - 20);
        objj_msgSend(self.emailField, "setFrameOrigin:", CGPointMake(10, 110));
        objj_msgSend(self.emailField, "setTarget:", self);
        objj_msgSend(self.emailField, "setTextChangedSelector:", sel_getUid("textChanged:"));
        objj_msgSend(self, "addSubview:", self.emailField);
        var spinner = objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(objj_msgSend(CPBundle, "mainBundle"), "pathForResource:", "spinner.gif"), CGSizeMake(20, 20));
        objj_msgSend(spinner, "setDelegate:", self);
        self.spinnerView = objj_msgSend(objj_msgSend(CPImageView, "alloc"), "init");
        objj_msgSend(self.spinnerView, "setImage:", spinner);
        objj_msgSend(self.spinnerView, "setHidden:", YES);
        objj_msgSend(self.spinnerView, "setFrame:", CGRectMake(self.LOGIN_BOX_WIDTH, 400, 60, 60));
        objj_msgSend(self, "addSubview:", self.spinnerView);
        self.messageSize = 0;
        objj_msgSend(self, "setAutoresizingMask:", CPViewMinXMargin | CPViewMaxXMargin | CPViewMinYMargin | CPViewMaxYMargin);
        objj_msgSend(self, "setState:", LOGIN_STATE);
    }
    return self;
}
,["id"]), new objj_method(sel_getUid("updateForScreenWidth:"), function $SessionWindow__updateForScreenWidth_(self, _cmd, width)
{
    if (width < WIDE_MODE_WIDTH)
    {
        self.LOGIN_BOX_WIDTH = NARROW_MODE_WIDTH;
    }
    else
    {
        self.LOGIN_BOX_WIDTH = WIDE_MODE_WIDTH;
    }
    objj_msgSend(self.usernameField, "setFrame:", CGRectMake(objj_msgSend(self.usernameField, "frame").origin.x, objj_msgSend(self.usernameField, "frame").origin.y, self.LOGIN_BOX_WIDTH - 20, objj_msgSend(self.usernameField, "frame").size.height));
    objj_msgSend(self.passwordField, "setFrame:", CGRectMake(objj_msgSend(self.passwordField, "frame").origin.x, objj_msgSend(self.passwordField, "frame").origin.y, self.LOGIN_BOX_WIDTH - 20, objj_msgSend(self.passwordField, "frame").size.height));
    objj_msgSend(self.passwordConfirmField, "setFrame:", CGRectMake(objj_msgSend(self.passwordConfirmField, "frame").origin.x, objj_msgSend(self.passwordConfirmField, "frame").origin.y, self.LOGIN_BOX_WIDTH - 20, objj_msgSend(self.passwordConfirmField, "frame").size.height));
    objj_msgSend(self.emailField, "setFrame:", CGRectMake(objj_msgSend(self.emailField, "frame").origin.x, objj_msgSend(self.emailField, "frame").origin.y, self.LOGIN_BOX_WIDTH - 20, objj_msgSend(self.emailField, "frame").size.height));
    objj_msgSend(self, "_update");
}
,["void","int"]), new objj_method(sel_getUid("username"), function $SessionWindow__username(self, _cmd)
{
    return objj_msgSend(self.usernameField, "text");
}
,["CPString"]), new objj_method(sel_getUid("password"), function $SessionWindow__password(self, _cmd)
{
    return objj_msgSend(self.passwordField, "text");
}
,["CPString"]), new objj_method(sel_getUid("email"), function $SessionWindow__email(self, _cmd)
{
    return objj_msgSend(self.emailField, "text");
}
,["CPString"]), new objj_method(sel_getUid("loginButtonClicked:"), function $SessionWindow__loginButtonClicked_(self, _cmd, sender)
{
    if (objj_msgSend(objj_msgSend(self, "delegate"), "respondsToSelector:", sel_getUid("loginButtonClicked:")))
    {
        objj_msgSend(objj_msgSend(self, "delegate"), "loginButtonClicked:", self);
    }
    return sender;
}
,["id","id"]), new objj_method(sel_getUid("registerButtonClicked:"), function $SessionWindow__registerButtonClicked_(self, _cmd, sender)
{
    if (objj_msgSend(objj_msgSend(self, "delegate"), "respondsToSelector:", sel_getUid("registerButtonClicked:")))
    {
        objj_msgSend(objj_msgSend(self, "delegate"), "registerButtonClicked:", self);
    }
    return sender;
}
,["id","id"]), new objj_method(sel_getUid("changePasswordButtonClicked:"), function $SessionWindow__changePasswordButtonClicked_(self, _cmd, sender)
{
    if (objj_msgSend(objj_msgSend(self, "delegate"), "respondsToSelector:", sel_getUid("changePasswordButtonClicked:")))
    {
        objj_msgSend(objj_msgSend(self, "delegate"), "changePasswordButtonClicked:", self);
    }
    return sender;
}
,["id","id"]), new objj_method(sel_getUid("submitUsernameButtonClicked:"), function $SessionWindow__submitUsernameButtonClicked_(self, _cmd, sender)
{
    if (objj_msgSend(objj_msgSend(self, "delegate"), "respondsToSelector:", sel_getUid("submitUsernameButtonClicked:")))
    {
        objj_msgSend(objj_msgSend(self, "delegate"), "submitUsernameButtonClicked:", self);
    }
    return sender;
}
,["id","id"]), new objj_method(sel_getUid("logoutButtonClicked:"), function $SessionWindow__logoutButtonClicked_(self, _cmd, sender)
{
    if (objj_msgSend(objj_msgSend(self, "delegate"), "respondsToSelector:", sel_getUid("logoutButtonClicked:")))
    {
        objj_msgSend(objj_msgSend(self, "delegate"), "logoutButtonClicked:", self);
    }
    return sender;
}
,["id","id"]), new objj_method(sel_getUid("cancelButtonClicked:"), function $SessionWindow__cancelButtonClicked_(self, _cmd, sender)
{
    if (objj_msgSend(objj_msgSend(self, "delegate"), "respondsToSelector:", sel_getUid("cancelButtonClicked:")))
    {
        objj_msgSend(objj_msgSend(self, "delegate"), "cancelButtonClicked:", self);
    }
    return sender;
}
,["id","id"]), new objj_method(sel_getUid("newAccountButtonClicked:"), function $SessionWindow__newAccountButtonClicked_(self, _cmd, sender)
{
    objj_msgSend(self, "setState:", REGISTRATION_STATE);
    return sender;
}
,["id","id"]), new objj_method(sel_getUid("forgotPasswordButtonClicked:"), function $SessionWindow__forgotPasswordButtonClicked_(self, _cmd, sender)
{
    objj_msgSend(self, "setState:", FORGOTPASSWORD_STATE);
    return sender;
}
,["id","id"]), new objj_method(sel_getUid("usernameIsValid:"), function $SessionWindow__usernameIsValid_(self, _cmd, username)
{
    if (username.length < MINIMUM_USERNAME_LENGTH)
    {
        objj_msgSend(self.errors, "addObject:", objj_msgSend(CPString, "stringWithFormat:", "Username must be at least %d letters", MINIMUM_USERNAME_LENGTH));
        return NO;
    }
    objj_msgSend(self.errors, "removeObject:", objj_msgSend(CPString, "stringWithFormat:", "Username must be at least %d letters", MINIMUM_USERNAME_LENGTH));
    return YES;
}
,["BOOL","CPString"]), new objj_method(sel_getUid("passwordIsValid:"), function $SessionWindow__passwordIsValid_(self, _cmd, password)
{
    if (password.length < MINIMUM_PASSWORD_LENGTH)
    {
        objj_msgSend(self.errors, "addObject:", objj_msgSend(CPString, "stringWithFormat:", "Password must be at least %d letters", MINIMUM_PASSWORD_LENGTH));
        return NO;
    }
    objj_msgSend(self.errors, "removeObject:", objj_msgSend(CPString, "stringWithFormat:", "Password must be at least %d letters", MINIMUM_PASSWORD_LENGTH));
    return YES;
}
,["BOOL","CPString"]), new objj_method(sel_getUid("passwordsMatch:"), function $SessionWindow__passwordsMatch_(self, _cmd, password)
{
    if (password !== objj_msgSend(self.passwordField, "text"))
    {
        objj_msgSend(self.errors, "addObject:", "Passwords do not match");
        return NO;
    }
    objj_msgSend(self.errors, "removeObject:", "Passwords do not match");
    return YES;
}
,["BOOL","CPString"]), new objj_method(sel_getUid("emailIsValid:"), function $SessionWindow__emailIsValid_(self, _cmd, email)
{
    if (!EMAIL_REGEX.test(email))
    {
        objj_msgSend(self.errors, "addObject:", "Please type in a valid e-mail address");
        return NO;
    }
    objj_msgSend(self.errors, "removeObject:", "Please type in a valid e-mail address");
    return YES;
}
,["BOOL","CPString"]), new objj_method(sel_getUid("setMessage:"), function $SessionWindow__setMessage_(self, _cmd, aMessage)
{
    objj_msgSend(self.messageField, "setStringValue:", aMessage);
}
,["void","CPString"]), new objj_method(sel_getUid("setError:"), function $SessionWindow__setError_(self, _cmd, anErrorMessage)
{
    objj_msgSend(self.errorField, "setStringValue:", anErrorMessage);
}
,["void","CPString"]), new objj_method(sel_getUid("_getPasswordRules"), function $SessionWindow___getPasswordRules(self, _cmd)
{
    var rules = ["We don't care if you use symbols in your password", "You are responsible for your own account", "Try and make your password long", "Poems and lyrics are effective ways to have long passwords", "If its short people can guess it easily"];
    var ruleString = "";
    for (var i = 0; i < rules.length; i++)
    {
        ruleString += "\n• " + rules[i];
    }
    return ruleString;
}
,["CPString"]), new objj_method(sel_getUid("setState:"), function $SessionWindow__setState_(self, _cmd, state)
{
    if (state == WAITING_STATE)
    {
        objj_msgSend(self, "setState:andResetFields:", state, NO);
    }
    else
    {
        objj_msgSend(self, "setState:andResetFields:", state, YES);
    }
}
,["void","CPInteger"]), new objj_method(sel_getUid("setState:andResetFields:"), function $SessionWindow__setState_andResetFields_(self, _cmd, state, eraseAllFields)
{
    objj_msgSend(self.errors, "removeAllObjects");
    if (eraseAllFields)
    {
        objj_msgSend(self.usernameField, "setText:", "");
        objj_msgSend(self.passwordField, "setText:", "");
        objj_msgSend(self.passwordConfirmField, "setText:", "");
        objj_msgSend(self.emailField, "setText:", "");
    }
    self.customMessage = "";
    self.customError = "";
    self.currentState = state;
    switch(self.currentState) {
    case LOGIN_STATE:
        self.message = "";
        objj_msgSend(self.usernameField, "setValidator:", nil);
        objj_msgSend(self.passwordField, "setValidator:", nil);
        objj_msgSend(self.passwordConfirmField, "setValidator:", nil);
        objj_msgSend(self.emailField, "setValidator:", nil);
        break;
    case REGISTRATION_STATE:
        self.message = "Account registration: A validation e-mail will be sent to you which contains a link you need to click before you can use your account.\n" + objj_msgSend(self, "_getPasswordRules");
        objj_msgSend(self.usernameField, "setValidator:", sel_getUid("usernameIsValid:"));
        objj_msgSend(self.passwordField, "setValidator:", sel_getUid("passwordIsValid:"));
        objj_msgSend(self.passwordConfirmField, "setValidator:", sel_getUid("passwordsMatch:"));
        objj_msgSend(self.emailField, "setValidator:", sel_getUid("emailIsValid:"));
        break;
    case FORGOTPASSWORD_STATE:
        self.message = "Forgot your password? Fear not. Enter your username and e-mail here and a reset password link will be sent to your e-mail";
        objj_msgSend(self.usernameField, "setValidator:", sel_getUid("usernameIsValid:"));
        objj_msgSend(self.passwordField, "setValidator:", nil);
        objj_msgSend(self.passwordConfirmField, "setValidator:", nil);
        objj_msgSend(self.emailField, "setValidator:", sel_getUid("emailIsValid:"));
        break;
    case CHANGEPASSWORD_STATE:
        self.message = "Change your password to something memorable and long..\n" + objj_msgSend(self, "_getPasswordRules");
        objj_msgSend(self.usernameField, "setValidator:", nil);
        objj_msgSend(self.passwordField, "setValidator:", sel_getUid("passwordIsValid:"));
        objj_msgSend(self.passwordConfirmField, "setValidator:", sel_getUid("passwordsMatch:"));
        objj_msgSend(self.emailField, "setValidator:", nil);
        break;
    case LOGOUT_STATE:
        self.message = "";
        objj_msgSend(self.usernameField, "setValidator:", nil);
        objj_msgSend(self.passwordField, "setValidator:", nil);
        objj_msgSend(self.passwordConfirmField, "setValidator:", nil);
        objj_msgSend(self.emailField, "setValidator:", nil);
        break;
    case WAITING_STATE:
        self.message = "";
        objj_msgSend(self.usernameField, "setValidator:", nil);
        objj_msgSend(self.passwordField, "setValidator:", nil);
        objj_msgSend(self.passwordConfirmField, "setValidator:", nil);
        objj_msgSend(self.emailField, "setValidator:", nil);
        break;
    }
    objj_msgSend(self, "_update");
}
,["void","CPInteger","BOOL"]), new objj_method(sel_getUid("textChanged:"), function $SessionWindow__textChanged_(self, _cmd, label)
{
    objj_msgSend(self, "_update");
}
,["void","TextFieldWithLabel"]), new objj_method(sel_getUid("update"), function $SessionWindow__update(self, _cmd)
{
    objj_msgSend(self, "_update");
}
,["void"]), new objj_method(sel_getUid("_update"), function $SessionWindow___update(self, _cmd)
{
    objj_msgSend(self.usernameField, "validate");
    objj_msgSend(self.passwordField, "validate");
    objj_msgSend(self.passwordConfirmField, "validate");
    objj_msgSend(self.emailField, "validate");
    var errorStrings = objj_msgSend(self.errors, "allObjects");
    if (self.customError.length > 0)
    {
        errorStrings = objj_msgSend(errorStrings, "arrayByAddingObject:", self.customError);
    }
    var errorString = objj_msgSend(errorStrings, "componentsJoinedByString:", "\n");
    objj_msgSend(self, "setError:", errorString);
    var messageStrings = [];
    if (self.message.length > 0)
    {
        messageStrings = objj_msgSend(messageStrings, "arrayByAddingObject:", self.message);
    }
    if (self.customMessage.length > 0)
    {
        messageStrings = objj_msgSend(messageStrings, "arrayByAddingObject:", self.customMessage);
    }
    var messageString = objj_msgSend(messageStrings, "componentsJoinedByString:", "\n");
    objj_msgSend(self, "setMessage:", messageString);
    var targetWidth = objj_msgSend(self, "frame").size.width;
    var targetHeight = objj_msgSend(self, "frame").size.height;
    var messageFieldSize = {width: self.LOGIN_BOX_WIDTH, height: 0};
    if (messageString && messageString.length > 0)
    {
        messageFieldSize = objj_msgSend(messageString, "sizeWithFont:inWidth:", objj_msgSend(self.messageField, "font"), self.LOGIN_BOX_WIDTH);
        objj_msgSend(self.messageField, "setFrame:", CGRectMake(0, 0, self.LOGIN_BOX_WIDTH, messageFieldSize.height + 18));
    }
    else
    {
        objj_msgSend(self.messageField, "setFrame:", CGRectMake(0, 0, self.LOGIN_BOX_WIDTH, 0));
    }
    var errorFieldSize = {width: self.LOGIN_BOX_WIDTH, height: 0};
    if (objj_msgSend(self.errorField, "stringValue") && objj_msgSend(self.errorField, "stringValue").length > 0)
    {
        errorFieldSize = objj_msgSend(objj_msgSend(self.errorField, "stringValue"), "sizeWithFont:inWidth:", objj_msgSend(self.errorField, "font"), self.LOGIN_BOX_WIDTH);
        objj_msgSend(self.errorField, "setFrame:", CGRectMake(0, objj_msgSend(self.messageField, "frame").size.height, self.LOGIN_BOX_WIDTH, errorFieldSize.height + 18));
    }
    else
    {
        objj_msgSend(self.errorField, "setFrame:", CGRectMake(0, objj_msgSend(self.messageField, "frame").size.height, self.LOGIN_BOX_WIDTH, 0));
    }
    self.messageSize = objj_msgSend(self.messageField, "frame").size.height + objj_msgSend(self.errorField, "frame").size.height;
    switch(self.currentState) {
    case LOGIN_STATE:
        objj_msgSend(self, "setTitle:", "Log In");
        objj_msgSend(self.usernameField, "setHidden:", NO);
        objj_msgSend(self.passwordField, "setHidden:", NO);
        objj_msgSend(self.passwordConfirmField, "setHidden:", YES);
        objj_msgSend(self.emailField, "setHidden:", YES);
        objj_msgSend(self.registerButton, "setHidden:", YES);
        objj_msgSend(self.submitUsernameButton, "setHidden:", YES);
        objj_msgSend(self.newAccountButton, "setHidden:", NO);
        objj_msgSend(self.forgotPasswordButton, "setHidden:", NO);
        objj_msgSend(self.loginButton, "setHidden:", NO);
        objj_msgSend(self.changePasswordButton, "setHidden:", YES);
        objj_msgSend(self.cancelButton, "setHidden:", NO);
        objj_msgSend(self.spinnerView, "setHidden:", YES);
        objj_msgSend(self.logoutButton, "setHidden:", YES);
        objj_msgSend(self.usernameField, "setFrameOrigin:", CGPointMake(10, 10 + self.messageSize));
        objj_msgSend(self.passwordField, "setFrameOrigin:", CGPointMake(10, 40 + self.messageSize));
        objj_msgSend(self.loginButton, "setFrame:", CGRectMake(10, 80 + self.messageSize, (self.LOGIN_BOX_WIDTH - 30) / 2, objj_msgSend(self.loginButton, "bounds").size.height));
        objj_msgSend(self.cancelButton, "setFrame:", CGRectMake(self.LOGIN_BOX_WIDTH / 2 + 5, 80 + self.messageSize, (self.LOGIN_BOX_WIDTH - 30) / 2, objj_msgSend(self.cancelButton, "bounds").size.height));
        objj_msgSend(self.newAccountButton, "setFrame:", CGRectMake(10, 110 + self.messageSize, (self.LOGIN_BOX_WIDTH - 30) / 2, objj_msgSend(self.loginButton, "bounds").size.height));
        objj_msgSend(self.forgotPasswordButton, "setFrame:", CGRectMake(self.LOGIN_BOX_WIDTH / 2 + 5, 110 + self.messageSize, (self.LOGIN_BOX_WIDTH - 30) / 2, objj_msgSend(self.cancelButton, "bounds").size.height));
        objj_msgSend(objj_msgSend(self.usernameField, "textField"), "setNextKeyView:", objj_msgSend(self.passwordField, "textField"));
        objj_msgSend(objj_msgSend(self.passwordField, "textField"), "setNextKeyView:", objj_msgSend(self.usernameField, "textField"));
        objj_msgSend(objj_msgSend(self, "window"), "setDefaultButton:", self.loginButton);
        targetWidth = self.LOGIN_BOX_WIDTH;
        targetHeight = 145 + self.messageSize;
        break;
    case REGISTRATION_STATE:
        objj_msgSend(self, "setTitle:", "New Account");
        objj_msgSend(self.usernameField, "setHidden:", NO);
        objj_msgSend(self.passwordField, "setHidden:", NO);
        objj_msgSend(self.passwordConfirmField, "setHidden:", NO);
        objj_msgSend(self.emailField, "setHidden:", NO);
        objj_msgSend(self.registerButton, "setHidden:", NO);
        objj_msgSend(self.submitUsernameButton, "setHidden:", YES);
        objj_msgSend(self.newAccountButton, "setHidden:", YES);
        objj_msgSend(self.forgotPasswordButton, "setHidden:", YES);
        objj_msgSend(self.loginButton, "setHidden:", YES);
        objj_msgSend(self.changePasswordButton, "setHidden:", YES);
        objj_msgSend(self.cancelButton, "setHidden:", NO);
        objj_msgSend(self.spinnerView, "setHidden:", YES);
        objj_msgSend(self.logoutButton, "setHidden:", YES);
        objj_msgSend(self.usernameField, "setFrameOrigin:", CGPointMake(10, 10 + self.messageSize));
        objj_msgSend(self.passwordField, "setFrameOrigin:", CGPointMake(10, 40 + self.messageSize));
        objj_msgSend(self.passwordConfirmField, "setFrameOrigin:", CGPointMake(10, 70 + self.messageSize));
        objj_msgSend(self.emailField, "setFrameOrigin:", CGPointMake(10, 100 + self.messageSize));
        objj_msgSend(objj_msgSend(self.usernameField, "textField"), "setNextKeyView:", objj_msgSend(self.passwordField, "textField"));
        objj_msgSend(objj_msgSend(self.passwordField, "textField"), "setNextKeyView:", objj_msgSend(self.passwordConfirmField, "textField"));
        objj_msgSend(objj_msgSend(self.passwordConfirmField, "textField"), "setNextKeyView:", objj_msgSend(self.emailField, "textField"));
        objj_msgSend(objj_msgSend(self.emailField, "textField"), "setNextKeyView:", objj_msgSend(self.usernameField, "textField"));
        objj_msgSend(self.registerButton, "setFrame:", CGRectMake(10, 140 + self.messageSize, (self.LOGIN_BOX_WIDTH - 30) / 2, objj_msgSend(self.loginButton, "bounds").size.height));
        objj_msgSend(self.cancelButton, "setFrame:", CGRectMake(self.LOGIN_BOX_WIDTH / 2 + 5, 140 + self.messageSize, (self.LOGIN_BOX_WIDTH - 30) / 2, objj_msgSend(self.cancelButton, "bounds").size.height));
        objj_msgSend(objj_msgSend(self, "window"), "setDefaultButton:", self.registerButton);
        targetWidth = self.LOGIN_BOX_WIDTH;
        targetHeight = 175 + self.messageSize;
        break;
    case FORGOTPASSWORD_STATE:
        objj_msgSend(self, "setTitle:", "Forgot Password");
        objj_msgSend(self.usernameField, "setHidden:", NO);
        objj_msgSend(self.passwordField, "setHidden:", YES);
        objj_msgSend(self.passwordConfirmField, "setHidden:", YES);
        objj_msgSend(self.emailField, "setHidden:", NO);
        objj_msgSend(self.registerButton, "setHidden:", YES);
        objj_msgSend(self.submitUsernameButton, "setHidden:", NO);
        objj_msgSend(self.newAccountButton, "setHidden:", YES);
        objj_msgSend(self.forgotPasswordButton, "setHidden:", YES);
        objj_msgSend(self.loginButton, "setHidden:", YES);
        objj_msgSend(self.changePasswordButton, "setHidden:", YES);
        objj_msgSend(self.cancelButton, "setHidden:", NO);
        objj_msgSend(self.spinnerView, "setHidden:", YES);
        objj_msgSend(self.logoutButton, "setHidden:", YES);
        objj_msgSend(self.usernameField, "setFrameOrigin:", CGPointMake(10, 10 + self.messageSize));
        objj_msgSend(self.emailField, "setFrameOrigin:", CGPointMake(10, 40 + self.messageSize));
        objj_msgSend(self.submitUsernameButton, "setFrame:", CGRectMake(10, 80 + self.messageSize, (self.LOGIN_BOX_WIDTH - 30) / 2, objj_msgSend(self.loginButton, "bounds").size.height));
        objj_msgSend(self.cancelButton, "setFrame:", CGRectMake(self.LOGIN_BOX_WIDTH / 2 + 5, 80 + self.messageSize, (self.LOGIN_BOX_WIDTH - 30) / 2, objj_msgSend(self.cancelButton, "bounds").size.height));
        objj_msgSend(objj_msgSend(self.usernameField, "textField"), "setNextKeyView:", objj_msgSend(self.emailField, "textField"));
        objj_msgSend(objj_msgSend(self.emailField, "textField"), "setNextKeyView:", objj_msgSend(self.usernameField, "textField"));
        objj_msgSend(objj_msgSend(self, "window"), "setDefaultButton:", self.submitUsernameButton);
        targetWidth = self.LOGIN_BOX_WIDTH;
        targetHeight = 115 + self.messageSize;
        break;
    case CHANGEPASSWORD_STATE:
        objj_msgSend(self, "setTitle:", "Change Password");
        objj_msgSend(self.usernameField, "setHidden:", YES);
        objj_msgSend(self.passwordField, "setHidden:", NO);
        objj_msgSend(self.passwordConfirmField, "setHidden:", NO);
        objj_msgSend(self.emailField, "setHidden:", YES);
        objj_msgSend(self.registerButton, "setHidden:", YES);
        objj_msgSend(self.submitUsernameButton, "setHidden:", YES);
        objj_msgSend(self.newAccountButton, "setHidden:", YES);
        objj_msgSend(self.forgotPasswordButton, "setHidden:", YES);
        objj_msgSend(self.loginButton, "setHidden:", YES);
        objj_msgSend(self.changePasswordButton, "setHidden:", NO);
        objj_msgSend(self.cancelButton, "setHidden:", NO);
        objj_msgSend(self.spinnerView, "setHidden:", YES);
        objj_msgSend(self.logoutButton, "setHidden:", YES);
        objj_msgSend(self.passwordField, "setFrameOrigin:", CGPointMake(10, 10 + self.messageSize));
        objj_msgSend(self.passwordConfirmField, "setFrameOrigin:", CGPointMake(10, 40 + self.messageSize));
        objj_msgSend(self.changePasswordButton, "setFrame:", CGRectMake(10, 80 + self.messageSize, (self.LOGIN_BOX_WIDTH - 30) / 2, objj_msgSend(self.loginButton, "bounds").size.height));
        objj_msgSend(self.cancelButton, "setFrame:", CGRectMake(self.LOGIN_BOX_WIDTH / 2 + 5, 80 + self.messageSize, (self.LOGIN_BOX_WIDTH - 30) / 2, objj_msgSend(self.cancelButton, "bounds").size.height));
        objj_msgSend(objj_msgSend(self.passwordField, "textField"), "setNextKeyView:", objj_msgSend(self.passwordConfirmField, "textField"));
        objj_msgSend(objj_msgSend(self.passwordConfirmField, "textField"), "setNextKeyView:", objj_msgSend(self.passwordField, "textField"));
        objj_msgSend(objj_msgSend(self, "window"), "setDefaultButton:", self.changePasswordButton);
        targetWidth = self.LOGIN_BOX_WIDTH;
        targetHeight = 115 + self.messageSize;
        break;
    case LOGOUT_STATE:
        objj_msgSend(self, "setTitle:", "Log out");
        objj_msgSend(self.usernameField, "setHidden:", YES);
        objj_msgSend(self.passwordField, "setHidden:", YES);
        objj_msgSend(self.passwordConfirmField, "setHidden:", YES);
        objj_msgSend(self.emailField, "setHidden:", YES);
        objj_msgSend(self.registerButton, "setHidden:", YES);
        objj_msgSend(self.submitUsernameButton, "setHidden:", YES);
        objj_msgSend(self.newAccountButton, "setHidden:", YES);
        objj_msgSend(self.forgotPasswordButton, "setHidden:", YES);
        objj_msgSend(self.loginButton, "setHidden:", YES);
        objj_msgSend(self.changePasswordButton, "setHidden:", YES);
        objj_msgSend(self.cancelButton, "setHidden:", NO);
        objj_msgSend(self.spinnerView, "setHidden:", YES);
        objj_msgSend(self.logoutButton, "setHidden:", NO);
        objj_msgSend(self.logoutButton, "setFrame:", CGRectMake(10, 20 + self.messageSize, (self.LOGIN_BOX_WIDTH - 30) / 2, objj_msgSend(self.logoutButton, "bounds").size.height));
        objj_msgSend(self.cancelButton, "setFrame:", CGRectMake(self.LOGIN_BOX_WIDTH / 2 + 5, 20 + self.messageSize, (self.LOGIN_BOX_WIDTH - 30) / 2, objj_msgSend(self.cancelButton, "bounds").size.height));
        objj_msgSend(objj_msgSend(self, "window"), "setDefaultButton:", self.logoutButton);
        targetWidth = self.LOGIN_BOX_WIDTH;
        targetHeight = 65 + self.messageSize;
        break;
    case WAITING_STATE:
        objj_msgSend(self, "setTitle:", "Please wait");
        objj_msgSend(self.usernameField, "setHidden:", YES);
        objj_msgSend(self.passwordField, "setHidden:", YES);
        objj_msgSend(self.passwordConfirmField, "setHidden:", YES);
        objj_msgSend(self.emailField, "setHidden:", YES);
        objj_msgSend(self.registerButton, "setHidden:", YES);
        objj_msgSend(self.submitUsernameButton, "setHidden:", YES);
        objj_msgSend(self.newAccountButton, "setHidden:", YES);
        objj_msgSend(self.forgotPasswordButton, "setHidden:", YES);
        objj_msgSend(self.loginButton, "setHidden:", YES);
        objj_msgSend(self.changePasswordButton, "setHidden:", YES);
        objj_msgSend(self.cancelButton, "setHidden:", YES);
        objj_msgSend(self.spinnerView, "setHidden:", NO);
        objj_msgSend(self.logoutButton, "setHidden:", YES);
        targetWidth = self.LOGIN_BOX_WIDTH;
        targetHeight = 115 + self.messageSize;
        break;
    }
    var xmargins = (targetWidth - objj_msgSend(self, "frame").size.width) / 2;
    var ymargins = (targetHeight - objj_msgSend(self, "frame").size.height) / 2;
    if (objj_msgSend(self.errors, "allObjects").length > 0)
    {
        objj_msgSend(objj_msgSend(objj_msgSend(self, "window"), "defaultButton"), "setEnabled:", NO);
    }
    else
    {
        objj_msgSend(objj_msgSend(objj_msgSend(self, "window"), "defaultButton"), "setEnabled:", YES);
    }
    objj_msgSend(self, "setFrame:", CGRectMake(objj_msgSend(self, "frame").origin.x - xmargins, objj_msgSend(self, "frame").origin.y - ymargins, targetWidth, targetHeight));
    objj_msgSend(self.spinnerView, "setCenter:", objj_msgSend(self, "center"));
}
,["void"]), new objj_method(sel_getUid("state"), function $SessionWindow__state(self, _cmd)
{
    return self.currentState;
}
,["CPInteger"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("loginState"), function $SessionWindow__loginState(self, _cmd)
{
    return LOGIN_STATE;
}
,["CPInteger"]), new objj_method(sel_getUid("registrationState"), function $SessionWindow__registrationState(self, _cmd)
{
    return REGISTRATION_STATE;
}
,["CPInteger"]), new objj_method(sel_getUid("forgotPasswordState"), function $SessionWindow__forgotPasswordState(self, _cmd)
{
    return FORGOTPASSWORD_STATE;
}
,["CPInteger"]), new objj_method(sel_getUid("changePasswordState"), function $SessionWindow__changePasswordState(self, _cmd)
{
    return CHANGEPASSWORD_STATE;
}
,["CPInteger"]), new objj_method(sel_getUid("logoutState"), function $SessionWindow__logoutState(self, _cmd)
{
    return LOGOUT_STATE;
}
,["CPInteger"]), new objj_method(sel_getUid("waitingState"), function $SessionWindow__waitingState(self, _cmd)
{
    return WAITING_STATE;
}
,["CPInteger"])]);
}p;28;SessionTableViewController.jt;3794;@STATIC;1.0;I;23;Foundation/Foundation.jI;15;AppKit/AppKit.ji;16;SessionManager.ji;16;BunnyTableView.jt;3685;objj_executeFile("Foundation/Foundation.j", NO);objj_executeFile("AppKit/AppKit.j", NO);objj_executeFile("SessionManager.j", YES);objj_executeFile("BunnyTableView.j", YES);{var the_class = objj_allocateClassPair(CPViewController, "SessionTableViewController"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("tableView"), new objj_ivar("sessionTable"), new objj_ivar("currentStatusCode"), new objj_ivar("currentData")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("init"), function $SessionTableViewController__init(self, _cmd)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("SessionTableViewController").super_class }, "init");
    if (self)
    {
        self.tableView = objj_msgSend(objj_msgSend(BunnyTableView, "alloc"), "init");
        objj_msgSend(self.tableView, "setDataSource:", self);
        objj_msgSend(self.tableView, "setDelegate:", self);
        objj_msgSend(self.tableView, "addColumnNamed:", "userid");
        objj_msgSend(self.tableView, "addColumnNamed:", "loginTime");
        objj_msgSend(self.tableView, "addColumnNamed:", "ip");
        objj_msgSend(self.tableView, "addColumnNamed:", "lastUseTime");
        objj_msgSend(self.tableView, "addColumnNamed:", "expiryTime");
        objj_msgSend(self, "reloadData");
        objj_msgSend(self, "setView:", self.tableView);
    }
    return self;
}
,["id"]), new objj_method(sel_getUid("reloadData"), function $SessionTableViewController__reloadData(self, _cmd)
{
    objj_msgSend(objj_msgSend(SessionManager, "instance"), "get:andNotify:", "/admin/sessions", self);
}
,["void"]), new objj_method(sel_getUid("reloadButtonClicked:"), function $SessionTableViewController__reloadButtonClicked_(self, _cmd, sender)
{
    objj_msgSend(self, "reloadData");
}
,["void","id"]), new objj_method(sel_getUid("numberOfRowsInTableView:"), function $SessionTableViewController__numberOfRowsInTableView_(self, _cmd, aTableView)
{
    if (self.sessionTable)
    {
        return self.sessionTable.length;
    }
    return 0;
}
,["int","CPTableView"]), new objj_method(sel_getUid("tableView:objectValueForTableColumn:row:"), function $SessionTableViewController__tableView_objectValueForTableColumn_row_(self, _cmd, aTableView, aColumn, aRowIndex)
{
    return self.sessionTable[aRowIndex][objj_msgSend(aColumn, "identifier")];
}
,["id","CPTableView","CPTableColumn","int"]), new objj_method(sel_getUid("tableView:shouldEditTableColumn:row:"), function $SessionTableViewController__tableView_shouldEditTableColumn_row_(self, _cmd, aTableView, aTableColumn, rowIndex)
{
    return NO;
}
,["BOOL","CPTableView","CPTableColumn","int"]), new objj_method(sel_getUid("connection:didFailWithError:"), function $SessionTableViewController__connection_didFailWithError_(self, _cmd, connection, error)
{
}
,["void","CPURLConnection","id"]), new objj_method(sel_getUid("connection:didReceiveResponse:"), function $SessionTableViewController__connection_didReceiveResponse_(self, _cmd, connection, response)
{
    self.currentStatusCode = objj_msgSend(response, "statusCode");
}
,["void","CPURLConnection","CPHTTPURLResponse"]), new objj_method(sel_getUid("connection:didReceiveData:"), function $SessionTableViewController__connection_didReceiveData_(self, _cmd, connection, data)
{
    self.currentData = data;
}
,["void","CPURLConnection","CPString"]), new objj_method(sel_getUid("connectionDidFinishLoading:"), function $SessionTableViewController__connectionDidFinishLoading_(self, _cmd, connection)
{
    self.sessionTable = JSON.parse(self.currentData);
    objj_msgSend(self.tableView, "reloadData");
}
,["void","CPURLConnection"])]);
}p;17;SessionMenuItem.jt;657;@STATIC;1.0;I;23;Foundation/Foundation.jI;15;AppKit/AppKit.jt;591;objj_executeFile("Foundation/Foundation.j", NO);objj_executeFile("AppKit/AppKit.j", NO);{var the_class = objj_allocateClassPair(CPMenuItem, "SessionMenuItem"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("init"), function $SessionMenuItem__init(self, _cmd)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("SessionMenuItem").super_class }, "initWithTitle:action:keyEquivalent:", "Not logged in", sel_getUid("menuItemClicked:"), nil);
    if (self)
    {
    }
    return self;
}
,["id"])]);
}p;16;SessionManager.jt;21777;@STATIC;1.0;I;23;Foundation/Foundation.ji;15;SessionWindow.ji;17;SessionMenuItem.ji;16;DesktopManager.ji;20;Utils/HashFragment.ji;22;Utils/URLQueryString.jt;21614;objj_executeFile("Foundation/Foundation.j", NO);objj_executeFile("SessionWindow.j", YES);objj_executeFile("SessionMenuItem.j", YES);objj_executeFile("DesktopManager.j", YES);objj_executeFile("Utils/HashFragment.j", YES);objj_executeFile("Utils/URLQueryString.j", YES);var GITHUB_CLIENT_ID = "39cee75ce85db5da2576";
var apiServerUrl = "https://bunnylabs-api.astrobunny.net";
var session;
NOTIFICATION_LOGIN_DATA_UPDATED = "NOTIFICATION_LOGIN_DATA_UPDATED";
popupwindow = function(url, title, w, h)
{
    var left = screen.width / 2 - w / 2;
    var top = screen.height / 2 - h / 2;
    return window.open(url, title, 'toolbar=no, location=no, directories=no, status=no, menubar=no, scrollbars=no, resizable=no, copyhistory=no, width=' + w + ', height=' + h + ', top=' + top + ', left=' + left);
}
{var the_class = objj_allocateClassPair(CPViewController, "SessionManager"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("currentResponseHandler"), new objj_ivar("currentStatusCode"), new objj_ivar("currentData"), new objj_ivar("statusMenuItem"), new objj_ivar("userData"), new objj_ivar("persistentStore")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("acceptsFirstResponder"), function $SessionManager__acceptsFirstResponder(self, _cmd)
{
    return YES;
}
,["BOOL"]), new objj_method(sel_getUid("init"), function $SessionManager__init(self, _cmd)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("SessionManager").super_class }, "init");
    if (self)
    {
        self.persistentStore = new Persist.Store("BunnyLabs");
        objj_msgSend(self, "setView:", objj_msgSend(objj_msgSend(SessionWindow, "alloc"), "init"));
        objj_msgSend(objj_msgSend(self, "view"), "setDelegate:", self);
        self.currentResponseHandler = sel_getUid("noResponseHandler:data:");
        self.statusMenuItem = objj_msgSend(objj_msgSend(SessionMenuItem, "alloc"), "init");
        objj_msgSend(self.statusMenuItem, "setTarget:", self);
        objj_msgSend(self, "getUserData");
        window.addEventListener('message', function(event)
        {
            try            {
                var obj = objj_msgSend(URLQueryString, "deserialize:", event.data);
                objj_msgSend(self, "handleSessionManagerMessage:", obj);
            }
            catch(e)             {
                CPLog("Received bad message");
            }        });
    }
    return self;
}
,["id"]), new objj_method(sel_getUid("authToken"), function $SessionManager__authToken(self, _cmd)
{
    var token = self.persistentStore.get("authToken");
    if (!token)
    {
        return "";
    }
    return token;
}
,["CPString"]), new objj_method(sel_getUid("setAuthToken:"), function $SessionManager__setAuthToken_(self, _cmd, aToken)
{
    self.persistentStore.set("authToken", aToken);
}
,["void","CPString"]), new objj_method(sel_getUid("clearAuthToken"), function $SessionManager__clearAuthToken(self, _cmd)
{
    self.persistentStore.set("authToken", "");
}
,["void"]), new objj_method(sel_getUid("desktopDidResizeToRect:"), function $SessionManager__desktopDidResizeToRect_(self, _cmd, newRect)
{
    objj_msgSend(objj_msgSend(self, "view"), "updateForScreenWidth:", newRect.size.width);
}
,["void","CGRect"]), new objj_method(sel_getUid("handleSessionManagerMessage:"), function $SessionManager__handleSessionManagerMessage_(self, _cmd, anObject)
{
    console.log(anObject);
    if (anObject.type === "githubLogin")
    {
        if (anObject.authToken)
        {
            objj_msgSend(self, "setAuthToken:", anObject.authToken);
            objj_msgSend(self, "getUserData");
        }
        else if (anObject.error)
        {
            objj_msgSend(self, "showLoginWindow");
            objj_msgSend(objj_msgSend(self, "view"), "setCustomError:", objj_msgSend(CPString, "stringWithFormat:", "Unable to login using Github. Reason: %@", anObject.error));
            objj_msgSend(objj_msgSend(self, "view"), "update");
        }
        else
        {
            console.log("wtf");
        }
    }
}
,["void","id"]), new objj_method(sel_getUid("menuItemClicked:"), function $SessionManager__menuItemClicked_(self, _cmd, sender)
{
    objj_msgSend(self, "showLoginWindow");
    return sender;
}
,["id","id"]), new objj_method(sel_getUid("getUserData"), function $SessionManager__getUserData(self, _cmd)
{
    if (objj_msgSend(self, "authToken").length > 0)
    {
        self.currentResponseHandler = sel_getUid("getUserDataHandler:forData:");
        objj_msgSend(self, "get:andNotify:", "/sessions/current", self);
    }
    else
    {
        self.userData = nil;
        objj_msgSend(self.statusMenuItem, "setTitle:", "Log In");
        objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "postNotificationName:object:", NOTIFICATION_LOGIN_DATA_UPDATED, self);
    }
}
,["void"]), new objj_method(sel_getUid("isAdmin"), function $SessionManager__isAdmin(self, _cmd)
{
    if (!self.userData)
    {
        return NO;
    }
    if (!self.userData.adminToken)
    {
        return NO;
    }
    return YES;
}
,["BOOL"]), new objj_method(sel_getUid("isLoggedIn"), function $SessionManager__isLoggedIn(self, _cmd)
{
    if (!self.userData)
    {
        return NO;
    }
    if (!self.userData.username)
    {
        return NO;
    }
    return YES;
}
,["BOOL"]), new objj_method(sel_getUid("nullResponseHandler:forData:"), function $SessionManager__nullResponseHandler_forData_(self, _cmd, statusCode, data)
{
    CPLog("Null response handler called");
}
,["void","int","CPString"]), new objj_method(sel_getUid("getUserDataHandler:forData:"), function $SessionManager__getUserDataHandler_forData_(self, _cmd, statusCode, data)
{
    if (statusCode == 200)
    {
        var result = JSON.parse(data);
        objj_msgSend(self.statusMenuItem, "setTitle:", objj_msgSend(CPString, "stringWithFormat:", "Logged in as %@", result.username));
        self.userData = result;
    }
    else
    {
        objj_msgSend(objj_msgSend(self, "view"), "setState:andResetFields:", objj_msgSend(SessionWindow, "loginState"), NO);
        objj_msgSend(objj_msgSend(self, "view"), "setCustomError:", data);
        objj_msgSend(objj_msgSend(self, "view"), "update");
        self.userData = nil;
    }
    objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "postNotificationName:object:", NOTIFICATION_LOGIN_DATA_UPDATED, self);
}
,["void","int","CPString"]), new objj_method(sel_getUid("validationResponseHandler:forData:"), function $SessionManager__validationResponseHandler_forData_(self, _cmd, statusCode, data)
{
    if (statusCode == 200)
    {
        var alert = objj_msgSend(CPAlert, "alertWithError:", objj_msgSend(CPString, "stringWithFormat:", "Your account is now validated. You may log in now."));
        objj_msgSend(alert, "setAlertStyle:", CPInformationalAlertStyle);
        objj_msgSend(alert, "runModal");
    }
    else
    {
        var alert = objj_msgSend(CPAlert, "alertWithError:", objj_msgSend(CPString, "stringWithFormat:", "Something went wrong. Maybe you already validated."));
        objj_msgSend(alert, "runModal");
    }
}
,["void","int","CPString"]), new objj_method(sel_getUid("loginResponseHandler:forData:"), function $SessionManager__loginResponseHandler_forData_(self, _cmd, statusCode, data)
{
    if (statusCode == 200)
    {
        objj_msgSend(self, "setAuthToken:", data);
        objj_msgSend(objj_msgSend(DesktopManager, "instance"), "removeViewController:", self);
    }
    else
    {
        objj_msgSend(self, "clearAuthToken");
        objj_msgSend(objj_msgSend(self, "view"), "setState:andResetFields:", objj_msgSend(SessionWindow, "loginState"), NO);
        objj_msgSend(objj_msgSend(self, "view"), "setCustomError:", data);
        objj_msgSend(objj_msgSend(self, "view"), "update");
    }
    objj_msgSend(self, "getUserData");
}
,["void","int","CPString"]), new objj_method(sel_getUid("registerResponseHandler:forData:"), function $SessionManager__registerResponseHandler_forData_(self, _cmd, statusCode, data)
{
    if (statusCode == 200)
    {
        objj_msgSend(objj_msgSend(self, "view"), "setState:", objj_msgSend(SessionWindow, "loginState"));
        objj_msgSend(objj_msgSend(self, "view"), "setCustomMessage:", "You should receive an e-mail with an activation link. Go to that link and then you will be able to log in.");
        objj_msgSend(objj_msgSend(self, "view"), "update");
    }
    else
    {
        objj_msgSend(objj_msgSend(self, "view"), "setState:andResetFields:", objj_msgSend(SessionWindow, "registrationState"), NO);
        objj_msgSend(objj_msgSend(self, "view"), "setCustomError:", data);
        objj_msgSend(objj_msgSend(self, "view"), "update");
    }
}
,["void","int","CPString"]), new objj_method(sel_getUid("submitUsernameResponseHandler:forData:"), function $SessionManager__submitUsernameResponseHandler_forData_(self, _cmd, statusCode, data)
{
    if (statusCode == 200)
    {
        objj_msgSend(objj_msgSend(self, "view"), "setState:", objj_msgSend(SessionWindow, "loginState"));
        objj_msgSend(objj_msgSend(self, "view"), "setCustomMessage:", "Your password has been changed. You may now log in with your new password");
        objj_msgSend(objj_msgSend(self, "view"), "update");
    }
    else
    {
        objj_msgSend(objj_msgSend(self, "view"), "setState:andResetFields:", objj_msgSend(SessionWindow, "changePasswordState"), NO);
        objj_msgSend(objj_msgSend(self, "view"), "setCustomError:", data);
        objj_msgSend(objj_msgSend(self, "view"), "update");
    }
}
,["void","int","CPString"]), new objj_method(sel_getUid("forgotPasswordResponseHandler:forData:"), function $SessionManager__forgotPasswordResponseHandler_forData_(self, _cmd, statusCode, data)
{
    if (statusCode == 200)
    {
        objj_msgSend(objj_msgSend(self, "view"), "setState:", objj_msgSend(SessionWindow, "loginState"));
        objj_msgSend(objj_msgSend(self, "view"), "setCustomMessage:", "You should receive an e-mail containing instructions on how to change your password");
        objj_msgSend(objj_msgSend(self, "view"), "update");
    }
    else
    {
        objj_msgSend(objj_msgSend(self, "view"), "setState:andResetFields:", objj_msgSend(SessionWindow, "forgotPasswordState"), NO);
        objj_msgSend(objj_msgSend(self, "view"), "setCustomError:", data);
        objj_msgSend(objj_msgSend(self, "view"), "update");
    }
}
,["void","int","CPString"]), new objj_method(sel_getUid("_buildUrl:"), function $SessionManager___buildUrl_(self, _cmd, apiPath)
{
    var query = {auth: objj_msgSend(self, "authToken"), lang: "en"};
    var url = objj_msgSend(CPURL, "URLWithString:", objj_msgSend(CPString, "stringWithFormat:", "%@%@?%@", apiServerUrl, apiPath, objj_msgSend(URLQueryString, "serialize:", query)));
    return url;
}
,["CPURL","CPString"]), new objj_method(sel_getUid("_performRequest:withDelegate:"), function $SessionManager___performRequest_withDelegate_(self, _cmd, aRequest, delegate)
{
    var conn = objj_msgSend(objj_msgSend(CPURLConnection, "alloc"), "initWithRequest:delegate:", aRequest, delegate);
    objj_msgSend(conn, "start");
}
,["void","CPURLRequest","id"]), new objj_method(sel_getUid("get:andNotify:"), function $SessionManager__get_andNotify_(self, _cmd, aUrl, delegate)
{
    var url = objj_msgSend(self, "_buildUrl:", aUrl);
    var request = objj_msgSend(CPURLRequest, "requestWithURL:", url);
    objj_msgSend(request, "setHTTPMethod:", "GET");
    objj_msgSend(self, "_performRequest:withDelegate:", request, delegate);
}
,["id","CPString","id"]), new objj_method(sel_getUid("post:withData:andNotify:"), function $SessionManager__post_withData_andNotify_(self, _cmd, aUrl, json, delegate)
{
    var url = objj_msgSend(self, "_buildUrl:", aUrl);
    var request = objj_msgSend(CPURLRequest, "requestWithURL:", url);
    objj_msgSend(request, "setHTTPMethod:", "POST");
    objj_msgSend(request, "setHTTPBody:", JSON.stringify(json));
    objj_msgSend(self, "_performRequest:withDelegate:", request, delegate);
}
,["id","CPString","id","id"]), new objj_method(sel_getUid("put:withData:andNotify:"), function $SessionManager__put_withData_andNotify_(self, _cmd, aUrl, json, delegate)
{
    var url = objj_msgSend(self, "_buildUrl:", aUrl);
    var request = objj_msgSend(CPURLRequest, "requestWithURL:", url);
    objj_msgSend(request, "setHTTPMethod:", "PUT");
    objj_msgSend(request, "setHTTPBody:", JSON.stringify(json));
    objj_msgSend(self, "_performRequest:withDelegate:", request, delegate);
}
,["id","CPString","id","id"]), new objj_method(sel_getUid("delete:andNotify:"), function $SessionManager__delete_andNotify_(self, _cmd, aUrl, delegate)
{
    var url = objj_msgSend(self, "_buildUrl:", aUrl);
    var request = objj_msgSend(CPURLRequest, "requestWithURL:", url);
    objj_msgSend(request, "setHTTPMethod:", "DELETE");
    objj_msgSend(self, "_performRequest:withDelegate:", request, delegate);
}
,["id","CPString","id"]), new objj_method(sel_getUid("loginWithUsername:andPassword:"), function $SessionManager__loginWithUsername_andPassword_(self, _cmd, aUsername, aPassword)
{
    CPLog("Login: %@ %@", aUsername, aPassword);
    self.currentResponseHandler = sel_getUid("loginResponseHandler:forData:");
    objj_msgSend(self, "post:withData:andNotify:", "/sessions", {username: aUsername, password: aPassword}, self);
}
,["void","CPString","CPString"]), new objj_method(sel_getUid("register:withPassword:andEmail:"), function $SessionManager__register_withPassword_andEmail_(self, _cmd, aUsername, aPassword, anEmail)
{
    CPLog("Register: %@ %@ %@", aUsername, aPassword, anEmail);
    self.currentResponseHandler = sel_getUid("registerResponseHandler:forData:");
    objj_msgSend(self, "post:withData:andNotify:", "/users", {username: aUsername, password: aPassword, email: anEmail}, self);
}
,["void","CPString","CPString","CPString"]), new objj_method(sel_getUid("changePassword:forUser:"), function $SessionManager__changePassword_forUser_(self, _cmd, aPassword, aUsername)
{
    var hash = objj_msgSend(HashFragment, "fragmentAsObject");
    CPLog("ChangePassword: %@ %@ %@", hash.validateUsername, aPassword, hash.forgotPassword);
    self.currentResponseHandler = sel_getUid("submitUsernameResponseHandler:forData:");
    objj_msgSend(self, "post:withData:andNotify:", "/users/" + hash.validateUsername + "/password", {name: hash.validateUsername, password: aPassword, validationToken: hash.forgotPassword}, self);
}
,["void","CPString","CPString"]), new objj_method(sel_getUid("requestForgottenPasswordForUser:andEmail:"), function $SessionManager__requestForgottenPasswordForUser_andEmail_(self, _cmd, aUsername, anEmail)
{
    CPLog("ForgotPassword: %@ %@", aUsername, anEmail);
    self.currentResponseHandler = sel_getUid("forgotPasswordResponseHandler:forData:");
    objj_msgSend(self, "post:withData:andNotify:", "/users/" + aUsername + "/forgotPassword", {name: aUsername, email: anEmail}, self);
}
,["void","CPString","CPString"]), new objj_method(sel_getUid("validateUser:withToken:"), function $SessionManager__validateUser_withToken_(self, _cmd, aUsername, aToken)
{
    CPLog("Validating User: %@ %@", aUsername, aToken);
    self.currentResponseHandler = sel_getUid("validationResponseHandler:forData:");
    objj_msgSend(self, "post:withData:andNotify:", "/users/" + aUsername + "/validation", {name: aUsername, validationToken: aToken}, self);
    objj_msgSend(HashFragment, "clearFragment");
}
,["void","CPString","CPString"]), new objj_method(sel_getUid("logout"), function $SessionManager__logout(self, _cmd)
{
    CPLog("Logout");
    self.currentResponseHandler = sel_getUid("nullResponseHandler:forData:");
    objj_msgSend(self, "delete:andNotify:", "/sessions/current", self);
    objj_msgSend(self, "clearAuthToken");
    objj_msgSend(self, "getUserData");
}
,["void"]), new objj_method(sel_getUid("connection:didFailWithError:"), function $SessionManager__connection_didFailWithError_(self, _cmd, connection, error)
{
    CPLog("Error: %@", error);
}
,["void","CPURLConnection","id"]), new objj_method(sel_getUid("connection:didReceiveResponse:"), function $SessionManager__connection_didReceiveResponse_(self, _cmd, connection, response)
{
    self.currentStatusCode = objj_msgSend(response, "statusCode");
}
,["void","CPURLConnection","CPHTTPURLResponse"]), new objj_method(sel_getUid("connection:didReceiveData:"), function $SessionManager__connection_didReceiveData_(self, _cmd, connection, data)
{
    self.currentData = data;
}
,["void","CPURLConnection","CPString"]), new objj_method(sel_getUid("connectionDidFinishLoading:"), function $SessionManager__connectionDidFinishLoading_(self, _cmd, connection)
{
    if (self.currentData.length > 200)
    {
        self.currentData = "Some weird internal error happened.";
    }
    objj_msgSend(self, "performSelector:withObject:withObject:", self.currentResponseHandler, self.currentStatusCode, self.currentData);
}
,["void","CPURLConnection"]), new objj_method(sel_getUid("connectionDidReceiveAuthenticationChallenge:"), function $SessionManager__connectionDidReceiveAuthenticationChallenge_(self, _cmd, connection)
{
    objj_msgSend(self, "clearAuthToken");
    objj_msgSend(self, "getUserData");
    objj_msgSend(self, "showLoginWindow");
    objj_msgSend(objj_msgSend(self, "view"), "setCustomMessage:", "You need to log in to do this");
    objj_msgSend(objj_msgSend(self, "view"), "update");
}
,["void","id"]), new objj_method(sel_getUid("loginWithGithub"), function $SessionManager__loginWithGithub(self, _cmd)
{
    var queryString = objj_msgSend(URLQueryString, "serialize:", {client_id: GITHUB_CLIENT_ID, scope: "gist,user:email"});
    var request = objj_msgSend(CPString, "stringWithFormat:", "https://github.com/login/oauth/authorize?%@", queryString);
    popupwindow(request, "asd", 1024, 768);
}
,["void"]), new objj_method(sel_getUid("showLoginWindow"), function $SessionManager__showLoginWindow(self, _cmd)
{
    if (objj_msgSend(self, "authToken").length == 0)
    {
        objj_msgSend(objj_msgSend(DesktopManager, "instance"), "pushTopViewController:", self);
        objj_msgSend(objj_msgSend(self, "view"), "setState:", objj_msgSend(SessionWindow, "loginState"));
    }
    else
    {
        objj_msgSend(objj_msgSend(DesktopManager, "instance"), "pushTopViewController:", self);
        objj_msgSend(objj_msgSend(self, "view"), "setState:", objj_msgSend(SessionWindow, "logoutState"));
    }
}
,["void"]), new objj_method(sel_getUid("showChangePasswordWindow"), function $SessionManager__showChangePasswordWindow(self, _cmd)
{
    objj_msgSend(objj_msgSend(DesktopManager, "instance"), "pushTopViewController:", self);
    objj_msgSend(objj_msgSend(self, "view"), "setState:", objj_msgSend(SessionWindow, "changePasswordState"));
    objj_msgSend(HashFragment, "clearFragment");
}
,["void"]), new objj_method(sel_getUid("cancelButtonClicked:"), function $SessionManager__cancelButtonClicked_(self, _cmd, sender)
{
    objj_msgSend(objj_msgSend(DesktopManager, "instance"), "removeViewController:", self);
}
,["id","id"]), new objj_method(sel_getUid("loginButtonClicked:"), function $SessionManager__loginButtonClicked_(self, _cmd, sender)
{
    objj_msgSend(self, "loginWithUsername:andPassword:", objj_msgSend(objj_msgSend(self, "view"), "username"), objj_msgSend(objj_msgSend(self, "view"), "password"));
    objj_msgSend(objj_msgSend(self, "view"), "setState:", objj_msgSend(SessionWindow, "waitingState"));
}
,["id","id"]), new objj_method(sel_getUid("logoutButtonClicked:"), function $SessionManager__logoutButtonClicked_(self, _cmd, sender)
{
    objj_msgSend(self, "logout");
    objj_msgSend(objj_msgSend(DesktopManager, "instance"), "removeViewController:", self);
}
,["id","id"]), new objj_method(sel_getUid("registerButtonClicked:"), function $SessionManager__registerButtonClicked_(self, _cmd, sender)
{
    objj_msgSend(self, "register:withPassword:andEmail:", objj_msgSend(objj_msgSend(self, "view"), "username"), objj_msgSend(objj_msgSend(self, "view"), "password"), objj_msgSend(objj_msgSend(self, "view"), "email"));
    objj_msgSend(objj_msgSend(self, "view"), "setState:", objj_msgSend(SessionWindow, "waitingState"));
}
,["id","id"]), new objj_method(sel_getUid("submitUsernameButtonClicked:"), function $SessionManager__submitUsernameButtonClicked_(self, _cmd, sender)
{
    objj_msgSend(self, "requestForgottenPasswordForUser:andEmail:", objj_msgSend(objj_msgSend(self, "view"), "username"), objj_msgSend(objj_msgSend(self, "view"), "email"));
    objj_msgSend(objj_msgSend(self, "view"), "setState:", objj_msgSend(SessionWindow, "waitingState"));
}
,["id","id"]), new objj_method(sel_getUid("changePasswordButtonClicked:"), function $SessionManager__changePasswordButtonClicked_(self, _cmd, sender)
{
    objj_msgSend(self, "changePassword:forUser:", objj_msgSend(objj_msgSend(self, "view"), "password"), objj_msgSend(objj_msgSend(self, "view"), "username"));
    objj_msgSend(objj_msgSend(self, "view"), "setState:", objj_msgSend(SessionWindow, "waitingState"));
}
,["id","id"]), new objj_method(sel_getUid("sessionStatusMenuItem"), function $SessionManager__sessionStatusMenuItem(self, _cmd)
{
    return self.statusMenuItem;
}
,["SessionMenuItem"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("instance"), function $SessionManager__instance(self, _cmd)
{
    if (!session)
    {
        session = objj_msgSend(objj_msgSend(SessionManager, "alloc"), "init");
        objj_msgSend(CPURLConnection, "setClassDelegate:", session);
    }
    return session;
}
,["SessionManager"])]);
}p;13;MenuManager.jt;2365;@STATIC;1.0;I;23;Foundation/Foundation.jI;15;AppKit/AppKit.ji;19;CPArray+Additions.jt;2274;objj_executeFile("Foundation/Foundation.j", NO);objj_executeFile("AppKit/AppKit.j", NO);objj_executeFile("CPArray+Additions.j", YES);var menuManagerInstance;
{var the_class = objj_allocateClassPair(CPObject, "MenuManager"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("leftStack"), new objj_ivar("centerStack"), new objj_ivar("rightStack")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("init"), function $MenuManager__init(self, _cmd)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("MenuManager").super_class }, "init");
    if (self)
    {
        self.leftStack = objj_msgSend(CPArray, "array");
        self.centerStack = objj_msgSend(CPArray, "array");
        self.rightStack = objj_msgSend(CPArray, "array");
    }
    return self;
}
,["id"]), new objj_method(sel_getUid("leftStack"), function $MenuManager__leftStack(self, _cmd)
{
    return self.leftStack;
}
,["CPArray"]), new objj_method(sel_getUid("centerStack"), function $MenuManager__centerStack(self, _cmd)
{
    return self.centerStack;
}
,["CPArray"]), new objj_method(sel_getUid("rightStack"), function $MenuManager__rightStack(self, _cmd)
{
    return self.rightStack;
}
,["CPArray"]), new objj_method(sel_getUid("refreshMenu"), function $MenuManager__refreshMenu(self, _cmd)
{
    var mainMenu = objj_msgSend(objj_msgSend(CPApplication, "sharedApplication"), "mainMenu");
    while (objj_msgSend(mainMenu, "countOfItems") > 0)
    {
        objj_msgSend(mainMenu, "removeItemAtIndex:", 0);
    }
    objj_msgSend(mainMenu, "removeAllItems");
addItem = function(menuItem)
    {
        objj_msgSend(mainMenu, "addItem:", menuItem);
    }
    objj_msgSend(self.leftStack, "foreach:", addItem);
    objj_msgSend(self.centerStack, "foreach:", addItem);
    objj_msgSend(mainMenu, "addItem:", objj_msgSend(CPMenuItem, "separatorItem"));
    objj_msgSend(self.rightStack, "foreach:", addItem);
}
,["void"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("instance"), function $MenuManager__instance(self, _cmd)
{
    if (!menuManagerInstance)
    {
        menuManagerInstance = objj_msgSend(objj_msgSend(MenuManager, "alloc"), "init");
    }
    return menuManagerInstance;
}
,["MenuManager"])]);
}p;29;BunnyLabsIconViewController.jt;1368;@STATIC;1.0;I;23;Foundation/Foundation.jI;15;AppKit/AppKit.jt;1301;objj_executeFile("Foundation/Foundation.j", NO);objj_executeFile("AppKit/AppKit.j", NO);{var the_class = objj_allocateClassPair(CPViewController, "BunnyLabsIconViewController"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("init"), function $BunnyLabsIconViewController__init(self, _cmd)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("BunnyLabsIconViewController").super_class }, "init");
    if (self)
    {
        var bundle = objj_msgSend(CPBundle, "mainBundle");
        var file = objj_msgSend(bundle, "pathForResource:", "Images/bunnylabs.png");
        var image = objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:", file);
        var imageView = objj_msgSend(objj_msgSend(CPImageView, "alloc"), "initWithFrame:", CGRectMake(0, 0, 200, 200));
        objj_msgSend(imageView, "setImage:", image);
        objj_msgSend(imageView, "setAutoresizingMask:", CPViewMinXMargin | CPViewMaxXMargin | CPViewMinYMargin | CPViewMaxYMargin);
        objj_msgSend(self, "setView:", imageView);
    }
    return self;
}
,["id"]), new objj_method(sel_getUid("breadcrumbName"), function $BunnyLabsIconViewController__breadcrumbName(self, _cmd)
{
    return "Desktop";
}
,["CPString"])]);
}p;16;BunnyTableView.jt;4233;@STATIC;1.0;I;23;Foundation/Foundation.jI;15;AppKit/AppKit.jt;4166;objj_executeFile("Foundation/Foundation.j", NO);objj_executeFile("AppKit/AppKit.j", NO);{var the_class = objj_allocateClassPair(CPView, "BunnyTableView"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("scrollView"), new objj_ivar("tableView"), new objj_ivar("reloadButton")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("init"), function $BunnyTableView__init(self, _cmd)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("BunnyTableView").super_class }, "initWithFrame:", CGRectMake(0, 0, 100, 100));
    if (self)
    {
        self.tableView = objj_msgSend(objj_msgSend(CPTableView, "alloc"), "init");
        objj_msgSend(self.tableView, "setColumnAutoresizingStyle:", CPTableViewUniformColumnAutoresizingStyle);
        objj_msgSend(self.tableView, "setAlternatingRowBackgroundColors:", [objj_msgSend(CPColor, "grayColor"), objj_msgSend(CPColor, "whiteColor")]);
        self.reloadButton = objj_msgSend(CPButton, "buttonWithTitle:", "Reload");
        objj_msgSend(self.reloadButton, "setFrameOrigin:", CGPointMake(3, 3));
        objj_msgSend(self.reloadButton, "setTarget:", self);
        objj_msgSend(self.reloadButton, "setAction:", sel_getUid("reloadButtonClicked:"));
        objj_msgSend(self, "addSubview:", self.reloadButton);
        self.scrollView = objj_msgSend(objj_msgSend(CPScrollView, "alloc"), "initWithFrame:", CGRectMake(0, 30, 100, 70));
        objj_msgSend(self.scrollView, "setAutoresizingMask:", CPViewWidthSizable | CPViewHeightSizable);
        objj_msgSend(self.scrollView, "setDocumentView:", self.tableView);
        objj_msgSend(self, "addSubview:", self.scrollView);
    }
    return self;
}
,["id"]), new objj_method(sel_getUid("reloadButtonClicked:"), function $BunnyTableView__reloadButtonClicked_(self, _cmd, sender)
{
    if (objj_msgSend(objj_msgSend(self, "delegate"), "respondsToSelector:", sel_getUid("reloadButtonClicked:")))
    {
        objj_msgSend(objj_msgSend(self, "delegate"), "reloadButtonClicked:", self);
    }
}
,["void","id"]), new objj_method(sel_getUid("reloadData"), function $BunnyTableView__reloadData(self, _cmd)
{
    objj_msgSend(self.tableView, "reloadData");
}
,["void"]), new objj_method(sel_getUid("addColumnNamed:"), function $BunnyTableView__addColumnNamed_(self, _cmd, anIdentifier)
{
    var column = objj_msgSend(objj_msgSend(CPTableColumn, "alloc"), "initWithIdentifier:", anIdentifier);
    objj_msgSend(objj_msgSend(column, "headerView"), "setStringValue:", anIdentifier);
    objj_msgSend(column, "setResizingMask:", CPTableColumnAutoresizingMask | CPTableColumnUserResizingMask);
    objj_msgSend(column, "setEditable:", YES);
    objj_msgSend(self.tableView, "addTableColumn:", column);
}
,["void","CPString"]), new objj_method(sel_getUid("addBooleanColumnNamed:"), function $BunnyTableView__addBooleanColumnNamed_(self, _cmd, anIdentifier)
{
    var column = objj_msgSend(objj_msgSend(CPTableColumn, "alloc"), "initWithIdentifier:", anIdentifier);
    objj_msgSend(objj_msgSend(column, "headerView"), "setStringValue:", anIdentifier);
    objj_msgSend(column, "setResizingMask:", CPTableColumnNoResizing);
    objj_msgSend(column, "setEditable:", YES);
    objj_msgSend(column, "setMaxWidth:", 50);
    objj_msgSend(column, "setDataView:", objj_msgSend(objj_msgSend(CPCheckBox, "alloc"), "init"));
    objj_msgSend(self.tableView, "addTableColumn:", column);
}
,["void","CPString"]), new objj_method(sel_getUid("setDataSource:"), function $BunnyTableView__setDataSource_(self, _cmd, aDataSource)
{
    objj_msgSend(self.tableView, "setDataSource:", aDataSource);
}
,["void","id"]), new objj_method(sel_getUid("setDelegate:"), function $BunnyTableView__setDelegate_(self, _cmd, aDelegate)
{
    objj_msgSend(self.tableView, "setDelegate:", aDelegate);
}
,["void","id"]), new objj_method(sel_getUid("delegate"), function $BunnyTableView__delegate(self, _cmd)
{
    return objj_msgSend(self.tableView, "delegate");
}
,["id"]), new objj_method(sel_getUid("dataSource"), function $BunnyTableView__dataSource(self, _cmd)
{
    return objj_msgSend(self.tableView, "dataSource");
}
,["id"])]);
}p;19;CPArray+Additions.jt;1409;@STATIC;1.0;I;23;Foundation/Foundation.jt;1362;objj_executeFile("Foundation/Foundation.j", NO);{
var the_class = objj_getClass("CPArray")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPArray\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("last"), function $CPArray__last(self, _cmd)
{
    return objj_msgSend(self, "objectAtIndex:", objj_msgSend(self, "count") - 1);
}
,["id"]), new objj_method(sel_getUid("first"), function $CPArray__first(self, _cmd)
{
    return objj_msgSend(self, "objectAtIndex:", 0);
}
,["id"]), new objj_method(sel_getUid("filterWithPredicate:"), function $CPArray__filterWithPredicate_(self, _cmd, predicate)
{
    var i = 0,
        newArray = [],
        currItem,
        count = objj_msgSend(self, "count");
    for (i = 0; i < count; i++)
    {
        currItem = objj_msgSend(self, "objectAtIndex:", i);
        if (predicate(currItem))
        {
            newArray.push(currItem);
        }
    }
    return newArray;
}
,["CPArray","Function"]), new objj_method(sel_getUid("foreach:"), function $CPArray__foreach_(self, _cmd, action)
{
    var i = 0,
        newArray = [],
        currItem,
        count = objj_msgSend(self, "count");
    for (i = 0; i < count; i++)
    {
        currItem = objj_msgSend(self, "objectAtIndex:", i);
        action(currItem);
    }
}
,["void","Function"])]);
}p;16;DesktopManager.jt;7172;@STATIC;1.0;I;23;Foundation/Foundation.jI;15;AppKit/AppKit.ji;13;MenuManager.ji;19;CPArray+Additions.jt;7063;objj_executeFile("Foundation/Foundation.j", NO);objj_executeFile("AppKit/AppKit.j", NO);objj_executeFile("MenuManager.j", YES);objj_executeFile("CPArray+Additions.j", YES);var desktopInstance;
{var the_class = objj_allocateClassPair(CPButton, "BreadcrumbButton"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("representedObject")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("representedObject"), function $BreadcrumbButton__representedObject(self, _cmd)
{
    return self.representedObject;
}
,["id"]), new objj_method(sel_getUid("setRepresentedObject:"), function $BreadcrumbButton__setRepresentedObject_(self, _cmd, newValue)
{
    self.representedObject = newValue;
}
,["void","id"])]);
}{var the_class = objj_allocateClassPair(CPObject, "DesktopManager"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("topWindow"), new objj_ivar("contentView"), new objj_ivar("viewControllerStack")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("init"), function $DesktopManager__init(self, _cmd)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("DesktopManager").super_class }, "init");
    if (self)
    {
        self.topWindow = objj_msgSend(objj_msgSend(CPApplication, "sharedApplication"), "mainWindow");
        self.contentView = objj_msgSend(self.topWindow, "contentView");
        self.viewControllerStack = objj_msgSend(CPArray, "array");
    }
    return self;
}
,["id"]), new objj_method(sel_getUid("desktopResized"), function $DesktopManager__desktopResized(self, _cmd)
{
    if (self.viewControllerStack.length != 0 && objj_msgSend(objj_msgSend(self.viewControllerStack, "last"), "respondsToSelector:", sel_getUid("desktopDidResizeToRect:")))
    {
        objj_msgSend(objj_msgSend(self.viewControllerStack, "last"), "desktopDidResizeToRect:", objj_msgSend(self.contentView, "frame"));
    }
    objj_msgSend(objj_msgSend(objj_msgSend(MenuManager, "instance"), "centerStack"), "removeAllObjects");
    var i = 0;
    for (i = 0; i < self.viewControllerStack.length; i++)
    {
        var name = self.viewControllerStack[i].isa.name;
        if (name === "BunnyLabsIconViewController")
        {
            continue;
        }
        if (objj_msgSend(self.viewControllerStack[i], "respondsToSelector:", sel_getUid("breadcrumbName")))
        {
            name = objj_msgSend(self.viewControllerStack[i], "breadcrumbName");
        }
        var title = "[" + name + "]";
        var layer = objj_msgSend(objj_msgSend(CPMenuItem, "alloc"), "initWithTitle:action:keyEquivalent:", "", nil, "");
        var button = objj_msgSend(BreadcrumbButton, "buttonWithTitle:", title);
        objj_msgSend(button, "setAction:", sel_getUid("breadcrumbMoveToTop:"));
        objj_msgSend(button, "setTarget:", self);
        objj_msgSend(button, "setRepresentedObject:", self.viewControllerStack[i]);
        var menu = objj_msgSend(objj_msgSend(CPMenu, "alloc"), "init");
        var menuCloseItem = objj_msgSend(objj_msgSend(CPMenuItem, "alloc"), "initWithTitle:action:keyEquivalent:", "Close", sel_getUid("breadcrumbClose:"), "");
        objj_msgSend(menuCloseItem, "setTarget:", self);
        objj_msgSend(menuCloseItem, "setRepresentedObject:", self.viewControllerStack[i]);
        objj_msgSend(menu, "addItem:", menuCloseItem);
        objj_msgSend(button, "setMenu:", menu);
        objj_msgSend(layer, "setView:", button);
        objj_msgSend(objj_msgSend(objj_msgSend(MenuManager, "instance"), "centerStack"), "addObject:", layer);
    }
    objj_msgSend(objj_msgSend(MenuManager, "instance"), "refreshMenu");
}
,["void"]), new objj_method(sel_getUid("breadcrumbMoveToTop:"), function $DesktopManager__breadcrumbMoveToTop_(self, _cmd, sender)
{
    objj_msgSend(self, "pushTopViewController:", objj_msgSend(sender, "representedObject"));
}
,["void","id"]), new objj_method(sel_getUid("breadcrumbClose:"), function $DesktopManager__breadcrumbClose_(self, _cmd, sender)
{
    objj_msgSend(self, "removeViewController:", objj_msgSend(sender, "representedObject"));
}
,["void","id"]), new objj_method(sel_getUid("setDefaultButton:"), function $DesktopManager__setDefaultButton_(self, _cmd, aButton)
{
    objj_msgSend(self.topWindow, "setDefaultButton:", aButton);
}
,["void","CPButton"]), new objj_method(sel_getUid("defaultButton"), function $DesktopManager__defaultButton(self, _cmd)
{
    return objj_msgSend(self.topWindow, "defaultButton");
}
,["CPButton"]), new objj_method(sel_getUid("topViewController"), function $DesktopManager__topViewController(self, _cmd)
{
    if (self.viewControllerStack.length != 0)
    {
        return objj_msgSend(self.viewControllerStack, "last");
    }
    return nil;
}
,["CPViewController"]), new objj_method(sel_getUid("pushTopViewController:"), function $DesktopManager__pushTopViewController_(self, _cmd, aViewController)
{
    objj_msgSend(self, "_remove:", aViewController);
    self.viewControllerStack = objj_msgSend(self.viewControllerStack, "arrayByAddingObject:", aViewController);
    objj_msgSend(self, "_update");
}
,["void","CPViewController"]), new objj_method(sel_getUid("removeViewController:"), function $DesktopManager__removeViewController_(self, _cmd, aViewController)
{
    objj_msgSend(self, "_remove:", aViewController);
    objj_msgSend(self, "_update");
}
,["void","CPViewController"]), new objj_method(sel_getUid("_remove:"), function $DesktopManager___remove_(self, _cmd, aViewController)
{
    self.viewControllerStack = objj_msgSend(self.viewControllerStack, "filterWithPredicate:", function(item)
    {
        return item !== aViewController;
    });
}
,["void","CPViewController"]), new objj_method(sel_getUid("_update"), function $DesktopManager___update(self, _cmd)
{
    while (objj_msgSend(self.contentView, "subviews").length != 0)
    {
        objj_msgSend(objj_msgSend(self.contentView, "subviews")[0], "removeFromSuperview");
    }
    if (self.viewControllerStack.length != 0)
    {
        var currentViewController = objj_msgSend(self.viewControllerStack, "last");
        objj_msgSend(self.contentView, "addSubview:", objj_msgSend(currentViewController, "view"));
        objj_msgSend(objj_msgSend(currentViewController, "view"), "setCenter:", objj_msgSend(self.contentView, "center"));
        if (objj_msgSend(objj_msgSend(self.viewControllerStack, "last"), "respondsToSelector:", sel_getUid("viewFillsDesktop")) && objj_msgSend(objj_msgSend(self.viewControllerStack, "last"), "viewFillsDesktop"))
        {
            objj_msgSend(objj_msgSend(currentViewController, "view"), "setFrame:", objj_msgSend(self.contentView, "frame"));
        }
    }
    objj_msgSend(self, "desktopResized");
}
,["void"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("instance"), function $DesktopManager__instance(self, _cmd)
{
    if (!desktopInstance)
    {
        desktopInstance = objj_msgSend(objj_msgSend(DesktopManager, "alloc"), "init");
    }
    return desktopInstance;
}
,["DesktopManager"])]);
}p;10;IconView.jt;2488;@STATIC;1.0;I;23;Foundation/Foundation.jI;15;AppKit/AppKit.ji;17;ApplicationInfo.jt;2399;objj_executeFile("Foundation/Foundation.j", NO);objj_executeFile("AppKit/AppKit.j", NO);objj_executeFile("ApplicationInfo.j", YES);{var the_class = objj_allocateClassPair(CPView, "IconView"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_imageView"), new objj_ivar("_textField")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function $IconView__initWithCoder_(self, _cmd, aCoder)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("IconView").super_class }, "initWithCoder:", aCoder);
    if (self)
    {
        self._imageView = objj_msgSend(objj_msgSend(CPImageView, "alloc"), "initWithFrame:", CGRectMake(25, 5, 100, 100));
        objj_msgSend(self._imageView, "setImageScaling:", CPScaleProportionally);
        objj_msgSend(self, "addSubview:", self._imageView);
        var textRect = CGRectMake(5, 107, 140, 40);
        self._textField = objj_msgSend(objj_msgSend(CPTextField, "alloc"), "initWithFrame:", textRect);
        objj_msgSend(self._textField, "setLineBreakMode:", CPLineBreakByWordWrapping);
        objj_msgSend(self._textField, "setAlignment:", CPCenterTextAlignment);
        objj_msgSend(self._textField, "setVerticalAlignment:", CPCenterVerticalTextAlignment);
        objj_msgSend(self._textField, "setTextShadowColor:", objj_msgSend(CPColor, "whiteColor"));
        objj_msgSend(self._textField, "setTextShadowOffset:", CGSizeMake(1, 1));
        var font = objj_msgSend(CPFont, "boldFontWithName:size:", "Helvetica", 12);
        objj_msgSend(self._textField, "setFont:", font);
        objj_msgSend(self._textField, "setTextColor:", objj_msgSend(CPColor, "blackColor"));
        objj_msgSend(self, "addSubview:", self._textField);
    }
    return self;
}
,["id","CPCoder"]), new objj_method(sel_getUid("setRepresentedObject:"), function $IconView__setRepresentedObject_(self, _cmd, appInfo)
{
    if (appInfo)
    {
        objj_msgSend(self._textField, "setStringValue:", objj_msgSend(appInfo, "name"));
        objj_msgSend(self._imageView, "setImage:", objj_msgSend(appInfo, "icon"));
    }
}
,["void","ApplicationInfo"]), new objj_method(sel_getUid("setSelected:"), function $IconView__setSelected_(self, _cmd, isSelected)
{
    objj_msgSend(self, "setBackgroundColor:", isSelected ? objj_msgSend(CPColor, "grayColor") : nil);
}
,["void","BOOL"])]);
}p;20;IconCollectionView.jt;1614;@STATIC;1.0;I;23;Foundation/Foundation.jI;15;AppKit/AppKit.ji;17;ApplicationInfo.ji;10;IconView.jt;1510;objj_executeFile("Foundation/Foundation.j", NO);objj_executeFile("AppKit/AppKit.j", NO);objj_executeFile("ApplicationInfo.j", YES);objj_executeFile("IconView.j", YES);{var the_class = objj_allocateClassPair(CPCollectionView, "IconCollectionView"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("_prepare"), function $IconCollectionView___prepare(self, _cmd)
{
    objj_msgSend(self, "setMinItemSize:", CGSizeMake(150, 150));
    objj_msgSend(self, "setMaxItemSize:", CGSizeMake(150, 150));
    var itemPrototype = objj_msgSend(objj_msgSend(CPCollectionViewItem, "alloc"), "init"),
        iconView = objj_msgSend(objj_msgSend(IconView, "alloc"), "initWithFrame:", CGRectMakeZero());
    objj_msgSend(itemPrototype, "setView:", iconView);
    objj_msgSend(self, "setItemPrototype:", itemPrototype);
}
,["void"]), new objj_method(sel_getUid("init"), function $IconCollectionView__init(self, _cmd)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("IconCollectionView").super_class }, "init");
    if (self)
    {
        objj_msgSend(self, "_prepare");
    }
    return self;
}
,["id"]), new objj_method(sel_getUid("initWithFrame:"), function $IconCollectionView__initWithFrame_(self, _cmd, frame)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("IconCollectionView").super_class }, "initWithFrame:", frame);
{
    objj_msgSend(self, "_prepare");
}
    return self;
}
,["id","CGRect"])]);
}p;22;Utils/URLQueryString.jt;1640;@STATIC;1.0;I;23;Foundation/Foundation.jt;1593;objj_executeFile("Foundation/Foundation.j", NO);{var the_class = objj_allocateClassPair(CPObject, "URLQueryString"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(meta_class, [new objj_method(sel_getUid("deserialize:"), function $URLQueryString__deserialize_(self, _cmd, str)
{
    if (typeof str !== 'string')
    {
        return {};
    }
    str = (str.trim()).replace(/^(\?|#)/, '');
    if (!str)
    {
        return {};
    }
    return ((str.trim()).split('&')).reduce(function(ret, param)
    {
        var parts = (param.replace(/\+/g, ' ')).split('=');
        var key = parts[0];
        var val = parts[1];
        key = decodeURIComponent(key);
        val = val === undefined ? null : decodeURIComponent(val);
        if (!ret.hasOwnProperty(key))
        {
            ret[key] = val;
        }
        else if (Array.isArray(ret[key]))
        {
            ret[key].push(val);
        }
        else
        {
            ret[key] = [ret[key], val];
        }
        return ret;
    }, {});
}
,["id","CPString"]), new objj_method(sel_getUid("serialize:"), function $URLQueryString__serialize_(self, _cmd, obj)
{
    return obj ? ((Object.keys(obj)).map(function(key)
    {
        var val = obj[key];
        if (Array.isArray(val))
        {
            return (val.map(function(val2)
            {
                return encodeURIComponent(key) + '=' + encodeURIComponent(val2);
            })).join('&');
        }
        return encodeURIComponent(key) + '=' + encodeURIComponent(val);
    })).join('&') : '';
}
,["CPString","id"])]);
}p;20;Utils/HashFragment.jt;806;@STATIC;1.0;I;23;Foundation/Foundation.ji;16;URLQueryString.jt;739;objj_executeFile("Foundation/Foundation.j", NO);objj_executeFile("URLQueryString.j", YES);{var the_class = objj_allocateClassPair(CPObject, "HashFragment"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(meta_class, [new objj_method(sel_getUid("fragment"), function $HashFragment__fragment(self, _cmd)
{
    return window.location.hash;
}
,["CPString"]), new objj_method(sel_getUid("fragmentAsObject"), function $HashFragment__fragmentAsObject(self, _cmd)
{
    return objj_msgSend(URLQueryString, "deserialize:", window.location.hash.substring(1));
}
,["id"]), new objj_method(sel_getUid("clearFragment"), function $HashFragment__clearFragment(self, _cmd)
{
    window.location.hash = "";
}
,["void"])]);
}p;32;Applications/TestApp2/TestApp2.jt;2271;@STATIC;1.0;I;23;Foundation/Foundation.jI;15;AppKit/AppKit.jt;2204;objj_executeFile("Foundation/Foundation.j", NO);objj_executeFile("AppKit/AppKit.j", NO);{var the_class = objj_allocateClassPair(CPViewController, "TestApp2ViewController"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("bundle")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithBundle:"), function $TestApp2ViewController__initWithBundle_(self, _cmd, aBundle)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("TestApp2ViewController").super_class }, "init");
    if (self)
    {
        self.bundle = aBundle;
        var file = objj_msgSend(self.bundle, "pathForResource:", "Images/icon.png");
        var image = objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:", file);
        var imageView = objj_msgSend(objj_msgSend(CPImageView, "alloc"), "initWithFrame:", CGRectMake(0, 0, 1280, 960));
        objj_msgSend(imageView, "setImage:", image);
        objj_msgSend(imageView, "setAutoresizingMask:", CPViewMinXMargin | CPViewMaxXMargin | CPViewMinYMargin | CPViewMaxYMargin);
        objj_msgSend(self, "setView:", imageView);
    }
    return self;
}
,["id","CPBundle"]), new objj_method(sel_getUid("breadcrumbName"), function $TestApp2ViewController__breadcrumbName(self, _cmd)
{
    return "Test 2";
}
,["CPString"])]);
}{var the_class = objj_allocateClassPair(CPObject, "TestApp2"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("controller"), new objj_ivar("bundle")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithBundle:"), function $TestApp2__initWithBundle_(self, _cmd, aBundle)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("TestApp2").super_class }, "init");
    if (self)
    {
        self.bundle = aBundle;
    }
    return self;
}
,["id","CPBundle"]), new objj_method(sel_getUid("viewController"), function $TestApp2__viewController(self, _cmd)
{
    if (!self.controller)
    {
        self.controller = objj_msgSend(objj_msgSend(TestApp2ViewController, "alloc"), "initWithBundle:", self.bundle);
    }
    return self.controller;
}
,["CPViewController"])]);
}p;32;Applications/TestApp1/TestApp1.jt;2271;@STATIC;1.0;I;23;Foundation/Foundation.jI;15;AppKit/AppKit.jt;2204;objj_executeFile("Foundation/Foundation.j", NO);objj_executeFile("AppKit/AppKit.j", NO);{var the_class = objj_allocateClassPair(CPViewController, "TestApp1ViewController"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("bundle")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithBundle:"), function $TestApp1ViewController__initWithBundle_(self, _cmd, aBundle)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("TestApp1ViewController").super_class }, "init");
    if (self)
    {
        self.bundle = aBundle;
        var file = objj_msgSend(self.bundle, "pathForResource:", "Images/icon.png");
        var image = objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:", file);
        var imageView = objj_msgSend(objj_msgSend(CPImageView, "alloc"), "initWithFrame:", CGRectMake(0, 0, 1280, 720));
        objj_msgSend(imageView, "setImage:", image);
        objj_msgSend(imageView, "setAutoresizingMask:", CPViewMinXMargin | CPViewMaxXMargin | CPViewMinYMargin | CPViewMaxYMargin);
        objj_msgSend(self, "setView:", imageView);
    }
    return self;
}
,["id","CPBundle"]), new objj_method(sel_getUid("breadcrumbName"), function $TestApp1ViewController__breadcrumbName(self, _cmd)
{
    return "Test 1";
}
,["CPString"])]);
}{var the_class = objj_allocateClassPair(CPObject, "TestApp1"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("controller"), new objj_ivar("bundle")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithBundle:"), function $TestApp1__initWithBundle_(self, _cmd, aBundle)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("TestApp1").super_class }, "init");
    if (self)
    {
        self.bundle = aBundle;
    }
    return self;
}
,["id","CPBundle"]), new objj_method(sel_getUid("viewController"), function $TestApp1__viewController(self, _cmd)
{
    if (!self.controller)
    {
        self.controller = objj_msgSend(objj_msgSend(TestApp1ViewController, "alloc"), "initWithBundle:", self.bundle);
    }
    return self.controller;
}
,["CPViewController"])]);
}p;38;Applications/DesignerApp/ContentView.jt;4402;@STATIC;1.0;I;23;Foundation/Foundation.jI;15;AppKit/AppKit.ji;12;UITreeView.ji;13;ToolBoxView.jt;4300;objj_executeFile("Foundation/Foundation.j", NO);objj_executeFile("AppKit/AppKit.j", NO);objj_executeFile("UITreeView.j", YES);objj_executeFile("ToolBoxView.j", YES);var MINSIDEBARWIDTH = 200;
{var the_class = objj_allocateClassPair(CPSplitView, "ContentView"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("elementList"), new objj_ivar("mainView")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithBundle:"), function $ContentView__initWithBundle_(self, _cmd, bundle)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("ContentView").super_class }, "init");
    if (self)
    {
        objj_msgSend(self, "setBackgroundColor:", objj_msgSend(CPColor, "redColor"));
        objj_msgSend(self, "setAutoresizingMask:", CPViewWidthSizable | CPViewHeightSizable);
        objj_msgSend(self, "setDelegate:", self);
        var file = objj_msgSend(bundle, "pathForResource:", "Images/910.jpg");
        var mainBackground = objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:", file);
        self.elementList = objj_msgSend(objj_msgSend(CPTabView, "alloc"), "init");
        objj_msgSend(self.elementList, "setBackgroundColor:", objj_msgSend(CPColor, "darkGrayColor"));
        var item = objj_msgSend(objj_msgSend(CPTabViewItem, "alloc"), "init");
        objj_msgSend(item, "setLabel:", "Toolbox");
        objj_msgSend(item, "setView:", objj_msgSend(objj_msgSend(ToolBoxView, "alloc"), "initWithBundle:", bundle));
        objj_msgSend(self.elementList, "addTabViewItem:", item);
        var item = objj_msgSend(objj_msgSend(CPTabViewItem, "alloc"), "init");
        objj_msgSend(item, "setLabel:", "UI Tree");
        objj_msgSend(item, "setView:", objj_msgSend(objj_msgSend(UITreeView, "alloc"), "init"));
        objj_msgSend(self.elementList, "addTabViewItem:", item);
        objj_msgSend(self, "addSubview:", self.elementList);
        self.mainView = objj_msgSend(objj_msgSend(CPView, "alloc"), "init");
        objj_msgSend(self.mainView, "setBackgroundColor:", objj_msgSend(CPColor, "colorWithPatternImage:", mainBackground));
        objj_msgSend(self, "addSubview:", self.mainView);
        objj_msgSend(self, "setPosition:ofDividerAtIndex:", MINSIDEBARWIDTH, 0);
    }
    return self;
}
,["id","CPBundle"]), new objj_method(sel_getUid("mainView"), function $ContentView__mainView(self, _cmd)
{
    return self.mainView;
}
,["CPColor"]), new objj_method(sel_getUid("elementList"), function $ContentView__elementList(self, _cmd)
{
    return self.elementList;
}
,["CPColor"]), new objj_method(sel_getUid("splitView:constrainMinCoordinate:ofSubviewAt:"), function $ContentView__splitView_constrainMinCoordinate_ofSubviewAt_(self, _cmd, aSplitView, proposedMin, subviewIndex)
{
    if (subviewIndex == 0)
    {
        return MINSIDEBARWIDTH;
    }
    return proposedMin;
}
,["float","CPSplitView","float","int"]), new objj_method(sel_getUid("splitView:constrainMaxCoordinate:ofSubviewAt:"), function $ContentView__splitView_constrainMaxCoordinate_ofSubviewAt_(self, _cmd, aSplitView, proposedMax, subviewIndex)
{
    if (subviewIndex == 0)
    {
        return objj_msgSend(aSplitView, "frame").size.width / 3;
    }
    return proposedMax;
}
,["float","CPSplitView","float","int"]), new objj_method(sel_getUid("splitView:resizeSubviewsWithOldSize:"), function $ContentView__splitView_resizeSubviewsWithOldSize_(self, _cmd, aSplitView, oldSize)
{
    var splitViewSize = objj_msgSend(aSplitView, "frame").size;
    var width = objj_msgSend(self.elementList, "frame").size.width;
    if (width > objj_msgSend(aSplitView, "frame").size.width / 3)
    {
        width = objj_msgSend(aSplitView, "frame").size.width / 3;
    }
    if (width < MINSIDEBARWIDTH)
    {
        width = MINSIDEBARWIDTH;
    }
    if (oldSize.width == 0)
    {
        width = MINSIDEBARWIDTH;
    }
    var leftSize = objj_msgSend(aSplitView, "frame").size;
    leftSize.width = width;
    objj_msgSend(self.elementList, "setFrameSize:", leftSize);
    objj_msgSend(self.mainView, "setFrame:", CGRectMake(width + objj_msgSend(aSplitView, "dividerThickness"), 0, splitViewSize.width - objj_msgSend(aSplitView, "dividerThickness") - width, splitViewSize.height));
}
,["void","CPSplitView","CGSize"])]);
}p;38;Applications/DesignerApp/DesignerApp.jt;1111;@STATIC;1.0;I;23;Foundation/Foundation.jI;15;AppKit/AppKit.ji;27;DesignerAppViewController.jt;1012;objj_executeFile("Foundation/Foundation.j", NO);objj_executeFile("AppKit/AppKit.j", NO);objj_executeFile("DesignerAppViewController.j", YES);{var the_class = objj_allocateClassPair(CPObject, "DesignerApp"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("controller"), new objj_ivar("bundle")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithBundle:"), function $DesignerApp__initWithBundle_(self, _cmd, aBundle)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("DesignerApp").super_class }, "init");
    if (self)
    {
        self.bundle = aBundle;
    }
    return self;
}
,["id","CPBundle"]), new objj_method(sel_getUid("viewController"), function $DesignerApp__viewController(self, _cmd)
{
    if (!self.controller)
    {
        self.controller = objj_msgSend(objj_msgSend(DesignerAppViewController, "alloc"), "initWithBundle:", self.bundle);
    }
    return self.controller;
}
,["CPViewController"])]);
}p;42;Applications/DesignerApp/DesignerAppView.jt;2771;@STATIC;1.0;I;23;Foundation/Foundation.jI;15;AppKit/AppKit.ji;13;ContentView.jt;2686;objj_executeFile("Foundation/Foundation.j", NO);objj_executeFile("AppKit/AppKit.j", NO);objj_executeFile("ContentView.j", YES);var TOPBARHEIGHT = 30;
{var the_class = objj_allocateClassPair(CPSplitView, "DesignerAppView"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("topBar"), new objj_ivar("splitView"), new objj_ivar("elementList"), new objj_ivar("mainView")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithBundle:"), function $DesignerAppView__initWithBundle_(self, _cmd, aBundle)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("DesignerAppView").super_class }, "initWithFrame:", CPRectMake(0, 0, 500, 500));
    if (self)
    {
        objj_msgSend(self, "setBackgroundColor:", objj_msgSend(CPColor, "redColor"));
        objj_msgSend(self, "setAutoresizingMask:", CPViewWidthSizable | CPViewHeightSizable);
        objj_msgSend(self, "setDelegate:", self);
        self.topBar = objj_msgSend(objj_msgSend(CPView, "alloc"), "init");
        objj_msgSend(self.topBar, "setBackgroundColor:", objj_msgSend(CPColor, "lightGrayColor"));
        objj_msgSend(self, "addSubview:", self.topBar);
        self.splitView = objj_msgSend(objj_msgSend(ContentView, "alloc"), "initWithBundle:", aBundle);
        self.elementList = objj_msgSend(self.splitView, "elementList");
        self.mainView = objj_msgSend(self.splitView, "mainView");
        objj_msgSend(self.splitView, "setBackgroundColor:", objj_msgSend(CPColor, "grayColor"));
        objj_msgSend(self, "addSubview:", self.splitView);
        objj_msgSend(self, "setVertical:", NO);
    }
    return self;
}
,["id","CPBundle"]), new objj_method(sel_getUid("splitView:constrainSplitPosition:ofSubviewAt:"), function $DesignerAppView__splitView_constrainSplitPosition_ofSubviewAt_(self, _cmd, aSpiltView, proposedPosition, subviewIndex)
{
    if (subviewIndex == 0)
    {
        return TOPBARHEIGHT;
    }
    return proposedPosition;
}
,["float","CPSplitView","float","int"]), new objj_method(sel_getUid("splitView:resizeSubviewsWithOldSize:"), function $DesignerAppView__splitView_resizeSubviewsWithOldSize_(self, _cmd, aSplitView, oldSize)
{
    var splitViewSize = objj_msgSend(aSplitView, "frame").size;
    var topSize = objj_msgSend(aSplitView, "frame").size;
    topSize.height = TOPBARHEIGHT;
    objj_msgSend(self.topBar, "setFrameSize:", topSize);
    objj_msgSend(self.splitView, "setFrame:", CGRectMake(0, TOPBARHEIGHT + objj_msgSend(aSplitView, "dividerThickness"), splitViewSize.width, splitViewSize.height - objj_msgSend(aSplitView, "dividerThickness") - TOPBARHEIGHT));
}
,["void","CPSplitView","CGSize"])]);
}p;52;Applications/DesignerApp/DesignerAppViewController.jt;1219;@STATIC;1.0;I;23;Foundation/Foundation.jI;15;AppKit/AppKit.ji;17;DesignerAppView.jt;1130;objj_executeFile("Foundation/Foundation.j", NO);objj_executeFile("AppKit/AppKit.j", NO);objj_executeFile("DesignerAppView.j", YES);{var the_class = objj_allocateClassPair(CPViewController, "DesignerAppViewController"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("view")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithBundle:"), function $DesignerAppViewController__initWithBundle_(self, _cmd, aBundle)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("DesignerAppViewController").super_class }, "init");
    if (self)
    {
        self.view = objj_msgSend(objj_msgSend(DesignerAppView, "alloc"), "initWithBundle:", aBundle);
        objj_msgSend(self, "setView:", self.view);
    }
    return self;
}
,["id","CPBundle"]), new objj_method(sel_getUid("breadcrumbName"), function $DesignerAppViewController__breadcrumbName(self, _cmd)
{
    return "Designer";
}
,["CPString"]), new objj_method(sel_getUid("viewFillsDesktop"), function $DesignerAppViewController__viewFillsDesktop(self, _cmd)
{
    return YES;
}
,["BOOL"])]);
}p;38;Applications/DesignerApp/ToolBoxView.jt;2730;@STATIC;1.0;I;23;Foundation/Foundation.jI;15;AppKit/AppKit.jt;2663;objj_executeFile("Foundation/Foundation.j", NO);objj_executeFile("AppKit/AppKit.j", NO);{var the_class = objj_allocateClassPair(CPView, "ToolBoxView"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("tableView"), new objj_ivar("elements"), new objj_ivar("bundle")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithBundle:"), function $ToolBoxView__initWithBundle_(self, _cmd, aBundle)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("ToolBoxView").super_class }, "initWithFrame:", CGRectMake(0, 0, 0, 20));
    if (self)
    {
        self.bundle = aBundle;
        self.tableView = objj_msgSend(objj_msgSend(CPTableView, "alloc"), "initWithFrame:", CGRectMake(0, 20, 0, 0));
        var iconColumn = objj_msgSend(objj_msgSend(CPTableColumn, "alloc"), "initWithIdentifier:", "icons");
        objj_msgSend(iconColumn, "setMaxWidth:", 25);
        objj_msgSend(iconColumn, "setMinWidth:", 25);
        var iconView = objj_msgSend(objj_msgSend(CPImageView, "alloc"), "initWithFrame:", CGRectMake(0, 0, 20, 20));
        objj_msgSend(iconView, "setImageAlignment:", CPImageAlignCenter);
        objj_msgSend(iconView, "setImageScaling:", CPScaleNone);
        objj_msgSend(iconColumn, "setDataView:", iconView);
        objj_msgSend(self.tableView, "addTableColumn:", iconColumn);
        objj_msgSend(self.tableView, "addTableColumn:", objj_msgSend(objj_msgSend(CPTableColumn, "alloc"), "initWithIdentifier:", "itemname"));
        objj_msgSend(self.tableView, "setAutoresizingMask:", CPViewWidthSizable | CPViewHeightSizable);
        self.elements = ["CPView", "CPTableView", "CPSplitView", "CPButton"];
        objj_msgSend(self.tableView, "setDataSource:", self);
        objj_msgSend(self.tableView, "reloadData");
        objj_msgSend(self, "addSubview:", self.tableView);
    }
    return self;
}
,["id","CPBundle"]), new objj_method(sel_getUid("numberOfRowsInTableView:"), function $ToolBoxView__numberOfRowsInTableView_(self, _cmd, aTableView)
{
    return self.elements.length;
}
,["int","CPTableView"]), new objj_method(sel_getUid("tableView:objectValueForTableColumn:row:"), function $ToolBoxView__tableView_objectValueForTableColumn_row_(self, _cmd, aTableView, aColumn, aRowIndex)
{
    if (objj_msgSend(aColumn, "identifier") === "itemname")
    {
        return self.elements[aRowIndex];
    }
    var file = objj_msgSend(self.bundle, "pathForResource:", "Images/" + self.elements[aRowIndex] + ".png");
    return objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:", file);
}
,["id","CPTableView","CPTableColumn","CPInteger"])]);
}p;37;Applications/DesignerApp/UITreeView.jt;1674;@STATIC;1.0;I;23;Foundation/Foundation.jI;15;AppKit/AppKit.jt;1607;objj_executeFile("Foundation/Foundation.j", NO);objj_executeFile("AppKit/AppKit.j", NO);{var the_class = objj_allocateClassPair(CPView, "UITreeView"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("tableView")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("init"), function $UITreeView__init(self, _cmd)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("UITreeView").super_class }, "initWithFrame:", CGRectMake(0, 0, 0, 20));
    if (self)
    {
        self.tableView = objj_msgSend(objj_msgSend(CPOutlineView, "alloc"), "initWithFrame:", CGRectMake(0, 20, 0, 0));
        var iconColumn = objj_msgSend(objj_msgSend(CPTableColumn, "alloc"), "initWithIdentifier:", "icons");
        objj_msgSend(iconColumn, "setMaxWidth:", 25);
        objj_msgSend(iconColumn, "setMinWidth:", 25);
        var iconView = objj_msgSend(objj_msgSend(CPImageView, "alloc"), "initWithFrame:", CGRectMake(0, 0, 20, 20));
        objj_msgSend(iconView, "setImageAlignment:", CPImageAlignCenter);
        objj_msgSend(iconView, "setImageScaling:", CPScaleNone);
        objj_msgSend(iconColumn, "setDataView:", iconView);
        objj_msgSend(self.tableView, "addTableColumn:", iconColumn);
        objj_msgSend(self.tableView, "addTableColumn:", objj_msgSend(objj_msgSend(CPTableColumn, "alloc"), "initWithIdentifier:", "itemname"));
        objj_msgSend(self.tableView, "setAutoresizingMask:", CPViewWidthSizable | CPViewHeightSizable);
        objj_msgSend(self, "addSubview:", self.tableView);
    }
    return self;
}
,["id"])]);
}p;41;Applications/DesignerApp/WorkspaceModel.jt;286;@STATIC;1.0;I;23;Foundation/Foundation.jI;15;AppKit/AppKit.jt;220;objj_executeFile("Foundation/Foundation.j", NO);objj_executeFile("AppKit/AppKit.j", NO);{var the_class = objj_allocateClassPair(CPObject, "WorkspaceModel"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
}e;