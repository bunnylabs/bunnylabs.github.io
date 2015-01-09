@STATIC;1.0;p;17;SessionMenuItem.jt;657;@STATIC;1.0;I;23;Foundation/Foundation.jI;15;AppKit/AppKit.jt;591;objj_executeFile("Foundation/Foundation.j", NO);objj_executeFile("AppKit/AppKit.j", NO);{var the_class = objj_allocateClassPair(CPMenuItem, "SessionMenuItem"),
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
}p;16;SessionManager.jt;18744;@STATIC;1.0;I;23;Foundation/Foundation.ji;15;SessionWindow.ji;17;SessionMenuItem.ji;20;Utils/HashFragment.ji;22;Utils/URLQueryString.jt;18602;objj_executeFile("Foundation/Foundation.j", NO);objj_executeFile("SessionWindow.j", YES);objj_executeFile("SessionMenuItem.j", YES);objj_executeFile("Utils/HashFragment.j", YES);objj_executeFile("Utils/URLQueryString.j", YES);var GITHUB_CLIENT_ID = "39cee75ce85db5da2576";
var apiServerUrl = "https://bunnylabs-api.astrobunny.net";
var session;
popupwindow = function(url, title, w, h)
{
    var left = screen.width / 2 - w / 2;
    var top = screen.height / 2 - h / 2;
    return window.open(url, title, 'toolbar=no, location=no, directories=no, status=no, menubar=no, scrollbars=no, resizable=no, copyhistory=no, width=' + w + ', height=' + h + ', top=' + top + ', left=' + left);
}
{var the_class = objj_allocateClassPair(CPWindowController, "SessionManager"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("authToken"), new objj_ivar("currentResponseHandler"), new objj_ivar("currentStatusCode"), new objj_ivar("currentData"), new objj_ivar("statusMenuItem")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("init"), function $SessionManager__init(self, _cmd)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("SessionManager").super_class }, "initWithWindow:", objj_msgSend(objj_msgSend(SessionWindow, "alloc"), "init"));
    if (self)
    {
        objj_msgSend(objj_msgSend(self, "window"), "setDelegate:", self);
        self.authToken = "";
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
,["id"]), new objj_method(sel_getUid("handleSessionManagerMessage:"), function $SessionManager__handleSessionManagerMessage_(self, _cmd, anObject)
{
    console.log(anObject);
    if (anObject.type === "githubLogin")
    {
        if (anObject.authToken)
        {
            self.authToken = anObject.authToken;
            objj_msgSend(self, "getUserData");
        }
        else if (anObject.error)
        {
            objj_msgSend(self, "showLoginWindow");
            objj_msgSend(objj_msgSend(self, "window"), "setCustomError:", objj_msgSend(CPString, "stringWithFormat:", "Unable to login using Github. Reason: %@", anObject.error));
            objj_msgSend(objj_msgSend(self, "window"), "update");
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
    if (self.authToken.length > 0)
    {
        self.currentResponseHandler = sel_getUid("getUserDataHandler:forData:");
        objj_msgSend(self, "get:andNotify:", "/sessions/current", self);
    }
    else
    {
        objj_msgSend(self.statusMenuItem, "setTitle:", "Log In");
    }
}
,["void"]), new objj_method(sel_getUid("nullResponseHandler:forData:"), function $SessionManager__nullResponseHandler_forData_(self, _cmd, statusCode, data)
{
}
,["void","int","CPString"]), new objj_method(sel_getUid("getUserDataHandler:forData:"), function $SessionManager__getUserDataHandler_forData_(self, _cmd, statusCode, data)
{
    if (statusCode == 200)
    {
        var result = JSON.parse(data);
        objj_msgSend(self.statusMenuItem, "setTitle:", objj_msgSend(CPString, "stringWithFormat:", "Logged in as %@", result.username));
    }
    else
    {
        objj_msgSend(objj_msgSend(self, "window"), "setState:andResetFields:", objj_msgSend(SessionWindow, "loginState"), NO);
        objj_msgSend(objj_msgSend(self, "window"), "setCustomError:", data);
        objj_msgSend(objj_msgSend(self, "window"), "update");
    }
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
        self.authToken = data;
        objj_msgSend(objj_msgSend(self, "window"), "close");
    }
    else
    {
        self.authToken = "";
        objj_msgSend(objj_msgSend(self, "window"), "setState:andResetFields:", objj_msgSend(SessionWindow, "loginState"), NO);
        objj_msgSend(objj_msgSend(self, "window"), "setCustomError:", data);
        objj_msgSend(objj_msgSend(self, "window"), "update");
    }
    objj_msgSend(self, "getUserData");
}
,["void","int","CPString"]), new objj_method(sel_getUid("registerResponseHandler:forData:"), function $SessionManager__registerResponseHandler_forData_(self, _cmd, statusCode, data)
{
    if (statusCode == 200)
    {
        objj_msgSend(objj_msgSend(self, "window"), "setState:", objj_msgSend(SessionWindow, "loginState"));
        objj_msgSend(objj_msgSend(self, "window"), "setCustomMessage:", "You should receive an e-mail with an activation link. Go to that link and then you will be able to log in.");
        objj_msgSend(objj_msgSend(self, "window"), "update");
    }
    else
    {
        objj_msgSend(objj_msgSend(self, "window"), "setState:andResetFields:", objj_msgSend(SessionWindow, "registrationState"), NO);
        objj_msgSend(objj_msgSend(self, "window"), "setCustomError:", data);
        objj_msgSend(objj_msgSend(self, "window"), "update");
    }
}
,["void","int","CPString"]), new objj_method(sel_getUid("submitUsernameResponseHandler:forData:"), function $SessionManager__submitUsernameResponseHandler_forData_(self, _cmd, statusCode, data)
{
    if (statusCode == 200)
    {
        objj_msgSend(objj_msgSend(self, "window"), "setState:", objj_msgSend(SessionWindow, "loginState"));
        objj_msgSend(objj_msgSend(self, "window"), "setCustomMessage:", "Your password has been changed. You may now log in with your new password");
        objj_msgSend(objj_msgSend(self, "window"), "update");
    }
    else
    {
        objj_msgSend(objj_msgSend(self, "window"), "setState:andResetFields:", objj_msgSend(SessionWindow, "changePasswordState"), NO);
        objj_msgSend(objj_msgSend(self, "window"), "setCustomError:", data);
        objj_msgSend(objj_msgSend(self, "window"), "update");
    }
}
,["void","int","CPString"]), new objj_method(sel_getUid("forgotPasswordResponseHandler:forData:"), function $SessionManager__forgotPasswordResponseHandler_forData_(self, _cmd, statusCode, data)
{
    if (statusCode == 200)
    {
        objj_msgSend(objj_msgSend(self, "window"), "setState:", objj_msgSend(SessionWindow, "loginState"));
        objj_msgSend(objj_msgSend(self, "window"), "setCustomMessage:", "You should receive an e-mail containing instructions on how to change your password");
        objj_msgSend(objj_msgSend(self, "window"), "update");
    }
    else
    {
        objj_msgSend(objj_msgSend(self, "window"), "setState:andResetFields:", objj_msgSend(SessionWindow, "forgotPasswordState"), NO);
        objj_msgSend(objj_msgSend(self, "window"), "setCustomError:", data);
        objj_msgSend(objj_msgSend(self, "window"), "update");
    }
}
,["void","int","CPString"]), new objj_method(sel_getUid("_buildUrl:"), function $SessionManager___buildUrl_(self, _cmd, apiPath)
{
    var query = {auth: self.authToken, lang: "en"};
    var url = objj_msgSend(CPURL, "URLWithString:", objj_msgSend(CPString, "stringWithFormat:", "%@%@?%@", apiServerUrl, apiPath, objj_msgSend(URLQueryString, "serialize:", query)));
    return url;
}
,["CPURL","CPString"]), new objj_method(sel_getUid("get:andNotify:"), function $SessionManager__get_andNotify_(self, _cmd, aUrl, delegate)
{
    var url = objj_msgSend(self, "_buildUrl:", aUrl);
    var request = objj_msgSend(CPURLRequest, "requestWithURL:", url);
    objj_msgSend(request, "setHTTPMethod:", "GET");
    var conn = objj_msgSend(CPURLConnection, "connectionWithRequest:delegate:", request, delegate);
}
,["id","CPString","id"]), new objj_method(sel_getUid("post:withData:andNotify:"), function $SessionManager__post_withData_andNotify_(self, _cmd, aUrl, json, delegate)
{
    var url = objj_msgSend(self, "_buildUrl:", aUrl);
    var request = objj_msgSend(CPURLRequest, "requestWithURL:", url);
    objj_msgSend(request, "setHTTPMethod:", "POST");
    objj_msgSend(request, "setHTTPBody:", JSON.stringify(json));
    var conn = objj_msgSend(CPURLConnection, "connectionWithRequest:delegate:", request, delegate);
}
,["id","CPString","id","id"]), new objj_method(sel_getUid("put:withData:andNotify:"), function $SessionManager__put_withData_andNotify_(self, _cmd, aUrl, json, delegate)
{
    var url = objj_msgSend(self, "_buildUrl:", aUrl);
    var request = objj_msgSend(CPURLRequest, "requestWithURL:", url);
    objj_msgSend(request, "setHTTPMethod:", "PUT");
    objj_msgSend(request, "setHTTPBody:", JSON.stringify(json));
    var conn = objj_msgSend(CPURLConnection, "connectionWithRequest:delegate:", request, delegate);
}
,["id","CPString","id","id"]), new objj_method(sel_getUid("delete:andNotify:"), function $SessionManager__delete_andNotify_(self, _cmd, aUrl, delegate)
{
    var url = objj_msgSend(self, "_buildUrl:", aUrl);
    var request = objj_msgSend(CPURLRequest, "requestWithURL:", url);
    objj_msgSend(request, "setHTTPMethod:", "DELETE");
    var conn = objj_msgSend(CPURLConnection, "connectionWithRequest:delegate:", request, delegate);
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
}
,["void","CPString","CPString"]), new objj_method(sel_getUid("logout"), function $SessionManager__logout(self, _cmd)
{
    CPLog("Logout");
    self.currentResponseHandler = sel_getUid("nullResponseHandler:forData:");
    objj_msgSend(self, "delete:andNotify:", "/sessions/current", self);
    self.authToken = "";
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
    objj_msgSend(self, "performSelector:withObject:withObject:", self.currentResponseHandler, self.currentStatusCode, self.currentData);
}
,["void","CPURLConnection"]), new objj_method(sel_getUid("connectionDidReceiveAuthenticationChallenge:"), function $SessionManager__connectionDidReceiveAuthenticationChallenge_(self, _cmd, connection)
{
    self.authToken = "";
    objj_msgSend(self, "getUserData");
    objj_msgSend(self, "showLoginWindow");
    objj_msgSend(objj_msgSend(self, "window"), "setCustomMessage:", "You need to log in to do this");
    objj_msgSend(objj_msgSend(self, "window"), "update");
}
,["void","id"]), new objj_method(sel_getUid("loginWithGithub"), function $SessionManager__loginWithGithub(self, _cmd)
{
    var queryString = objj_msgSend(URLQueryString, "serialize:", {client_id: GITHUB_CLIENT_ID, scope: "gist,user:email"});
    var request = objj_msgSend(CPString, "stringWithFormat:", "https://github.com/login/oauth/authorize?%@", queryString);
    popupwindow(request, "asd", 1024, 768);
}
,["void"]), new objj_method(sel_getUid("showLoginWindow"), function $SessionManager__showLoginWindow(self, _cmd)
{
    if (self.authToken.length == 0)
    {
        objj_msgSend(self, "showWindow:", self);
        objj_msgSend(objj_msgSend(self, "window"), "setState:", objj_msgSend(SessionWindow, "loginState"));
    }
    else
    {
        objj_msgSend(self, "showWindow:", self);
        objj_msgSend(objj_msgSend(self, "window"), "setState:", objj_msgSend(SessionWindow, "logoutState"));
    }
}
,["void"]), new objj_method(sel_getUid("showChangePasswordWindow"), function $SessionManager__showChangePasswordWindow(self, _cmd)
{
    objj_msgSend(self, "showWindow:", self);
    objj_msgSend(objj_msgSend(self, "window"), "setState:", objj_msgSend(SessionWindow, "changePasswordState"));
}
,["void"]), new objj_method(sel_getUid("loginButtonClicked:"), function $SessionManager__loginButtonClicked_(self, _cmd, sender)
{
    objj_msgSend(self, "loginWithUsername:andPassword:", objj_msgSend(objj_msgSend(self, "window"), "username"), objj_msgSend(objj_msgSend(self, "window"), "password"));
    objj_msgSend(objj_msgSend(self, "window"), "setState:", objj_msgSend(SessionWindow, "waitingState"));
}
,["id","id"]), new objj_method(sel_getUid("logoutButtonClicked:"), function $SessionManager__logoutButtonClicked_(self, _cmd, sender)
{
    objj_msgSend(self, "logout");
    objj_msgSend(objj_msgSend(self, "window"), "close");
}
,["id","id"]), new objj_method(sel_getUid("registerButtonClicked:"), function $SessionManager__registerButtonClicked_(self, _cmd, sender)
{
    objj_msgSend(self, "register:withPassword:andEmail:", objj_msgSend(objj_msgSend(self, "window"), "username"), objj_msgSend(objj_msgSend(self, "window"), "password"), objj_msgSend(objj_msgSend(self, "window"), "email"));
    objj_msgSend(objj_msgSend(self, "window"), "setState:", objj_msgSend(SessionWindow, "waitingState"));
}
,["id","id"]), new objj_method(sel_getUid("submitUsernameButtonClicked:"), function $SessionManager__submitUsernameButtonClicked_(self, _cmd, sender)
{
    objj_msgSend(self, "requestForgottenPasswordForUser:andEmail:", objj_msgSend(objj_msgSend(self, "window"), "username"), objj_msgSend(objj_msgSend(self, "window"), "email"));
    objj_msgSend(objj_msgSend(self, "window"), "setState:", objj_msgSend(SessionWindow, "waitingState"));
}
,["id","id"]), new objj_method(sel_getUid("changePasswordButtonClicked:"), function $SessionManager__changePasswordButtonClicked_(self, _cmd, sender)
{
    objj_msgSend(self, "changePassword:forUser:", objj_msgSend(objj_msgSend(self, "window"), "password"), objj_msgSend(objj_msgSend(self, "window"), "username"));
    objj_msgSend(objj_msgSend(self, "window"), "setState:", objj_msgSend(SessionWindow, "waitingState"));
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
}p;15;SessionWindow.jt;34000;@STATIC;1.0;I;23;Foundation/Foundation.jI;15;AppKit/AppKit.ji;20;TextFieldWithLabel.jt;33907;objj_executeFile("Foundation/Foundation.j", NO);objj_executeFile("AppKit/AppKit.j", NO);objj_executeFile("TextFieldWithLabel.j", YES);var LOGIN_STATE = 1;
var REGISTRATION_STATE = 2;
var FORGOTPASSWORD_STATE = 3;
var CHANGEPASSWORD_STATE = 4;
var LOGOUT_STATE = 5;
var WAITING_STATE = 6;
var MINIMUM_USERNAME_LENGTH = 4;
var MINIMUM_PASSWORD_LENGTH = 8;
var EMAIL_REGEX = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
{var the_class = objj_allocateClassPair(CPPanel, "SessionWindow"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("currentState"), new objj_ivar("contentView"), new objj_ivar("messageField"), new objj_ivar("errorField"), new objj_ivar("usernameField"), new objj_ivar("passwordField"), new objj_ivar("passwordConfirmField"), new objj_ivar("emailField"), new objj_ivar("loginButton"), new objj_ivar("newAccountButton"), new objj_ivar("forgotPasswordButton"), new objj_ivar("registerButton"), new objj_ivar("submitUsernameButton"), new objj_ivar("cancelButton"), new objj_ivar("changePasswordButton"), new objj_ivar("logoutButton"), new objj_ivar("spinnerView"), new objj_ivar("messageSize"), new objj_ivar("errors"), new objj_ivar("message"), new objj_ivar("customMessage"), new objj_ivar("customError")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("customMessage"), function $SessionWindow__customMessage(self, _cmd)
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
        self.contentView = objj_msgSend(self, "contentView");
        objj_msgSend(self, "setFrame:", CGRectMake(0, 0, 400, 100));
        objj_msgSend(self, "center");
        objj_msgSend(self, "setFrameOrigin:", CGPointMake(objj_msgSend(self, "frame").origin.x, objj_msgSend(self, "frame").origin.y - 50));
        self.messageField = objj_msgSend(objj_msgSend(CPTextField, "alloc"), "initWithFrame:", CGRectMake(0, 0, 100, 40));
        objj_msgSend(self.messageField, "setLineBreakMode:", CPLineBreakByWordWrapping);
        objj_msgSend(self.messageField, "setBackgroundColor:", objj_msgSend(CPColor, "colorWithCalibratedRed:green:blue:alpha:", 103.0 / 255.0, 154.0 / 255.0, 205.0 / 255.0, 1.0));
        objj_msgSend(self.messageField, "setTextColor:", objj_msgSend(CPColor, "whiteColor"));
        objj_msgSend(self.messageField, "setAutoresizingMask:", CPViewWidthSizable);
        objj_msgSend(self.messageField, "setValue:forThemeAttribute:", CGInsetMake(9.0, 9.0, 9.0, 9.0), "content-inset");
        objj_msgSend(self.contentView, "addSubview:", self.messageField);
        self.errorField = objj_msgSend(objj_msgSend(CPTextField, "alloc"), "initWithFrame:", CGRectMake(0, 0, 100, 0));
        objj_msgSend(self.errorField, "setLineBreakMode:", CPLineBreakByWordWrapping);
        objj_msgSend(self.errorField, "setBackgroundColor:", objj_msgSend(CPColor, "colorWithHexString:", "993333"));
        objj_msgSend(self.errorField, "setTextColor:", objj_msgSend(CPColor, "whiteColor"));
        objj_msgSend(self.errorField, "setAutoresizingMask:", CPViewWidthSizable);
        objj_msgSend(self.errorField, "setValue:forThemeAttribute:", CGInsetMake(9.0, 9.0, 9.0, 9.0), "content-inset");
        objj_msgSend(self.contentView, "addSubview:", self.errorField);
        self.loginButton = objj_msgSend(CPButton, "buttonWithTitle:", "Log In");
        objj_msgSend(self.loginButton, "setFrame:", CGRectMake(10, 180, 185, objj_msgSend(self.loginButton, "bounds").size.height));
        objj_msgSend(self.loginButton, "setTarget:", self);
        objj_msgSend(self.loginButton, "setAction:", sel_getUid("loginButtonClicked:"));
        objj_msgSend(self.contentView, "addSubview:", self.loginButton);
        self.newAccountButton = objj_msgSend(CPButton, "buttonWithTitle:", "New Account");
        objj_msgSend(self.newAccountButton, "setFrame:", CGRectMake(10, 180, 185, objj_msgSend(self.newAccountButton, "bounds").size.height));
        objj_msgSend(self.newAccountButton, "setTarget:", self);
        objj_msgSend(self.newAccountButton, "setAction:", sel_getUid("newAccountButtonClicked:"));
        objj_msgSend(self.contentView, "addSubview:", self.newAccountButton);
        self.forgotPasswordButton = objj_msgSend(CPButton, "buttonWithTitle:", "Forgot Password");
        objj_msgSend(self.forgotPasswordButton, "setFrame:", CGRectMake(10, 180, 185, objj_msgSend(self.forgotPasswordButton, "bounds").size.height));
        objj_msgSend(self.forgotPasswordButton, "setTarget:", self);
        objj_msgSend(self.forgotPasswordButton, "setAction:", sel_getUid("forgotPasswordButtonClicked:"));
        objj_msgSend(self.contentView, "addSubview:", self.forgotPasswordButton);
        self.registerButton = objj_msgSend(CPButton, "buttonWithTitle:", "Register");
        objj_msgSend(self.registerButton, "setFrame:", CGRectMake(10, 180, 185, objj_msgSend(self.registerButton, "bounds").size.height));
        objj_msgSend(self.registerButton, "setTarget:", self);
        objj_msgSend(self.registerButton, "setAction:", sel_getUid("registerButtonClicked:"));
        objj_msgSend(self.contentView, "addSubview:", self.registerButton);
        self.changePasswordButton = objj_msgSend(CPButton, "buttonWithTitle:", "Change Password");
        objj_msgSend(self.changePasswordButton, "setFrame:", CGRectMake(10, 180, 185, objj_msgSend(self.changePasswordButton, "bounds").size.height));
        objj_msgSend(self.changePasswordButton, "setTarget:", self);
        objj_msgSend(self.changePasswordButton, "setAction:", sel_getUid("changePasswordButtonClicked:"));
        objj_msgSend(self.contentView, "addSubview:", self.changePasswordButton);
        self.submitUsernameButton = objj_msgSend(CPButton, "buttonWithTitle:", "Send Recovery E-mail");
        objj_msgSend(self.submitUsernameButton, "setFrame:", CGRectMake(10, 180, 185, objj_msgSend(self.submitUsernameButton, "bounds").size.height));
        objj_msgSend(self.submitUsernameButton, "setTarget:", self);
        objj_msgSend(self.submitUsernameButton, "setAction:", sel_getUid("submitUsernameButtonClicked:"));
        objj_msgSend(self.contentView, "addSubview:", self.submitUsernameButton);
        self.logoutButton = objj_msgSend(CPButton, "buttonWithTitle:", "Log out");
        objj_msgSend(self.logoutButton, "setFrame:", CGRectMake(10, 180, 185, objj_msgSend(self.logoutButton, "bounds").size.height));
        objj_msgSend(self.logoutButton, "setTarget:", self);
        objj_msgSend(self.logoutButton, "setAction:", sel_getUid("logoutButtonClicked:"));
        objj_msgSend(self.contentView, "addSubview:", self.logoutButton);
        self.cancelButton = objj_msgSend(CPButton, "buttonWithTitle:", "Cancel");
        objj_msgSend(self.cancelButton, "setFrame:", CGRectMake(205, 180, 185, objj_msgSend(self.cancelButton, "bounds").size.height));
        objj_msgSend(self.cancelButton, "setTarget:", self);
        objj_msgSend(self.cancelButton, "setAction:", sel_getUid("cancelButtonClicked:"));
        objj_msgSend(self.contentView, "addSubview:", self.cancelButton);
        self.usernameField = objj_msgSend(objj_msgSend(TextFieldWithLabel, "alloc"), "initWithLabel:andPlaceHolder:andWidth:", "Username:", "Username", 380);
        objj_msgSend(self.usernameField, "setFrameOrigin:", CGPointMake(10, 20));
        objj_msgSend(self.usernameField, "setTarget:", self);
        objj_msgSend(self.usernameField, "setTextChangedSelector:", sel_getUid("textChanged:"));
        objj_msgSend(self.contentView, "addSubview:", self.usernameField);
        self.passwordField = objj_msgSend(objj_msgSend(TextFieldWithLabel, "alloc"), "initWithLabel:andPlaceHolder:andWidth:isSecure:", "Password:", "Password", 380, YES);
        objj_msgSend(self.passwordField, "setFrameOrigin:", CGPointMake(10, 50));
        objj_msgSend(self.passwordField, "setTarget:", self);
        objj_msgSend(self.passwordField, "setTextChangedSelector:", sel_getUid("textChanged:"));
        objj_msgSend(self.contentView, "addSubview:", self.passwordField);
        self.passwordConfirmField = objj_msgSend(objj_msgSend(TextFieldWithLabel, "alloc"), "initWithLabel:andPlaceHolder:andWidth:isSecure:", "Password (again):", "Password (again)", 380, YES);
        objj_msgSend(self.passwordConfirmField, "setFrameOrigin:", CGPointMake(10, 80));
        objj_msgSend(self.passwordConfirmField, "setTarget:", self);
        objj_msgSend(self.passwordConfirmField, "setTextChangedSelector:", sel_getUid("textChanged:"));
        objj_msgSend(self.contentView, "addSubview:", self.passwordConfirmField);
        self.emailField = objj_msgSend(objj_msgSend(TextFieldWithLabel, "alloc"), "initWithLabel:andPlaceHolder:andWidth:", "E-mail:", "E-mail", 380);
        objj_msgSend(self.emailField, "setFrameOrigin:", CGPointMake(10, 110));
        objj_msgSend(self.emailField, "setTarget:", self);
        objj_msgSend(self.emailField, "setTextChangedSelector:", sel_getUid("textChanged:"));
        objj_msgSend(self.contentView, "addSubview:", self.emailField);
        var spinner = objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(objj_msgSend(CPBundle, "mainBundle"), "pathForResource:", "spinner.gif"), CGSizeMake(20, 20));
        objj_msgSend(spinner, "setDelegate:", self);
        self.spinnerView = objj_msgSend(objj_msgSend(CPImageView, "alloc"), "init");
        objj_msgSend(self.spinnerView, "setImage:", spinner);
        objj_msgSend(self.spinnerView, "setHidden:", YES);
        objj_msgSend(self.spinnerView, "setFrame:", CGRectMake(400, 400, 60, 60));
        objj_msgSend(self.contentView, "addSubview:", self.spinnerView);
        self.messageSize = 0;
        objj_msgSend(self, "setState:", LOGIN_STATE);
    }
    return self;
}
,["id"]), new objj_method(sel_getUid("username"), function $SessionWindow__username(self, _cmd)
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
    objj_msgSend(self, "close");
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
    var messageFieldSize = {width: objj_msgSend(self.messageField, "frame").size.width, height: 0};
    if (messageString && messageString.length > 0)
    {
        messageFieldSize = objj_msgSend(messageString, "sizeWithFont:inWidth:", objj_msgSend(self.messageField, "font"), 400);
        objj_msgSend(self.messageField, "setFrame:", CGRectMake(0, 0, messageFieldSize.width, messageFieldSize.height + 18));
    }
    else
    {
        objj_msgSend(self.messageField, "setFrame:", CGRectMake(0, 0, messageFieldSize.width, 0));
    }
    var errorFieldSize = {width: objj_msgSend(self.errorField, "frame").size.width, height: 0};
    if (objj_msgSend(self.errorField, "stringValue") && objj_msgSend(self.errorField, "stringValue").length > 0)
    {
        errorFieldSize = objj_msgSend(objj_msgSend(self.errorField, "stringValue"), "sizeWithFont:inWidth:", objj_msgSend(self.errorField, "font"), 400);
        objj_msgSend(self.errorField, "setFrame:", CGRectMake(0, objj_msgSend(self.messageField, "frame").size.height, errorFieldSize.width, errorFieldSize.height + 18));
    }
    else
    {
        objj_msgSend(self.errorField, "setFrame:", CGRectMake(0, objj_msgSend(self.messageField, "frame").size.height, errorFieldSize.width, 0));
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
        objj_msgSend(self.loginButton, "setFrame:", CGRectMake(10, 80 + self.messageSize, 185, objj_msgSend(self.loginButton, "bounds").size.height));
        objj_msgSend(self.cancelButton, "setFrame:", CGRectMake(205, 80 + self.messageSize, 185, objj_msgSend(self.cancelButton, "bounds").size.height));
        objj_msgSend(self.newAccountButton, "setFrame:", CGRectMake(10, 110 + self.messageSize, 185, objj_msgSend(self.loginButton, "bounds").size.height));
        objj_msgSend(self.forgotPasswordButton, "setFrame:", CGRectMake(205, 110 + self.messageSize, 185, objj_msgSend(self.cancelButton, "bounds").size.height));
        objj_msgSend(self, "setDefaultButton:", self.loginButton);
        targetWidth = 400;
        targetHeight = 180 + self.messageSize;
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
        objj_msgSend(self.registerButton, "setFrame:", CGRectMake(10, 140 + self.messageSize, 185, objj_msgSend(self.loginButton, "bounds").size.height));
        objj_msgSend(self.cancelButton, "setFrame:", CGRectMake(205, 140 + self.messageSize, 185, objj_msgSend(self.cancelButton, "bounds").size.height));
        objj_msgSend(self, "setDefaultButton:", self.registerButton);
        targetWidth = 400;
        targetHeight = 210 + self.messageSize;
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
        objj_msgSend(self.submitUsernameButton, "setFrame:", CGRectMake(10, 80 + self.messageSize, 185, objj_msgSend(self.loginButton, "bounds").size.height));
        objj_msgSend(self.cancelButton, "setFrame:", CGRectMake(205, 80 + self.messageSize, 185, objj_msgSend(self.cancelButton, "bounds").size.height));
        objj_msgSend(self, "setDefaultButton:", self.submitUsernameButton);
        targetWidth = 400;
        targetHeight = 150 + self.messageSize;
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
        objj_msgSend(self.changePasswordButton, "setFrame:", CGRectMake(10, 80 + self.messageSize, 185, objj_msgSend(self.loginButton, "bounds").size.height));
        objj_msgSend(self.cancelButton, "setFrame:", CGRectMake(205, 80 + self.messageSize, 185, objj_msgSend(self.cancelButton, "bounds").size.height));
        objj_msgSend(self, "setDefaultButton:", self.changePasswordButton);
        targetWidth = 400;
        targetHeight = 150 + self.messageSize;
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
        objj_msgSend(self.logoutButton, "setFrame:", CGRectMake(10, 20 + self.messageSize, 185, objj_msgSend(self.logoutButton, "bounds").size.height));
        objj_msgSend(self.cancelButton, "setFrame:", CGRectMake(205, 20 + self.messageSize, 185, objj_msgSend(self.cancelButton, "bounds").size.height));
        objj_msgSend(self, "setDefaultButton:", self.logoutButton);
        targetWidth = 400;
        targetHeight = 100 + self.messageSize;
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
        objj_msgSend(self.spinnerView, "setFrameOrigin:", CGPointMake(170, 30 + self.messageSize));
        targetWidth = 400;
        targetHeight = 150 + self.messageSize;
        break;
    }
    var xmargins = (targetWidth - objj_msgSend(self, "frame").size.width) / 2;
    var ymargins = (targetHeight - objj_msgSend(self, "frame").size.height) / 2;
    if (objj_msgSend(self.errors, "allObjects").length > 0)
    {
        objj_msgSend(objj_msgSend(self, "defaultButton"), "setEnabled:", NO);
    }
    else
    {
        objj_msgSend(objj_msgSend(self, "defaultButton"), "setEnabled:", YES);
    }
    objj_msgSend(self, "setFrame:display:animate:", CGRectMake(objj_msgSend(self, "frame").origin.x - xmargins, objj_msgSend(self, "frame").origin.y - ymargins, targetWidth, targetHeight), YES, YES);
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
}p;6;main.jt;292;@STATIC;1.0;I;23;Foundation/Foundation.jI;15;AppKit/AppKit.ji;15;AppController.jt;206;objj_executeFile("Foundation/Foundation.j", NO);objj_executeFile("AppKit/AppKit.j", NO);objj_executeFile("AppController.j", YES);main = function(args, namedArgs)
{
    CPApplicationMain(args, namedArgs);
}
p;15;AppController.jt;5275;@STATIC;1.0;I;23;Foundation/Foundation.jI;15;AppKit/AppKit.ji;16;SessionManager.ji;20;Utils/HashFragment.jt;5162;objj_executeFile("Foundation/Foundation.j", NO);objj_executeFile("AppKit/AppKit.j", NO);objj_executeFile("SessionManager.j", YES);objj_executeFile("Utils/HashFragment.j", YES);{var the_class = objj_allocateClassPair(CPObject, "AppController"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("mainMenu"), new objj_ivar("contentView")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("applicationDidFinishLaunching:"), function $AppController__applicationDidFinishLaunching_(self, _cmd, aNotification)
{
    var theWindow = objj_msgSend(objj_msgSend(CPWindow, "alloc"), "initWithContentRect:styleMask:", CGRectMakeZero(), CPBorderlessBridgeWindowMask);
    self.contentView = objj_msgSend(theWindow, "contentView");
    objj_msgSend(theWindow, "setDelegate:", self);
    objj_msgSend(theWindow, "orderFront:", self);
    objj_msgSend(CPMenu, "setMenuBarVisible:", YES);
    objj_msgSend(self, "refreshMenu");
    objj_msgSend(self, "setDesktop");
    objj_msgSend(self, "performHash");
    var button = objj_msgSend(CPButton, "buttonWithTitle:", "test");
    objj_msgSend(button, "setTarget:", self);
    objj_msgSend(button, "setAction:", sel_getUid("test:"));
    objj_msgSend(self.contentView, "addSubview:", button);
    var ghlogin = objj_msgSend(CPButton, "buttonWithTitle:", "ghlogin");
    objj_msgSend(ghlogin, "setFrameOrigin:", CGPointMake(0, 80));
    objj_msgSend(ghlogin, "setTarget:", self);
    objj_msgSend(ghlogin, "setAction:", sel_getUid("ghlogin:"));
    objj_msgSend(self.contentView, "addSubview:", ghlogin);
    var cpbutton = objj_msgSend(CPButton, "buttonWithTitle:", "changepass");
    objj_msgSend(cpbutton, "setFrameOrigin:", CGPointMake(0, 20));
    objj_msgSend(cpbutton, "setTarget:", self);
    objj_msgSend(cpbutton, "setAction:", sel_getUid("changepass:"));
    objj_msgSend(self.contentView, "addSubview:", cpbutton);
    var ds = objj_msgSend(CPButton, "buttonWithTitle:", "dosomething");
    objj_msgSend(ds, "setFrameOrigin:", CGPointMake(0, 50));
    objj_msgSend(ds, "setTarget:", self);
    objj_msgSend(ds, "setAction:", sel_getUid("ds:"));
    objj_msgSend(self.contentView, "addSubview:", ds);
}
,["void","CPNotification"]), new objj_method(sel_getUid("test:"), function $AppController__test_(self, _cmd, sender)
{
    objj_msgSend(objj_msgSend(SessionManager, "instance"), "get:andNotify:", "/admin/usercount", self);
}
,["id","id"]), new objj_method(sel_getUid("ghlogin:"), function $AppController__ghlogin_(self, _cmd, sender)
{
    objj_msgSend(objj_msgSend(SessionManager, "instance"), "loginWithGithub");
}
,["id","id"]), new objj_method(sel_getUid("changepass:"), function $AppController__changepass_(self, _cmd, sender)
{
    objj_msgSend(objj_msgSend(SessionManager, "instance"), "showChangePasswordWindow");
}
,["id","id"]), new objj_method(sel_getUid("ds:"), function $AppController__ds_(self, _cmd, sender)
{
    objj_msgSend(objj_msgSend(SessionManager, "instance"), "get:andNotify:", "/", self);
}
,["id","id"]), new objj_method(sel_getUid("performHash"), function $AppController__performHash(self, _cmd)
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
,["void"]), new objj_method(sel_getUid("setDesktop"), function $AppController__setDesktop(self, _cmd)
{
    var bundle = objj_msgSend(CPBundle, "mainBundle");
    var file = objj_msgSend(bundle, "pathForResource:", "Images/bunnylabs.png");
    var image = objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:", file);
    var imageView = objj_msgSend(objj_msgSend(CPImageView, "alloc"), "initWithFrame:", CGRectMake(0, 0, 200, 200));
    objj_msgSend(imageView, "setImage:", image);
    objj_msgSend(imageView, "setAutoresizingMask:", CPViewMinXMargin | CPViewMaxXMargin | CPViewMinYMargin | CPViewMaxYMargin);
    objj_msgSend(imageView, "setCenter:", objj_msgSend(self.contentView, "center"));
    objj_msgSend(self.contentView, "addSubview:", imageView);
}
,["void"]), new objj_method(sel_getUid("refreshMenu"), function $AppController__refreshMenu(self, _cmd)
{
    self.mainMenu = objj_msgSend(objj_msgSend(CPApplication, "sharedApplication"), "mainMenu");
    while (objj_msgSend(self.mainMenu, "countOfItems") > 0)
    {
        objj_msgSend(self.mainMenu, "removeItemAtIndex:", 0);
    }
    objj_msgSend(self.mainMenu, "removeAllItems");
    objj_msgSend(self.mainMenu, "addItem:", objj_msgSend(CPMenuItem, "separatorItem"));
    objj_msgSend(self.mainMenu, "addItem:", objj_msgSend(CPMenuItem, "separatorItem"));
    objj_msgSend(self.mainMenu, "addItem:", objj_msgSend(objj_msgSend(SessionManager, "instance"), "sessionStatusMenuItem"));
}
,["void"]), new objj_method(sel_getUid("windowDidResize:"), function $AppController__windowDidResize_(self, _cmd, notification)
{
    objj_msgSend(self, "refreshMenu");
}
,["void","CPNotification"])]);
}p;20;TextFieldWithLabel.jt;4772;@STATIC;1.0;I;23;Foundation/Foundation.jI;15;AppKit/AppKit.jt;4705;objj_executeFile("Foundation/Foundation.j", NO);objj_executeFile("AppKit/AppKit.j", NO);{var the_class = objj_allocateClassPair(CPView, "TextFieldWithLabel"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("textField"), new objj_ivar("label"), new objj_ivar("target"), new objj_ivar("validator"), new objj_ivar("textChangedSelector")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("target"), function $TextFieldWithLabel__target(self, _cmd)
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
}p;20;Utils/HashFragment.jt;664;@STATIC;1.0;I;23;Foundation/Foundation.ji;16;URLQueryString.jt;597;objj_executeFile("Foundation/Foundation.j", NO);objj_executeFile("URLQueryString.j", YES);{var the_class = objj_allocateClassPair(CPObject, "HashFragment"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(meta_class, [new objj_method(sel_getUid("fragment"), function $HashFragment__fragment(self, _cmd)
{
    return window.location.hash;
}
,["CPString"]), new objj_method(sel_getUid("fragmentAsObject"), function $HashFragment__fragmentAsObject(self, _cmd)
{
    return objj_msgSend(URLQueryString, "deserialize:", window.location.hash.substring(1));
}
,["id"])]);
}p;40;Frameworks/SCAuth/SCUserSessionManager.jt;9435;@STATIC;1.0;I;21;Foundation/CPObject.jI;28;Foundation/CPURLConnection.jI;33;Foundation/CPUserSessionManager.ji;40;LoginProviders/SCLoginDialogController.jt;9274;objj_executeFile("Foundation/CPObject.j", NO);objj_executeFile("Foundation/CPURLConnection.j", NO);objj_executeFile("Foundation/CPUserSessionManager.j", NO);objj_executeFile("LoginProviders/SCLoginDialogController.j", YES);var SCDefaultSessionManager = nil;
{var the_class = objj_allocateClassPair(CPUserSessionManager, "SCUserSessionManager"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_loginDelegate"), new objj_ivar("_loginProvider"), new objj_ivar("_loginConnection"), new objj_ivar("_logoutConnection"), new objj_ivar("_sessionSyncConnection")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("loginProvider"), function $SCUserSessionManager__loginProvider(self, _cmd)
{
    return self._loginProvider;
}
,["id"]), new objj_method(sel_getUid("setLoginProvider:"), function $SCUserSessionManager__setLoginProvider_(self, _cmd, newValue)
{
    self._loginProvider = newValue;
}
,["void","id"]), new objj_method(sel_getUid("init"), function $SCUserSessionManager__init(self, _cmd)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("SCUserSessionManager").super_class }, "init");
    if (self)
    {
        objj_msgSend(self, "setLoginProvider:", objj_msgSend(SCLoginDialogController, "defaultController"));
    }
    return self;
}
,["id"]), new objj_method(sel_getUid("syncSession:"), function $SCUserSessionManager__syncSession_(self, _cmd, delegate)
{
    var request = objj_msgSend(CPURLRequest, "requestWithURL:", objj_msgSend(objj_msgSend(CPBundle, "mainBundle"), "objectForInfoDictionaryKey:", "SCAuthSyncURL") || "/session/");
    objj_msgSend(request, "setHTTPMethod:", "GET");
    self._sessionSyncConnection = objj_msgSend(CPURLConnection, "connectionWithRequest:delegate:", request, self);
    self._sessionSyncConnection.delegate = delegate;
}
,["void","id"]), new objj_method(sel_getUid("logout:"), function $SCUserSessionManager__logout_(self, _cmd, delegate)
{
    var request = objj_msgSend(CPURLRequest, "requestWithURL:", objj_msgSend(objj_msgSend(CPBundle, "mainBundle"), "objectForInfoDictionaryKey:", "SCAuthLogoutURL") || "/session/");
    objj_msgSend(request, "setHTTPMethod:", "DELETE");
    self._logoutConnection = objj_msgSend(CPURLConnection, "connectionWithRequest:delegate:", request, self);
    self._logoutConnection.delegate = delegate;
}
,["void","id"]), new objj_method(sel_getUid("login:"), function $SCUserSessionManager__login_(self, _cmd, delegate)
{
    if (self._loginDelegate)
        return;
    self._loginDelegate = delegate;
    objj_msgSend(self._loginProvider, "loginWithDelegate:callback:", self, sel_getUid("_loginFinishedWithCode:"));
}
,["void","id"]), new objj_method(sel_getUid("userDisplayName"), function $SCUserSessionManager__userDisplayName(self, _cmd)
{
    return objj_msgSend(self, "userIdentifier");
}
,["CPString"]), new objj_method(sel_getUid("_loginFinishedWithCode:"), function $SCUserSessionManager___loginFinishedWithCode_(self, _cmd, returnCode)
{
    var selectorToPerform;
    if (returnCode === SCLoginSucceeded)
    {
        objj_msgSend(self, "_setCurrentUser:", objj_msgSend(self._loginProvider, "username"));
        selectorToPerform = sel_getUid("loginDidSucceed:");
    }
    else
        selectorToPerform = sel_getUid("loginDidFail:");
    if (selectorToPerform && self._loginDelegate && objj_msgSend(self._loginDelegate, "respondsToSelector:", selectorToPerform))
        objj_msgSend(self._loginDelegate, "performSelector:withObject:", selectorToPerform, self);
    self._loginDelegate = nil;
}
,["void","unsigned"]), new objj_method(sel_getUid("_setCurrentUser:"), function $SCUserSessionManager___setCurrentUser_(self, _cmd, aUser)
{
    if (aUser)
    {
        objj_msgSend(self, "setStatus:", CPUserSessionLoggedInStatus);
        objj_msgSend(self, "setUserIdentifier:", aUser);
    }
    else
    {
        objj_msgSend(self, "setStatus:", CPUserSessionLoggedOutStatus);
        objj_msgSend(self, "setUserIdentifier:", nil);
    }
}
,["void","CPString"]), new objj_method(sel_getUid("connection:didFailWithError:"), function $SCUserSessionManager__connection_didFailWithError_(self, _cmd, aConnection, anException)
{
    var delegate = aConnection.delegate;
    if (aConnection === self._sessionSyncConnection)
    {
        if (delegate && objj_msgSend(delegate, "respondsToSelector:", sel_getUid("sessionSyncDidFail:")))
            objj_msgSend(delegate, "sessionSyncDidFail:", self);
    }
    else if (aConnection === self._logoutConnection)
        if (delegate && objj_msgSend(delegate, "respondsToSelector:", sel_getUid("logoutDidFail:")))
            objj_msgSend(delegate, "logoutDidFail:", self);
}
,["void","CPURLConnection","CPException"]), new objj_method(sel_getUid("connection:didReceiveResponse:"), function $SCUserSessionManager__connection_didReceiveResponse_(self, _cmd, aConnection, aResponse)
{
    var delegate = aConnection.delegate;
    if (!objj_msgSend(aResponse, "isKindOfClass:", objj_msgSend(CPHTTPURLResponse, "class")))
    {
        objj_msgSend(aConnection, "cancel");
        if (aConnection === self._sessionSyncConnection)
        {
            if (delegate && objj_msgSend(delegate, "respondsToSelector:", sel_getUid("sessionSyncDidFail:")))
                objj_msgSend(delegate, "sessionSyncDidFail:", self);
        }
        else if (aConnection === self._logoutConnection)
            if (delegate && objj_msgSend(delegate, "respondsToSelector:", sel_getUid("logoutDidFail:")))
                objj_msgSend(delegate, "logoutDidFail:", self);
        return;
    }
    var statusCode = objj_msgSend(aResponse, "statusCode");
    if (aConnection !== self._sessionSyncConnection || statusCode !== 200)
        objj_msgSend(aConnection, "cancel");
    if (aConnection === self._sessionSyncConnection)
    {
        if (statusCode === 200)
            return;
        if (statusCode === 404)
        {
            objj_msgSend(self, "_setCurrentUser:", nil);
            if (delegate && objj_msgSend(delegate, "respondsToSelector:", sel_getUid("sessionSyncDidSucceed:")))
                objj_msgSend(delegate, "sessionSyncDidSucceed:", self);
        }
    }
    else if (aConnection === self._logoutConnection)
    {
        objj_msgSend(aConnection, "cancel");
        if (statusCode === 200)
        {
            objj_msgSend(self, "_setCurrentUser:", nil);
            if (delegate && objj_msgSend(delegate, "respondsToSelector:", sel_getUid("logoutDidSucceed:")))
                objj_msgSend(delegate, "logoutDidSucceed:", self);
        }
        else if (delegate && objj_msgSend(delegate, "respondsToSelector:", sel_getUid("logoutDidFail:")))
            objj_msgSend(delegate, "logoutDidFail:", self);
    }
}
,["void","CPURLConnection","CPURLResponse"]), new objj_method(sel_getUid("connection:didReceiveData:"), function $SCUserSessionManager__connection_didReceiveData_(self, _cmd, aConnection, data)
{
    if (!data || aConnection != self._sessionSyncConnection)
        return;
    var responseBody = objj_msgSend(data, "objectFromJSON"),
        delegate = aConnection.delegate;
    if (responseBody.username)
        objj_msgSend(self, "_setCurrentUser:", responseBody.username);
    if (delegate && objj_msgSend(delegate, "respondsToSelector:", sel_getUid("sessionSyncDidSucceed:")))
        objj_msgSend(delegate, "sessionSyncDidSucceed:", self);
}
,["void","CPURLConnection","CPString"]), new objj_method(sel_getUid("connectionDidReceiveAuthenticationChallenge:"), function $SCUserSessionManager__connectionDidReceiveAuthenticationChallenge_(self, _cmd, aConnection)
{
    self._loginConnection = aConnection;
    objj_msgSend(self._loginConnection, "cancel");
    objj_msgSend(self, "_setCurrentUser:", nil);
    objj_msgSend(self, "login:", self);
    if (objj_msgSend(objj_msgSend(self._loginConnection, "delegate"), "respondsToSelector:", sel_getUid("sessionManagerDidInterceptAuthenticationChallenge:forConnection:")))
        objj_msgSend(objj_msgSend(self._loginConnection, "delegate"), "sessionManagerDidInterceptAuthenticationChallenge:forConnection:", self, aConnection);
}
,["void","CPURLConnection"]), new objj_method(sel_getUid("loginDidFail:"), function $SCUserSessionManager__loginDidFail_(self, _cmd, sender)
{
    if (objj_msgSend(objj_msgSend(self._loginConnection, "delegate"), "respondsToSelector:", sel_getUid("connectionDidFailAuthentication:")))
        objj_msgSend(objj_msgSend(self._loginConnection, "delegate"), "connectionDidFailAuthentication:", self._loginConnection);
    self._loginConnection = nil;
}
,["void","id"]), new objj_method(sel_getUid("loginDidSucceed:"), function $SCUserSessionManager__loginDidSucceed_(self, _cmd, sender)
{
    objj_msgSend(self._loginConnection, "start");
    self._loginConnection = nil;
}
,["void","id"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("defaultManager"), function $SCUserSessionManager__defaultManager(self, _cmd)
{
    if (!SCDefaultSessionManager)
        SCDefaultSessionManager = objj_msgSend(objj_msgSend(SCUserSessionManager, "alloc"), "init");
    return SCDefaultSessionManager;
}
,["SCUserSessionManager"])]);
}objj_msgSend(CPURLConnection, "setClassDelegate:", objj_msgSend(SCUserSessionManager, "defaultManager"));
p;61;Frameworks/SCAuth/AccountValidators/SCEmailAccountValidator.jt;605;@STATIC;1.0;I;21;Foundation/CPObject.ji;20;SCAccountValidator.jt;536;objj_executeFile("Foundation/CPObject.j", NO);objj_executeFile("SCAccountValidator.j", YES);{var the_class = objj_allocateClassPair(SCAccountValidator, "SCEmailAccountValidator"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(meta_class, [new objj_method(sel_getUid("validateUsername:"), function $SCEmailAccountValidator__validateUsername_(self, _cmd, username)
{
    var reg = new RegExp("^[-a-zA-Z0-9+._]+@[-a-zA-Z0-9.]+\\.[a-zA-Z]{2,4}$");
    return reg.test(username);
}
,["BOOL","CPString"])]);
}p;56;Frameworks/SCAuth/AccountValidators/SCAccountValidator.jt;966;@STATIC;1.0;I;21;Foundation/CPObject.jt;922;objj_executeFile("Foundation/CPObject.j", NO);{var the_class = objj_allocateClassPair(CPObject, "SCAccountValidator"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(meta_class, [new objj_method(sel_getUid("validateUsername:"), function $SCAccountValidator__validateUsername_(self, _cmd, username)
{
    return YES;
}
,["BOOL","CPString"]), new objj_method(sel_getUid("validatePassword:withConfirmPassword:"), function $SCAccountValidator__validatePassword_withConfirmPassword_(self, _cmd, password, confirmPassword)
{
    var retVal = nil;
    if (!password || password === "")
        retVal = "Password can't be blank.";
    else if (objj_msgSend(password, "length") < 10)
        retVal = "Password must be at least 10 characters long.";
    else if (password !== confirmPassword)
        retVal = "Passwords don't match.";
    return retVal;
}
,["CPString","CPString","CPString"])]);
}p;58;Frameworks/SCAuth/LoginProviders/SCLoginDialogController.jt;38409;@STATIC;1.0;I;27;AppKit/CPWindowController.ji;41;../AccountValidators/SCAccountValidator.jt;38311;objj_executeFile("AppKit/CPWindowController.j", NO);objj_executeFile("../AccountValidators/SCAccountValidator.j", YES);var DefaultLoginDialogController = nil,
    DefaultLoginTitle = "Login/Register",
    LoginTitle = "Login",
    RegisterTitle = "Register",
    UserCheckErrorMessage = "There was an error trying to find your username. Check your internet connection.",
    GenericErrorMessage = "Something went wrong. Check your internet connection and try again.",
    ConnectionStatusCode = -1;
SCLoginSucceeded = 0;
SCLoginFailed = 1;
{var the_class = objj_allocateClassPair(CPWindowController, "SCLoginDialogController"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_dialogReturnCode"), new objj_ivar("_username"), new objj_ivar("_delegate"), new objj_ivar("_callback"), new objj_ivar("_userCheckConnection"), new objj_ivar("_loginConnection"), new objj_ivar("_registrationConnection"), new objj_ivar("_accountValidator"), new objj_ivar("_connectionClass"), new objj_ivar("_tryAgainButton"), new objj_ivar("_subheading"), new objj_ivar("_userLabel"), new objj_ivar("_userField"), new objj_ivar("_passwordLabel"), new objj_ivar("_passwordField"), new objj_ivar("_passwordConfirmLabel"), new objj_ivar("_passwordConfirmField"), new objj_ivar("_errorMessage"), new objj_ivar("_loginButton"), new objj_ivar("_cancelButton"), new objj_ivar("_registeringProgressLabel"), new objj_ivar("_loggingInProgressLabel"), new objj_ivar("_progressSpinner"), new objj_ivar("_userCheckSpinner"), new objj_ivar("_forgotPasswordLink"), new objj_ivar("_rememberMeButton"), new objj_ivar("_formFieldContainer")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("username"), function $SCLoginDialogController__username(self, _cmd)
{
    return self._username;
}
,["CPString"]), new objj_method(sel_getUid("delegate"), function $SCLoginDialogController__delegate(self, _cmd)
{
    return self._delegate;
}
,["id"]), new objj_method(sel_getUid("setDelegate:"), function $SCLoginDialogController__setDelegate_(self, _cmd, newValue)
{
    self._delegate = newValue;
}
,["void","id"]), new objj_method(sel_getUid("accountValidator"), function $SCLoginDialogController__accountValidator(self, _cmd)
{
    return self._accountValidator;
}
,["id"]), new objj_method(sel_getUid("setAccountValidator:"), function $SCLoginDialogController__setAccountValidator_(self, _cmd, newValue)
{
    self._accountValidator = newValue;
}
,["void","id"]), new objj_method(sel_getUid("connectionClass"), function $SCLoginDialogController__connectionClass(self, _cmd)
{
    return self._connectionClass;
}
,["CPObject"]), new objj_method(sel_getUid("setConnectionClass:"), function $SCLoginDialogController__setConnectionClass_(self, _cmd, newValue)
{
    self._connectionClass = newValue;
}
,["void","CPObject"]), new objj_method(sel_getUid("tryAgainButton"), function $SCLoginDialogController__tryAgainButton(self, _cmd)
{
    return self._tryAgainButton;
}
,["CPButton"]), new objj_method(sel_getUid("setTryAgainButton:"), function $SCLoginDialogController__setTryAgainButton_(self, _cmd, newValue)
{
    self._tryAgainButton = newValue;
}
,["void","CPButton"]), new objj_method(sel_getUid("subheading"), function $SCLoginDialogController__subheading(self, _cmd)
{
    return self._subheading;
}
,["CPTextField"]), new objj_method(sel_getUid("setSubheading:"), function $SCLoginDialogController__setSubheading_(self, _cmd, newValue)
{
    self._subheading = newValue;
}
,["void","CPTextField"]), new objj_method(sel_getUid("userLabel"), function $SCLoginDialogController__userLabel(self, _cmd)
{
    return self._userLabel;
}
,["CPTextField"]), new objj_method(sel_getUid("setUserLabel:"), function $SCLoginDialogController__setUserLabel_(self, _cmd, newValue)
{
    self._userLabel = newValue;
}
,["void","CPTextField"]), new objj_method(sel_getUid("userField"), function $SCLoginDialogController__userField(self, _cmd)
{
    return self._userField;
}
,["CPTextField"]), new objj_method(sel_getUid("setUserField:"), function $SCLoginDialogController__setUserField_(self, _cmd, newValue)
{
    self._userField = newValue;
}
,["void","CPTextField"]), new objj_method(sel_getUid("passwordLabel"), function $SCLoginDialogController__passwordLabel(self, _cmd)
{
    return self._passwordLabel;
}
,["CPTextField"]), new objj_method(sel_getUid("setPasswordLabel:"), function $SCLoginDialogController__setPasswordLabel_(self, _cmd, newValue)
{
    self._passwordLabel = newValue;
}
,["void","CPTextField"]), new objj_method(sel_getUid("passwordField"), function $SCLoginDialogController__passwordField(self, _cmd)
{
    return self._passwordField;
}
,["CPTextField"]), new objj_method(sel_getUid("setPasswordField:"), function $SCLoginDialogController__setPasswordField_(self, _cmd, newValue)
{
    self._passwordField = newValue;
}
,["void","CPTextField"]), new objj_method(sel_getUid("passwordConfirmLabel"), function $SCLoginDialogController__passwordConfirmLabel(self, _cmd)
{
    return self._passwordConfirmLabel;
}
,["CPTextField"]), new objj_method(sel_getUid("setPasswordConfirmLabel:"), function $SCLoginDialogController__setPasswordConfirmLabel_(self, _cmd, newValue)
{
    self._passwordConfirmLabel = newValue;
}
,["void","CPTextField"]), new objj_method(sel_getUid("passwordConfirmField"), function $SCLoginDialogController__passwordConfirmField(self, _cmd)
{
    return self._passwordConfirmField;
}
,["CPTextField"]), new objj_method(sel_getUid("setPasswordConfirmField:"), function $SCLoginDialogController__setPasswordConfirmField_(self, _cmd, newValue)
{
    self._passwordConfirmField = newValue;
}
,["void","CPTextField"]), new objj_method(sel_getUid("errorMessage"), function $SCLoginDialogController__errorMessage(self, _cmd)
{
    return self._errorMessage;
}
,["CPTextField"]), new objj_method(sel_getUid("setErrorMessage:"), function $SCLoginDialogController__setErrorMessage_(self, _cmd, newValue)
{
    self._errorMessage = newValue;
}
,["void","CPTextField"]), new objj_method(sel_getUid("loginButton"), function $SCLoginDialogController__loginButton(self, _cmd)
{
    return self._loginButton;
}
,["CPButton"]), new objj_method(sel_getUid("setLoginButton:"), function $SCLoginDialogController__setLoginButton_(self, _cmd, newValue)
{
    self._loginButton = newValue;
}
,["void","CPButton"]), new objj_method(sel_getUid("cancelButton"), function $SCLoginDialogController__cancelButton(self, _cmd)
{
    return self._cancelButton;
}
,["CPButton"]), new objj_method(sel_getUid("setCancelButton:"), function $SCLoginDialogController__setCancelButton_(self, _cmd, newValue)
{
    self._cancelButton = newValue;
}
,["void","CPButton"]), new objj_method(sel_getUid("registeringProgressLabel"), function $SCLoginDialogController__registeringProgressLabel(self, _cmd)
{
    return self._registeringProgressLabel;
}
,["CPTextField"]), new objj_method(sel_getUid("setRegisteringProgressLabel:"), function $SCLoginDialogController__setRegisteringProgressLabel_(self, _cmd, newValue)
{
    self._registeringProgressLabel = newValue;
}
,["void","CPTextField"]), new objj_method(sel_getUid("loggingInProgressLabel"), function $SCLoginDialogController__loggingInProgressLabel(self, _cmd)
{
    return self._loggingInProgressLabel;
}
,["CPTextField"]), new objj_method(sel_getUid("setLoggingInProgressLabel:"), function $SCLoginDialogController__setLoggingInProgressLabel_(self, _cmd, newValue)
{
    self._loggingInProgressLabel = newValue;
}
,["void","CPTextField"]), new objj_method(sel_getUid("progressSpinner"), function $SCLoginDialogController__progressSpinner(self, _cmd)
{
    return self._progressSpinner;
}
,["CPImageView"]), new objj_method(sel_getUid("setProgressSpinner:"), function $SCLoginDialogController__setProgressSpinner_(self, _cmd, newValue)
{
    self._progressSpinner = newValue;
}
,["void","CPImageView"]), new objj_method(sel_getUid("userCheckSpinner"), function $SCLoginDialogController__userCheckSpinner(self, _cmd)
{
    return self._userCheckSpinner;
}
,["CPImageView"]), new objj_method(sel_getUid("setUserCheckSpinner:"), function $SCLoginDialogController__setUserCheckSpinner_(self, _cmd, newValue)
{
    self._userCheckSpinner = newValue;
}
,["void","CPImageView"]), new objj_method(sel_getUid("forgotPasswordLink"), function $SCLoginDialogController__forgotPasswordLink(self, _cmd)
{
    return self._forgotPasswordLink;
}
,["CPButton"]), new objj_method(sel_getUid("setForgotPasswordLink:"), function $SCLoginDialogController__setForgotPasswordLink_(self, _cmd, newValue)
{
    self._forgotPasswordLink = newValue;
}
,["void","CPButton"]), new objj_method(sel_getUid("rememberMeButton"), function $SCLoginDialogController__rememberMeButton(self, _cmd)
{
    return self._rememberMeButton;
}
,["CPCheckBox"]), new objj_method(sel_getUid("setRememberMeButton:"), function $SCLoginDialogController__setRememberMeButton_(self, _cmd, newValue)
{
    self._rememberMeButton = newValue;
}
,["void","CPCheckBox"]), new objj_method(sel_getUid("formFieldContainer"), function $SCLoginDialogController__formFieldContainer(self, _cmd)
{
    return self._formFieldContainer;
}
,["CPView"]), new objj_method(sel_getUid("setFormFieldContainer:"), function $SCLoginDialogController__setFormFieldContainer_(self, _cmd, newValue)
{
    self._formFieldContainer = newValue;
}
,["void","CPView"]), new objj_method(sel_getUid("awakeFromCib"), function $SCLoginDialogController__awakeFromCib(self, _cmd)
{
    self._accountValidator = SCAccountValidator;
    self._connectionClass = CPURLConnection;
    objj_msgSend(self._window, "setAutorecalculatesKeyViewLoop:", NO);
    objj_msgSend(self._window, "setDefaultButton:", self._loginButton);
    if (self._window._windowView && self._window._windowView._closeButton)
        objj_msgSend(self._window._windowView._closeButton, "setHidden:", YES);
    objj_msgSend(self._userLabel, "sizeToFit");
    objj_msgSend(self._passwordLabel, "sizeToFit");
    objj_msgSend(self._registeringProgressLabel, "sizeToFit");
    objj_msgSend(self._loggingInProgressLabel, "sizeToFit");
    objj_msgSend(self._userField, "setDelegate:", self);
    objj_msgSend(self._subheading, "setLineBreakMode:", CPLineBreakByWordWrapping);
    objj_msgSend(self._subheading, "setBackgroundColor:", objj_msgSend(CPColor, "colorWithCalibratedRed:green:blue:alpha:", 103.0 / 255.0, 154.0 / 255.0, 205.0 / 255.0, 1.0));
    objj_msgSend(self._subheading, "setTextColor:", objj_msgSend(CPColor, "whiteColor"));
    var border = objj_msgSend(objj_msgSend(CPView, "alloc"), "initWithFrame:", CPRectMake(0, CPRectGetHeight(objj_msgSend(self._subheading, "bounds")) - 1, CPRectGetWidth(objj_msgSend(self._subheading, "bounds")), 1));
    objj_msgSend(border, "setAutoresizingMask:", CPViewWidthSizable | CPViewMinYMargin);
    objj_msgSend(border, "setBackgroundColor:", objj_msgSend(CPColor, "grayColor"));
    objj_msgSend(self._subheading, "addSubview:", border);
    objj_msgSend(self._subheading, "setValue:forThemeAttribute:", CGInsetMake(9.0, 9.0, 9.0, 9.0), "content-inset");
    objj_msgSend(self._errorMessage, "setLineBreakMode:", CPLineBreakByWordWrapping);
    objj_msgSend(self._errorMessage, "setBackgroundColor:", objj_msgSend(CPColor, "colorWithHexString:", "993333"));
    objj_msgSend(self._errorMessage, "setTextColor:", objj_msgSend(CPColor, "whiteColor"));
    var border = objj_msgSend(objj_msgSend(CPView, "alloc"), "initWithFrame:", CPRectMake(0, CPRectGetHeight(objj_msgSend(self._errorMessage, "bounds")) - 1, CPRectGetWidth(objj_msgSend(self._errorMessage, "bounds")), 1));
    objj_msgSend(border, "setAutoresizingMask:", CPViewWidthSizable | CPViewMinYMargin);
    objj_msgSend(border, "setBackgroundColor:", objj_msgSend(CPColor, "grayColor"));
    objj_msgSend(self._errorMessage, "addSubview:", border);
    objj_msgSend(self._errorMessage, "setValue:forThemeAttribute:", CGInsetMake(9.0, 9.0, 9.0, 9.0), "content-inset");
    objj_msgSend(self._tryAgainButton, "setTheme:", nil);
    objj_msgSend(self._tryAgainButton, "setTextColor:", objj_msgSend(CPColor, "colorWithCalibratedRed:green:blue:alpha:", 159.0 / 255.0, 201.0 / 255.0, 245.0 / 255.0, 1.0));
    objj_msgSend(self._tryAgainButton, "setAlignment:", CPLeftTextAlignment);
    objj_msgSend(self._tryAgainButton, "setStringValue:", "Tryagain.");
    if (self._tryAgainButton._DOMElement)
    {
        self._tryAgainButton._DOMElement.className = "hover";
        self._tryAgainButton._DOMElement.style.color = objj_msgSend(objj_msgSend(CPColor, "colorWithCalibratedRed:green:blue:alpha:", 159.0 / 255.0, 201.0 / 255.0, 245.0 / 255.0, 1.0), "cssString");
        self._tryAgainButton._DOMElement.style.textDecoration = "underline";
    }
    objj_msgSend(self._tryAgainButton, "sizeToFit");
    objj_msgSend(self._tryAgainButton, "setFrameSize:", CGSizeMake(objj_msgSend(self._tryAgainButton, "frame").size.width + 5.0, objj_msgSend(self._tryAgainButton, "frame").size.height));
    objj_msgSend(self._forgotPasswordLink, "setFont:", objj_msgSend(CPFont, "fontWithName:size:", objj_msgSend(objj_msgSend(self._forgotPasswordLink, "font"), "familyName"), 10.0));
    objj_msgSend(self._forgotPasswordLink, "setTheme:", nil);
    objj_msgSend(self._forgotPasswordLink, "setTextColor:", objj_msgSend(CPColor, "colorWithCalibratedRed:green:blue:alpha:", 103.0 / 255.0, 154.0 / 255.0, 205.0 / 255.0, 1.0));
    objj_msgSend(self._forgotPasswordLink, "sizeToFit");
    objj_msgSend(self._forgotPasswordLink, "setFrameOrigin:", CGPointMake(objj_msgSend(self._passwordField, "frame").origin.x + objj_msgSend(self._passwordField, "frame").size.width - objj_msgSend(self._forgotPasswordLink, "frame").size.width, objj_msgSend(self._passwordField, "frame").origin.y + objj_msgSend(self._passwordField, "frame").size.height));
    objj_msgSend(self._rememberMeButton, "setFont:", objj_msgSend(CPFont, "fontWithName:size:", objj_msgSend(objj_msgSend(self._forgotPasswordLink, "font"), "familyName"), objj_msgSend(objj_msgSend(self._passwordLabel, "font"), "size")));
    if (self._forgotPasswordLink._DOMElement)
        self._forgotPasswordLink._DOMElement.className = "hover";
    objj_msgSend(self._passwordField, "setSecure:", YES);
    objj_msgSend(self._passwordConfirmField, "setSecure:", YES);
    objj_msgSend(self._window, "setShowsResizeIndicator:", NO);
    objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "addObserver:selector:name:object:", self, sel_getUid("_loginDialogClosed:"), CPWindowWillCloseNotification, self._window);
}
,["void"]), new objj_method(sel_getUid("_loginDialogClosed:"), function $SCLoginDialogController___loginDialogClosed_(self, _cmd, aNotification)
{
    objj_msgSend(CPApp, "stopModalWithCode:", CPRunStoppedResponse);
    if (self._delegate && objj_msgSend(self._delegate, "respondsToSelector:", self._callback))
        objj_msgSend(self._delegate, "performSelector:withObject:", self._callback, self._dialogReturnCode);
}
,["void","CPNotification"]), new objj_method(sel_getUid("forgotPasswordLinkClicked:"), function $SCLoginDialogController__forgotPasswordLinkClicked_(self, _cmd, sender)
{
    var forgotPasswordURL = objj_msgSend(objj_msgSend(CPBundle, "mainBundle"), "objectForInfoDictionaryKey:", "SCAuthForgotPasswordURL");
    if (forgotPasswordURL)
        if (window.open)
            window.open(forgotPasswordURL);
}
,["void","id"]), new objj_method(sel_getUid("tryCheckUserAgain:"), function $SCLoginDialogController__tryCheckUserAgain_(self, _cmd, sender)
{
    objj_msgSend(self, "_checkUser");
}
,["void","id"]), new objj_method(sel_getUid("cancel:"), function $SCLoginDialogController__cancel_(self, _cmd, sender)
{
    self._dialogReturnCode = SCLoginFailed;
    objj_msgSend(self._window, "close");
}
,["void","id"]), new objj_method(sel_getUid("login:"), function $SCLoginDialogController__login_(self, _cmd, sender)
{
    if (objj_msgSend(self._loginButton, "title") === RegisterTitle)
    {
        var passwordError = objj_msgSend(self._accountValidator, "validatePassword:withConfirmPassword:", objj_msgSend(self._passwordField, "stringValue"), objj_msgSend(self._passwordConfirmField, "stringValue"));
        if (passwordError)
            objj_msgSend(self, "_setErrorMessageText:", passwordError);
        else
        {
            if (objj_msgSend(self._accountValidator, "validateUsername:", objj_msgSend(self._userField, "stringValue")))
            {
                objj_msgSend(self, "_registerUser:password:", objj_msgSend(self._userField, "stringValue"), objj_msgSend(self._passwordField, "stringValue"));
                objj_msgSend(self._registeringProgressLabel, "setHidden:", NO);
                objj_msgSend(self._progressSpinner, "setHidden:", NO);
                objj_msgSend(self._loginButton, "setHidden:", YES);
            }
            else
                objj_msgSend(self, "_setErrorMessageText:", "Please enter a valid username.");
        }
    }
    else
    {
        objj_msgSend(self, "_loginUser:password:", objj_msgSend(self._userField, "stringValue"), objj_msgSend(self._passwordField, "stringValue"));
        objj_msgSend(self._loggingInProgressLabel, "setHidden:", NO);
        objj_msgSend(self._progressSpinner, "setHidden:", NO);
        objj_msgSend(self._loginButton, "setHidden:", YES);
    }
}
,["void","id"]), new objj_method(sel_getUid("_loginFailedWithError:statusCode:"), function $SCLoginDialogController___loginFailedWithError_statusCode_(self, _cmd, errorMessageText, statusCode)
{
    objj_msgSend(self, "_setDialogModeToLogin");
    objj_msgSend(self, "_setErrorMessageText:", errorMessageText);
    objj_msgSend(self._window, "makeFirstResponder:", self._passwordField);
    objj_msgSend(self._passwordField, "selectText:", self);
}
,["void","CPString","int"]), new objj_method(sel_getUid("_registrationFailedWithError:statusCode:"), function $SCLoginDialogController___registrationFailedWithError_statusCode_(self, _cmd, errorMessageText, statusCode)
{
    objj_msgSend(self, "_setDialogModeToRegister");
    objj_msgSend(self, "_setErrorMessageText:", errorMessageText);
}
,["void","CPString","int"]), new objj_method(sel_getUid("_loginUser:password:"), function $SCLoginDialogController___loginUser_password_(self, _cmd, username, password)
{
    var shouldRemember = objj_msgSend(self._rememberMeButton, "state") === CPOnState,
        loginObject = {'username': username, 'password': password, 'remember': shouldRemember},
        request = objj_msgSend(CPURLRequest, "requestWithURL:", objj_msgSend(objj_msgSend(CPBundle, "mainBundle"), "objectForInfoDictionaryKey:", "SCAuthLoginURL") || "/session/");
    objj_msgSend(request, "setHTTPMethod:", "POST");
    objj_msgSend(request, "setValue:forHTTPHeaderField:", "application/json", "Content-Type");
    objj_msgSend(request, "setHTTPBody:", objj_msgSend(CPString, "JSONFromObject:", loginObject));
    self._loginConnection = objj_msgSend(self._connectionClass, "connectionWithRequest:delegate:", request, self);
    self._loginConnection.username = username;
}
,["void","CPString","CPString"]), new objj_method(sel_getUid("_registerUser:password:"), function $SCLoginDialogController___registerUser_password_(self, _cmd, username, password)
{
    var shouldRemember = objj_msgSend(self._rememberMeButton, "state") === CPOnState,
        registerObject = {'username': username, 'password': password, 'remember': shouldRemember},
        request = objj_msgSend(CPURLRequest, "requestWithURL:", objj_msgSend(objj_msgSend(CPBundle, "mainBundle"), "objectForInfoDictionaryKey:", "SCAuthRegistrationURL") || "/user/");
    objj_msgSend(request, "setHTTPMethod:", "POST");
    objj_msgSend(request, "setValue:forHTTPHeaderField:", "application/json", "Content-Type");
    objj_msgSend(request, "setHTTPBody:", objj_msgSend(CPString, "JSONFromObject:", registerObject));
    self._registrationConnection = objj_msgSend(self._connectionClass, "connectionWithRequest:delegate:", request, self);
    self._registrationConnection.username = username;
}
,["void","CPString","CPString"]), new objj_method(sel_getUid("_setButtonOrigins"), function $SCLoginDialogController___setButtonOrigins(self, _cmd)
{
    var frameToUse = objj_msgSend(self._passwordConfirmField, "frame");
    if (objj_msgSend(self._passwordConfirmField, "isHidden"))
    {
        if (objj_msgSend(self._forgotPasswordLink, "isHidden"))
            frameToUse = objj_msgSend(self._passwordField, "frame");
        else
            frameToUse = objj_msgSend(self._forgotPasswordLink, "frame");
    }
    objj_msgSend(self._loginButton, "setFrameOrigin:", CGPointMake(frameToUse.origin.x + frameToUse.size.width - objj_msgSend(self._loginButton, "frame").size.width - 3.0, frameToUse.origin.y + frameToUse.size.height + 5.0));
    var loginFrame = objj_msgSend(self._loginButton, "frame");
    objj_msgSend(self._cancelButton, "setFrameOrigin:", CGPointMake(loginFrame.origin.x - objj_msgSend(self._cancelButton, "frame").size.width - 8.0, loginFrame.origin.y));
    objj_msgSend(self._rememberMeButton, "setFrameOrigin:", CGPointMake(0, loginFrame.origin.y + loginFrame.size.height / 2 - objj_msgSend(self._rememberMeButton, "frame").size.height / 2));
    objj_msgSend(self._progressSpinner, "setFrameOrigin:", CGPointMake(loginFrame.origin.x, loginFrame.origin.y + loginFrame.size.height / 2.0 - objj_msgSend(self._progressSpinner, "frame").size.height / 2.0));
    var spinnerFrame = objj_msgSend(self._progressSpinner, "frame");
    objj_msgSend(self._registeringProgressLabel, "setFrameOrigin:", CGPointMake(spinnerFrame.origin.x + spinnerFrame.size.width + 5.0, spinnerFrame.origin.y + spinnerFrame.size.height / 2.0 - objj_msgSend(self._registeringProgressLabel, "frame").size.height / 2.0));
    objj_msgSend(self._loggingInProgressLabel, "setFrameOrigin:", CGPointMake(spinnerFrame.origin.x + spinnerFrame.size.width + 5.0, spinnerFrame.origin.y + spinnerFrame.size.height / 2.0 - objj_msgSend(self._loggingInProgressLabel, "frame").size.height / 2.0));
}
,["CGPoint"]), new objj_method(sel_getUid("_sizeAndPositionFormFieldContainer"), function $SCLoginDialogController___sizeAndPositionFormFieldContainer(self, _cmd)
{
    if (objj_msgSend(self._subheading, "isHidden") && objj_msgSend(self._errorMessage, "isHidden"))
        objj_msgSend(self._formFieldContainer, "setFrameOrigin:", CGPointMake(16, 0));
    else
    {
        if (!objj_msgSend(self._subheading, "isHidden"))
            objj_msgSend(self._formFieldContainer, "setFrameOrigin:", CGPointMake(16, objj_msgSend(self._subheading, "frame").origin.y + objj_msgSend(self._subheading, "frame").size.height + 5.0));
        else if (!objj_msgSend(self._errorMessage, "isHidden"))
            objj_msgSend(self._formFieldContainer, "setFrameOrigin:", CGPointMake(16, objj_msgSend(self._errorMessage, "frame").origin.y + objj_msgSend(self._errorMessage, "frame").size.height + 5.0));
    }
    objj_msgSend(self._formFieldContainer, "setFrameSize:", CGSizeMake(objj_msgSend(self._loginButton, "frame").origin.x + objj_msgSend(self._loginButton, "frame").size.width + 16.0, objj_msgSend(self._loginButton, "frame").origin.y + objj_msgSend(self._loginButton, "frame").size.height + 10.0));
}
,["void"]), new objj_method(sel_getUid("_setKeyViews"), function $SCLoginDialogController___setKeyViews(self, _cmd)
{
    if (objj_msgSend(self._passwordConfirmField, "isHidden"))
    {
        objj_msgSend(self._userField, "setNextKeyView:", self._passwordField);
        objj_msgSend(self._passwordField, "setNextKeyView:", self._userField);
    }
    else
    {
        objj_msgSend(self._userField, "setNextKeyView:", self._passwordField);
        objj_msgSend(self._passwordField, "setNextKeyView:", self._passwordConfirmField);
        objj_msgSend(self._passwordConfirmField, "setNextKeyView:", self._userField);
    }
}
,["void"]), new objj_method(sel_getUid("_sizeWindowToFit"), function $SCLoginDialogController___sizeWindowToFit(self, _cmd)
{
    var fieldFrame = objj_msgSend(self._formFieldContainer, "frame");
    objj_msgSend(self._window, "setFrameSize:", CGSizeMake(fieldFrame.origin.x + fieldFrame.size.width, fieldFrame.origin.y + fieldFrame.size.height + 32.0));
}
,["void"]), new objj_method(sel_getUid("_checkUser"), function $SCLoginDialogController___checkUser(self, _cmd)
{
    objj_msgSend(self._userCheckSpinner, "setHidden:", NO);
    var request = objj_msgSend(CPURLRequest, "requestWithURL:", (objj_msgSend(objj_msgSend(CPBundle, "mainBundle"), "objectForInfoDictionaryKey:", "SCAuthUserCheckURL") || "/user/") + objj_msgSend(self._userField, "stringValue"));
    objj_msgSend(request, "setHTTPMethod:", "GET");
    self._userCheckConnection = objj_msgSend(self._connectionClass, "connectionWithRequest:delegate:", request, self);
}
,["void"]), new objj_method(sel_getUid("_setMessage:inTextBox:"), function $SCLoginDialogController___setMessage_inTextBox_(self, _cmd, aMessage, textBox)
{
    if (aMessage)
    {
        objj_msgSend(textBox, "setStringValue:", aMessage);
        objj_msgSend(textBox, "setHidden:", NO);
        var size = objj_msgSend(aMessage, "sizeWithFont:inWidth:", objj_msgSend(textBox, "font"), objj_msgSend(self._formFieldContainer, "frame").size.width + 16.0);
        objj_msgSend(textBox, "setFrame:", CGRectMake(0, 0, size.width, size.height + 18.0));
    }
    else
    {
        objj_msgSend(textBox, "setStringValue:", "");
        objj_msgSend(textBox, "setHidden:", YES);
    }
}
,["void","CPString","CPTextField"]), new objj_method(sel_getUid("setSubheadingText:"), function $SCLoginDialogController__setSubheadingText_(self, _cmd, aSubheading)
{
    objj_msgSend(self, "_setMessage:inTextBox:", aSubheading, self._subheading);
    if (!objj_msgSend(self._errorMessage, "isHidden") && !objj_msgSend(self._subheading, "isHidden"))
        objj_msgSend(self._errorMessage, "setHidden:", YES);
    objj_msgSend(self, "_sizeAndPositionFormFieldContainer");
    objj_msgSend(self, "_sizeWindowToFit");
}
,["void","CPString"]), new objj_method(sel_getUid("_setErrorMessageText:"), function $SCLoginDialogController___setErrorMessageText_(self, _cmd, anErrorMessage)
{
    objj_msgSend(self._tryAgainButton, "setHidden:", YES);
    objj_msgSend(self, "_setMessage:inTextBox:", anErrorMessage, self._errorMessage);
    if (!objj_msgSend(self._errorMessage, "isHidden") && !objj_msgSend(self._subheading, "isHidden"))
        objj_msgSend(self._subheading, "setHidden:", YES);
    objj_msgSend(self, "_sizeAndPositionFormFieldContainer");
    objj_msgSend(self, "_sizeWindowToFit");
}
,["void","CPString"]), new objj_method(sel_getUid("_displayForgotPasswordLink"), function $SCLoginDialogController___displayForgotPasswordLink(self, _cmd)
{
    if (objj_msgSend(objj_msgSend(CPBundle, "mainBundle"), "objectForInfoDictionaryKey:", "SCAuthForgotPasswordURL"))
        objj_msgSend(self._forgotPasswordLink, "setHidden:", NO);
    else
        objj_msgSend(self._forgotPasswordLink, "setHidden:", YES);
}
,["void"]), new objj_method(sel_getUid("_setDefaultHiddenSettings"), function $SCLoginDialogController___setDefaultHiddenSettings(self, _cmd)
{
    objj_msgSend(self._userLabel, "setHidden:", NO);
    objj_msgSend(self._userField, "setHidden:", NO);
    objj_msgSend(self._passwordLabel, "setHidden:", NO);
    objj_msgSend(self._passwordField, "setHidden:", NO);
    objj_msgSend(self._loginButton, "setHidden:", NO);
    objj_msgSend(self._cancelButton, "setHidden:", NO);
    objj_msgSend(self._rememberMeButton, "setHidden:", NO);
    objj_msgSend(self._registeringProgressLabel, "setHidden:", YES);
    objj_msgSend(self._loggingInProgressLabel, "setHidden:", YES);
    objj_msgSend(self._progressSpinner, "setHidden:", YES);
    objj_msgSend(self._userCheckSpinner, "setHidden:", YES);
    objj_msgSend(self._formFieldContainer, "setHidden:", NO);
    objj_msgSend(self._tryAgainButton, "setHidden:", YES);
    objj_msgSend(self, "_setErrorMessageText:", nil);
    objj_msgSend(self, "setSubheadingText:", nil);
}
,["void"]), new objj_method(sel_getUid("_setDialogModeToLogin"), function $SCLoginDialogController___setDialogModeToLogin(self, _cmd)
{
    var currentErrorMessage = objj_msgSend(self._errorMessage, "isHidden") ? nil : objj_msgSend(self._errorMessage, "stringValue");
    objj_msgSend(self, "_setDefaultHiddenSettings");
    if (objj_msgSend(self._loginButton, "title") === LoginTitle && currentErrorMessage)
        objj_msgSend(self, "_setErrorMessageText:", currentErrorMessage);
    objj_msgSend(self._loginButton, "setTitle:", LoginTitle);
    objj_msgSend(self._passwordConfirmLabel, "setHidden:", YES);
    objj_msgSend(self._passwordConfirmField, "setHidden:", YES);
    objj_msgSend(self._passwordConfirmField, "setStringValue:", "");
    objj_msgSend(self, "_displayForgotPasswordLink");
    objj_msgSend(self, "_layout");
}
,["void"]), new objj_method(sel_getUid("_setDialogModeToRegister"), function $SCLoginDialogController___setDialogModeToRegister(self, _cmd)
{
    var currentErrorMessage = objj_msgSend(self._errorMessage, "isHidden") ? nil : objj_msgSend(self._errorMessage, "stringValue");
    objj_msgSend(self, "_setDefaultHiddenSettings");
    objj_msgSend(self, "setSubheadingText:", "Welcome! Looks like you're a new user. Just choose a password to register.");
    if (objj_msgSend(self._loginButton, "title") === RegisterTitle && currentErrorMessage)
        objj_msgSend(self, "_setErrorMessageText:", currentErrorMessage);
    objj_msgSend(self._loginButton, "setTitle:", RegisterTitle);
    objj_msgSend(self._passwordConfirmLabel, "setHidden:", NO);
    objj_msgSend(self._passwordConfirmField, "setHidden:", NO);
    objj_msgSend(self._forgotPasswordLink, "setHidden:", YES);
    objj_msgSend(self, "_layout");
}
,["void"]), new objj_method(sel_getUid("_setDialogModeToLoginOrRegister"), function $SCLoginDialogController___setDialogModeToLoginOrRegister(self, _cmd)
{
    objj_msgSend(self, "_setDefaultHiddenSettings");
    objj_msgSend(self._loginButton, "setTitle:", DefaultLoginTitle);
    objj_msgSend(self._passwordConfirmLabel, "setHidden:", YES);
    objj_msgSend(self._passwordConfirmField, "setHidden:", YES);
    objj_msgSend(self._passwordConfirmField, "setStringValue:", "");
    objj_msgSend(self, "_displayForgotPasswordLink");
    objj_msgSend(self, "_layout");
}
,["void"]), new objj_method(sel_getUid("_layout"), function $SCLoginDialogController___layout(self, _cmd)
{
    objj_msgSend(self, "_setButtonOrigins");
    objj_msgSend(self, "_sizeAndPositionFormFieldContainer");
    objj_msgSend(self, "_setKeyViews");
    objj_msgSend(self, "_sizeWindowToFit");
}
,["void"]), new objj_method(sel_getUid("loginWithDelegate:callback:"), function $SCLoginDialogController__loginWithDelegate_callback_(self, _cmd, aDelegate, aCallback)
{
    objj_msgSend(CPApp, "runModalForWindow:", objj_msgSend(self, "window"));
    self._username = nil;
    self._delegate = aDelegate;
    self._callback = aCallback;
    self._dialogReturnCode = SCLoginFailed;
    objj_msgSend(self, "_setDialogModeToLoginOrRegister");
    objj_msgSend(self._passwordField, "setStringValue:", "");
    objj_msgSend(self._passwordConfirmField, "setStringValue:", "");
    objj_msgSend(self._window, "makeFirstResponder:", self._userField);
}
,["void","id","SEL"]), new objj_method(sel_getUid("loadWindow"), function $SCLoginDialogController__loadWindow(self, _cmd)
{
    if (self._window)
        return;
    objj_msgSend(objj_msgSend(CPBundle, "bundleForClass:", objj_msgSend(self._cibOwner, "class")), "loadCibFile:externalNameTable:", objj_msgSend(self, "windowCibPath"), objj_msgSend(CPDictionary, "dictionaryWithObject:forKey:", self._cibOwner, CPCibOwner));
}
,["void"]), new objj_method(sel_getUid("windowCibPath"), function $SCLoginDialogController__windowCibPath(self, _cmd)
{
    if (self._windowCibPath)
        return self._windowCibPath;
    return objj_msgSend(objj_msgSend(CPBundle, "bundleForClass:", objj_msgSend(self._cibOwner, "class")), "pathForResource:", self._windowCibName + ".cib");
}
,["CPString"]), new objj_method(sel_getUid("controlTextDidBlur:"), function $SCLoginDialogController__controlTextDidBlur_(self, _cmd, aNotification)
{
    if (objj_msgSend(aNotification, "object") !== self._userField)
        return;
    if (objj_msgSend(self._cancelButton, "isHighlighted"))
    {
        objj_msgSend(self._window, "makeFirstResponder:", self._userField);
        return;
    }
    if (objj_msgSend(objj_msgSend(CPBundle, "mainBundle"), "objectForInfoDictionaryKey:", "SCAuthUserCheckURL"))
        objj_msgSend(self, "_checkUser");
}
,["void","CPNotification"]), new objj_method(sel_getUid("_userCheckFailedWithStatusCode:"), function $SCLoginDialogController___userCheckFailedWithStatusCode_(self, _cmd, statusCode)
{
    objj_msgSend(self, "_setDialogModeToLoginOrRegister");
    objj_msgSend(self, "_setErrorMessageText:", UserCheckErrorMessage);
    objj_msgSend(self._tryAgainButton, "setHidden:", NO);
    objj_msgSend(self._tryAgainButton, "setFrameOrigin:", CGPointMake(objj_msgSend(self._errorMessage, "frame").origin.x + 9.0, objj_msgSend(self._errorMessage, "frame").origin.y + objj_msgSend(self._errorMessage, "frame").size.height - 8.0));
    objj_msgSend(self._errorMessage, "setFrameSize:", CGSizeMake(objj_msgSend(self._errorMessage, "frame").size.width, objj_msgSend(self._tryAgainButton, "frame").origin.y + objj_msgSend(self._tryAgainButton, "frame").size.height + 9.0));
    objj_msgSend(self, "_sizeAndPositionFormFieldContainer");
    objj_msgSend(self, "_sizeWindowToFit");
}
,["void","int"]), new objj_method(sel_getUid("connection:didFailWithError:"), function $SCLoginDialogController__connection_didFailWithError_(self, _cmd, aConnection, anException)
{
    if (aConnection === self._loginConnection)
        objj_msgSend(self, "_loginFailedWithError:statusCode:", GenericErrorMessage, ConnectionStatusCode);
    else if (aConnection === self._registrationConnection)
        objj_msgSend(self, "_registrationFailedWithError:statusCode:", GenericErrorMessage, ConnectionStatusCode);
    else if (aConnection === self._userCheckConnection)
        objj_msgSend(self, "_userCheckFailedWithStatusCode:", ConnectionStatusCode);
}
,["void","CPURLConnection","CPException"]), new objj_method(sel_getUid("_registrationSucceededWithUsername:"), function $SCLoginDialogController___registrationSucceededWithUsername_(self, _cmd, username)
{
    self._dialogReturnCode = SCLoginSucceeded;
    self._username = username;
    objj_msgSend(self._window, "close");
}
,["void","CPString"]), new objj_method(sel_getUid("_loginSucceededWithUsername:"), function $SCLoginDialogController___loginSucceededWithUsername_(self, _cmd, username)
{
    self._dialogReturnCode = SCLoginSucceeded;
    self._username = username;
    objj_msgSend(self._window, "close");
}
,["void","CPString"]), new objj_method(sel_getUid("connection:didReceiveResponse:"), function $SCLoginDialogController__connection_didReceiveResponse_(self, _cmd, aConnection, aResponse)
{
    if (!objj_msgSend(aResponse, "isKindOfClass:", objj_msgSend(CPHTTPURLResponse, "class")))
    {
        switch(aConnection) {
        case self._userCheckConnection:
            objj_msgSend(self, "_userCheckFailedWithStatusCode:", ConnectionStatusCode);
            break;
        case self._loginConnection:
            objj_msgSend(self, "_loginFailedWithError:statusCode:", GenericErrorMessage, ConnectionStatusCode);
            break;
        case self._registrationConnection:
            objj_msgSend(self, "_registrationFailedWithError:statusCode:", GenericErrorMessage, ConnectionStatusCode);
            break;
default:
            objj_msgSend(self, "_setErrorMessageText:", GenericErrorMessage);
        }
        return;
    }
    var statusCode = objj_msgSend(aResponse, "statusCode");
    switch(aConnection) {
    case self._userCheckConnection:
        if (statusCode === 200)
            return;
        else if (statusCode == 404)
            objj_msgSend(self, "_setDialogModeToRegister");
        else
            objj_msgSend(self, "_userCheckFailedWithStatusCode:", statusCode);
        break;
    case self._loginConnection:
        if (statusCode === 200)
            return;
        else
        {
            if (statusCode === 403)
            {
                if (objj_msgSend(self._loginButton, "title") !== RegisterTitle)
                    objj_msgSend(self, "_loginFailedWithError:statusCode:", "Incorrect username or password.", statusCode);
            }
            else
                objj_msgSend(self, "_loginFailedWithError:statusCode:", GenericErrorMessage, statusCode);
        }
        break;
    case self._registrationConnection:
        if (statusCode === 200)
            return;
        else
        {
            if (statusCode === 409)
                objj_msgSend(self, "_setDialogModeToLogin");
            else
                objj_msgSend(self, "_registrationFailedWithError:statusCode:", GenericErrorMessage, statusCode);
        }
    }
    objj_msgSend(aConnection, "cancel");
}
,["void","CPURLConnection","CPURLResponse"]), new objj_method(sel_getUid("connection:didReceiveData:"), function $SCLoginDialogController__connection_didReceiveData_(self, _cmd, aConnection, data)
{
    objj_msgSend(aConnection, "cancel");
    switch(aConnection) {
    case self._userCheckConnection:
        objj_msgSend(self, "_setDialogModeToLogin");
        break;
    case self._loginConnection:
        objj_msgSend(self, "_loginSucceededWithUsername:", self._loginConnection.username);
        break;
    case self._registrationConnection:
        objj_msgSend(self, "_registrationSucceededWithUsername:", self._registrationConnection.username);
    }
}
,["void","CPURLConnection","CPString"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("newLoginDialogController"), function $SCLoginDialogController__newLoginDialogController(self, _cmd)
{
    return objj_msgSend(objj_msgSend(self, "alloc"), "initWithWindowCibName:", "SCLoginDialog");
}
,["SCLoginDialogController"]), new objj_method(sel_getUid("defaultController"), function $SCLoginDialogController__defaultController(self, _cmd)
{
    if (!DefaultLoginDialogController)
        DefaultLoginDialogController = objj_msgSend(self, "newLoginDialogController");
    return DefaultLoginDialogController;
}
,["SCLoginDialogController"])]);
}p;63;Frameworks/SCAuth/LoginProviders/SCEmailLoginDialogController.jt;2375;@STATIC;1.0;I;27;AppKit/CPWindowController.ji;46;../AccountValidators/SCEmailAccountValidator.ji;25;SCLoginDialogController.jt;2243;objj_executeFile("AppKit/CPWindowController.j", NO);objj_executeFile("../AccountValidators/SCEmailAccountValidator.j", YES);objj_executeFile("SCLoginDialogController.j", YES);var DefaultLoginDialogController = nil;
{var the_class = objj_allocateClassPair(SCLoginDialogController, "SCEmailLoginDialogController"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("awakeFromCib"), function $SCEmailLoginDialogController__awakeFromCib(self, _cmd)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("SCEmailLoginDialogController").super_class }, "awakeFromCib");
    self._accountValidator = SCEmailAccountValidator;
    objj_msgSend(self._userLabel, "setStringValue:", "E-mail:");
    objj_msgSend(self._userLabel, "sizeToFit");
    objj_msgSend(self._userLabel, "setFrameOrigin:", CGPointMake(objj_msgSend(self._userField, "frame").origin.x - 4.0 - objj_msgSend(self._userLabel, "frame").size.width, objj_msgSend(self._userField, "frame").origin.y + 4.0));
    objj_msgSend(self._userCheckSpinner, "setFrameOrigin:", CGPointMake(objj_msgSend(self._userLabel, "frame").origin.x - objj_msgSend(self._userCheckSpinner, "frame").size.width - 3.0, objj_msgSend(self._userLabel, "frame").origin.y + 2.0));
}
,["void"]), new objj_method(sel_getUid("_setErrorMessageText:"), function $SCEmailLoginDialogController___setErrorMessageText_(self, _cmd, anErrorMessage)
{
    anErrorMessage = objj_msgSend(anErrorMessage, "stringByReplacingOccurrencesOfString:withString:", "username", "e-mail address");
    anErrorMessage = objj_msgSend(anErrorMessage, "stringByReplacingOccurrencesOfString:withString:", "Username", "E-mail address");
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("SCEmailLoginDialogController").super_class }, "_setErrorMessageText:", anErrorMessage);
}
,["void","CPString"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("defaultController"), function $SCEmailLoginDialogController__defaultController(self, _cmd)
{
    if (!DefaultLoginDialogController)
        DefaultLoginDialogController = objj_msgSend(self, "newLoginDialogController");
    return DefaultLoginDialogController;
}
,["SCLoginDialogController"])]);
}p;57;Frameworks/SCAuth/Test/SCEmailLoginDialogControllerTest.jt;1504;@STATIC;1.0;I;19;OJUnit/OJTestCase.ji;48;../LoginProviders/SCEmailLoginDialogController.jI;15;AppKit/AppKit.jt;1388;objj_executeFile("OJUnit/OJTestCase.j", NO);objj_executeFile("../LoginProviders/SCEmailLoginDialogController.j", YES);objj_executeFile("AppKit/AppKit.j", NO);{var the_class = objj_allocateClassPair(OJTestCase, "SCEmailLoginDialogControllerTest"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("testDialogController")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("setUp"), function $SCEmailLoginDialogControllerTest__setUp(self, _cmd)
{
    objj_msgSend(CPApplication, "sharedApplication");
    self.testDialogController = objj_msgSend(SCEmailLoginDialogController, "newLoginDialogController");
}
,["void"]), new objj_method(sel_getUid("tearDown"), function $SCEmailLoginDialogControllerTest__tearDown(self, _cmd)
{
    CPApp = nil;
}
,["void"]), new objj_method(sel_getUid("testThatDialogGetsCreated"), function $SCEmailLoginDialogControllerTest__testThatDialogGetsCreated(self, _cmd)
{
    objj_msgSend(self, "assertTrue:", !!self.testDialogController);
}
,["void"]), new objj_method(sel_getUid("testThatUserLabelIsChangedToEmail"), function $SCEmailLoginDialogControllerTest__testThatUserLabelIsChangedToEmail(self, _cmd)
{
    objj_msgSend(self.testDialogController, "window");
    objj_msgSend(self, "assertTrue:", objj_msgSend(self.testDialogController._userLabel, "stringValue") === "E-mail:");
}
,["void"])]);
}p;49;Frameworks/SCAuth/Test/SCUserSessionManagerTest.jt;590;@STATIC;1.0;I;19;OJUnit/OJTestCase.ji;25;../SCUserSessionManager.jt;518;objj_executeFile("OJUnit/OJTestCase.j", NO);objj_executeFile("../SCUserSessionManager.j", YES);{var the_class = objj_allocateClassPair(OJTestCase, "SCUserSessionManagerTest"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("sessionManager")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("setUp"), function $SCUserSessionManagerTest__setUp(self, _cmd)
{
    self.sessionManager = objj_msgSend(SCUserSessionManager, "defaultManager");
}
,["void"])]);
}p;47;Frameworks/SCAuth/Test/SCAccountValidatorTest.jt;2019;@STATIC;1.0;I;19;OJUnit/OJTestCase.ji;41;../AccountValidators/SCAccountValidator.jt;1930;objj_executeFile("OJUnit/OJTestCase.j", NO);objj_executeFile("../AccountValidators/SCAccountValidator.j", YES);{var the_class = objj_allocateClassPair(OJTestCase, "SCAccountValidatorTest"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("testThatUsernamesValidate"), function $SCAccountValidatorTest__testThatUsernamesValidate(self, _cmd)
{
    var isValid = objj_msgSend(SCAccountValidator, "validateUsername:", "test_username");
    objj_msgSend(self, "assertTrue:", isValid);
}
,["void"]), new objj_method(sel_getUid("testThatBlankPasswordDoesNotValidate"), function $SCAccountValidatorTest__testThatBlankPasswordDoesNotValidate(self, _cmd)
{
    var errorMsg = objj_msgSend(SCAccountValidator, "validatePassword:withConfirmPassword:", "", "");
    objj_msgSend(self, "assertFalse:", errorMsg === nil);
}
,["void"]), new objj_method(sel_getUid("testThatShortPasswordDoesNotValidate"), function $SCAccountValidatorTest__testThatShortPasswordDoesNotValidate(self, _cmd)
{
    var errorMsg = objj_msgSend(SCAccountValidator, "validatePassword:withConfirmPassword:", "abc", "abc");
    objj_msgSend(self, "assertFalse:", errorMsg === nil);
}
,["void"]), new objj_method(sel_getUid("testThatMismatchedPasswordsDoNotValidate"), function $SCAccountValidatorTest__testThatMismatchedPasswordsDoNotValidate(self, _cmd)
{
    var errorMsg = objj_msgSend(SCAccountValidator, "validatePassword:withConfirmPassword:", "testpass", "testpasS");
    objj_msgSend(self, "assertFalse:", errorMsg === nil);
}
,["void"]), new objj_method(sel_getUid("testThatValidPasswordValidates"), function $SCAccountValidatorTest__testThatValidPasswordValidates(self, _cmd)
{
    var errorMsg = objj_msgSend(SCAccountValidator, "validatePassword:withConfirmPassword:", "test_password080ABC", "test_password080ABC");
    objj_msgSend(self, "assertTrue:", errorMsg === nil);
}
,["void"])]);
}p;52;Frameworks/SCAuth/Test/SCLoginDialogControllerTest.jt;17394;@STATIC;1.0;I;19;OJUnit/OJTestCase.ji;43;../LoginProviders/SCLoginDialogController.jI;13;OJMoq/OJMoq.jI;15;AppKit/AppKit.jt;17264;objj_executeFile("OJUnit/OJTestCase.j", NO);objj_executeFile("../LoginProviders/SCLoginDialogController.j", YES);objj_executeFile("OJMoq/OJMoq.j", NO);objj_executeFile("AppKit/AppKit.j", NO);objj_msgSend_decorate(objj_backtrace_decorator);
CPWindowObjectList = function()
{
    return [];
}
{var the_class = objj_allocateClassPair(OJTestCase, "SCLoginDialogControllerTest"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("platformWindowMock"), new objj_ivar("testController")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("setUp"), function $SCLoginDialogControllerTest__setUp(self, _cmd)
{
    objj_msgSend(CPApplication, "sharedApplication");
    self.testController = objj_msgSend(SCLoginDialogController, "newLoginDialogController");
    var windowBase = objj_msgSend(self.testController, "window"),
        platformWindowBase = objj_msgSend(windowBase, "platformWindow");
    self.platformWindowMock = moq(platformWindowBase);
    objj_msgSend(self.platformWindowMock, "selector:returns:", sel_getUid("setContentRect:"), nil);
    objj_msgSend(self.platformWindowMock, "selector:returns:", sel_getUid("orderOut:"), nil);
    objj_msgSend(self.platformWindowMock, "selector:returns:", sel_getUid("orderFront:"), nil);
    objj_msgSend(self.platformWindowMock, "selector:returns:", sel_getUid("order:window:relativeTo:"), nil);
    objj_msgSend(windowBase, "setPlatformWindow:", self.platformWindowMock);
}
,["void"]), new objj_method(sel_getUid("tearDown"), function $SCLoginDialogControllerTest__tearDown(self, _cmd)
{
    CPApp = nil;
}
,["void"]), new objj_method(sel_getUid("checkInitialHiddenSettings"), function $SCLoginDialogControllerTest__checkInitialHiddenSettings(self, _cmd)
{
    objj_msgSend(self, "assertTrue:", objj_msgSend(objj_msgSend(self.testController, "registeringProgressLabel"), "isHidden"));
    objj_msgSend(self, "assertTrue:", objj_msgSend(objj_msgSend(self.testController, "loggingInProgressLabel"), "isHidden"));
    objj_msgSend(self, "assertTrue:", objj_msgSend(objj_msgSend(self.testController, "progressSpinner"), "isHidden"));
    objj_msgSend(self, "assertTrue:", objj_msgSend(objj_msgSend(self.testController, "userCheckSpinner"), "isHidden"));
    objj_msgSend(self, "assertTrue:", objj_msgSend(objj_msgSend(self.testController, "tryAgainButton"), "isHidden"));
    objj_msgSend(self, "assertTrue:", objj_msgSend(objj_msgSend(self.testController, "subheading"), "isHidden"));
    objj_msgSend(self, "assertTrue:", objj_msgSend(objj_msgSend(self.testController, "errorMessage"), "isHidden"));
}
,["void"]), new objj_method(sel_getUid("checkThatDialogIsInLoginOrRegisterMode"), function $SCLoginDialogControllerTest__checkThatDialogIsInLoginOrRegisterMode(self, _cmd)
{
    objj_msgSend(self, "assert:equals:", objj_msgSend(objj_msgSend(self.testController, "loginButton"), "title"), "Login/Register");
    objj_msgSend(self, "assertTrue:", objj_msgSend(objj_msgSend(self.testController, "passwordConfirmLabel"), "isHidden"));
    objj_msgSend(self, "assertTrue:", objj_msgSend(objj_msgSend(self.testController, "passwordConfirmField"), "isHidden"));
    objj_msgSend(self, "assert:equals:", objj_msgSend(objj_msgSend(self.testController, "passwordConfirmField"), "stringValue"), "");
    objj_msgSend(self, "checkInitialHiddenSettings");
}
,["void"]), new objj_method(sel_getUid("checkThatDialogIsInLoginMode"), function $SCLoginDialogControllerTest__checkThatDialogIsInLoginMode(self, _cmd)
{
    objj_msgSend(self, "assert:equals:", objj_msgSend(objj_msgSend(self.testController, "loginButton"), "title"), "Login");
    objj_msgSend(self, "assertTrue:", objj_msgSend(objj_msgSend(self.testController, "passwordConfirmLabel"), "isHidden"));
    objj_msgSend(self, "assertTrue:", objj_msgSend(objj_msgSend(self.testController, "passwordConfirmField"), "isHidden"));
    objj_msgSend(self, "assert:equals:", objj_msgSend(objj_msgSend(self.testController, "passwordConfirmField"), "stringValue"), "");
    objj_msgSend(self, "checkInitialHiddenSettings");
}
,["void"]), new objj_method(sel_getUid("checkThatDialogIsInRegisterMode"), function $SCLoginDialogControllerTest__checkThatDialogIsInRegisterMode(self, _cmd)
{
    objj_msgSend(self, "assert:equals:", objj_msgSend(objj_msgSend(self.testController, "loginButton"), "title"), "Register");
    objj_msgSend(self, "assertFalse:", objj_msgSend(objj_msgSend(self.testController, "passwordConfirmLabel"), "isHidden"));
    objj_msgSend(self, "assertFalse:", objj_msgSend(objj_msgSend(self.testController, "passwordConfirmField"), "isHidden"));
    objj_msgSend(self, "checkInitialHiddenSettings");
}
,["void"]), new objj_method(sel_getUid("checkThatURLIsHit:withMethod:withBody:whenControlIsClicked:"), function $SCLoginDialogControllerTest__checkThatURLIsHit_withMethod_withBody_whenControlIsClicked_(self, _cmd, URL, HTTPMethod, aBody, aControl)
{
    var mockConnectionClass = moq(),
        madeRequest = nil;
    objj_msgSend(mockConnectionClass, "selector:callback:", sel_getUid("connectionWithRequest:delegate:"), function(args)
    {
        madeRequest = args[0];
    });
    objj_msgSend(mockConnectionClass, "selector:returns:", sel_getUid("connectionWithRequest:delegate:"), {});
    objj_msgSend(mockConnectionClass, "selector:times:", sel_getUid("connectionWithRequest:delegate:"), 1);
    objj_msgSend(self.testController, "setConnectionClass:", mockConnectionClass);
    objj_msgSend(aControl, "performClick:", self);
    objj_msgSend(mockConnectionClass, "verifyThatAllExpectationsHaveBeenMet");
    objj_msgSend(self, "assert:equals:", objj_msgSend(objj_msgSend(madeRequest, "URL"), "relativeString"), URL);
    objj_msgSend(self, "assert:equals:", objj_msgSend(madeRequest, "HTTPMethod"), HTTPMethod);
    objj_msgSend(self, "assert:equals:", objj_msgSend(madeRequest, "HTTPBody"), aBody);
}
,["void","CPString","CPString","CPString","CPControl"]), new objj_method(sel_getUid("startDialogWithStub"), function $SCLoginDialogControllerTest__startDialogWithStub(self, _cmd)
{
    var delegateMock = moq();
    objj_msgSend(self.testController, "loginWithDelegate:callback:", delegateMock, sel_getUid("didFinishSelector:"));
}
,["void"]), new objj_method(sel_getUid("testThatDialogGetsCreated"), function $SCLoginDialogControllerTest__testThatDialogGetsCreated(self, _cmd)
{
    objj_msgSend(self, "assertTrue:", !!self.testController);
}
,["void"]), new objj_method(sel_getUid("testInitialStateOfDialog"), function $SCLoginDialogControllerTest__testInitialStateOfDialog(self, _cmd)
{
    objj_msgSend(self, "startDialogWithStub");
    objj_msgSend(self, "assert:equals:", objj_msgSend(objj_msgSend(self.testController, "passwordField"), "stringValue"), "");
    objj_msgSend(self, "assert:equals:", objj_msgSend(objj_msgSend(self.testController, "passwordConfirmField"), "stringValue"), "");
    objj_msgSend(self, "assert:equals:", objj_msgSend(objj_msgSend(self.testController, "window"), "firstResponder"), objj_msgSend(self.testController, "userField"));
    objj_msgSend(self, "assertTrue:", objj_msgSend(objj_msgSend(self.testController, "forgotPasswordLink"), "isHidden"));
    objj_msgSend(self, "checkThatDialogIsInLoginOrRegisterMode");
}
,["void"]), new objj_method(sel_getUid("testInitialStateOfDialogWhenForgotPasswordInformationExists"), function $SCLoginDialogControllerTest__testInitialStateOfDialogWhenForgotPasswordInformationExists(self, _cmd)
{
    var mainBundle = objj_msgSend(CPBundle, "mainBundle");
    mainBundle._bundle.valueForInfoDictionaryKey = function(aKey)
    {
        if (aKey === "SCAuthForgotPasswordURL")
            return "forgot_password_url";
        return nil;
    };
    objj_msgSend(self, "startDialogWithStub");
    objj_msgSend(self, "assert:equals:", objj_msgSend(objj_msgSend(self.testController, "passwordField"), "stringValue"), "");
    objj_msgSend(self, "assert:equals:", objj_msgSend(objj_msgSend(self.testController, "passwordConfirmField"), "stringValue"), "");
    objj_msgSend(self, "assert:equals:", objj_msgSend(objj_msgSend(self.testController, "window"), "firstResponder"), objj_msgSend(self.testController, "userField"));
    objj_msgSend(self, "checkThatDialogIsInLoginOrRegisterMode");
    objj_msgSend(self, "assertFalse:", objj_msgSend(objj_msgSend(self.testController, "forgotPasswordLink"), "isHidden"));
}
,["void"]), new objj_method(sel_getUid("testClosingDialog"), function $SCLoginDialogControllerTest__testClosingDialog(self, _cmd)
{
    var delegateMock = moq();
    objj_msgSend(delegateMock, "selector:times:arguments:", sel_getUid("didFinishSelector:"), 1, [SCLoginFailed]);
    objj_msgSend(self.testController, "loginWithDelegate:callback:", delegateMock, sel_getUid("didFinishSelector:"));
    objj_msgSend(objj_msgSend(self.testController, "window"), "performClose:", self);
    objj_msgSend(delegateMock, "verifyThatAllExpectationsHaveBeenMet");
}
,["void"]), new objj_method(sel_getUid("testClickingForgotPasswordLink"), function $SCLoginDialogControllerTest__testClickingForgotPasswordLink(self, _cmd)
{
    objj_msgSend(self, "startDialogWithStub");
    var mainBundle = objj_msgSend(CPBundle, "mainBundle");
    mainBundle._bundle.valueForInfoDictionaryKey = function(aKey)
    {
        if (aKey === "SCForgotPasswordURL")
            return "forgot_password_url";
        return nil;
    };
    objj_msgSend(self.testController, "forgotPasswordLinkClicked:", self);
}
,["void"]), new objj_method(sel_getUid("testThatClickingTryAgainButtonAsksBackendForTheUser"), function $SCLoginDialogControllerTest__testThatClickingTryAgainButtonAsksBackendForTheUser(self, _cmd)
{
    objj_msgSend(self, "startDialogWithStub");
    objj_msgSend(objj_msgSend(self.testController, "userField"), "setStringValue:", "test@test.com");
    objj_msgSend(self.testController, "_userCheckFailedWithStatusCode:", -1);
    objj_msgSend(self, "assert:notEqual:", objj_msgSend(objj_msgSend(self.testController, "errorMessage"), "stringValue"), "");
    objj_msgSend(self, "assertFalse:", objj_msgSend(objj_msgSend(self.testController, "tryAgainButton"), "isHidden"));
    objj_msgSend(self, "checkThatURLIsHit:withMethod:withBody:whenControlIsClicked:", "/user/test@test.com", "GET", "", objj_msgSend(self.testController, "tryAgainButton"));
    objj_msgSend(self, "assertFalse:", objj_msgSend(objj_msgSend(self.testController, "userCheckSpinner"), "isHidden"));
}
,["void"]), new objj_method(sel_getUid("testClickingCancel"), function $SCLoginDialogControllerTest__testClickingCancel(self, _cmd)
{
    var delegateMock = moq();
    objj_msgSend(delegateMock, "selector:times:arguments:", sel_getUid("didFinishSelector:"), 1, [SCLoginFailed]);
    objj_msgSend(self.testController, "loginWithDelegate:callback:", delegateMock, sel_getUid("didFinishSelector:"));
    objj_msgSend(objj_msgSend(self.testController, "cancelButton"), "performClick:", self);
    objj_msgSend(delegateMock, "verifyThatAllExpectationsHaveBeenMet");
}
,["void"]), new objj_method(sel_getUid("testThatClickingRegisterInRegisterModeAsksBackendToRegister"), function $SCLoginDialogControllerTest__testThatClickingRegisterInRegisterModeAsksBackendToRegister(self, _cmd)
{
    objj_msgSend(self, "startDialogWithStub");
    objj_msgSend(self.testController, "_setDialogModeToRegister");
    objj_msgSend(objj_msgSend(self.testController, "userField"), "setStringValue:", "test@test.com");
    objj_msgSend(objj_msgSend(self.testController, "passwordField"), "setStringValue:", "test");
    objj_msgSend(objj_msgSend(self.testController, "passwordConfirmField"), "setStringValue:", "test");
    objj_msgSend(objj_msgSend(self.testController, "rememberMeButton"), "performClick:", self);
    var body = objj_msgSend(CPString, "JSONFromObject:", {'username': 'test@test.com', 'password': 'test', 'remember': NO});
    objj_msgSend(self, "checkThatURLIsHit:withMethod:withBody:whenControlIsClicked:", "/user/", "POST", body, objj_msgSend(self.testController, "loginButton"));
}
,["void"]), new objj_method(sel_getUid("testThatClickingLogininLoginModeAsksBackendToLogin"), function $SCLoginDialogControllerTest__testThatClickingLogininLoginModeAsksBackendToLogin(self, _cmd)
{
    objj_msgSend(self, "startDialogWithStub");
    objj_msgSend(self.testController, "_setDialogModeToLogin");
    objj_msgSend(objj_msgSend(self.testController, "userField"), "setStringValue:", "test@test.com");
    objj_msgSend(objj_msgSend(self.testController, "passwordField"), "setStringValue:", "test");
    objj_msgSend(objj_msgSend(self.testController, "passwordConfirmField"), "setStringValue:", "");
    objj_msgSend(objj_msgSend(self.testController, "rememberMeButton"), "performClick:", self);
    var body = objj_msgSend(CPString, "JSONFromObject:", {'username': 'test@test.com', 'password': 'test', 'remember': NO});
    objj_msgSend(self, "checkThatURLIsHit:withMethod:withBody:whenControlIsClicked:", "/session/", "POST", body, objj_msgSend(self.testController, "loginButton"));
}
,["void"]), new objj_method(sel_getUid("testClickingLoginInLoginOrRegisterModeAsksBackendToLogin"), function $SCLoginDialogControllerTest__testClickingLoginInLoginOrRegisterModeAsksBackendToLogin(self, _cmd)
{
    objj_msgSend(self, "startDialogWithStub");
    objj_msgSend(self.testController, "_setDialogModeToLoginOrRegister");
    objj_msgSend(objj_msgSend(self.testController, "userField"), "setStringValue:", "test@test.com");
    objj_msgSend(objj_msgSend(self.testController, "passwordField"), "setStringValue:", "test");
    objj_msgSend(objj_msgSend(self.testController, "passwordConfirmField"), "setStringValue:", "");
    objj_msgSend(objj_msgSend(self.testController, "rememberMeButton"), "performClick:", self);
    var body = objj_msgSend(CPString, "JSONFromObject:", {'username': 'test@test.com', 'password': 'test', 'remember': NO});
    objj_msgSend(self, "checkThatURLIsHit:withMethod:withBody:whenControlIsClicked:", "/session/", "POST", body, objj_msgSend(self.testController, "loginButton"));
}
,["void"]), new objj_method(sel_getUid("testClickingLoginWithRememberMeOn"), function $SCLoginDialogControllerTest__testClickingLoginWithRememberMeOn(self, _cmd)
{
    objj_msgSend(self, "startDialogWithStub");
    objj_msgSend(self.testController, "_setDialogModeToLogin");
    objj_msgSend(objj_msgSend(self.testController, "userField"), "setStringValue:", "test@test.com");
    objj_msgSend(objj_msgSend(self.testController, "passwordField"), "setStringValue:", "test");
    objj_msgSend(objj_msgSend(self.testController, "passwordConfirmField"), "setStringValue:", "");
    objj_msgSend(self, "assert:equals:", objj_msgSend(objj_msgSend(self.testController, "rememberMeButton"), "state"), CPOnState);
    var body = objj_msgSend(CPString, "JSONFromObject:", {'username': 'test@test.com', 'password': 'test', 'remember': YES});
    objj_msgSend(self, "checkThatURLIsHit:withMethod:withBody:whenControlIsClicked:", "/session/", "POST", body, objj_msgSend(self.testController, "loginButton"));
}
,["void"]), new objj_method(sel_getUid("testClickingRegisterWithRememberMeOn"), function $SCLoginDialogControllerTest__testClickingRegisterWithRememberMeOn(self, _cmd)
{
    objj_msgSend(self, "startDialogWithStub");
    objj_msgSend(self.testController, "_setDialogModeToRegister");
    objj_msgSend(objj_msgSend(self.testController, "userField"), "setStringValue:", "test@test.com");
    objj_msgSend(objj_msgSend(self.testController, "passwordField"), "setStringValue:", "test");
    objj_msgSend(objj_msgSend(self.testController, "passwordConfirmField"), "setStringValue:", "test");
    objj_msgSend(self, "assert:equals:", objj_msgSend(objj_msgSend(self.testController, "rememberMeButton"), "state"), CPOnState);
    var body = objj_msgSend(CPString, "JSONFromObject:", {'username': 'test@test.com', 'password': 'test', 'remember': YES});
    objj_msgSend(self, "checkThatURLIsHit:withMethod:withBody:whenControlIsClicked:", "/user/", "POST", body, objj_msgSend(self.testController, "loginButton"));
}
,["void"]), new objj_method(sel_getUid("testClickingRegisterWithMismatchedPasswords"), function $SCLoginDialogControllerTest__testClickingRegisterWithMismatchedPasswords(self, _cmd)
{
    objj_msgSend(self, "startDialogWithStub");
    objj_msgSend(self.testController, "_setDialogModeToRegister");
    objj_msgSend(objj_msgSend(self.testController, "userField"), "setStringValue:", "test@test.com");
    objj_msgSend(objj_msgSend(self.testController, "passwordField"), "setStringValue:", "test");
    objj_msgSend(objj_msgSend(self.testController, "passwordConfirmField"), "setStringValue:", "test1");
    var mockConnectionClass = moq();
    objj_msgSend(mockConnectionClass, "selector:times:", sel_getUid("connectionWithRequest:delegate:"), 0);
    objj_msgSend(self.testController, "setConnectionClass:", mockConnectionClass);
    objj_msgSend(objj_msgSend(self.testController, "loginButton"), "performClick:", self);
    objj_msgSend(mockConnectionClass, "verifyThatAllExpectationsHaveBeenMet");
    objj_msgSend(self, "assertFalse:", objj_msgSend(objj_msgSend(self.testController, "errorMessage"), "isHidden"));
    objj_msgSend(self, "assert:notEqual:", objj_msgSend(objj_msgSend(self.testController, "errorMessage"), "stringValue"), "");
}
,["void"])]);
}p;52;Frameworks/SCAuth/Test/SCEmailAccountValidatorTest.jt;1973;@STATIC;1.0;I;19;OJUnit/OJTestCase.ji;46;../AccountValidators/SCEmailAccountValidator.jt;1879;objj_executeFile("OJUnit/OJTestCase.j", NO);objj_executeFile("../AccountValidators/SCEmailAccountValidator.j", YES);{var the_class = objj_allocateClassPair(OJTestCase, "SCEmailAccountValidatorTest"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("testEmailWithNoAtSign"), function $SCEmailAccountValidatorTest__testEmailWithNoAtSign(self, _cmd)
{
    objj_msgSend(self, "assertFalse:", objj_msgSend(SCEmailAccountValidator, "validateUsername:", "saikatgmail.com"));
}
,["void"]), new objj_method(sel_getUid("testEmailWithNoDomain"), function $SCEmailAccountValidatorTest__testEmailWithNoDomain(self, _cmd)
{
    objj_msgSend(self, "assertFalse:", objj_msgSend(SCEmailAccountValidator, "validateUsername:", "saikat@gmailcom"));
}
,["void"]), new objj_method(sel_getUid("testEmailWithPlus"), function $SCEmailAccountValidatorTest__testEmailWithPlus(self, _cmd)
{
    objj_msgSend(self, "assertTrue:", objj_msgSend(SCEmailAccountValidator, "validateUsername:", "saikat+1@gmail.com"));
}
,["void"]), new objj_method(sel_getUid("testEmailWithHyphen"), function $SCEmailAccountValidatorTest__testEmailWithHyphen(self, _cmd)
{
    objj_msgSend(self, "assertTrue:", objj_msgSend(SCEmailAccountValidator, "validateUsername:", "test-email@gmail.com"));
}
,["void"]), new objj_method(sel_getUid("testComplexEmail"), function $SCEmailAccountValidatorTest__testComplexEmail(self, _cmd)
{
    objj_msgSend(self, "assertTrue:", objj_msgSend(SCEmailAccountValidator, "validateUsername:", "TeSt_E-mail3a389hus.hello@gmai998e-l.neT"));
}
,["void"]), new objj_method(sel_getUid("testBadDomain"), function $SCEmailAccountValidatorTest__testBadDomain(self, _cmd)
{
    objj_msgSend(self, "assertFalse:", objj_msgSend(SCEmailAccountValidator, "validateUsername:", "TeSt_E-mail3a389hus.hello@gmai998e-_l.neTt"));
}
,["void"])]);
}e;