@STATIC;1.0;p;14;AdminManager.jt;3858;@STATIC;1.0;I;23;Foundation/Foundation.jI;15;AppKit/AppKit.ji;16;SessionManager.ji;21;AdminViewController.ji;13;MenuManager.jt;3726;objj_executeFile("Foundation/Foundation.j", NO);objj_executeFile("AppKit/AppKit.j", NO);objj_executeFile("SessionManager.j", YES);objj_executeFile("AdminViewController.j", YES);objj_executeFile("MenuManager.j", YES);var instance;
{var the_class = objj_allocateClassPair(CPObject, "AdminManager"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("controller"), new objj_ivar("adminItem")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("init"), function $AdminManager__init(self, _cmd)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("AdminManager").super_class }, "init");
    if (self)
    {
        self.controller = ((___r1 = AdminViewController.isa.objj_msgSend0(AdminViewController, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "init"));
        ((___r1 = CPNotificationCenter.isa.objj_msgSend0(CPNotificationCenter, "defaultCenter")), ___r1 == null ? null : ___r1.isa.objj_msgSend(___r1, "addObserver:selector:name:object:", self, sel_getUid("loginStateChanged"), NOTIFICATION_LOGIN_DATA_UPDATED, nil));
        self.adminItem = ((___r1 = CPMenuItem.isa.objj_msgSend0(CPMenuItem, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend3(___r1, "initWithTitle:action:keyEquivalent:", "Admin", sel_getUid("menuItemClicked:"), nil));
        ((___r1 = self.adminItem), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setTarget:", self));
    }
    return self;
    var ___r1;
}
,["id"]), new objj_method(sel_getUid("menuItemClicked:"), function $AdminManager__menuItemClicked_(self, _cmd, sender)
{
    if (((___r1 = DesktopManager.isa.objj_msgSend0(DesktopManager, "instance")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "topViewController")) !== self.controller)
    {
        ((___r1 = DesktopManager.isa.objj_msgSend0(DesktopManager, "instance")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "pushTopViewController:", self.controller));
    }
    else
    {
        ((___r1 = DesktopManager.isa.objj_msgSend0(DesktopManager, "instance")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "removeViewController:", self.controller));
    }
    return sender;
    var ___r1;
}
,["id","id"]), new objj_method(sel_getUid("loginStateChanged"), function $AdminManager__loginStateChanged(self, _cmd)
{
    ((___r1 = ((___r2 = MenuManager.isa.objj_msgSend0(MenuManager, "instance")), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "leftStack"))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "removeObject:", self.adminItem));
    if (((___r1 = SessionManager.isa.objj_msgSend0(SessionManager, "instance")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "isAdmin")))
    {
        ((___r1 = ((___r2 = MenuManager.isa.objj_msgSend0(MenuManager, "instance")), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "leftStack"))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "addObject:", self.adminItem));
    }
    else
    {
        ((___r1 = DesktopManager.isa.objj_msgSend0(DesktopManager, "instance")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "removeViewController:", self.controller));
    }
    ((___r1 = MenuManager.isa.objj_msgSend0(MenuManager, "instance")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "refreshMenu"));
    var ___r1, ___r2;
}
,["void"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("instance"), function $AdminManager__instance(self, _cmd)
{
    if (!instance)
    {
        instance = ((___r1 = AdminManager.isa.objj_msgSend0(AdminManager, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "init"));
    }
    return instance;
    var ___r1;
}
,["AdminManager"])]);
}p;11;AdminView.jt;4763;@STATIC;1.0;I;23;Foundation/Foundation.jI;15;AppKit/AppKit.jt;4696;objj_executeFile("Foundation/Foundation.j", NO);objj_executeFile("AppKit/AppKit.j", NO);{var the_class = objj_allocateClassPair(CPView, "AdminView"),
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
        var splitView = ((___r1 = CPSplitView.isa.objj_msgSend0(CPSplitView, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithFrame:", CGRectMake(0, 0, 500, 500)));
        (splitView == null ? null : splitView.isa.objj_msgSend1(splitView, "setDelegate:", self));
        (splitView == null ? null : splitView.isa.objj_msgSend1(splitView, "setAutoresizingMask:", CPViewWidthSizable | CPViewHeightSizable));
        (self == null ? null : self.isa.objj_msgSend1(self, "addSubview:", splitView));
        self.menuTableView = ((___r1 = CPTableView.isa.objj_msgSend0(CPTableView, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithFrame:", CGRectMake(0, 0, 150, 500)));
        ((___r1 = self.menuTableView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setHeaderView:", nil));
        ((___r1 = self.menuTableView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "addTableColumn:", ((___r2 = CPTableColumn.isa.objj_msgSend0(CPTableColumn, "alloc")), ___r2 == null ? null : ___r2.isa.objj_msgSend1(___r2, "initWithIdentifier:", "menuitems"))));
        self.scrollTableView = ((___r1 = CPScrollView.isa.objj_msgSend0(CPScrollView, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithFrame:", CGRectMake(0, 0, 150, 500)));
        ((___r1 = self.scrollTableView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setDocumentView:", self.menuTableView));
        (splitView == null ? null : splitView.isa.objj_msgSend1(splitView, "addSubview:", self.scrollTableView));
        self.anotherView = ((___r1 = CPView.isa.objj_msgSend0(CPView, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithFrame:", CGRectMake(0, 0, 350, 500)));
        ((___r1 = self.anotherView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setBackgroundColor:", CPColor.isa.objj_msgSend0(CPColor, "grayColor")));
        (splitView == null ? null : splitView.isa.objj_msgSend1(splitView, "addSubview:", self.anotherView));
        (self == null ? null : self.isa.objj_msgSend1(self, "setAutoresizingMask:", CPViewWidthSizable | CPViewHeightSizable));
    }
    return self;
    var ___r1, ___r2;
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
    var splitViewSize = (aSplitView == null ? null : aSplitView.isa.objj_msgSend0(aSplitView, "frame")).size;
    var leftSize = (aSplitView == null ? null : aSplitView.isa.objj_msgSend0(aSplitView, "frame")).size;
    leftSize.width = 150;
    ((___r1 = self.scrollTableView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setFrameSize:", leftSize));
    ((___r1 = self.anotherView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setFrame:", CGRectMake(150 + (aSplitView == null ? null : aSplitView.isa.objj_msgSend0(aSplitView, "dividerThickness")), 0, splitViewSize.width - (aSplitView == null ? null : aSplitView.isa.objj_msgSend0(aSplitView, "dividerThickness")) - 150, splitViewSize.height)));
    var ___r1;
}
,["void","CPSplitView","CGSize"])]);
}p;21;AdminViewController.jt;4432;@STATIC;1.0;I;23;Foundation/Foundation.jI;15;AppKit/AppKit.ji;11;AdminView.ji;25;UserTableViewController.ji;28;SessionTableViewController.jt;4286;objj_executeFile("Foundation/Foundation.j", NO);objj_executeFile("AppKit/AppKit.j", NO);objj_executeFile("AdminView.j", YES);objj_executeFile("UserTableViewController.j", YES);objj_executeFile("SessionTableViewController.j", YES);{var the_class = objj_allocateClassPair(CPViewController, "AdminViewController"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("menuData"), new objj_ivar("view")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("init"), function $AdminViewController__init(self, _cmd)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("AdminViewController").super_class }, "init");
    if (self)
    {
        self.view = ((___r1 = AdminView.isa.objj_msgSend0(AdminView, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "init"));
        (self == null ? null : self.isa.objj_msgSend1(self, "setView:", self.view));
        self.menuData = [{name: "Users", vc: ((___r1 = UserTableViewController.isa.objj_msgSend0(UserTableViewController, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "init"))}, {name: "Sessions", vc: ((___r1 = SessionTableViewController.isa.objj_msgSend0(SessionTableViewController, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "init"))}];
        ((___r1 = ((___r2 = self.view), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "menuTableView"))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setDelegate:", self));
        ((___r1 = ((___r2 = self.view), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "menuTableView"))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setDataSource:", self));
        ((___r1 = ((___r2 = self.view), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "menuTableView"))), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "reloadData"));
    }
    return self;
    var ___r1, ___r2;
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
    var rowIndex = ((___r1 = ((___r2 = self.view), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "menuTableView"))), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "selectedRow"));
    if (rowIndex > -1)
    {
        while (((___r1 = ((___r2 = self.view), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "anotherView"))), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "subviews")).length != 0)
        {
            ((___r1 = ((___r2 = ((___r3 = self.view), ___r3 == null ? null : ___r3.isa.objj_msgSend0(___r3, "anotherView"))), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "subviews"))[0]), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "removeFromSuperview"));
        }
        var newView = ((___r1 = self.menuData[rowIndex].vc), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "view"));
        var rect = ((___r1 = ((___r2 = self.view), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "anotherView"))), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "frame"));
        rect.origin.x = 0;
        rect.origin.y = 0;
        (newView == null ? null : newView.isa.objj_msgSend1(newView, "setFrame:", rect));
        (newView == null ? null : newView.isa.objj_msgSend1(newView, "setAutoresizingMask:", CPViewWidthSizable | CPViewHeightSizable));
        ((___r1 = ((___r2 = self.view), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "anotherView"))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "addSubview:", newView));
    }
    var ___r1, ___r2, ___r3;
}
,["void","CPNotification"])]);
}p;15;AppController.jt;5489;@STATIC;1.0;I;23;Foundation/Foundation.jI;15;AppKit/AppKit.ji;16;DesktopManager.ji;16;SessionManager.ji;13;MenuManager.ji;20;ApplicationManager.ji;14;AdminManager.ji;29;BunnyLabsIconViewController.ji;20;Utils/HashFragment.jt;5259;objj_executeFile("Foundation/Foundation.j", NO);objj_executeFile("AppKit/AppKit.j", NO);objj_executeFile("DesktopManager.j", YES);objj_executeFile("SessionManager.j", YES);objj_executeFile("MenuManager.j", YES);objj_executeFile("ApplicationManager.j", YES);objj_executeFile("AdminManager.j", YES);objj_executeFile("BunnyLabsIconViewController.j", YES);objj_executeFile("Utils/HashFragment.j", YES);{var the_class = objj_allocateClassPair(CPView, "MyWebView"),
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
        var view = ((___r1 = MyWebView.isa.objj_msgSend0(MyWebView, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithFrame:", CGRectMake(0, 0, 100, 100)));
        (view == null ? null : view.isa.objj_msgSend1(view, "setMainFrameURL:", "https://blog.davidsiaw.net"));
        (view == null ? null : view.isa.objj_msgSend1(view, "setAutoresizingMask:", CPViewWidthSizable | CPViewHeightSizable));
        (self == null ? null : self.isa.objj_msgSend1(self, "setView:", view));
    }
    return self;
    var ___r1;
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
    var theWindow = ((___r1 = CPWindow.isa.objj_msgSend0(CPWindow, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "initWithContentRect:styleMask:", CGRectMakeZero(), CPBorderlessBridgeWindowMask));
    self.contentView = (theWindow == null ? null : theWindow.isa.objj_msgSend0(theWindow, "contentView"));
    (theWindow == null ? null : theWindow.isa.objj_msgSend1(theWindow, "setDelegate:", self));
    (theWindow == null ? null : theWindow.isa.objj_msgSend1(theWindow, "orderFront:", self));
    CPMenu.isa.objj_msgSend1(CPMenu, "setMenuBarVisible:", YES);
    ((___r1 = DesktopManager.isa.objj_msgSend0(DesktopManager, "instance")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "pushTopViewController:", ((___r2 = BunnyLabsIconViewController.isa.objj_msgSend0(BunnyLabsIconViewController, "alloc")), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "init"))));
    ((___r1 = MenuManager.isa.objj_msgSend0(MenuManager, "instance")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "rightStack")).push(((___r1 = SessionManager.isa.objj_msgSend0(SessionManager, "instance")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "sessionStatusMenuItem")));
    ApplicationManager.isa.objj_msgSend0(ApplicationManager, "instance");
    AdminManager.isa.objj_msgSend0(AdminManager, "instance");
    self.isa.objj_msgSend0(self, "performHash");
    var ___r1, ___r2;
}
,["void","CPNotification"]), new objj_method(sel_getUid("performHash"), function $AppController__performHash(self, _cmd)
{
    var hash = HashFragment.isa.objj_msgSend0(HashFragment, "fragmentAsObject");
    if (hash.validate)
    {
        ((___r1 = SessionManager.isa.objj_msgSend0(SessionManager, "instance")), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "validateUser:withToken:", hash.validateUsername, hash.validate));
    }
    if (hash.forgotPassword)
    {
        ((___r1 = SessionManager.isa.objj_msgSend0(SessionManager, "instance")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "showChangePasswordWindow"));
    }
    var ___r1;
}
,["void"]), new objj_method(sel_getUid("windowDidResize:"), function $AppController__windowDidResize_(self, _cmd, notification)
{
    ((___r1 = DesktopManager.isa.objj_msgSend0(DesktopManager, "instance")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "desktopResized"));
    var ___r1;
}
,["void","CPNotification"])]);
}p;17;ApplicationInfo.jt;2068;@STATIC;1.0;I;23;Foundation/Foundation.jI;15;AppKit/AppKit.jt;2001;objj_executeFile("Foundation/Foundation.j", NO);objj_executeFile("AppKit/AppKit.j", NO);{var the_class = objj_allocateClassPair(CPObject, "ApplicationInfo"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("icon"), new objj_ivar("application")]);objj_registerClassPair(the_class);
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
,["void","id"]), new objj_method(sel_getUid("name"), function $ApplicationInfo__name(self, _cmd)
{
    var bundle = CPBundle.isa.objj_msgSend1(CPBundle, "bundleWithIdentifier:", ((___r1 = self.application), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "bundleIdentifier")));
    var name = ((___r1 = (bundle == null ? null : bundle.isa.objj_msgSend0(bundle, "infoDictionary"))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "objectForKey:", "CPBundleName"));
    return name;
    var ___r1;
}
,["CPString"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("applicationInfoOf:withIcon:"), function $ApplicationInfo__applicationInfoOf_withIcon_(self, _cmd, anApp, anImage)
{
    var result = ((___r1 = ApplicationInfo.isa.objj_msgSend0(ApplicationInfo, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "init"));
    (result == null ? null : result.isa.objj_msgSend1(result, "setApplication:", anApp));
    (result == null ? null : result.isa.objj_msgSend1(result, "setIcon:", anImage));
    return result;
    var ___r1;
}
,["ApplicationInfo","CPString","CPImage"])]);
}p;20;ApplicationManager.jt;3976;@STATIC;1.0;I;23;Foundation/Foundation.jI;15;AppKit/AppKit.ji;16;SessionManager.ji;27;ApplicationViewController.ji;13;MenuManager.jt;3838;objj_executeFile("Foundation/Foundation.j", NO);objj_executeFile("AppKit/AppKit.j", NO);objj_executeFile("SessionManager.j", YES);objj_executeFile("ApplicationViewController.j", YES);objj_executeFile("MenuManager.j", YES);var instance;
{var the_class = objj_allocateClassPair(CPObject, "ApplicationManager"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("controller"), new objj_ivar("applicationItem")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("init"), function $ApplicationManager__init(self, _cmd)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("ApplicationManager").super_class }, "init");
    if (self)
    {
        self.controller = ((___r1 = ApplicationViewController.isa.objj_msgSend0(ApplicationViewController, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "init"));
        ((___r1 = CPNotificationCenter.isa.objj_msgSend0(CPNotificationCenter, "defaultCenter")), ___r1 == null ? null : ___r1.isa.objj_msgSend(___r1, "addObserver:selector:name:object:", self, sel_getUid("loginStateChanged"), NOTIFICATION_LOGIN_DATA_UPDATED, nil));
        self.applicationItem = ((___r1 = CPMenuItem.isa.objj_msgSend0(CPMenuItem, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend3(___r1, "initWithTitle:action:keyEquivalent:", "Applications", sel_getUid("menuItemClicked:"), nil));
        ((___r1 = self.applicationItem), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setTarget:", self));
    }
    return self;
    var ___r1;
}
,["id"]), new objj_method(sel_getUid("menuItemClicked:"), function $ApplicationManager__menuItemClicked_(self, _cmd, sender)
{
    if (((___r1 = DesktopManager.isa.objj_msgSend0(DesktopManager, "instance")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "topViewController")) !== self.controller)
    {
        ((___r1 = DesktopManager.isa.objj_msgSend0(DesktopManager, "instance")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "pushTopViewController:", self.controller));
    }
    else
    {
        ((___r1 = DesktopManager.isa.objj_msgSend0(DesktopManager, "instance")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "removeViewController:", self.controller));
    }
    return sender;
    var ___r1;
}
,["id","id"]), new objj_method(sel_getUid("loginStateChanged"), function $ApplicationManager__loginStateChanged(self, _cmd)
{
    ((___r1 = ((___r2 = MenuManager.isa.objj_msgSend0(MenuManager, "instance")), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "leftStack"))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "removeObject:", self.applicationItem));
    if (((___r1 = SessionManager.isa.objj_msgSend0(SessionManager, "instance")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "isLoggedIn")))
    {
        ((___r1 = ((___r2 = MenuManager.isa.objj_msgSend0(MenuManager, "instance")), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "leftStack"))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "addObject:", self.applicationItem));
    }
    else
    {
        ((___r1 = DesktopManager.isa.objj_msgSend0(DesktopManager, "instance")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "removeViewController:", self.controller));
    }
    ((___r1 = MenuManager.isa.objj_msgSend0(MenuManager, "instance")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "refreshMenu"));
    var ___r1, ___r2;
}
,["void"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("instance"), function $ApplicationManager__instance(self, _cmd)
{
    if (!instance)
    {
        instance = ((___r1 = ApplicationManager.isa.objj_msgSend0(ApplicationManager, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "init"));
    }
    return instance;
    var ___r1;
}
,["ApplicationManager"])]);
}p;17;ApplicationView.jt;5172;@STATIC;1.0;I;23;Foundation/Foundation.jI;15;AppKit/AppKit.ji;17;ApplicationInfo.ji;20;IconCollectionView.ji;38;Applications/DesignerApp/DesignerApp.ji;32;Applications/TestApp1/TestApp1.ji;32;Applications/TestApp2/TestApp2.jt;4941;objj_executeFile("Foundation/Foundation.j", NO);objj_executeFile("AppKit/AppKit.j", NO);objj_executeFile("ApplicationInfo.j", YES);objj_executeFile("IconCollectionView.j", YES);objj_executeFile("Applications/DesignerApp/DesignerApp.j", YES);objj_executeFile("Applications/TestApp1/TestApp1.j", YES);objj_executeFile("Applications/TestApp2/TestApp2.j", YES);{var the_class = objj_allocateClassPair(CPView, "ApplicationView"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("iconsView"), new objj_ivar("scrollView")]);objj_registerClassPair(the_class);
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
        self.scrollView = ((___r1 = CPScrollView.isa.objj_msgSend0(CPScrollView, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithFrame:", (self == null ? null : self.isa.objj_msgSend0(self, "frame"))));
        ((___r1 = self.scrollView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setAutoresizingMask:", CPViewWidthSizable | CPViewHeightSizable));
        ((___r1 = self.scrollView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setAutohidesScrollers:", YES));
        self.iconsView = ((___r1 = IconCollectionView.isa.objj_msgSend0(IconCollectionView, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithFrame:", (self == null ? null : self.isa.objj_msgSend0(self, "frame"))));
        ((___r1 = self.iconsView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setAutoresizingMask:", CPViewWidthSizable | CPViewHeightSizable));
        (self == null ? null : self.isa.objj_msgSend1(self, "setAutoresizingMask:", CPViewWidthSizable | CPViewHeightSizable));
        var items = [];
    {
        var app = ((___r1 = DesignerApp.isa.objj_msgSend0(DesignerApp, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "init"));
        var appBundle = CPBundle.isa.objj_msgSend1(CPBundle, "bundleWithIdentifier:", (app == null ? null : app.isa.objj_msgSend0(app, "bundleIdentifier")));
        var file = (appBundle == null ? null : appBundle.isa.objj_msgSend1(appBundle, "pathForResource:", "Images/icon.png"));
        var icon = ((___r1 = CPImage.isa.objj_msgSend0(CPImage, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "initWithContentsOfFile:size:", file, CGSizeMake(200.0, 200.0)));
        var item = ApplicationInfo.isa.objj_msgSend2(ApplicationInfo, "applicationInfoOf:withIcon:", app, icon);
        items.push(item);
    }
    {
        var app = ((___r1 = TestApp1.isa.objj_msgSend0(TestApp1, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "init"));
        var appBundle = CPBundle.isa.objj_msgSend1(CPBundle, "bundleWithIdentifier:", (app == null ? null : app.isa.objj_msgSend0(app, "bundleIdentifier")));
        var file = (appBundle == null ? null : appBundle.isa.objj_msgSend1(appBundle, "pathForResource:", "Images/icon.png"));
        var icon = ((___r1 = CPImage.isa.objj_msgSend0(CPImage, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "initWithContentsOfFile:size:", file, CGSizeMake(200.0, 200.0)));
        var item = ApplicationInfo.isa.objj_msgSend2(ApplicationInfo, "applicationInfoOf:withIcon:", app, icon);
        items.push(item);
    }
    {
        var app = ((___r1 = TestApp2.isa.objj_msgSend0(TestApp2, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "init"));
        var appBundle = CPBundle.isa.objj_msgSend1(CPBundle, "bundleWithIdentifier:", (app == null ? null : app.isa.objj_msgSend0(app, "bundleIdentifier")));
        var file = (appBundle == null ? null : appBundle.isa.objj_msgSend1(appBundle, "pathForResource:", "Images/icon.png"));
        var icon = ((___r1 = CPImage.isa.objj_msgSend0(CPImage, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "initWithContentsOfFile:size:", file, CGSizeMake(200.0, 200.0)));
        var item = ApplicationInfo.isa.objj_msgSend2(ApplicationInfo, "applicationInfoOf:withIcon:", app, icon);
        items.push(item);
    }
        ((___r1 = self.iconsView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setContent:", items));
        ((___r1 = self.scrollView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setDocumentView:", self.iconsView));
        (self == null ? null : self.isa.objj_msgSend1(self, "addSubview:", self.scrollView));
    }
    return self;
    var ___r1;
}
,["id"])]);
}p;27;ApplicationViewController.jt;2115;@STATIC;1.0;I;23;Foundation/Foundation.jI;15;AppKit/AppKit.ji;17;ApplicationView.jt;2026;objj_executeFile("Foundation/Foundation.j", NO);objj_executeFile("AppKit/AppKit.j", NO);objj_executeFile("ApplicationView.j", YES);{var the_class = objj_allocateClassPair(CPViewController, "ApplicationViewController"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("menuData"), new objj_ivar("view")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("init"), function $ApplicationViewController__init(self, _cmd)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("ApplicationViewController").super_class }, "init");
    if (self)
    {
        self.view = ((___r1 = ApplicationView.isa.objj_msgSend0(ApplicationView, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "init"));
        ((___r1 = ((___r2 = self.view), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "iconsView"))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setDelegate:", self));
        (self == null ? null : self.isa.objj_msgSend1(self, "setView:", self.view));
    }
    return self;
    var ___r1, ___r2;
}
,["id"]), new objj_method(sel_getUid("viewFillsDesktop"), function $ApplicationViewController__viewFillsDesktop(self, _cmd)
{
    return YES;
}
,["BOOL"]), new objj_method(sel_getUid("collectionView:didDoubleClickOnItemAtIndex:"), function $ApplicationViewController__collectionView_didDoubleClickOnItemAtIndex_(self, _cmd, collectionView, index)
{
    var app = ((___r1 = ((___r2 = (collectionView == null ? null : collectionView.isa.objj_msgSend0(collectionView, "items"))[index]), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "representedObject"))), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "application"));
    ((___r1 = DesktopManager.isa.objj_msgSend0(DesktopManager, "instance")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "pushTopViewController:", (app == null ? null : app.isa.objj_msgSend0(app, "viewController"))));
    var ___r1, ___r2;
}
,["void","CPCollectionView","int"])]);
}p;29;BunnyLabsIconViewController.jt;1693;@STATIC;1.0;I;23;Foundation/Foundation.jI;15;AppKit/AppKit.jt;1626;objj_executeFile("Foundation/Foundation.j", NO);objj_executeFile("AppKit/AppKit.j", NO);{var the_class = objj_allocateClassPair(CPViewController, "BunnyLabsIconViewController"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("init"), function $BunnyLabsIconViewController__init(self, _cmd)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("BunnyLabsIconViewController").super_class }, "init");
    if (self)
    {
        var bundle = CPBundle.isa.objj_msgSend0(CPBundle, "mainBundle");
        var file = (bundle == null ? null : bundle.isa.objj_msgSend1(bundle, "pathForResource:", "Images/bunnylabs.png"));
        var image = ((___r1 = CPImage.isa.objj_msgSend0(CPImage, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithContentsOfFile:", file));
        var imageView = ((___r1 = CPImageView.isa.objj_msgSend0(CPImageView, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithFrame:", CGRectMake(0, 0, 200, 200)));
        (imageView == null ? null : imageView.isa.objj_msgSend1(imageView, "setImage:", image));
        (imageView == null ? null : imageView.isa.objj_msgSend1(imageView, "setAutoresizingMask:", CPViewMinXMargin | CPViewMaxXMargin | CPViewMinYMargin | CPViewMaxYMargin));
        (self == null ? null : self.isa.objj_msgSend1(self, "setView:", imageView));
    }
    return self;
    var ___r1;
}
,["id"]), new objj_method(sel_getUid("breadcrumbName"), function $BunnyLabsIconViewController__breadcrumbName(self, _cmd)
{
    return "Desktop";
}
,["CPString"])]);
}p;16;BunnyTableView.jt;6108;@STATIC;1.0;I;23;Foundation/Foundation.jI;15;AppKit/AppKit.jt;6041;objj_executeFile("Foundation/Foundation.j", NO);objj_executeFile("AppKit/AppKit.j", NO);{var the_class = objj_allocateClassPair(CPView, "BunnyTableView"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("scrollView"), new objj_ivar("tableView"), new objj_ivar("reloadButton")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("init"), function $BunnyTableView__init(self, _cmd)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("BunnyTableView").super_class }, "initWithFrame:", CGRectMake(0, 0, 100, 100));
    if (self)
    {
        self.tableView = ((___r1 = CPTableView.isa.objj_msgSend0(CPTableView, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "init"));
        ((___r1 = self.tableView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setColumnAutoresizingStyle:", CPTableViewUniformColumnAutoresizingStyle));
        ((___r1 = self.tableView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setAlternatingRowBackgroundColors:", [CPColor.isa.objj_msgSend0(CPColor, "grayColor"), CPColor.isa.objj_msgSend0(CPColor, "whiteColor")]));
        self.reloadButton = CPButton.isa.objj_msgSend1(CPButton, "buttonWithTitle:", "Reload");
        ((___r1 = self.reloadButton), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setFrameOrigin:", CGPointMake(3, 3)));
        ((___r1 = self.reloadButton), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setTarget:", self));
        ((___r1 = self.reloadButton), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setAction:", sel_getUid("reloadButtonClicked:")));
        (self == null ? null : self.isa.objj_msgSend1(self, "addSubview:", self.reloadButton));
        self.scrollView = ((___r1 = CPScrollView.isa.objj_msgSend0(CPScrollView, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithFrame:", CGRectMake(0, 30, 100, 70)));
        ((___r1 = self.scrollView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setAutoresizingMask:", CPViewWidthSizable | CPViewHeightSizable));
        ((___r1 = self.scrollView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setDocumentView:", self.tableView));
        (self == null ? null : self.isa.objj_msgSend1(self, "addSubview:", self.scrollView));
    }
    return self;
    var ___r1;
}
,["id"]), new objj_method(sel_getUid("reloadButtonClicked:"), function $BunnyTableView__reloadButtonClicked_(self, _cmd, sender)
{
    if (((___r1 = self.isa.objj_msgSend0(self, "delegate")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "respondsToSelector:", sel_getUid("reloadButtonClicked:"))))
    {
        ((___r1 = self.isa.objj_msgSend0(self, "delegate")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "reloadButtonClicked:", self));
    }
    var ___r1;
}
,["void","id"]), new objj_method(sel_getUid("reloadData"), function $BunnyTableView__reloadData(self, _cmd)
{
    ((___r1 = self.tableView), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "reloadData"));
    var ___r1;
}
,["void"]), new objj_method(sel_getUid("addColumnNamed:"), function $BunnyTableView__addColumnNamed_(self, _cmd, anIdentifier)
{
    var column = ((___r1 = CPTableColumn.isa.objj_msgSend0(CPTableColumn, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithIdentifier:", anIdentifier));
    ((___r1 = (column == null ? null : column.isa.objj_msgSend0(column, "headerView"))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setStringValue:", anIdentifier));
    (column == null ? null : column.isa.objj_msgSend1(column, "setResizingMask:", CPTableColumnAutoresizingMask | CPTableColumnUserResizingMask));
    (column == null ? null : column.isa.objj_msgSend1(column, "setEditable:", YES));
    ((___r1 = self.tableView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "addTableColumn:", column));
    var ___r1;
}
,["void","CPString"]), new objj_method(sel_getUid("addBooleanColumnNamed:"), function $BunnyTableView__addBooleanColumnNamed_(self, _cmd, anIdentifier)
{
    var column = ((___r1 = CPTableColumn.isa.objj_msgSend0(CPTableColumn, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithIdentifier:", anIdentifier));
    ((___r1 = (column == null ? null : column.isa.objj_msgSend0(column, "headerView"))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setStringValue:", anIdentifier));
    (column == null ? null : column.isa.objj_msgSend1(column, "setResizingMask:", CPTableColumnNoResizing));
    (column == null ? null : column.isa.objj_msgSend1(column, "setEditable:", YES));
    (column == null ? null : column.isa.objj_msgSend1(column, "setMaxWidth:", 50));
    (column == null ? null : column.isa.objj_msgSend1(column, "setDataView:", ((___r1 = CPCheckBox.isa.objj_msgSend0(CPCheckBox, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "init"))));
    ((___r1 = self.tableView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "addTableColumn:", column));
    var ___r1;
}
,["void","CPString"]), new objj_method(sel_getUid("setDataSource:"), function $BunnyTableView__setDataSource_(self, _cmd, aDataSource)
{
    ((___r1 = self.tableView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setDataSource:", aDataSource));
    var ___r1;
}
,["void","id"]), new objj_method(sel_getUid("setDelegate:"), function $BunnyTableView__setDelegate_(self, _cmd, aDelegate)
{
    ((___r1 = self.tableView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setDelegate:", aDelegate));
    var ___r1;
}
,["void","id"]), new objj_method(sel_getUid("delegate"), function $BunnyTableView__delegate(self, _cmd)
{
    return ((___r1 = self.tableView), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "delegate"));
    var ___r1;
}
,["id"]), new objj_method(sel_getUid("dataSource"), function $BunnyTableView__dataSource(self, _cmd)
{
    return ((___r1 = self.tableView), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "dataSource"));
    var ___r1;
}
,["id"])]);
}p;19;CPArray+Additions.jt;1479;@STATIC;1.0;I;23;Foundation/Foundation.jt;1432;objj_executeFile("Foundation/Foundation.j", NO);{
var the_class = objj_getClass("CPArray")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPArray\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("last"), function $CPArray__last(self, _cmd)
{
    return self.isa.objj_msgSend1(self, "objectAtIndex:", self.isa.objj_msgSend0(self, "count") - 1);
}
,["id"]), new objj_method(sel_getUid("first"), function $CPArray__first(self, _cmd)
{
    return self.isa.objj_msgSend1(self, "objectAtIndex:", 0);
}
,["id"]), new objj_method(sel_getUid("filterWithPredicate:"), function $CPArray__filterWithPredicate_(self, _cmd, predicate)
{
    var i = 0,
        newArray = [],
        currItem,
        count = self.isa.objj_msgSend0(self, "count");
    for (i = 0; i < count; i++)
    {
        currItem = self.isa.objj_msgSend1(self, "objectAtIndex:", i);
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
        count = self.isa.objj_msgSend0(self, "count");
    for (i = 0; i < count; i++)
    {
        currItem = self.isa.objj_msgSend1(self, "objectAtIndex:", i);
        action(currItem);
    }
}
,["void","Function"])]);
}p;16;DesktopManager.jt;10074;@STATIC;1.0;I;23;Foundation/Foundation.jI;15;AppKit/AppKit.ji;13;MenuManager.ji;19;CPArray+Additions.jt;9965;objj_executeFile("Foundation/Foundation.j", NO);objj_executeFile("AppKit/AppKit.j", NO);objj_executeFile("MenuManager.j", YES);objj_executeFile("CPArray+Additions.j", YES);var desktopInstance;
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
        self.topWindow = ((___r1 = CPApplication.isa.objj_msgSend0(CPApplication, "sharedApplication")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "mainWindow"));
        self.contentView = ((___r1 = self.topWindow), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "contentView"));
        self.viewControllerStack = CPArray.isa.objj_msgSend0(CPArray, "array");
    }
    return self;
    var ___r1;
}
,["id"]), new objj_method(sel_getUid("desktopResized"), function $DesktopManager__desktopResized(self, _cmd)
{
    if (self.viewControllerStack.length != 0 && ((___r1 = ((___r2 = self.viewControllerStack), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "last"))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "respondsToSelector:", sel_getUid("desktopDidResizeToRect:"))))
    {
        ((___r1 = ((___r2 = self.viewControllerStack), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "last"))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "desktopDidResizeToRect:", ((___r2 = self.contentView), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "frame"))));
    }
    ((___r1 = ((___r2 = MenuManager.isa.objj_msgSend0(MenuManager, "instance")), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "centerStack"))), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "removeAllObjects"));
    var i = 0;
    for (i = 0; i < self.viewControllerStack.length; i++)
    {
        var name = self.viewControllerStack[i].isa.name;
        if (name === "BunnyLabsIconViewController")
        {
            continue;
        }
        if (((___r1 = self.viewControllerStack[i]), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "respondsToSelector:", sel_getUid("breadcrumbName"))))
        {
            name = ((___r1 = self.viewControllerStack[i]), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "breadcrumbName"));
        }
        var title = "[" + name + "]";
        var layer = ((___r1 = CPMenuItem.isa.objj_msgSend0(CPMenuItem, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend3(___r1, "initWithTitle:action:keyEquivalent:", "", nil, ""));
        var button = BreadcrumbButton.isa.objj_msgSend1(BreadcrumbButton, "buttonWithTitle:", title);
        (button == null ? null : button.isa.objj_msgSend1(button, "setAction:", sel_getUid("breadcrumbMoveToTop:")));
        (button == null ? null : button.isa.objj_msgSend1(button, "setTarget:", self));
        (button == null ? null : button.isa.objj_msgSend1(button, "setRepresentedObject:", self.viewControllerStack[i]));
        var menu = ((___r1 = CPMenu.isa.objj_msgSend0(CPMenu, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "init"));
        var menuCloseItem = ((___r1 = CPMenuItem.isa.objj_msgSend0(CPMenuItem, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend3(___r1, "initWithTitle:action:keyEquivalent:", "Close", sel_getUid("breadcrumbClose:"), ""));
        (menuCloseItem == null ? null : menuCloseItem.isa.objj_msgSend1(menuCloseItem, "setTarget:", self));
        (menuCloseItem == null ? null : menuCloseItem.isa.objj_msgSend1(menuCloseItem, "setRepresentedObject:", self.viewControllerStack[i]));
        (menu == null ? null : menu.isa.objj_msgSend1(menu, "addItem:", menuCloseItem));
        (button == null ? null : button.isa.objj_msgSend1(button, "setMenu:", menu));
        (layer == null ? null : layer.isa.objj_msgSend1(layer, "setView:", button));
        ((___r1 = ((___r2 = MenuManager.isa.objj_msgSend0(MenuManager, "instance")), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "centerStack"))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "addObject:", layer));
    }
    ((___r1 = MenuManager.isa.objj_msgSend0(MenuManager, "instance")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "refreshMenu"));
    var ___r1, ___r2;
}
,["void"]), new objj_method(sel_getUid("breadcrumbMoveToTop:"), function $DesktopManager__breadcrumbMoveToTop_(self, _cmd, sender)
{
    self.isa.objj_msgSend1(self, "pushTopViewController:", (sender == null ? null : sender.isa.objj_msgSend0(sender, "representedObject")));
}
,["void","id"]), new objj_method(sel_getUid("breadcrumbClose:"), function $DesktopManager__breadcrumbClose_(self, _cmd, sender)
{
    self.isa.objj_msgSend1(self, "removeViewController:", (sender == null ? null : sender.isa.objj_msgSend0(sender, "representedObject")));
}
,["void","id"]), new objj_method(sel_getUid("setDefaultButton:"), function $DesktopManager__setDefaultButton_(self, _cmd, aButton)
{
    ((___r1 = self.topWindow), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setDefaultButton:", aButton));
    var ___r1;
}
,["void","CPButton"]), new objj_method(sel_getUid("defaultButton"), function $DesktopManager__defaultButton(self, _cmd)
{
    return ((___r1 = self.topWindow), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "defaultButton"));
    var ___r1;
}
,["CPButton"]), new objj_method(sel_getUid("topViewController"), function $DesktopManager__topViewController(self, _cmd)
{
    if (self.viewControllerStack.length != 0)
    {
        return ((___r1 = self.viewControllerStack), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "last"));
    }
    return nil;
    var ___r1;
}
,["CPViewController"]), new objj_method(sel_getUid("pushTopViewController:"), function $DesktopManager__pushTopViewController_(self, _cmd, aViewController)
{
    self.isa.objj_msgSend1(self, "_remove:", aViewController);
    self.viewControllerStack = ((___r1 = self.viewControllerStack), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "arrayByAddingObject:", aViewController));
    self.isa.objj_msgSend0(self, "_update");
    var ___r1;
}
,["void","CPViewController"]), new objj_method(sel_getUid("removeViewController:"), function $DesktopManager__removeViewController_(self, _cmd, aViewController)
{
    self.isa.objj_msgSend1(self, "_remove:", aViewController);
    self.isa.objj_msgSend0(self, "_update");
}
,["void","CPViewController"]), new objj_method(sel_getUid("_remove:"), function $DesktopManager___remove_(self, _cmd, aViewController)
{
    self.viewControllerStack = ((___r1 = self.viewControllerStack), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "filterWithPredicate:", function(item)
    {
        return item !== aViewController;
    }));
    var ___r1;
}
,["void","CPViewController"]), new objj_method(sel_getUid("_update"), function $DesktopManager___update(self, _cmd)
{
    while (((___r1 = self.contentView), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "subviews")).length != 0)
    {
        ((___r1 = ((___r2 = self.contentView), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "subviews"))[0]), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "removeFromSuperview"));
    }
    if (self.viewControllerStack.length != 0)
    {
        var currentViewController = ((___r1 = self.viewControllerStack), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "last"));
        ((___r1 = self.contentView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "addSubview:", (currentViewController == null ? null : currentViewController.isa.objj_msgSend0(currentViewController, "view"))));
        ((___r1 = (currentViewController == null ? null : currentViewController.isa.objj_msgSend0(currentViewController, "view"))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setCenter:", ((___r2 = self.contentView), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "center"))));
        if (((___r1 = ((___r2 = self.viewControllerStack), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "last"))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "respondsToSelector:", sel_getUid("viewFillsDesktop"))) && ((___r1 = ((___r2 = self.viewControllerStack), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "last"))), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "viewFillsDesktop")))
        {
            ((___r1 = (currentViewController == null ? null : currentViewController.isa.objj_msgSend0(currentViewController, "view"))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setFrame:", ((___r2 = self.contentView), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "frame"))));
        }
    }
    self.isa.objj_msgSend0(self, "desktopResized");
    var ___r1, ___r2;
}
,["void"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("instance"), function $DesktopManager__instance(self, _cmd)
{
    if (!desktopInstance)
    {
        desktopInstance = ((___r1 = DesktopManager.isa.objj_msgSend0(DesktopManager, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "init"));
    }
    return desktopInstance;
    var ___r1;
}
,["DesktopManager"])]);
}p;20;IconCollectionView.jt;1925;@STATIC;1.0;I;23;Foundation/Foundation.jI;15;AppKit/AppKit.ji;17;ApplicationInfo.ji;10;IconView.jt;1821;objj_executeFile("Foundation/Foundation.j", NO);objj_executeFile("AppKit/AppKit.j", NO);objj_executeFile("ApplicationInfo.j", YES);objj_executeFile("IconView.j", YES);{var the_class = objj_allocateClassPair(CPCollectionView, "IconCollectionView"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("_prepare"), function $IconCollectionView___prepare(self, _cmd)
{
    self.isa.objj_msgSend1(self, "setMinItemSize:", CGSizeMake(150, 150));
    self.isa.objj_msgSend1(self, "setMaxItemSize:", CGSizeMake(150, 150));
    var itemPrototype = ((___r1 = CPCollectionViewItem.isa.objj_msgSend0(CPCollectionViewItem, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "init")),
        iconView = ((___r1 = IconView.isa.objj_msgSend0(IconView, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithFrame:", CGRectMakeZero()));
    (itemPrototype == null ? null : itemPrototype.isa.objj_msgSend1(itemPrototype, "setView:", iconView));
    self.isa.objj_msgSend1(self, "setItemPrototype:", itemPrototype);
    var ___r1;
}
,["void"]), new objj_method(sel_getUid("init"), function $IconCollectionView__init(self, _cmd)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("IconCollectionView").super_class }, "init");
    if (self)
    {
        (self == null ? null : self.isa.objj_msgSend0(self, "_prepare"));
    }
    return self;
}
,["id"]), new objj_method(sel_getUid("initWithFrame:"), function $IconCollectionView__initWithFrame_(self, _cmd, frame)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("IconCollectionView").super_class }, "initWithFrame:", frame);
{
    (self == null ? null : self.isa.objj_msgSend0(self, "_prepare"));
}
    return self;
}
,["id","CGRect"])]);
}p;10;IconView.jt;3397;@STATIC;1.0;I;23;Foundation/Foundation.jI;15;AppKit/AppKit.ji;17;ApplicationInfo.jt;3308;objj_executeFile("Foundation/Foundation.j", NO);objj_executeFile("AppKit/AppKit.j", NO);objj_executeFile("ApplicationInfo.j", YES);{var the_class = objj_allocateClassPair(CPView, "IconView"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_imageView"), new objj_ivar("_textField")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function $IconView__initWithCoder_(self, _cmd, aCoder)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("IconView").super_class }, "initWithCoder:", aCoder);
    if (self)
    {
        self._imageView = ((___r1 = CPImageView.isa.objj_msgSend0(CPImageView, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithFrame:", CGRectMake(25, 5, 100, 100)));
        ((___r1 = self._imageView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setImageScaling:", CPScaleProportionally));
        (self == null ? null : self.isa.objj_msgSend1(self, "addSubview:", self._imageView));
        var textRect = CGRectMake(5, 107, 140, 40);
        self._textField = ((___r1 = CPTextField.isa.objj_msgSend0(CPTextField, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithFrame:", textRect));
        ((___r1 = self._textField), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setLineBreakMode:", CPLineBreakByWordWrapping));
        ((___r1 = self._textField), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setAlignment:", CPCenterTextAlignment));
        ((___r1 = self._textField), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setVerticalAlignment:", CPCenterVerticalTextAlignment));
        ((___r1 = self._textField), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setTextShadowColor:", CPColor.isa.objj_msgSend0(CPColor, "whiteColor")));
        ((___r1 = self._textField), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setTextShadowOffset:", CGSizeMake(1, 1)));
        var font = CPFont.isa.objj_msgSend2(CPFont, "boldFontWithName:size:", "Helvetica", 12);
        ((___r1 = self._textField), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setFont:", font));
        ((___r1 = self._textField), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setTextColor:", CPColor.isa.objj_msgSend0(CPColor, "blackColor")));
        (self == null ? null : self.isa.objj_msgSend1(self, "addSubview:", self._textField));
    }
    return self;
    var ___r1;
}
,["id","CPCoder"]), new objj_method(sel_getUid("setRepresentedObject:"), function $IconView__setRepresentedObject_(self, _cmd, appInfo)
{
    if (appInfo)
    {
        ((___r1 = self._textField), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setStringValue:", (appInfo == null ? null : appInfo.isa.objj_msgSend0(appInfo, "name"))));
        ((___r1 = self._imageView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setImage:", (appInfo == null ? null : appInfo.isa.objj_msgSend0(appInfo, "icon"))));
    }
    var ___r1;
}
,["void","ApplicationInfo"]), new objj_method(sel_getUid("setSelected:"), function $IconView__setSelected_(self, _cmd, isSelected)
{
    self.isa.objj_msgSend1(self, "setBackgroundColor:", isSelected ? CPColor.isa.objj_msgSend0(CPColor, "grayColor") : nil);
}
,["void","BOOL"])]);
}p;6;main.jt;292;@STATIC;1.0;I;23;Foundation/Foundation.jI;15;AppKit/AppKit.ji;15;AppController.jt;206;objj_executeFile("Foundation/Foundation.j", NO);objj_executeFile("AppKit/AppKit.j", NO);objj_executeFile("AppController.j", YES);main = function(args, namedArgs)
{
    CPApplicationMain(args, namedArgs);
}
p;13;MenuManager.jt;2961;@STATIC;1.0;I;23;Foundation/Foundation.jI;15;AppKit/AppKit.ji;19;CPArray+Additions.jt;2870;objj_executeFile("Foundation/Foundation.j", NO);objj_executeFile("AppKit/AppKit.j", NO);objj_executeFile("CPArray+Additions.j", YES);var menuManagerInstance;
{var the_class = objj_allocateClassPair(CPObject, "MenuManager"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("leftStack"), new objj_ivar("centerStack"), new objj_ivar("rightStack")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("init"), function $MenuManager__init(self, _cmd)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("MenuManager").super_class }, "init");
    if (self)
    {
        self.leftStack = CPArray.isa.objj_msgSend0(CPArray, "array");
        self.centerStack = CPArray.isa.objj_msgSend0(CPArray, "array");
        self.rightStack = CPArray.isa.objj_msgSend0(CPArray, "array");
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
    var mainMenu = ((___r1 = CPApplication.isa.objj_msgSend0(CPApplication, "sharedApplication")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "mainMenu"));
    while ((mainMenu == null ? null : mainMenu.isa.objj_msgSend0(mainMenu, "countOfItems")) > 0)
    {
        (mainMenu == null ? null : mainMenu.isa.objj_msgSend1(mainMenu, "removeItemAtIndex:", 0));
    }
    (mainMenu == null ? null : mainMenu.isa.objj_msgSend0(mainMenu, "removeAllItems"));
addItem = function(menuItem)
    {
        (mainMenu == null ? null : mainMenu.isa.objj_msgSend1(mainMenu, "addItem:", menuItem));
    }
    ((___r1 = self.leftStack), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "foreach:", addItem));
    ((___r1 = self.centerStack), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "foreach:", addItem));
    (mainMenu == null ? null : mainMenu.isa.objj_msgSend1(mainMenu, "addItem:", CPMenuItem.isa.objj_msgSend0(CPMenuItem, "separatorItem")));
    ((___r1 = self.rightStack), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "foreach:", addItem));
    var ___r1;
}
,["void"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("instance"), function $MenuManager__instance(self, _cmd)
{
    if (!menuManagerInstance)
    {
        menuManagerInstance = ((___r1 = MenuManager.isa.objj_msgSend0(MenuManager, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "init"));
    }
    return menuManagerInstance;
    var ___r1;
}
,["MenuManager"])]);
}p;16;SessionManager.jt;27545;@STATIC;1.0;I;23;Foundation/Foundation.ji;15;SessionWindow.ji;17;SessionMenuItem.ji;16;DesktopManager.ji;20;Utils/HashFragment.ji;22;Utils/URLQueryString.jt;27382;objj_executeFile("Foundation/Foundation.j", NO);objj_executeFile("SessionWindow.j", YES);objj_executeFile("SessionMenuItem.j", YES);objj_executeFile("DesktopManager.j", YES);objj_executeFile("Utils/HashFragment.j", YES);objj_executeFile("Utils/URLQueryString.j", YES);var GITHUB_CLIENT_ID = "39cee75ce85db5da2576";
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
        (self == null ? null : self.isa.objj_msgSend1(self, "setView:", ((___r1 = SessionWindow.isa.objj_msgSend0(SessionWindow, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "init"))));
        ((___r1 = (self == null ? null : self.isa.objj_msgSend0(self, "view"))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setDelegate:", self));
        self.currentResponseHandler = sel_getUid("noResponseHandler:data:");
        self.statusMenuItem = ((___r1 = SessionMenuItem.isa.objj_msgSend0(SessionMenuItem, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "init"));
        ((___r1 = self.statusMenuItem), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setTarget:", self));
        (self == null ? null : self.isa.objj_msgSend0(self, "getUserData"));
        window.addEventListener('message', function(event)
        {
            try            {
                var obj = URLQueryString.isa.objj_msgSend1(URLQueryString, "deserialize:", event.data);
                (self == null ? null : self.isa.objj_msgSend1(self, "handleSessionManagerMessage:", obj));
            }
            catch(e)             {
                CPLog("Received bad message");
            }        });
    }
    return self;
    var ___r1;
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
    ((___r1 = self.isa.objj_msgSend0(self, "view")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "updateForScreenWidth:", newRect.size.width));
    var ___r1;
}
,["void","CGRect"]), new objj_method(sel_getUid("handleSessionManagerMessage:"), function $SessionManager__handleSessionManagerMessage_(self, _cmd, anObject)
{
    console.log(anObject);
    if (anObject.type === "githubLogin")
    {
        if (anObject.authToken)
        {
            self.isa.objj_msgSend1(self, "setAuthToken:", anObject.authToken);
            self.isa.objj_msgSend0(self, "getUserData");
        }
        else if (anObject.error)
        {
            self.isa.objj_msgSend0(self, "showLoginWindow");
            ((___r1 = self.isa.objj_msgSend0(self, "view")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setCustomError:", CPString.isa.objj_msgSend2(CPString, "stringWithFormat:", "Unable to login using Github. Reason: %@", anObject.error)));
            ((___r1 = self.isa.objj_msgSend0(self, "view")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "update"));
        }
        else
        {
            console.log("wtf");
        }
    }
    var ___r1;
}
,["void","id"]), new objj_method(sel_getUid("menuItemClicked:"), function $SessionManager__menuItemClicked_(self, _cmd, sender)
{
    self.isa.objj_msgSend0(self, "showLoginWindow");
    return sender;
}
,["id","id"]), new objj_method(sel_getUid("getUserData"), function $SessionManager__getUserData(self, _cmd)
{
    if (self.isa.objj_msgSend0(self, "authToken").length > 0)
    {
        self.currentResponseHandler = sel_getUid("getUserDataHandler:forData:");
        self.isa.objj_msgSend2(self, "get:andNotify:", "/sessions/current", self);
    }
    else
    {
        self.userData = nil;
        ((___r1 = self.statusMenuItem), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setTitle:", "Log In"));
        ((___r1 = CPNotificationCenter.isa.objj_msgSend0(CPNotificationCenter, "defaultCenter")), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "postNotificationName:object:", NOTIFICATION_LOGIN_DATA_UPDATED, self));
    }
    var ___r1;
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
        ((___r1 = self.statusMenuItem), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setTitle:", CPString.isa.objj_msgSend2(CPString, "stringWithFormat:", "Logged in as %@", result.username)));
        self.userData = result;
    }
    else
    {
        ((___r1 = self.isa.objj_msgSend0(self, "view")), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "setState:andResetFields:", SessionWindow.isa.objj_msgSend0(SessionWindow, "loginState"), NO));
        ((___r1 = self.isa.objj_msgSend0(self, "view")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setCustomError:", data));
        ((___r1 = self.isa.objj_msgSend0(self, "view")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "update"));
        self.userData = nil;
    }
    ((___r1 = CPNotificationCenter.isa.objj_msgSend0(CPNotificationCenter, "defaultCenter")), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "postNotificationName:object:", NOTIFICATION_LOGIN_DATA_UPDATED, self));
    var ___r1;
}
,["void","int","CPString"]), new objj_method(sel_getUid("validationResponseHandler:forData:"), function $SessionManager__validationResponseHandler_forData_(self, _cmd, statusCode, data)
{
    if (statusCode == 200)
    {
        var alert = CPAlert.isa.objj_msgSend1(CPAlert, "alertWithError:", CPString.isa.objj_msgSend1(CPString, "stringWithFormat:", "Your account is now validated. You may log in now."));
        (alert == null ? null : alert.isa.objj_msgSend1(alert, "setAlertStyle:", CPInformationalAlertStyle));
        (alert == null ? null : alert.isa.objj_msgSend0(alert, "runModal"));
    }
    else
    {
        var alert = CPAlert.isa.objj_msgSend1(CPAlert, "alertWithError:", CPString.isa.objj_msgSend1(CPString, "stringWithFormat:", "Something went wrong. Maybe you already validated."));
        (alert == null ? null : alert.isa.objj_msgSend0(alert, "runModal"));
    }
}
,["void","int","CPString"]), new objj_method(sel_getUid("loginResponseHandler:forData:"), function $SessionManager__loginResponseHandler_forData_(self, _cmd, statusCode, data)
{
    if (statusCode == 200)
    {
        self.isa.objj_msgSend1(self, "setAuthToken:", data);
        ((___r1 = DesktopManager.isa.objj_msgSend0(DesktopManager, "instance")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "removeViewController:", self));
    }
    else
    {
        self.isa.objj_msgSend0(self, "clearAuthToken");
        ((___r1 = self.isa.objj_msgSend0(self, "view")), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "setState:andResetFields:", SessionWindow.isa.objj_msgSend0(SessionWindow, "loginState"), NO));
        ((___r1 = self.isa.objj_msgSend0(self, "view")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setCustomError:", data));
        ((___r1 = self.isa.objj_msgSend0(self, "view")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "update"));
    }
    self.isa.objj_msgSend0(self, "getUserData");
    var ___r1;
}
,["void","int","CPString"]), new objj_method(sel_getUid("registerResponseHandler:forData:"), function $SessionManager__registerResponseHandler_forData_(self, _cmd, statusCode, data)
{
    if (statusCode == 200)
    {
        ((___r1 = self.isa.objj_msgSend0(self, "view")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setState:", SessionWindow.isa.objj_msgSend0(SessionWindow, "loginState")));
        ((___r1 = self.isa.objj_msgSend0(self, "view")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setCustomMessage:", "You should receive an e-mail with an activation link. Go to that link and then you will be able to log in."));
        ((___r1 = self.isa.objj_msgSend0(self, "view")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "update"));
    }
    else
    {
        ((___r1 = self.isa.objj_msgSend0(self, "view")), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "setState:andResetFields:", SessionWindow.isa.objj_msgSend0(SessionWindow, "registrationState"), NO));
        ((___r1 = self.isa.objj_msgSend0(self, "view")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setCustomError:", data));
        ((___r1 = self.isa.objj_msgSend0(self, "view")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "update"));
    }
    var ___r1;
}
,["void","int","CPString"]), new objj_method(sel_getUid("submitUsernameResponseHandler:forData:"), function $SessionManager__submitUsernameResponseHandler_forData_(self, _cmd, statusCode, data)
{
    if (statusCode == 200)
    {
        ((___r1 = self.isa.objj_msgSend0(self, "view")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setState:", SessionWindow.isa.objj_msgSend0(SessionWindow, "loginState")));
        ((___r1 = self.isa.objj_msgSend0(self, "view")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setCustomMessage:", "Your password has been changed. You may now log in with your new password"));
        ((___r1 = self.isa.objj_msgSend0(self, "view")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "update"));
    }
    else
    {
        ((___r1 = self.isa.objj_msgSend0(self, "view")), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "setState:andResetFields:", SessionWindow.isa.objj_msgSend0(SessionWindow, "changePasswordState"), NO));
        ((___r1 = self.isa.objj_msgSend0(self, "view")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setCustomError:", data));
        ((___r1 = self.isa.objj_msgSend0(self, "view")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "update"));
    }
    var ___r1;
}
,["void","int","CPString"]), new objj_method(sel_getUid("forgotPasswordResponseHandler:forData:"), function $SessionManager__forgotPasswordResponseHandler_forData_(self, _cmd, statusCode, data)
{
    if (statusCode == 200)
    {
        ((___r1 = self.isa.objj_msgSend0(self, "view")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setState:", SessionWindow.isa.objj_msgSend0(SessionWindow, "loginState")));
        ((___r1 = self.isa.objj_msgSend0(self, "view")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setCustomMessage:", "You should receive an e-mail containing instructions on how to change your password"));
        ((___r1 = self.isa.objj_msgSend0(self, "view")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "update"));
    }
    else
    {
        ((___r1 = self.isa.objj_msgSend0(self, "view")), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "setState:andResetFields:", SessionWindow.isa.objj_msgSend0(SessionWindow, "forgotPasswordState"), NO));
        ((___r1 = self.isa.objj_msgSend0(self, "view")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setCustomError:", data));
        ((___r1 = self.isa.objj_msgSend0(self, "view")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "update"));
    }
    var ___r1;
}
,["void","int","CPString"]), new objj_method(sel_getUid("_buildUrl:"), function $SessionManager___buildUrl_(self, _cmd, apiPath)
{
    var query = {auth: self.isa.objj_msgSend0(self, "authToken"), lang: "en"};
    var url = CPURL.isa.objj_msgSend1(CPURL, "URLWithString:", CPString.isa.objj_msgSend(CPString, "stringWithFormat:", "%@%@?%@", apiServerUrl, apiPath, URLQueryString.isa.objj_msgSend1(URLQueryString, "serialize:", query)));
    return url;
}
,["CPURL","CPString"]), new objj_method(sel_getUid("_performRequest:withDelegate:"), function $SessionManager___performRequest_withDelegate_(self, _cmd, aRequest, delegate)
{
    var conn = ((___r1 = CPURLConnection.isa.objj_msgSend0(CPURLConnection, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "initWithRequest:delegate:", aRequest, delegate));
    (conn == null ? null : conn.isa.objj_msgSend0(conn, "start"));
    var ___r1;
}
,["void","CPURLRequest","id"]), new objj_method(sel_getUid("get:andNotify:"), function $SessionManager__get_andNotify_(self, _cmd, aUrl, delegate)
{
    var url = self.isa.objj_msgSend1(self, "_buildUrl:", aUrl);
    var request = CPURLRequest.isa.objj_msgSend1(CPURLRequest, "requestWithURL:", url);
    (request == null ? null : request.isa.objj_msgSend1(request, "setHTTPMethod:", "GET"));
    self.isa.objj_msgSend2(self, "_performRequest:withDelegate:", request, delegate);
}
,["id","CPString","id"]), new objj_method(sel_getUid("post:withData:andNotify:"), function $SessionManager__post_withData_andNotify_(self, _cmd, aUrl, json, delegate)
{
    var url = self.isa.objj_msgSend1(self, "_buildUrl:", aUrl);
    var request = CPURLRequest.isa.objj_msgSend1(CPURLRequest, "requestWithURL:", url);
    (request == null ? null : request.isa.objj_msgSend1(request, "setHTTPMethod:", "POST"));
    (request == null ? null : request.isa.objj_msgSend1(request, "setHTTPBody:", JSON.stringify(json)));
    self.isa.objj_msgSend2(self, "_performRequest:withDelegate:", request, delegate);
}
,["id","CPString","id","id"]), new objj_method(sel_getUid("put:withData:andNotify:"), function $SessionManager__put_withData_andNotify_(self, _cmd, aUrl, json, delegate)
{
    var url = self.isa.objj_msgSend1(self, "_buildUrl:", aUrl);
    var request = CPURLRequest.isa.objj_msgSend1(CPURLRequest, "requestWithURL:", url);
    (request == null ? null : request.isa.objj_msgSend1(request, "setHTTPMethod:", "PUT"));
    (request == null ? null : request.isa.objj_msgSend1(request, "setHTTPBody:", JSON.stringify(json)));
    self.isa.objj_msgSend2(self, "_performRequest:withDelegate:", request, delegate);
}
,["id","CPString","id","id"]), new objj_method(sel_getUid("delete:andNotify:"), function $SessionManager__delete_andNotify_(self, _cmd, aUrl, delegate)
{
    var url = self.isa.objj_msgSend1(self, "_buildUrl:", aUrl);
    var request = CPURLRequest.isa.objj_msgSend1(CPURLRequest, "requestWithURL:", url);
    (request == null ? null : request.isa.objj_msgSend1(request, "setHTTPMethod:", "DELETE"));
    self.isa.objj_msgSend2(self, "_performRequest:withDelegate:", request, delegate);
}
,["id","CPString","id"]), new objj_method(sel_getUid("loginWithUsername:andPassword:"), function $SessionManager__loginWithUsername_andPassword_(self, _cmd, aUsername, aPassword)
{
    CPLog("Login: %@ %@", aUsername, aPassword);
    self.currentResponseHandler = sel_getUid("loginResponseHandler:forData:");
    self.isa.objj_msgSend3(self, "post:withData:andNotify:", "/sessions", {username: aUsername, password: aPassword}, self);
}
,["void","CPString","CPString"]), new objj_method(sel_getUid("register:withPassword:andEmail:"), function $SessionManager__register_withPassword_andEmail_(self, _cmd, aUsername, aPassword, anEmail)
{
    CPLog("Register: %@ %@ %@", aUsername, aPassword, anEmail);
    self.currentResponseHandler = sel_getUid("registerResponseHandler:forData:");
    self.isa.objj_msgSend3(self, "post:withData:andNotify:", "/users", {username: aUsername, password: aPassword, email: anEmail}, self);
}
,["void","CPString","CPString","CPString"]), new objj_method(sel_getUid("changePassword:forUser:"), function $SessionManager__changePassword_forUser_(self, _cmd, aPassword, aUsername)
{
    var hash = HashFragment.isa.objj_msgSend0(HashFragment, "fragmentAsObject");
    CPLog("ChangePassword: %@ %@ %@", hash.validateUsername, aPassword, hash.forgotPassword);
    self.currentResponseHandler = sel_getUid("submitUsernameResponseHandler:forData:");
    self.isa.objj_msgSend3(self, "post:withData:andNotify:", "/users/" + hash.validateUsername + "/password", {name: hash.validateUsername, password: aPassword, validationToken: hash.forgotPassword}, self);
}
,["void","CPString","CPString"]), new objj_method(sel_getUid("requestForgottenPasswordForUser:andEmail:"), function $SessionManager__requestForgottenPasswordForUser_andEmail_(self, _cmd, aUsername, anEmail)
{
    CPLog("ForgotPassword: %@ %@", aUsername, anEmail);
    self.currentResponseHandler = sel_getUid("forgotPasswordResponseHandler:forData:");
    self.isa.objj_msgSend3(self, "post:withData:andNotify:", "/users/" + aUsername + "/forgotPassword", {name: aUsername, email: anEmail}, self);
}
,["void","CPString","CPString"]), new objj_method(sel_getUid("validateUser:withToken:"), function $SessionManager__validateUser_withToken_(self, _cmd, aUsername, aToken)
{
    CPLog("Validating User: %@ %@", aUsername, aToken);
    self.currentResponseHandler = sel_getUid("validationResponseHandler:forData:");
    self.isa.objj_msgSend3(self, "post:withData:andNotify:", "/users/" + aUsername + "/validation", {name: aUsername, validationToken: aToken}, self);
    HashFragment.isa.objj_msgSend0(HashFragment, "clearFragment");
}
,["void","CPString","CPString"]), new objj_method(sel_getUid("logout"), function $SessionManager__logout(self, _cmd)
{
    CPLog("Logout");
    self.currentResponseHandler = sel_getUid("nullResponseHandler:forData:");
    self.isa.objj_msgSend2(self, "delete:andNotify:", "/sessions/current", self);
    self.isa.objj_msgSend0(self, "clearAuthToken");
    self.isa.objj_msgSend0(self, "getUserData");
}
,["void"]), new objj_method(sel_getUid("connection:didFailWithError:"), function $SessionManager__connection_didFailWithError_(self, _cmd, connection, error)
{
    CPLog("Error: %@", error);
}
,["void","CPURLConnection","id"]), new objj_method(sel_getUid("connection:didReceiveResponse:"), function $SessionManager__connection_didReceiveResponse_(self, _cmd, connection, response)
{
    self.currentStatusCode = (response == null ? null : response.isa.objj_msgSend0(response, "statusCode"));
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
    self.isa.objj_msgSend3(self, "performSelector:withObject:withObject:", self.currentResponseHandler, self.currentStatusCode, self.currentData);
}
,["void","CPURLConnection"]), new objj_method(sel_getUid("connectionDidReceiveAuthenticationChallenge:"), function $SessionManager__connectionDidReceiveAuthenticationChallenge_(self, _cmd, connection)
{
    self.isa.objj_msgSend0(self, "clearAuthToken");
    self.isa.objj_msgSend0(self, "getUserData");
    self.isa.objj_msgSend0(self, "showLoginWindow");
    ((___r1 = self.isa.objj_msgSend0(self, "view")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setCustomMessage:", "You need to log in to do this"));
    ((___r1 = self.isa.objj_msgSend0(self, "view")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "update"));
    var ___r1;
}
,["void","id"]), new objj_method(sel_getUid("loginWithGithub"), function $SessionManager__loginWithGithub(self, _cmd)
{
    var queryString = URLQueryString.isa.objj_msgSend1(URLQueryString, "serialize:", {client_id: GITHUB_CLIENT_ID, scope: "gist,user:email"});
    var request = CPString.isa.objj_msgSend2(CPString, "stringWithFormat:", "https://github.com/login/oauth/authorize?%@", queryString);
    popupwindow(request, "asd", 1024, 768);
}
,["void"]), new objj_method(sel_getUid("showLoginWindow"), function $SessionManager__showLoginWindow(self, _cmd)
{
    if (self.isa.objj_msgSend0(self, "authToken").length == 0)
    {
        ((___r1 = DesktopManager.isa.objj_msgSend0(DesktopManager, "instance")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "pushTopViewController:", self));
        ((___r1 = self.isa.objj_msgSend0(self, "view")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setState:", SessionWindow.isa.objj_msgSend0(SessionWindow, "loginState")));
    }
    else
    {
        ((___r1 = DesktopManager.isa.objj_msgSend0(DesktopManager, "instance")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "pushTopViewController:", self));
        ((___r1 = self.isa.objj_msgSend0(self, "view")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setState:", SessionWindow.isa.objj_msgSend0(SessionWindow, "logoutState")));
    }
    var ___r1;
}
,["void"]), new objj_method(sel_getUid("showChangePasswordWindow"), function $SessionManager__showChangePasswordWindow(self, _cmd)
{
    ((___r1 = DesktopManager.isa.objj_msgSend0(DesktopManager, "instance")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "pushTopViewController:", self));
    ((___r1 = self.isa.objj_msgSend0(self, "view")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setState:", SessionWindow.isa.objj_msgSend0(SessionWindow, "changePasswordState")));
    HashFragment.isa.objj_msgSend0(HashFragment, "clearFragment");
    var ___r1;
}
,["void"]), new objj_method(sel_getUid("cancelButtonClicked:"), function $SessionManager__cancelButtonClicked_(self, _cmd, sender)
{
    ((___r1 = DesktopManager.isa.objj_msgSend0(DesktopManager, "instance")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "removeViewController:", self));
    var ___r1;
}
,["id","id"]), new objj_method(sel_getUid("loginButtonClicked:"), function $SessionManager__loginButtonClicked_(self, _cmd, sender)
{
    self.isa.objj_msgSend2(self, "loginWithUsername:andPassword:", ((___r1 = self.isa.objj_msgSend0(self, "view")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "username")), ((___r1 = self.isa.objj_msgSend0(self, "view")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "password")));
    ((___r1 = self.isa.objj_msgSend0(self, "view")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setState:", SessionWindow.isa.objj_msgSend0(SessionWindow, "waitingState")));
    var ___r1;
}
,["id","id"]), new objj_method(sel_getUid("logoutButtonClicked:"), function $SessionManager__logoutButtonClicked_(self, _cmd, sender)
{
    self.isa.objj_msgSend0(self, "logout");
    ((___r1 = DesktopManager.isa.objj_msgSend0(DesktopManager, "instance")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "removeViewController:", self));
    var ___r1;
}
,["id","id"]), new objj_method(sel_getUid("registerButtonClicked:"), function $SessionManager__registerButtonClicked_(self, _cmd, sender)
{
    self.isa.objj_msgSend3(self, "register:withPassword:andEmail:", ((___r1 = self.isa.objj_msgSend0(self, "view")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "username")), ((___r1 = self.isa.objj_msgSend0(self, "view")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "password")), ((___r1 = self.isa.objj_msgSend0(self, "view")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "email")));
    ((___r1 = self.isa.objj_msgSend0(self, "view")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setState:", SessionWindow.isa.objj_msgSend0(SessionWindow, "waitingState")));
    var ___r1;
}
,["id","id"]), new objj_method(sel_getUid("submitUsernameButtonClicked:"), function $SessionManager__submitUsernameButtonClicked_(self, _cmd, sender)
{
    self.isa.objj_msgSend2(self, "requestForgottenPasswordForUser:andEmail:", ((___r1 = self.isa.objj_msgSend0(self, "view")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "username")), ((___r1 = self.isa.objj_msgSend0(self, "view")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "email")));
    ((___r1 = self.isa.objj_msgSend0(self, "view")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setState:", SessionWindow.isa.objj_msgSend0(SessionWindow, "waitingState")));
    var ___r1;
}
,["id","id"]), new objj_method(sel_getUid("changePasswordButtonClicked:"), function $SessionManager__changePasswordButtonClicked_(self, _cmd, sender)
{
    self.isa.objj_msgSend2(self, "changePassword:forUser:", ((___r1 = self.isa.objj_msgSend0(self, "view")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "password")), ((___r1 = self.isa.objj_msgSend0(self, "view")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "username")));
    ((___r1 = self.isa.objj_msgSend0(self, "view")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setState:", SessionWindow.isa.objj_msgSend0(SessionWindow, "waitingState")));
    var ___r1;
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
        session = ((___r1 = SessionManager.isa.objj_msgSend0(SessionManager, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "init"));
        CPURLConnection.isa.objj_msgSend1(CPURLConnection, "setClassDelegate:", session);
    }
    return session;
    var ___r1;
}
,["SessionManager"])]);
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
}p;28;SessionTableViewController.jt;4569;@STATIC;1.0;I;23;Foundation/Foundation.jI;15;AppKit/AppKit.ji;16;SessionManager.ji;16;BunnyTableView.jt;4460;objj_executeFile("Foundation/Foundation.j", NO);objj_executeFile("AppKit/AppKit.j", NO);objj_executeFile("SessionManager.j", YES);objj_executeFile("BunnyTableView.j", YES);{var the_class = objj_allocateClassPair(CPViewController, "SessionTableViewController"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("tableView"), new objj_ivar("sessionTable"), new objj_ivar("currentStatusCode"), new objj_ivar("currentData")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("init"), function $SessionTableViewController__init(self, _cmd)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("SessionTableViewController").super_class }, "init");
    if (self)
    {
        self.tableView = ((___r1 = BunnyTableView.isa.objj_msgSend0(BunnyTableView, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "init"));
        ((___r1 = self.tableView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setDataSource:", self));
        ((___r1 = self.tableView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setDelegate:", self));
        ((___r1 = self.tableView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "addColumnNamed:", "userid"));
        ((___r1 = self.tableView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "addColumnNamed:", "loginTime"));
        ((___r1 = self.tableView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "addColumnNamed:", "ip"));
        ((___r1 = self.tableView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "addColumnNamed:", "lastUseTime"));
        ((___r1 = self.tableView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "addColumnNamed:", "expiryTime"));
        (self == null ? null : self.isa.objj_msgSend0(self, "reloadData"));
        (self == null ? null : self.isa.objj_msgSend1(self, "setView:", self.tableView));
    }
    return self;
    var ___r1;
}
,["id"]), new objj_method(sel_getUid("reloadData"), function $SessionTableViewController__reloadData(self, _cmd)
{
    ((___r1 = SessionManager.isa.objj_msgSend0(SessionManager, "instance")), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "get:andNotify:", "/admin/sessions", self));
    var ___r1;
}
,["void"]), new objj_method(sel_getUid("reloadButtonClicked:"), function $SessionTableViewController__reloadButtonClicked_(self, _cmd, sender)
{
    self.isa.objj_msgSend0(self, "reloadData");
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
    return self.sessionTable[aRowIndex][(aColumn == null ? null : aColumn.isa.objj_msgSend0(aColumn, "identifier"))];
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
    self.currentStatusCode = (response == null ? null : response.isa.objj_msgSend0(response, "statusCode"));
}
,["void","CPURLConnection","CPHTTPURLResponse"]), new objj_method(sel_getUid("connection:didReceiveData:"), function $SessionTableViewController__connection_didReceiveData_(self, _cmd, connection, data)
{
    self.currentData = data;
}
,["void","CPURLConnection","CPString"]), new objj_method(sel_getUid("connectionDidFinishLoading:"), function $SessionTableViewController__connectionDidFinishLoading_(self, _cmd, connection)
{
    self.sessionTable = JSON.parse(self.currentData);
    ((___r1 = self.tableView), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "reloadData"));
    var ___r1;
}
,["void","CPURLConnection"])]);
}p;15;SessionWindow.jt;56709;@STATIC;1.0;I;23;Foundation/Foundation.jI;15;AppKit/AppKit.ji;20;TextFieldWithLabel.jt;56616;objj_executeFile("Foundation/Foundation.j", NO);objj_executeFile("AppKit/AppKit.j", NO);objj_executeFile("TextFieldWithLabel.j", YES);var LOGIN_STATE = 1;
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
        self.errors = ((___r1 = CPSet.isa.objj_msgSend0(CPSet, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "init"));
        self.customMessage = "";
        self.customError = "";
        self.LOGIN_BOX_WIDTH = WIDE_MODE_WIDTH;
        (self == null ? null : self.isa.objj_msgSend1(self, "setFrame:", CGRectMake(0, 0, self.LOGIN_BOX_WIDTH, 100)));
        (self == null ? null : self.isa.objj_msgSend0(self, "center"));
        (self == null ? null : self.isa.objj_msgSend1(self, "setFrameOrigin:", CGPointMake((self == null ? null : self.isa.objj_msgSend0(self, "frame")).origin.x, (self == null ? null : self.isa.objj_msgSend0(self, "frame")).origin.y - 50)));
        self.messageField = ((___r1 = CPTextField.isa.objj_msgSend0(CPTextField, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithFrame:", CGRectMake(0, 0, 100, 40)));
        ((___r1 = self.messageField), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setLineBreakMode:", CPLineBreakByWordWrapping));
        ((___r1 = self.messageField), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setBackgroundColor:", CPColor.isa.objj_msgSend(CPColor, "colorWithCalibratedRed:green:blue:alpha:", 103.0 / 255.0, 154.0 / 255.0, 205.0 / 255.0, 1.0)));
        ((___r1 = self.messageField), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setTextColor:", CPColor.isa.objj_msgSend0(CPColor, "whiteColor")));
        ((___r1 = self.messageField), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "setValue:forThemeAttribute:", CGInsetMake(9.0, 9.0, 9.0, 9.0), "content-inset"));
        (self == null ? null : self.isa.objj_msgSend1(self, "addSubview:", self.messageField));
        self.errorField = ((___r1 = CPTextField.isa.objj_msgSend0(CPTextField, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithFrame:", CGRectMake(0, 0, 100, 0)));
        ((___r1 = self.errorField), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setLineBreakMode:", CPLineBreakByWordWrapping));
        ((___r1 = self.errorField), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setBackgroundColor:", CPColor.isa.objj_msgSend1(CPColor, "colorWithHexString:", "993333")));
        ((___r1 = self.errorField), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setTextColor:", CPColor.isa.objj_msgSend0(CPColor, "whiteColor")));
        ((___r1 = self.errorField), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "setValue:forThemeAttribute:", CGInsetMake(9.0, 9.0, 9.0, 9.0), "content-inset"));
        (self == null ? null : self.isa.objj_msgSend1(self, "addSubview:", self.errorField));
        self.loginButton = CPButton.isa.objj_msgSend1(CPButton, "buttonWithTitle:", "Log In");
        ((___r1 = self.loginButton), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setFrame:", CGRectMake(10, 180, 185, ((___r2 = self.loginButton), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "bounds")).size.height)));
        ((___r1 = self.loginButton), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setTarget:", self));
        ((___r1 = self.loginButton), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setAction:", sel_getUid("loginButtonClicked:")));
        (self == null ? null : self.isa.objj_msgSend1(self, "addSubview:", self.loginButton));
        self.newAccountButton = CPButton.isa.objj_msgSend1(CPButton, "buttonWithTitle:", "New Account");
        ((___r1 = self.newAccountButton), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setFrame:", CGRectMake(10, 180, 185, ((___r2 = self.newAccountButton), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "bounds")).size.height)));
        ((___r1 = self.newAccountButton), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setTarget:", self));
        ((___r1 = self.newAccountButton), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setAction:", sel_getUid("newAccountButtonClicked:")));
        (self == null ? null : self.isa.objj_msgSend1(self, "addSubview:", self.newAccountButton));
        self.forgotPasswordButton = CPButton.isa.objj_msgSend1(CPButton, "buttonWithTitle:", "Forgot Password");
        ((___r1 = self.forgotPasswordButton), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setFrame:", CGRectMake(10, 180, 185, ((___r2 = self.forgotPasswordButton), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "bounds")).size.height)));
        ((___r1 = self.forgotPasswordButton), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setTarget:", self));
        ((___r1 = self.forgotPasswordButton), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setAction:", sel_getUid("forgotPasswordButtonClicked:")));
        (self == null ? null : self.isa.objj_msgSend1(self, "addSubview:", self.forgotPasswordButton));
        self.registerButton = CPButton.isa.objj_msgSend1(CPButton, "buttonWithTitle:", "Register");
        ((___r1 = self.registerButton), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setFrame:", CGRectMake(10, 180, 185, ((___r2 = self.registerButton), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "bounds")).size.height)));
        ((___r1 = self.registerButton), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setTarget:", self));
        ((___r1 = self.registerButton), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setAction:", sel_getUid("registerButtonClicked:")));
        (self == null ? null : self.isa.objj_msgSend1(self, "addSubview:", self.registerButton));
        self.changePasswordButton = CPButton.isa.objj_msgSend1(CPButton, "buttonWithTitle:", "Change Password");
        ((___r1 = self.changePasswordButton), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setFrame:", CGRectMake(10, 180, 185, ((___r2 = self.changePasswordButton), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "bounds")).size.height)));
        ((___r1 = self.changePasswordButton), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setTarget:", self));
        ((___r1 = self.changePasswordButton), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setAction:", sel_getUid("changePasswordButtonClicked:")));
        (self == null ? null : self.isa.objj_msgSend1(self, "addSubview:", self.changePasswordButton));
        self.submitUsernameButton = CPButton.isa.objj_msgSend1(CPButton, "buttonWithTitle:", "Send Recovery E-mail");
        ((___r1 = self.submitUsernameButton), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setFrame:", CGRectMake(10, 180, 185, ((___r2 = self.submitUsernameButton), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "bounds")).size.height)));
        ((___r1 = self.submitUsernameButton), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setTarget:", self));
        ((___r1 = self.submitUsernameButton), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setAction:", sel_getUid("submitUsernameButtonClicked:")));
        (self == null ? null : self.isa.objj_msgSend1(self, "addSubview:", self.submitUsernameButton));
        self.logoutButton = CPButton.isa.objj_msgSend1(CPButton, "buttonWithTitle:", "Log out");
        ((___r1 = self.logoutButton), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setFrame:", CGRectMake(10, 180, 185, ((___r2 = self.logoutButton), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "bounds")).size.height)));
        ((___r1 = self.logoutButton), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setTarget:", self));
        ((___r1 = self.logoutButton), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setAction:", sel_getUid("logoutButtonClicked:")));
        (self == null ? null : self.isa.objj_msgSend1(self, "addSubview:", self.logoutButton));
        self.cancelButton = CPButton.isa.objj_msgSend1(CPButton, "buttonWithTitle:", "Cancel");
        ((___r1 = self.cancelButton), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setFrame:", CGRectMake(205, 180, 185, ((___r2 = self.cancelButton), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "bounds")).size.height)));
        ((___r1 = self.cancelButton), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setTarget:", self));
        ((___r1 = self.cancelButton), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setAction:", sel_getUid("cancelButtonClicked:")));
        (self == null ? null : self.isa.objj_msgSend1(self, "addSubview:", self.cancelButton));
        self.usernameField = ((___r1 = TextFieldWithLabel.isa.objj_msgSend0(TextFieldWithLabel, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend3(___r1, "initWithLabel:andPlaceHolder:andWidth:", "Username:", "Username", self.LOGIN_BOX_WIDTH - 20));
        ((___r1 = self.usernameField), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setFrameOrigin:", CGPointMake(10, 20)));
        ((___r1 = self.usernameField), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setTarget:", self));
        ((___r1 = self.usernameField), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setTextChangedSelector:", sel_getUid("textChanged:")));
        (self == null ? null : self.isa.objj_msgSend1(self, "addSubview:", self.usernameField));
        self.passwordField = ((___r1 = TextFieldWithLabel.isa.objj_msgSend0(TextFieldWithLabel, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend(___r1, "initWithLabel:andPlaceHolder:andWidth:isSecure:", "Password:", "Password", self.LOGIN_BOX_WIDTH - 20, YES));
        ((___r1 = self.passwordField), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setFrameOrigin:", CGPointMake(10, 50)));
        ((___r1 = self.passwordField), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setTarget:", self));
        ((___r1 = self.passwordField), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setTextChangedSelector:", sel_getUid("textChanged:")));
        (self == null ? null : self.isa.objj_msgSend1(self, "addSubview:", self.passwordField));
        self.passwordConfirmField = ((___r1 = TextFieldWithLabel.isa.objj_msgSend0(TextFieldWithLabel, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend(___r1, "initWithLabel:andPlaceHolder:andWidth:isSecure:", "Password (again):", "Password (again)", self.LOGIN_BOX_WIDTH - 20, YES));
        ((___r1 = self.passwordConfirmField), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setFrameOrigin:", CGPointMake(10, 80)));
        ((___r1 = self.passwordConfirmField), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setTarget:", self));
        ((___r1 = self.passwordConfirmField), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setTextChangedSelector:", sel_getUid("textChanged:")));
        (self == null ? null : self.isa.objj_msgSend1(self, "addSubview:", self.passwordConfirmField));
        self.emailField = ((___r1 = TextFieldWithLabel.isa.objj_msgSend0(TextFieldWithLabel, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend3(___r1, "initWithLabel:andPlaceHolder:andWidth:", "E-mail:", "E-mail", self.LOGIN_BOX_WIDTH - 20));
        ((___r1 = self.emailField), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setFrameOrigin:", CGPointMake(10, 110)));
        ((___r1 = self.emailField), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setTarget:", self));
        ((___r1 = self.emailField), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setTextChangedSelector:", sel_getUid("textChanged:")));
        (self == null ? null : self.isa.objj_msgSend1(self, "addSubview:", self.emailField));
        var spinner = ((___r1 = CPImage.isa.objj_msgSend0(CPImage, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "initWithContentsOfFile:size:", ((___r2 = CPBundle.isa.objj_msgSend0(CPBundle, "mainBundle")), ___r2 == null ? null : ___r2.isa.objj_msgSend1(___r2, "pathForResource:", "spinner.gif")), CGSizeMake(20, 20)));
        (spinner == null ? null : spinner.isa.objj_msgSend1(spinner, "setDelegate:", self));
        self.spinnerView = ((___r1 = CPImageView.isa.objj_msgSend0(CPImageView, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "init"));
        ((___r1 = self.spinnerView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setImage:", spinner));
        ((___r1 = self.spinnerView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setHidden:", YES));
        ((___r1 = self.spinnerView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setFrame:", CGRectMake(self.LOGIN_BOX_WIDTH, 400, 60, 60)));
        (self == null ? null : self.isa.objj_msgSend1(self, "addSubview:", self.spinnerView));
        self.messageSize = 0;
        (self == null ? null : self.isa.objj_msgSend1(self, "setAutoresizingMask:", CPViewMinXMargin | CPViewMaxXMargin | CPViewMinYMargin | CPViewMaxYMargin));
        (self == null ? null : self.isa.objj_msgSend1(self, "setState:", LOGIN_STATE));
    }
    return self;
    var ___r1, ___r2;
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
    ((___r1 = self.usernameField), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setFrame:", CGRectMake(((___r2 = self.usernameField), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "frame")).origin.x, ((___r2 = self.usernameField), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "frame")).origin.y, self.LOGIN_BOX_WIDTH - 20, ((___r2 = self.usernameField), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "frame")).size.height)));
    ((___r1 = self.passwordField), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setFrame:", CGRectMake(((___r2 = self.passwordField), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "frame")).origin.x, ((___r2 = self.passwordField), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "frame")).origin.y, self.LOGIN_BOX_WIDTH - 20, ((___r2 = self.passwordField), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "frame")).size.height)));
    ((___r1 = self.passwordConfirmField), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setFrame:", CGRectMake(((___r2 = self.passwordConfirmField), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "frame")).origin.x, ((___r2 = self.passwordConfirmField), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "frame")).origin.y, self.LOGIN_BOX_WIDTH - 20, ((___r2 = self.passwordConfirmField), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "frame")).size.height)));
    ((___r1 = self.emailField), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setFrame:", CGRectMake(((___r2 = self.emailField), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "frame")).origin.x, ((___r2 = self.emailField), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "frame")).origin.y, self.LOGIN_BOX_WIDTH - 20, ((___r2 = self.emailField), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "frame")).size.height)));
    self.isa.objj_msgSend0(self, "_update");
    var ___r1, ___r2;
}
,["void","int"]), new objj_method(sel_getUid("username"), function $SessionWindow__username(self, _cmd)
{
    return ((___r1 = self.usernameField), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "text"));
    var ___r1;
}
,["CPString"]), new objj_method(sel_getUid("password"), function $SessionWindow__password(self, _cmd)
{
    return ((___r1 = self.passwordField), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "text"));
    var ___r1;
}
,["CPString"]), new objj_method(sel_getUid("email"), function $SessionWindow__email(self, _cmd)
{
    return ((___r1 = self.emailField), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "text"));
    var ___r1;
}
,["CPString"]), new objj_method(sel_getUid("loginButtonClicked:"), function $SessionWindow__loginButtonClicked_(self, _cmd, sender)
{
    if (((___r1 = self.isa.objj_msgSend0(self, "delegate")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "respondsToSelector:", sel_getUid("loginButtonClicked:"))))
    {
        ((___r1 = self.isa.objj_msgSend0(self, "delegate")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "loginButtonClicked:", self));
    }
    return sender;
    var ___r1;
}
,["id","id"]), new objj_method(sel_getUid("registerButtonClicked:"), function $SessionWindow__registerButtonClicked_(self, _cmd, sender)
{
    if (((___r1 = self.isa.objj_msgSend0(self, "delegate")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "respondsToSelector:", sel_getUid("registerButtonClicked:"))))
    {
        ((___r1 = self.isa.objj_msgSend0(self, "delegate")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "registerButtonClicked:", self));
    }
    return sender;
    var ___r1;
}
,["id","id"]), new objj_method(sel_getUid("changePasswordButtonClicked:"), function $SessionWindow__changePasswordButtonClicked_(self, _cmd, sender)
{
    if (((___r1 = self.isa.objj_msgSend0(self, "delegate")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "respondsToSelector:", sel_getUid("changePasswordButtonClicked:"))))
    {
        ((___r1 = self.isa.objj_msgSend0(self, "delegate")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "changePasswordButtonClicked:", self));
    }
    return sender;
    var ___r1;
}
,["id","id"]), new objj_method(sel_getUid("submitUsernameButtonClicked:"), function $SessionWindow__submitUsernameButtonClicked_(self, _cmd, sender)
{
    if (((___r1 = self.isa.objj_msgSend0(self, "delegate")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "respondsToSelector:", sel_getUid("submitUsernameButtonClicked:"))))
    {
        ((___r1 = self.isa.objj_msgSend0(self, "delegate")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "submitUsernameButtonClicked:", self));
    }
    return sender;
    var ___r1;
}
,["id","id"]), new objj_method(sel_getUid("logoutButtonClicked:"), function $SessionWindow__logoutButtonClicked_(self, _cmd, sender)
{
    if (((___r1 = self.isa.objj_msgSend0(self, "delegate")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "respondsToSelector:", sel_getUid("logoutButtonClicked:"))))
    {
        ((___r1 = self.isa.objj_msgSend0(self, "delegate")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "logoutButtonClicked:", self));
    }
    return sender;
    var ___r1;
}
,["id","id"]), new objj_method(sel_getUid("cancelButtonClicked:"), function $SessionWindow__cancelButtonClicked_(self, _cmd, sender)
{
    if (((___r1 = self.isa.objj_msgSend0(self, "delegate")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "respondsToSelector:", sel_getUid("cancelButtonClicked:"))))
    {
        ((___r1 = self.isa.objj_msgSend0(self, "delegate")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "cancelButtonClicked:", self));
    }
    return sender;
    var ___r1;
}
,["id","id"]), new objj_method(sel_getUid("newAccountButtonClicked:"), function $SessionWindow__newAccountButtonClicked_(self, _cmd, sender)
{
    self.isa.objj_msgSend1(self, "setState:", REGISTRATION_STATE);
    return sender;
}
,["id","id"]), new objj_method(sel_getUid("forgotPasswordButtonClicked:"), function $SessionWindow__forgotPasswordButtonClicked_(self, _cmd, sender)
{
    self.isa.objj_msgSend1(self, "setState:", FORGOTPASSWORD_STATE);
    return sender;
}
,["id","id"]), new objj_method(sel_getUid("usernameIsValid:"), function $SessionWindow__usernameIsValid_(self, _cmd, username)
{
    if (username.length < MINIMUM_USERNAME_LENGTH)
    {
        ((___r1 = self.errors), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "addObject:", CPString.isa.objj_msgSend2(CPString, "stringWithFormat:", "Username must be at least %d letters", MINIMUM_USERNAME_LENGTH)));
        return NO;
    }
    ((___r1 = self.errors), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "removeObject:", CPString.isa.objj_msgSend2(CPString, "stringWithFormat:", "Username must be at least %d letters", MINIMUM_USERNAME_LENGTH)));
    return YES;
    var ___r1;
}
,["BOOL","CPString"]), new objj_method(sel_getUid("passwordIsValid:"), function $SessionWindow__passwordIsValid_(self, _cmd, password)
{
    if (password.length < MINIMUM_PASSWORD_LENGTH)
    {
        ((___r1 = self.errors), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "addObject:", CPString.isa.objj_msgSend2(CPString, "stringWithFormat:", "Password must be at least %d letters", MINIMUM_PASSWORD_LENGTH)));
        return NO;
    }
    ((___r1 = self.errors), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "removeObject:", CPString.isa.objj_msgSend2(CPString, "stringWithFormat:", "Password must be at least %d letters", MINIMUM_PASSWORD_LENGTH)));
    return YES;
    var ___r1;
}
,["BOOL","CPString"]), new objj_method(sel_getUid("passwordsMatch:"), function $SessionWindow__passwordsMatch_(self, _cmd, password)
{
    if (password !== ((___r1 = self.passwordField), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "text")))
    {
        ((___r1 = self.errors), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "addObject:", "Passwords do not match"));
        return NO;
    }
    ((___r1 = self.errors), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "removeObject:", "Passwords do not match"));
    return YES;
    var ___r1;
}
,["BOOL","CPString"]), new objj_method(sel_getUid("emailIsValid:"), function $SessionWindow__emailIsValid_(self, _cmd, email)
{
    if (!EMAIL_REGEX.test(email))
    {
        ((___r1 = self.errors), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "addObject:", "Please type in a valid e-mail address"));
        return NO;
    }
    ((___r1 = self.errors), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "removeObject:", "Please type in a valid e-mail address"));
    return YES;
    var ___r1;
}
,["BOOL","CPString"]), new objj_method(sel_getUid("setMessage:"), function $SessionWindow__setMessage_(self, _cmd, aMessage)
{
    ((___r1 = self.messageField), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setStringValue:", aMessage));
    var ___r1;
}
,["void","CPString"]), new objj_method(sel_getUid("setError:"), function $SessionWindow__setError_(self, _cmd, anErrorMessage)
{
    ((___r1 = self.errorField), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setStringValue:", anErrorMessage));
    var ___r1;
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
        self.isa.objj_msgSend2(self, "setState:andResetFields:", state, NO);
    }
    else
    {
        self.isa.objj_msgSend2(self, "setState:andResetFields:", state, YES);
    }
}
,["void","CPInteger"]), new objj_method(sel_getUid("setState:andResetFields:"), function $SessionWindow__setState_andResetFields_(self, _cmd, state, eraseAllFields)
{
    ((___r1 = self.errors), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "removeAllObjects"));
    if (eraseAllFields)
    {
        ((___r1 = self.usernameField), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setText:", ""));
        ((___r1 = self.passwordField), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setText:", ""));
        ((___r1 = self.passwordConfirmField), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setText:", ""));
        ((___r1 = self.emailField), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setText:", ""));
    }
    self.customMessage = "";
    self.customError = "";
    self.currentState = state;
    switch(self.currentState) {
    case LOGIN_STATE:
        self.message = "";
        ((___r1 = self.usernameField), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setValidator:", nil));
        ((___r1 = self.passwordField), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setValidator:", nil));
        ((___r1 = self.passwordConfirmField), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setValidator:", nil));
        ((___r1 = self.emailField), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setValidator:", nil));
        break;
    case REGISTRATION_STATE:
        self.message = "Account registration: A validation e-mail will be sent to you which contains a link you need to click before you can use your account.\n" + self.isa.objj_msgSend0(self, "_getPasswordRules");
        ((___r1 = self.usernameField), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setValidator:", sel_getUid("usernameIsValid:")));
        ((___r1 = self.passwordField), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setValidator:", sel_getUid("passwordIsValid:")));
        ((___r1 = self.passwordConfirmField), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setValidator:", sel_getUid("passwordsMatch:")));
        ((___r1 = self.emailField), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setValidator:", sel_getUid("emailIsValid:")));
        break;
    case FORGOTPASSWORD_STATE:
        self.message = "Forgot your password? Fear not. Enter your username and e-mail here and a reset password link will be sent to your e-mail";
        ((___r1 = self.usernameField), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setValidator:", sel_getUid("usernameIsValid:")));
        ((___r1 = self.passwordField), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setValidator:", nil));
        ((___r1 = self.passwordConfirmField), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setValidator:", nil));
        ((___r1 = self.emailField), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setValidator:", sel_getUid("emailIsValid:")));
        break;
    case CHANGEPASSWORD_STATE:
        self.message = "Change your password to something memorable and long..\n" + self.isa.objj_msgSend0(self, "_getPasswordRules");
        ((___r1 = self.usernameField), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setValidator:", nil));
        ((___r1 = self.passwordField), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setValidator:", sel_getUid("passwordIsValid:")));
        ((___r1 = self.passwordConfirmField), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setValidator:", sel_getUid("passwordsMatch:")));
        ((___r1 = self.emailField), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setValidator:", nil));
        break;
    case LOGOUT_STATE:
        self.message = "";
        ((___r1 = self.usernameField), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setValidator:", nil));
        ((___r1 = self.passwordField), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setValidator:", nil));
        ((___r1 = self.passwordConfirmField), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setValidator:", nil));
        ((___r1 = self.emailField), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setValidator:", nil));
        break;
    case WAITING_STATE:
        self.message = "";
        ((___r1 = self.usernameField), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setValidator:", nil));
        ((___r1 = self.passwordField), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setValidator:", nil));
        ((___r1 = self.passwordConfirmField), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setValidator:", nil));
        ((___r1 = self.emailField), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setValidator:", nil));
        break;
    }
    self.isa.objj_msgSend0(self, "_update");
    var ___r1;
}
,["void","CPInteger","BOOL"]), new objj_method(sel_getUid("textChanged:"), function $SessionWindow__textChanged_(self, _cmd, label)
{
    self.isa.objj_msgSend0(self, "_update");
}
,["void","TextFieldWithLabel"]), new objj_method(sel_getUid("update"), function $SessionWindow__update(self, _cmd)
{
    self.isa.objj_msgSend0(self, "_update");
}
,["void"]), new objj_method(sel_getUid("_update"), function $SessionWindow___update(self, _cmd)
{
    ((___r1 = self.usernameField), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "validate"));
    ((___r1 = self.passwordField), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "validate"));
    ((___r1 = self.passwordConfirmField), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "validate"));
    ((___r1 = self.emailField), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "validate"));
    var errorStrings = ((___r1 = self.errors), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "allObjects"));
    if (self.customError.length > 0)
    {
        errorStrings = (errorStrings == null ? null : errorStrings.isa.objj_msgSend1(errorStrings, "arrayByAddingObject:", self.customError));
    }
    var errorString = (errorStrings == null ? null : errorStrings.isa.objj_msgSend1(errorStrings, "componentsJoinedByString:", "\n"));
    self.isa.objj_msgSend1(self, "setError:", errorString);
    var messageStrings = [];
    if (self.message.length > 0)
    {
        messageStrings = (messageStrings == null ? null : messageStrings.isa.objj_msgSend1(messageStrings, "arrayByAddingObject:", self.message));
    }
    if (self.customMessage.length > 0)
    {
        messageStrings = (messageStrings == null ? null : messageStrings.isa.objj_msgSend1(messageStrings, "arrayByAddingObject:", self.customMessage));
    }
    var messageString = (messageStrings == null ? null : messageStrings.isa.objj_msgSend1(messageStrings, "componentsJoinedByString:", "\n"));
    self.isa.objj_msgSend1(self, "setMessage:", messageString);
    var targetWidth = self.isa.objj_msgSend0(self, "frame").size.width;
    var targetHeight = self.isa.objj_msgSend0(self, "frame").size.height;
    var messageFieldSize = {width: self.LOGIN_BOX_WIDTH, height: 0};
    if (messageString && messageString.length > 0)
    {
        messageFieldSize = (messageString == null ? null : messageString.isa.objj_msgSend2(messageString, "sizeWithFont:inWidth:", ((___r1 = self.messageField), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "font")), self.LOGIN_BOX_WIDTH));
        ((___r1 = self.messageField), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setFrame:", CGRectMake(0, 0, self.LOGIN_BOX_WIDTH, messageFieldSize.height + 18)));
    }
    else
    {
        ((___r1 = self.messageField), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setFrame:", CGRectMake(0, 0, self.LOGIN_BOX_WIDTH, 0)));
    }
    var errorFieldSize = {width: self.LOGIN_BOX_WIDTH, height: 0};
    if (((___r1 = self.errorField), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "stringValue")) && ((___r1 = self.errorField), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "stringValue")).length > 0)
    {
        errorFieldSize = ((___r1 = ((___r2 = self.errorField), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "stringValue"))), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "sizeWithFont:inWidth:", ((___r2 = self.errorField), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "font")), self.LOGIN_BOX_WIDTH));
        ((___r1 = self.errorField), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setFrame:", CGRectMake(0, ((___r2 = self.messageField), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "frame")).size.height, self.LOGIN_BOX_WIDTH, errorFieldSize.height + 18)));
    }
    else
    {
        ((___r1 = self.errorField), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setFrame:", CGRectMake(0, ((___r2 = self.messageField), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "frame")).size.height, self.LOGIN_BOX_WIDTH, 0)));
    }
    self.messageSize = ((___r1 = self.messageField), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "frame")).size.height + ((___r1 = self.errorField), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "frame")).size.height;
    switch(self.currentState) {
    case LOGIN_STATE:
        self.isa.objj_msgSend1(self, "setTitle:", "Log In");
        ((___r1 = self.usernameField), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setHidden:", NO));
        ((___r1 = self.passwordField), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setHidden:", NO));
        ((___r1 = self.passwordConfirmField), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setHidden:", YES));
        ((___r1 = self.emailField), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setHidden:", YES));
        ((___r1 = self.registerButton), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setHidden:", YES));
        ((___r1 = self.submitUsernameButton), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setHidden:", YES));
        ((___r1 = self.newAccountButton), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setHidden:", NO));
        ((___r1 = self.forgotPasswordButton), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setHidden:", NO));
        ((___r1 = self.loginButton), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setHidden:", NO));
        ((___r1 = self.changePasswordButton), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setHidden:", YES));
        ((___r1 = self.cancelButton), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setHidden:", NO));
        ((___r1 = self.spinnerView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setHidden:", YES));
        ((___r1 = self.logoutButton), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setHidden:", YES));
        ((___r1 = self.usernameField), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setFrameOrigin:", CGPointMake(10, 10 + self.messageSize)));
        ((___r1 = self.passwordField), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setFrameOrigin:", CGPointMake(10, 40 + self.messageSize)));
        ((___r1 = self.loginButton), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setFrame:", CGRectMake(10, 80 + self.messageSize, (self.LOGIN_BOX_WIDTH - 30) / 2, ((___r2 = self.loginButton), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "bounds")).size.height)));
        ((___r1 = self.cancelButton), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setFrame:", CGRectMake(self.LOGIN_BOX_WIDTH / 2 + 5, 80 + self.messageSize, (self.LOGIN_BOX_WIDTH - 30) / 2, ((___r2 = self.cancelButton), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "bounds")).size.height)));
        ((___r1 = self.newAccountButton), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setFrame:", CGRectMake(10, 110 + self.messageSize, (self.LOGIN_BOX_WIDTH - 30) / 2, ((___r2 = self.loginButton), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "bounds")).size.height)));
        ((___r1 = self.forgotPasswordButton), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setFrame:", CGRectMake(self.LOGIN_BOX_WIDTH / 2 + 5, 110 + self.messageSize, (self.LOGIN_BOX_WIDTH - 30) / 2, ((___r2 = self.cancelButton), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "bounds")).size.height)));
        ((___r1 = ((___r2 = self.usernameField), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "textField"))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setNextKeyView:", ((___r2 = self.passwordField), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "textField"))));
        ((___r1 = ((___r2 = self.passwordField), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "textField"))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setNextKeyView:", ((___r2 = self.usernameField), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "textField"))));
        ((___r1 = self.isa.objj_msgSend0(self, "window")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setDefaultButton:", self.loginButton));
        targetWidth = self.LOGIN_BOX_WIDTH;
        targetHeight = 145 + self.messageSize;
        break;
    case REGISTRATION_STATE:
        self.isa.objj_msgSend1(self, "setTitle:", "New Account");
        ((___r1 = self.usernameField), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setHidden:", NO));
        ((___r1 = self.passwordField), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setHidden:", NO));
        ((___r1 = self.passwordConfirmField), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setHidden:", NO));
        ((___r1 = self.emailField), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setHidden:", NO));
        ((___r1 = self.registerButton), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setHidden:", NO));
        ((___r1 = self.submitUsernameButton), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setHidden:", YES));
        ((___r1 = self.newAccountButton), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setHidden:", YES));
        ((___r1 = self.forgotPasswordButton), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setHidden:", YES));
        ((___r1 = self.loginButton), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setHidden:", YES));
        ((___r1 = self.changePasswordButton), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setHidden:", YES));
        ((___r1 = self.cancelButton), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setHidden:", NO));
        ((___r1 = self.spinnerView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setHidden:", YES));
        ((___r1 = self.logoutButton), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setHidden:", YES));
        ((___r1 = self.usernameField), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setFrameOrigin:", CGPointMake(10, 10 + self.messageSize)));
        ((___r1 = self.passwordField), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setFrameOrigin:", CGPointMake(10, 40 + self.messageSize)));
        ((___r1 = self.passwordConfirmField), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setFrameOrigin:", CGPointMake(10, 70 + self.messageSize)));
        ((___r1 = self.emailField), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setFrameOrigin:", CGPointMake(10, 100 + self.messageSize)));
        ((___r1 = ((___r2 = self.usernameField), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "textField"))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setNextKeyView:", ((___r2 = self.passwordField), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "textField"))));
        ((___r1 = ((___r2 = self.passwordField), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "textField"))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setNextKeyView:", ((___r2 = self.passwordConfirmField), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "textField"))));
        ((___r1 = ((___r2 = self.passwordConfirmField), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "textField"))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setNextKeyView:", ((___r2 = self.emailField), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "textField"))));
        ((___r1 = ((___r2 = self.emailField), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "textField"))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setNextKeyView:", ((___r2 = self.usernameField), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "textField"))));
        ((___r1 = self.registerButton), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setFrame:", CGRectMake(10, 140 + self.messageSize, (self.LOGIN_BOX_WIDTH - 30) / 2, ((___r2 = self.loginButton), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "bounds")).size.height)));
        ((___r1 = self.cancelButton), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setFrame:", CGRectMake(self.LOGIN_BOX_WIDTH / 2 + 5, 140 + self.messageSize, (self.LOGIN_BOX_WIDTH - 30) / 2, ((___r2 = self.cancelButton), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "bounds")).size.height)));
        ((___r1 = self.isa.objj_msgSend0(self, "window")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setDefaultButton:", self.registerButton));
        targetWidth = self.LOGIN_BOX_WIDTH;
        targetHeight = 175 + self.messageSize;
        break;
    case FORGOTPASSWORD_STATE:
        self.isa.objj_msgSend1(self, "setTitle:", "Forgot Password");
        ((___r1 = self.usernameField), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setHidden:", NO));
        ((___r1 = self.passwordField), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setHidden:", YES));
        ((___r1 = self.passwordConfirmField), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setHidden:", YES));
        ((___r1 = self.emailField), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setHidden:", NO));
        ((___r1 = self.registerButton), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setHidden:", YES));
        ((___r1 = self.submitUsernameButton), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setHidden:", NO));
        ((___r1 = self.newAccountButton), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setHidden:", YES));
        ((___r1 = self.forgotPasswordButton), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setHidden:", YES));
        ((___r1 = self.loginButton), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setHidden:", YES));
        ((___r1 = self.changePasswordButton), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setHidden:", YES));
        ((___r1 = self.cancelButton), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setHidden:", NO));
        ((___r1 = self.spinnerView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setHidden:", YES));
        ((___r1 = self.logoutButton), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setHidden:", YES));
        ((___r1 = self.usernameField), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setFrameOrigin:", CGPointMake(10, 10 + self.messageSize)));
        ((___r1 = self.emailField), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setFrameOrigin:", CGPointMake(10, 40 + self.messageSize)));
        ((___r1 = self.submitUsernameButton), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setFrame:", CGRectMake(10, 80 + self.messageSize, (self.LOGIN_BOX_WIDTH - 30) / 2, ((___r2 = self.loginButton), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "bounds")).size.height)));
        ((___r1 = self.cancelButton), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setFrame:", CGRectMake(self.LOGIN_BOX_WIDTH / 2 + 5, 80 + self.messageSize, (self.LOGIN_BOX_WIDTH - 30) / 2, ((___r2 = self.cancelButton), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "bounds")).size.height)));
        ((___r1 = ((___r2 = self.usernameField), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "textField"))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setNextKeyView:", ((___r2 = self.emailField), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "textField"))));
        ((___r1 = ((___r2 = self.emailField), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "textField"))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setNextKeyView:", ((___r2 = self.usernameField), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "textField"))));
        ((___r1 = self.isa.objj_msgSend0(self, "window")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setDefaultButton:", self.submitUsernameButton));
        targetWidth = self.LOGIN_BOX_WIDTH;
        targetHeight = 115 + self.messageSize;
        break;
    case CHANGEPASSWORD_STATE:
        self.isa.objj_msgSend1(self, "setTitle:", "Change Password");
        ((___r1 = self.usernameField), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setHidden:", YES));
        ((___r1 = self.passwordField), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setHidden:", NO));
        ((___r1 = self.passwordConfirmField), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setHidden:", NO));
        ((___r1 = self.emailField), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setHidden:", YES));
        ((___r1 = self.registerButton), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setHidden:", YES));
        ((___r1 = self.submitUsernameButton), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setHidden:", YES));
        ((___r1 = self.newAccountButton), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setHidden:", YES));
        ((___r1 = self.forgotPasswordButton), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setHidden:", YES));
        ((___r1 = self.loginButton), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setHidden:", YES));
        ((___r1 = self.changePasswordButton), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setHidden:", NO));
        ((___r1 = self.cancelButton), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setHidden:", NO));
        ((___r1 = self.spinnerView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setHidden:", YES));
        ((___r1 = self.logoutButton), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setHidden:", YES));
        ((___r1 = self.passwordField), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setFrameOrigin:", CGPointMake(10, 10 + self.messageSize)));
        ((___r1 = self.passwordConfirmField), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setFrameOrigin:", CGPointMake(10, 40 + self.messageSize)));
        ((___r1 = self.changePasswordButton), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setFrame:", CGRectMake(10, 80 + self.messageSize, (self.LOGIN_BOX_WIDTH - 30) / 2, ((___r2 = self.loginButton), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "bounds")).size.height)));
        ((___r1 = self.cancelButton), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setFrame:", CGRectMake(self.LOGIN_BOX_WIDTH / 2 + 5, 80 + self.messageSize, (self.LOGIN_BOX_WIDTH - 30) / 2, ((___r2 = self.cancelButton), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "bounds")).size.height)));
        ((___r1 = ((___r2 = self.passwordField), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "textField"))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setNextKeyView:", ((___r2 = self.passwordConfirmField), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "textField"))));
        ((___r1 = ((___r2 = self.passwordConfirmField), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "textField"))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setNextKeyView:", ((___r2 = self.passwordField), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "textField"))));
        ((___r1 = self.isa.objj_msgSend0(self, "window")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setDefaultButton:", self.changePasswordButton));
        targetWidth = self.LOGIN_BOX_WIDTH;
        targetHeight = 115 + self.messageSize;
        break;
    case LOGOUT_STATE:
        self.isa.objj_msgSend1(self, "setTitle:", "Log out");
        ((___r1 = self.usernameField), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setHidden:", YES));
        ((___r1 = self.passwordField), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setHidden:", YES));
        ((___r1 = self.passwordConfirmField), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setHidden:", YES));
        ((___r1 = self.emailField), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setHidden:", YES));
        ((___r1 = self.registerButton), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setHidden:", YES));
        ((___r1 = self.submitUsernameButton), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setHidden:", YES));
        ((___r1 = self.newAccountButton), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setHidden:", YES));
        ((___r1 = self.forgotPasswordButton), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setHidden:", YES));
        ((___r1 = self.loginButton), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setHidden:", YES));
        ((___r1 = self.changePasswordButton), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setHidden:", YES));
        ((___r1 = self.cancelButton), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setHidden:", NO));
        ((___r1 = self.spinnerView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setHidden:", YES));
        ((___r1 = self.logoutButton), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setHidden:", NO));
        ((___r1 = self.logoutButton), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setFrame:", CGRectMake(10, 20 + self.messageSize, (self.LOGIN_BOX_WIDTH - 30) / 2, ((___r2 = self.logoutButton), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "bounds")).size.height)));
        ((___r1 = self.cancelButton), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setFrame:", CGRectMake(self.LOGIN_BOX_WIDTH / 2 + 5, 20 + self.messageSize, (self.LOGIN_BOX_WIDTH - 30) / 2, ((___r2 = self.cancelButton), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "bounds")).size.height)));
        ((___r1 = self.isa.objj_msgSend0(self, "window")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setDefaultButton:", self.logoutButton));
        targetWidth = self.LOGIN_BOX_WIDTH;
        targetHeight = 65 + self.messageSize;
        break;
    case WAITING_STATE:
        self.isa.objj_msgSend1(self, "setTitle:", "Please wait");
        ((___r1 = self.usernameField), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setHidden:", YES));
        ((___r1 = self.passwordField), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setHidden:", YES));
        ((___r1 = self.passwordConfirmField), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setHidden:", YES));
        ((___r1 = self.emailField), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setHidden:", YES));
        ((___r1 = self.registerButton), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setHidden:", YES));
        ((___r1 = self.submitUsernameButton), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setHidden:", YES));
        ((___r1 = self.newAccountButton), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setHidden:", YES));
        ((___r1 = self.forgotPasswordButton), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setHidden:", YES));
        ((___r1 = self.loginButton), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setHidden:", YES));
        ((___r1 = self.changePasswordButton), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setHidden:", YES));
        ((___r1 = self.cancelButton), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setHidden:", YES));
        ((___r1 = self.spinnerView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setHidden:", NO));
        ((___r1 = self.logoutButton), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setHidden:", YES));
        targetWidth = self.LOGIN_BOX_WIDTH;
        targetHeight = 115 + self.messageSize;
        break;
    }
    var xmargins = (targetWidth - self.isa.objj_msgSend0(self, "frame").size.width) / 2;
    var ymargins = (targetHeight - self.isa.objj_msgSend0(self, "frame").size.height) / 2;
    if (((___r1 = self.errors), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "allObjects")).length > 0)
    {
        ((___r1 = ((___r2 = self.isa.objj_msgSend0(self, "window")), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "defaultButton"))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setEnabled:", NO));
    }
    else
    {
        ((___r1 = ((___r2 = self.isa.objj_msgSend0(self, "window")), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "defaultButton"))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setEnabled:", YES));
    }
    self.isa.objj_msgSend1(self, "setFrame:", CGRectMake(self.isa.objj_msgSend0(self, "frame").origin.x - xmargins, self.isa.objj_msgSend0(self, "frame").origin.y - ymargins, targetWidth, targetHeight));
    ((___r1 = self.spinnerView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setCenter:", self.isa.objj_msgSend0(self, "center")));
    var ___r1, ___r2;
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
}p;20;TextFieldWithLabel.jt;6571;@STATIC;1.0;I;23;Foundation/Foundation.jI;15;AppKit/AppKit.jt;6504;objj_executeFile("Foundation/Foundation.j", NO);objj_executeFile("AppKit/AppKit.j", NO);{var the_class = objj_allocateClassPair(CPView, "TextFieldWithLabel"),
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
    return self.isa.objj_msgSend(self, "initWithLabel:andPlaceHolder:andWidth:isSecure:", aLabel, aPlaceholder, aWidth, NO);
}
,["id","CPString","CPString","CPInteger"]), new objj_method(sel_getUid("initWithLabel:andPlaceHolder:andWidth:isSecure:"), function $TextFieldWithLabel__initWithLabel_andPlaceHolder_andWidth_isSecure_(self, _cmd, aLabel, aPlaceholder, aWidth, secure)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("TextFieldWithLabel").super_class }, "init");
    if (self)
    {
        self.textField = CPTextField.isa.objj_msgSend3(CPTextField, "textFieldWithStringValue:placeholder:width:", "", aPlaceholder, aWidth - 125);
        ((___r1 = self.textField), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setEditable:", YES));
        ((___r1 = self.textField), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setDelegate:", self));
        ((___r1 = self.textField), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setSecure:", secure));
        ((___r1 = self.textField), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setFrameOrigin:", CGPointMake(125, 0)));
        (self == null ? null : self.isa.objj_msgSend1(self, "addSubview:", self.textField));
        self.label = CPTextField.isa.objj_msgSend1(CPTextField, "labelWithTitle:", aLabel);
        ((___r1 = self.label), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setFrame:", CGRectMake(0, 0, 120, ((___r2 = self.textField), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "bounds")).size.height)));
        ((___r1 = self.label), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setVerticalAlignment:", CPCenterVerticalTextAlignment));
        ((___r1 = self.label), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setAlignment:", CPRightTextAlignment));
        (self == null ? null : self.isa.objj_msgSend1(self, "addSubview:", self.label));
        (self == null ? null : self.isa.objj_msgSend1(self, "setFrame:", CGRectMake(0, 0, aWidth, ((___r1 = self.textField), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "bounds")).size.height)));
        ((___r1 = self.textField), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setAutoresizingMask:", CPViewWidthSizable));
    }
    return self;
    var ___r1, ___r2;
}
,["id","CPString","CPString","CPInteger","BOOL"]), new objj_method(sel_getUid("controlTextDidChange:"), function $TextFieldWithLabel__controlTextDidChange_(self, _cmd, aTextField)
{
    self.isa.objj_msgSend0(self, "validate");
    if (((___r1 = self.target), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "respondsToSelector:", self.textChangedSelector)))
    {
        ((___r1 = self.target), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "performSelector:withObject:", self.textChangedSelector, self.textField));
    }
    var ___r1;
}
,["void","CPTextField"]), new objj_method(sel_getUid("validate"), function $TextFieldWithLabel__validate(self, _cmd)
{
    if (((___r1 = self.target), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "respondsToSelector:", self.validator)))
    {
        var valid = ((___r1 = self.target), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "performSelector:withObject:", self.validator, ((___r2 = self.textField), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "stringValue"))));
        if (!valid)
        {
            ((___r1 = self.textField), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setBackgroundColor:", CPColor.isa.objj_msgSend0(CPColor, "redColor")));
        }
        else
        {
            ((___r1 = self.textField), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setBackgroundColor:", CPColor.isa.objj_msgSend0(CPColor, "clearColor")));
        }
        return valid;
    }
    ((___r1 = self.textField), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setBackgroundColor:", CPColor.isa.objj_msgSend0(CPColor, "clearColor")));
    return true;
    var ___r1, ___r2;
}
,["BOOL"]), new objj_method(sel_getUid("controlTextDidEndEditing:"), function $TextFieldWithLabel__controlTextDidEndEditing_(self, _cmd, aTextField)
{
}
,["void","CPTextField"]), new objj_method(sel_getUid("text"), function $TextFieldWithLabel__text(self, _cmd)
{
    return ((___r1 = self.textField), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "stringValue"));
    var ___r1;
}
,["CPString"]), new objj_method(sel_getUid("setText:"), function $TextFieldWithLabel__setText_(self, _cmd, aString)
{
    ((___r1 = self.textField), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setStringValue:", aString));
    var ___r1;
}
,["void","CPString"])]);
}p;25;UserTableViewController.jt;6249;@STATIC;1.0;I;23;Foundation/Foundation.jI;15;AppKit/AppKit.ji;16;SessionManager.ji;16;BunnyTableView.jt;6140;objj_executeFile("Foundation/Foundation.j", NO);objj_executeFile("AppKit/AppKit.j", NO);objj_executeFile("SessionManager.j", YES);objj_executeFile("BunnyTableView.j", YES);{var the_class = objj_allocateClassPair(CPViewController, "UserTableViewController"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("tableView"), new objj_ivar("userTable"), new objj_ivar("currentStatusCode"), new objj_ivar("currentData")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("init"), function $UserTableViewController__init(self, _cmd)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("UserTableViewController").super_class }, "init");
    if (self)
    {
        self.tableView = ((___r1 = BunnyTableView.isa.objj_msgSend0(BunnyTableView, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "init"));
        ((___r1 = self.tableView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setDataSource:", self));
        ((___r1 = self.tableView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setDelegate:", self));
        ((___r1 = self.tableView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "addColumnNamed:", "name"));
        ((___r1 = self.tableView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "addColumnNamed:", "email"));
        ((___r1 = self.tableView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "addColumnNamed:", "password"));
        ((___r1 = self.tableView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "addBooleanColumnNamed:", "validated"));
        ((___r1 = self.tableView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "addColumnNamed:", "validationToken"));
        ((___r1 = self.tableView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "addColumnNamed:", "registrationTime"));
        ((___r1 = self.tableView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "addColumnNamed:", "currentSession"));
        ((___r1 = self.tableView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "addColumnNamed:", "accountType"));
        ((___r1 = self.tableView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "addColumnNamed:", "githubAccessToken"));
        ((___r1 = self.tableView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "addColumnNamed:", "identityId"));
        (self == null ? null : self.isa.objj_msgSend0(self, "reloadData"));
        (self == null ? null : self.isa.objj_msgSend1(self, "setView:", self.tableView));
    }
    return self;
    var ___r1;
}
,["id"]), new objj_method(sel_getUid("reloadData"), function $UserTableViewController__reloadData(self, _cmd)
{
    ((___r1 = SessionManager.isa.objj_msgSend0(SessionManager, "instance")), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "get:andNotify:", "/admin/users", self));
    var ___r1;
}
,["void"]), new objj_method(sel_getUid("reloadButtonClicked:"), function $UserTableViewController__reloadButtonClicked_(self, _cmd, sender)
{
    self.isa.objj_msgSend0(self, "reloadData");
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
    return self.userTable[aRowIndex][(aColumn == null ? null : aColumn.isa.objj_msgSend0(aColumn, "identifier"))];
}
,["id","CPTableView","CPTableColumn","int"]), new objj_method(sel_getUid("tableView:setObjectValue:forTableColumn:row:"), function $UserTableViewController__tableView_setObjectValue_forTableColumn_row_(self, _cmd, aTableView, anObject, aTableColumn, rowIndex)
{
    var value = anObject;
    if ((aTableColumn == null ? null : aTableColumn.isa.objj_msgSend0(aTableColumn, "identifier")) == "validated")
    {
        value = anObject ? true : false;
    }
    ((___r1 = SessionManager.isa.objj_msgSend0(SessionManager, "instance")), ___r1 == null ? null : ___r1.isa.objj_msgSend3(___r1, "put:withData:andNotify:", "/admin/users/" + self.userTable[rowIndex].identityId + "/" + (aTableColumn == null ? null : aTableColumn.isa.objj_msgSend0(aTableColumn, "identifier")), {value: value}, self));
    var ___r1;
}
,["void","CPTableView","id","CPTableColumn","int"]), new objj_method(sel_getUid("tableView:shouldEditTableColumn:row:"), function $UserTableViewController__tableView_shouldEditTableColumn_row_(self, _cmd, aTableView, aTableColumn, rowIndex)
{
    if ((aTableColumn == null ? null : aTableColumn.isa.objj_msgSend0(aTableColumn, "identifier")) == "name")
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
    self.currentStatusCode = (response == null ? null : response.isa.objj_msgSend0(response, "statusCode"));
}
,["void","CPURLConnection","CPHTTPURLResponse"]), new objj_method(sel_getUid("connection:didReceiveData:"), function $UserTableViewController__connection_didReceiveData_(self, _cmd, connection, data)
{
    self.currentData = data;
}
,["void","CPURLConnection","CPString"]), new objj_method(sel_getUid("connectionDidFinishLoading:"), function $UserTableViewController__connectionDidFinishLoading_(self, _cmd, connection)
{
    if (self.currentData === "OK")
    {
        self.isa.objj_msgSend0(self, "reloadData");
    }
    else
    {
        self.userTable = JSON.parse(self.currentData);
        ((___r1 = self.tableView), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "reloadData"));
    }
    var ___r1;
}
,["void","CPURLConnection"])]);
}p;38;Applications/DesignerApp/ContentView.jt;6088;@STATIC;1.0;I;23;Foundation/Foundation.jI;15;AppKit/AppKit.ji;12;UITreeView.ji;13;ToolBoxView.jt;5986;objj_executeFile("Foundation/Foundation.j", NO);objj_executeFile("AppKit/AppKit.j", NO);objj_executeFile("UITreeView.j", YES);objj_executeFile("ToolBoxView.j", YES);var MINSIDEBARWIDTH = 200;
{var the_class = objj_allocateClassPair(CPSplitView, "ContentView"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("elementList"), new objj_ivar("mainView")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("init"), function $ContentView__init(self, _cmd)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("ContentView").super_class }, "init");
    if (self)
    {
        (self == null ? null : self.isa.objj_msgSend1(self, "setBackgroundColor:", CPColor.isa.objj_msgSend0(CPColor, "redColor")));
        (self == null ? null : self.isa.objj_msgSend1(self, "setAutoresizingMask:", CPViewWidthSizable | CPViewHeightSizable));
        (self == null ? null : self.isa.objj_msgSend1(self, "setDelegate:", self));
        var bundle = CPBundle.isa.objj_msgSend1(CPBundle, "bundleWithIdentifier:", "net.astrobunny.bunnylabs.DesignerApp");
        var file = (bundle == null ? null : bundle.isa.objj_msgSend1(bundle, "pathForResource:", "Images/910.jpg"));
        var mainBackground = ((___r1 = CPImage.isa.objj_msgSend0(CPImage, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithContentsOfFile:", file));
        self.elementList = ((___r1 = CPTabView.isa.objj_msgSend0(CPTabView, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "init"));
        ((___r1 = self.elementList), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setBackgroundColor:", CPColor.isa.objj_msgSend0(CPColor, "darkGrayColor")));
        var item = ((___r1 = CPTabViewItem.isa.objj_msgSend0(CPTabViewItem, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "init"));
        (item == null ? null : item.isa.objj_msgSend1(item, "setLabel:", "Toolbox"));
        (item == null ? null : item.isa.objj_msgSend1(item, "setView:", ((___r1 = ToolBoxView.isa.objj_msgSend0(ToolBoxView, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "init"))));
        ((___r1 = self.elementList), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "addTabViewItem:", item));
        var item = ((___r1 = CPTabViewItem.isa.objj_msgSend0(CPTabViewItem, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "init"));
        (item == null ? null : item.isa.objj_msgSend1(item, "setLabel:", "UI Tree"));
        (item == null ? null : item.isa.objj_msgSend1(item, "setView:", ((___r1 = UITreeView.isa.objj_msgSend0(UITreeView, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "init"))));
        ((___r1 = self.elementList), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "addTabViewItem:", item));
        (self == null ? null : self.isa.objj_msgSend1(self, "addSubview:", self.elementList));
        self.mainView = ((___r1 = CPView.isa.objj_msgSend0(CPView, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "init"));
        ((___r1 = self.mainView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setBackgroundColor:", CPColor.isa.objj_msgSend1(CPColor, "colorWithPatternImage:", mainBackground)));
        (self == null ? null : self.isa.objj_msgSend1(self, "addSubview:", self.mainView));
        (self == null ? null : self.isa.objj_msgSend2(self, "setPosition:ofDividerAtIndex:", MINSIDEBARWIDTH, 0));
    }
    return self;
    var ___r1;
}
,["id"]), new objj_method(sel_getUid("mainView"), function $ContentView__mainView(self, _cmd)
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
        return (aSplitView == null ? null : aSplitView.isa.objj_msgSend0(aSplitView, "frame")).size.width / 3;
    }
    return proposedMax;
}
,["float","CPSplitView","float","int"]), new objj_method(sel_getUid("splitView:resizeSubviewsWithOldSize:"), function $ContentView__splitView_resizeSubviewsWithOldSize_(self, _cmd, aSplitView, oldSize)
{
    var splitViewSize = (aSplitView == null ? null : aSplitView.isa.objj_msgSend0(aSplitView, "frame")).size;
    var width = ((___r1 = self.elementList), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "frame")).size.width;
    if (width > (aSplitView == null ? null : aSplitView.isa.objj_msgSend0(aSplitView, "frame")).size.width / 3)
    {
        width = (aSplitView == null ? null : aSplitView.isa.objj_msgSend0(aSplitView, "frame")).size.width / 3;
    }
    if (width < MINSIDEBARWIDTH)
    {
        width = MINSIDEBARWIDTH;
    }
    if (oldSize.width == 0)
    {
        width = MINSIDEBARWIDTH;
    }
    var leftSize = (aSplitView == null ? null : aSplitView.isa.objj_msgSend0(aSplitView, "frame")).size;
    leftSize.width = width;
    ((___r1 = self.elementList), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setFrameSize:", leftSize));
    ((___r1 = self.mainView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setFrame:", CGRectMake(width + (aSplitView == null ? null : aSplitView.isa.objj_msgSend0(aSplitView, "dividerThickness")), 0, splitViewSize.width - (aSplitView == null ? null : aSplitView.isa.objj_msgSend0(aSplitView, "dividerThickness")) - width, splitViewSize.height)));
    var ___r1;
}
,["void","CPSplitView","CGSize"])]);
}p;38;Applications/DesignerApp/DesignerApp.jt;1057;@STATIC;1.0;I;23;Foundation/Foundation.jI;15;AppKit/AppKit.ji;27;DesignerAppViewController.jt;959;objj_executeFile("Foundation/Foundation.j", NO);objj_executeFile("AppKit/AppKit.j", NO);var BUNDLE_IDENTIFIER = "net.astrobunny.bunnylabs.DesignerApp";
objj_executeFile("DesignerAppViewController.j", YES);{var the_class = objj_allocateClassPair(CPObject, "DesignerApp"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("controller")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("bundleIdentifier"), function $DesignerApp__bundleIdentifier(self, _cmd)
{
    return BUNDLE_IDENTIFIER;
}
,["CPString"]), new objj_method(sel_getUid("viewController"), function $DesignerApp__viewController(self, _cmd)
{
    if (!self.controller)
    {
        self.controller = ((___r1 = DesignerAppViewController.isa.objj_msgSend0(DesignerAppViewController, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "init"));
    }
    return self.controller;
    var ___r1;
}
,["CPViewController"])]);
}p;42;Applications/DesignerApp/DesignerAppView.jt;3619;@STATIC;1.0;I;23;Foundation/Foundation.jI;15;AppKit/AppKit.ji;13;ContentView.jt;3534;objj_executeFile("Foundation/Foundation.j", NO);objj_executeFile("AppKit/AppKit.j", NO);objj_executeFile("ContentView.j", YES);var TOPBARHEIGHT = 30;
{var the_class = objj_allocateClassPair(CPSplitView, "DesignerAppView"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("topBar"), new objj_ivar("splitView"), new objj_ivar("elementList"), new objj_ivar("mainView")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("init"), function $DesignerAppView__init(self, _cmd)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("DesignerAppView").super_class }, "initWithFrame:", CPRectMake(0, 0, 500, 500));
    if (self)
    {
        (self == null ? null : self.isa.objj_msgSend1(self, "setBackgroundColor:", CPColor.isa.objj_msgSend0(CPColor, "redColor")));
        (self == null ? null : self.isa.objj_msgSend1(self, "setAutoresizingMask:", CPViewWidthSizable | CPViewHeightSizable));
        (self == null ? null : self.isa.objj_msgSend1(self, "setDelegate:", self));
        self.topBar = ((___r1 = CPView.isa.objj_msgSend0(CPView, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "init"));
        ((___r1 = self.topBar), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setBackgroundColor:", CPColor.isa.objj_msgSend0(CPColor, "lightGrayColor")));
        (self == null ? null : self.isa.objj_msgSend1(self, "addSubview:", self.topBar));
        self.splitView = ((___r1 = ContentView.isa.objj_msgSend0(ContentView, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "init"));
        self.elementList = ((___r1 = self.splitView), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "elementList"));
        self.mainView = ((___r1 = self.splitView), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "mainView"));
        ((___r1 = self.splitView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setBackgroundColor:", CPColor.isa.objj_msgSend0(CPColor, "grayColor")));
        (self == null ? null : self.isa.objj_msgSend1(self, "addSubview:", self.splitView));
        (self == null ? null : self.isa.objj_msgSend1(self, "setVertical:", NO));
    }
    return self;
    var ___r1;
}
,["id"]), new objj_method(sel_getUid("splitView:constrainSplitPosition:ofSubviewAt:"), function $DesignerAppView__splitView_constrainSplitPosition_ofSubviewAt_(self, _cmd, aSpiltView, proposedPosition, subviewIndex)
{
    if (subviewIndex == 0)
    {
        return TOPBARHEIGHT;
    }
    return proposedPosition;
}
,["float","CPSplitView","float","int"]), new objj_method(sel_getUid("splitView:resizeSubviewsWithOldSize:"), function $DesignerAppView__splitView_resizeSubviewsWithOldSize_(self, _cmd, aSplitView, oldSize)
{
    var splitViewSize = (aSplitView == null ? null : aSplitView.isa.objj_msgSend0(aSplitView, "frame")).size;
    var topSize = (aSplitView == null ? null : aSplitView.isa.objj_msgSend0(aSplitView, "frame")).size;
    topSize.height = TOPBARHEIGHT;
    ((___r1 = self.topBar), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setFrameSize:", topSize));
    ((___r1 = self.splitView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setFrame:", CGRectMake(0, TOPBARHEIGHT + (aSplitView == null ? null : aSplitView.isa.objj_msgSend0(aSplitView, "dividerThickness")), splitViewSize.width, splitViewSize.height - (aSplitView == null ? null : aSplitView.isa.objj_msgSend0(aSplitView, "dividerThickness")) - TOPBARHEIGHT)));
    var ___r1;
}
,["void","CPSplitView","CGSize"])]);
}p;52;Applications/DesignerApp/DesignerAppViewController.jt;1280;@STATIC;1.0;I;23;Foundation/Foundation.jI;15;AppKit/AppKit.ji;17;DesignerAppView.jt;1191;objj_executeFile("Foundation/Foundation.j", NO);objj_executeFile("AppKit/AppKit.j", NO);objj_executeFile("DesignerAppView.j", YES);{var the_class = objj_allocateClassPair(CPViewController, "DesignerAppViewController"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("view")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("init"), function $DesignerAppViewController__init(self, _cmd)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("DesignerAppViewController").super_class }, "init");
    if (self)
    {
        self.view = ((___r1 = DesignerAppView.isa.objj_msgSend0(DesignerAppView, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "init"));
        (self == null ? null : self.isa.objj_msgSend1(self, "setView:", self.view));
    }
    return self;
    var ___r1;
}
,["id"]), new objj_method(sel_getUid("breadcrumbName"), function $DesignerAppViewController__breadcrumbName(self, _cmd)
{
    return "Designer";
}
,["CPString"]), new objj_method(sel_getUid("viewFillsDesktop"), function $DesignerAppViewController__viewFillsDesktop(self, _cmd)
{
    return YES;
}
,["BOOL"])]);
}p;38;Applications/DesignerApp/ToolBoxView.jt;3783;@STATIC;1.0;I;23;Foundation/Foundation.jI;15;AppKit/AppKit.jt;3716;objj_executeFile("Foundation/Foundation.j", NO);objj_executeFile("AppKit/AppKit.j", NO);{var the_class = objj_allocateClassPair(CPView, "ToolBoxView"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("tableView"), new objj_ivar("elements"), new objj_ivar("bundle")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("init"), function $ToolBoxView__init(self, _cmd)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("ToolBoxView").super_class }, "initWithFrame:", CGRectMake(0, 0, 0, 20));
    if (self)
    {
        self.bundle = CPBundle.isa.objj_msgSend1(CPBundle, "bundleWithIdentifier:", "net.astrobunny.bunnylabs.DesignerApp");
        self.tableView = ((___r1 = CPTableView.isa.objj_msgSend0(CPTableView, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithFrame:", CGRectMake(0, 20, 0, 0)));
        var iconColumn = ((___r1 = CPTableColumn.isa.objj_msgSend0(CPTableColumn, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithIdentifier:", "icons"));
        (iconColumn == null ? null : iconColumn.isa.objj_msgSend1(iconColumn, "setMaxWidth:", 25));
        (iconColumn == null ? null : iconColumn.isa.objj_msgSend1(iconColumn, "setMinWidth:", 25));
        var iconView = ((___r1 = CPImageView.isa.objj_msgSend0(CPImageView, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithFrame:", CGRectMake(0, 0, 20, 20)));
        (iconView == null ? null : iconView.isa.objj_msgSend1(iconView, "setImageAlignment:", CPImageAlignCenter));
        (iconView == null ? null : iconView.isa.objj_msgSend1(iconView, "setImageScaling:", CPScaleNone));
        (iconColumn == null ? null : iconColumn.isa.objj_msgSend1(iconColumn, "setDataView:", iconView));
        ((___r1 = self.tableView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "addTableColumn:", iconColumn));
        ((___r1 = self.tableView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "addTableColumn:", ((___r2 = CPTableColumn.isa.objj_msgSend0(CPTableColumn, "alloc")), ___r2 == null ? null : ___r2.isa.objj_msgSend1(___r2, "initWithIdentifier:", "itemname"))));
        ((___r1 = self.tableView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setAutoresizingMask:", CPViewWidthSizable | CPViewHeightSizable));
        self.elements = ["CPView", "CPTableView", "CPSplitView", "CPButton"];
        ((___r1 = self.tableView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setDataSource:", self));
        ((___r1 = self.tableView), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "reloadData"));
        (self == null ? null : self.isa.objj_msgSend1(self, "addSubview:", self.tableView));
    }
    return self;
    var ___r1, ___r2;
}
,["id"]), new objj_method(sel_getUid("numberOfRowsInTableView:"), function $ToolBoxView__numberOfRowsInTableView_(self, _cmd, aTableView)
{
    return self.elements.length;
}
,["int","CPTableView"]), new objj_method(sel_getUid("tableView:objectValueForTableColumn:row:"), function $ToolBoxView__tableView_objectValueForTableColumn_row_(self, _cmd, aTableView, aColumn, aRowIndex)
{
    if ((aColumn == null ? null : aColumn.isa.objj_msgSend0(aColumn, "identifier")) === "itemname")
    {
        return self.elements[aRowIndex];
    }
    var file = ((___r1 = self.bundle), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "pathForResource:", "Images/" + self.elements[aRowIndex] + ".png"));
    return ((___r1 = CPImage.isa.objj_msgSend0(CPImage, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithContentsOfFile:", file));
    var ___r1;
}
,["id","CPTableView","CPTableColumn","CPInteger"])]);
}p;37;Applications/DesignerApp/UITreeView.jt;2397;@STATIC;1.0;I;23;Foundation/Foundation.jI;15;AppKit/AppKit.jt;2330;objj_executeFile("Foundation/Foundation.j", NO);objj_executeFile("AppKit/AppKit.j", NO);{var the_class = objj_allocateClassPair(CPView, "UITreeView"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("tableView")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("init"), function $UITreeView__init(self, _cmd)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("UITreeView").super_class }, "initWithFrame:", CGRectMake(0, 0, 0, 20));
    if (self)
    {
        self.tableView = ((___r1 = CPOutlineView.isa.objj_msgSend0(CPOutlineView, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithFrame:", CGRectMake(0, 20, 0, 0)));
        var iconColumn = ((___r1 = CPTableColumn.isa.objj_msgSend0(CPTableColumn, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithIdentifier:", "icons"));
        (iconColumn == null ? null : iconColumn.isa.objj_msgSend1(iconColumn, "setMaxWidth:", 25));
        (iconColumn == null ? null : iconColumn.isa.objj_msgSend1(iconColumn, "setMinWidth:", 25));
        var iconView = ((___r1 = CPImageView.isa.objj_msgSend0(CPImageView, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithFrame:", CGRectMake(0, 0, 20, 20)));
        (iconView == null ? null : iconView.isa.objj_msgSend1(iconView, "setImageAlignment:", CPImageAlignCenter));
        (iconView == null ? null : iconView.isa.objj_msgSend1(iconView, "setImageScaling:", CPScaleNone));
        (iconColumn == null ? null : iconColumn.isa.objj_msgSend1(iconColumn, "setDataView:", iconView));
        ((___r1 = self.tableView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "addTableColumn:", iconColumn));
        ((___r1 = self.tableView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "addTableColumn:", ((___r2 = CPTableColumn.isa.objj_msgSend0(CPTableColumn, "alloc")), ___r2 == null ? null : ___r2.isa.objj_msgSend1(___r2, "initWithIdentifier:", "itemname"))));
        ((___r1 = self.tableView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setAutoresizingMask:", CPViewWidthSizable | CPViewHeightSizable));
        (self == null ? null : self.isa.objj_msgSend1(self, "addSubview:", self.tableView));
    }
    return self;
    var ___r1, ___r2;
}
,["id"])]);
}p;41;Applications/DesignerApp/WorkspaceModel.jt;286;@STATIC;1.0;I;23;Foundation/Foundation.jI;15;AppKit/AppKit.jt;220;objj_executeFile("Foundation/Foundation.j", NO);objj_executeFile("AppKit/AppKit.j", NO);{var the_class = objj_allocateClassPair(CPObject, "WorkspaceModel"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
}p;32;Applications/TestApp1/TestApp1.jt;2498;@STATIC;1.0;I;23;Foundation/Foundation.jI;15;AppKit/AppKit.jt;2431;objj_executeFile("Foundation/Foundation.j", NO);objj_executeFile("AppKit/AppKit.j", NO);var BUNDLE_IDENTIFIER = "net.astrobunny.bunnylabs.TestApp1";
{var the_class = objj_allocateClassPair(CPViewController, "TestApp1ViewController"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("init"), function $TestApp1ViewController__init(self, _cmd)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("TestApp1ViewController").super_class }, "init");
    if (self)
    {
        var bundle = CPBundle.isa.objj_msgSend1(CPBundle, "bundleWithIdentifier:", BUNDLE_IDENTIFIER);
        var file = (bundle == null ? null : bundle.isa.objj_msgSend1(bundle, "pathForResource:", "Images/icon.png"));
        var image = ((___r1 = CPImage.isa.objj_msgSend0(CPImage, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithContentsOfFile:", file));
        var imageView = ((___r1 = CPImageView.isa.objj_msgSend0(CPImageView, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithFrame:", CGRectMake(0, 0, 1280, 720)));
        (imageView == null ? null : imageView.isa.objj_msgSend1(imageView, "setImage:", image));
        (imageView == null ? null : imageView.isa.objj_msgSend1(imageView, "setAutoresizingMask:", CPViewMinXMargin | CPViewMaxXMargin | CPViewMinYMargin | CPViewMaxYMargin));
        (self == null ? null : self.isa.objj_msgSend1(self, "setView:", imageView));
    }
    return self;
    var ___r1;
}
,["id"]), new objj_method(sel_getUid("breadcrumbName"), function $TestApp1ViewController__breadcrumbName(self, _cmd)
{
    return "Test 1";
}
,["CPString"])]);
}{var the_class = objj_allocateClassPair(CPObject, "TestApp1"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("controller")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("bundleIdentifier"), function $TestApp1__bundleIdentifier(self, _cmd)
{
    return BUNDLE_IDENTIFIER;
}
,["CPString"]), new objj_method(sel_getUid("viewController"), function $TestApp1__viewController(self, _cmd)
{
    if (!self.controller)
    {
        self.controller = ((___r1 = TestApp1ViewController.isa.objj_msgSend0(TestApp1ViewController, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "init"));
    }
    return self.controller;
    var ___r1;
}
,["CPViewController"])]);
}p;32;Applications/TestApp2/TestApp2.jt;2498;@STATIC;1.0;I;23;Foundation/Foundation.jI;15;AppKit/AppKit.jt;2431;objj_executeFile("Foundation/Foundation.j", NO);objj_executeFile("AppKit/AppKit.j", NO);var BUNDLE_IDENTIFIER = "net.astrobunny.bunnylabs.TestApp2";
{var the_class = objj_allocateClassPair(CPViewController, "TestApp2ViewController"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("init"), function $TestApp2ViewController__init(self, _cmd)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("TestApp2ViewController").super_class }, "init");
    if (self)
    {
        var bundle = CPBundle.isa.objj_msgSend1(CPBundle, "bundleWithIdentifier:", BUNDLE_IDENTIFIER);
        var file = (bundle == null ? null : bundle.isa.objj_msgSend1(bundle, "pathForResource:", "Images/icon.png"));
        var image = ((___r1 = CPImage.isa.objj_msgSend0(CPImage, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithContentsOfFile:", file));
        var imageView = ((___r1 = CPImageView.isa.objj_msgSend0(CPImageView, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithFrame:", CGRectMake(0, 0, 1280, 960)));
        (imageView == null ? null : imageView.isa.objj_msgSend1(imageView, "setImage:", image));
        (imageView == null ? null : imageView.isa.objj_msgSend1(imageView, "setAutoresizingMask:", CPViewMinXMargin | CPViewMaxXMargin | CPViewMinYMargin | CPViewMaxYMargin));
        (self == null ? null : self.isa.objj_msgSend1(self, "setView:", imageView));
    }
    return self;
    var ___r1;
}
,["id"]), new objj_method(sel_getUid("breadcrumbName"), function $TestApp2ViewController__breadcrumbName(self, _cmd)
{
    return "Test 2";
}
,["CPString"])]);
}{var the_class = objj_allocateClassPair(CPObject, "TestApp2"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("controller")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("bundleIdentifier"), function $TestApp2__bundleIdentifier(self, _cmd)
{
    return BUNDLE_IDENTIFIER;
}
,["CPString"]), new objj_method(sel_getUid("viewController"), function $TestApp2__viewController(self, _cmd)
{
    if (!self.controller)
    {
        self.controller = ((___r1 = TestApp2ViewController.isa.objj_msgSend0(TestApp2ViewController, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "init"));
    }
    return self.controller;
    var ___r1;
}
,["CPViewController"])]);
}p;20;Utils/HashFragment.jt;826;@STATIC;1.0;I;23;Foundation/Foundation.ji;16;URLQueryString.jt;759;objj_executeFile("Foundation/Foundation.j", NO);objj_executeFile("URLQueryString.j", YES);{var the_class = objj_allocateClassPair(CPObject, "HashFragment"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(meta_class, [new objj_method(sel_getUid("fragment"), function $HashFragment__fragment(self, _cmd)
{
    return window.location.hash;
}
,["CPString"]), new objj_method(sel_getUid("fragmentAsObject"), function $HashFragment__fragmentAsObject(self, _cmd)
{
    return URLQueryString.isa.objj_msgSend1(URLQueryString, "deserialize:", window.location.hash.substring(1));
}
,["id"]), new objj_method(sel_getUid("clearFragment"), function $HashFragment__clearFragment(self, _cmd)
{
    window.location.hash = "";
}
,["void"])]);
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
}p;35;Applications/DesignerApp/Info.plistt;330;<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
	<key>CPBundleIdentifier</key>
	<string>net.astrobunny.bunnylabs.DesignerApp</string>
	<key>CPBundleName</key>
	<string>Designer App</string>
</dict>
</plist>
p;32;Applications/TestApp1/Info.plistt;335;<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
	<key>CPBundleIdentifier</key>
	<string>net.astrobunny.bunnylabs.TestApp1</string>
	<key>CPBundleName</key>
	<string>Test Application One</string>
</dict>
</plist>
p;32;Applications/TestApp2/Info.plistt;325;<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
	<key>CPBundleIdentifier</key>
	<string>net.astrobunny.bunnylabs.TestApp2</string>
	<key>CPBundleName</key>
	<string>Test App 2</string>
</dict>
</plist>
e;