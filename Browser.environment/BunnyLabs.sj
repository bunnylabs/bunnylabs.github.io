@STATIC;1.0;p;15;AppController.jt;2320;@STATIC;1.0;I;23;Foundation/Foundation.jI;15;AppKit/AppKit.jt;2253;objj_executeFile("Foundation/Foundation.j", NO);objj_executeFile("AppKit/AppKit.j", NO);{var the_class = objj_allocateClassPair(CPObject, "AppController"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("mainMenu"), new objj_ivar("loginStatusTextField")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("applicationDidFinishLaunching:"), function $AppController__applicationDidFinishLaunching_(self, _cmd, aNotification)
{
    var theWindow = objj_msgSend(objj_msgSend(CPWindow, "alloc"), "initWithContentRect:styleMask:", CGRectMakeZero(), CPBorderlessBridgeWindowMask),
        contentView = objj_msgSend(theWindow, "contentView");
    self.mainMenu = objj_msgSend(objj_msgSend(CPApplication, "sharedApplication"), "mainMenu");
    objj_msgSend(self.mainMenu, "removeAllItems");
    self.loginStatusTextField = objj_msgSend(CPTextField, "labelWithTitle:", "Not Logged In");
    var font = objj_msgSend(CPFont, "fontWithName:size:", "Helvetica", 14);
    objj_msgSend(self.loginStatusTextField, "setFrameOrigin:", CGPointMake(0, 6));
    objj_msgSend(self.loginStatusTextField, "setFont:", font);
    objj_msgSend(self.loginStatusTextField, "sizeToFit");
    var item = objj_msgSend(objj_msgSend(CPMenuItem, "alloc"), "init");
    objj_msgSend(item, "setView:", self.loginStatusTextField);
    objj_msgSend(self.mainMenu, "addItem:", objj_msgSend(CPMenuItem, "separatorItem"));
    objj_msgSend(self.mainMenu, "addItem:", objj_msgSend(CPMenuItem, "separatorItem"));
    objj_msgSend(self.mainMenu, "addItem:", item);
    objj_msgSend(CPMenu, "setMenuBarVisible:", YES);
    var bundle = objj_msgSend(CPBundle, "mainBundle");
    var file = objj_msgSend(bundle, "pathForResource:", "Images/bunnylabs.png");
    var image = objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:", file);
    var imageView = objj_msgSend(objj_msgSend(CPImageView, "alloc"), "initWithFrame:", CGRectMake(0, 0, 200, 200));
    objj_msgSend(imageView, "setImage:", image);
    objj_msgSend(imageView, "setCenter:", objj_msgSend(contentView, "center"));
    objj_msgSend(contentView, "addSubview:", imageView);
    objj_msgSend(theWindow, "orderFront:", self);
}
,["void","CPNotification"])]);
}p;6;main.jt;292;@STATIC;1.0;I;23;Foundation/Foundation.jI;15;AppKit/AppKit.ji;15;AppController.jt;206;objj_executeFile("Foundation/Foundation.j", NO);objj_executeFile("AppKit/AppKit.j", NO);objj_executeFile("AppController.j", YES);main = function(args, namedArgs)
{
    CPApplicationMain(args, namedArgs);
}
e;