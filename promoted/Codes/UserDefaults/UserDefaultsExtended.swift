//
//  UserDefaultsExtended.swift
//  promoted
//
//  Created by Vikram Sindhu on 12/01/23
//  
//

import Foundation

extension UserDefaults {
    
    static func resetDefaults() {
        if let bundleID = Bundle.main.bundleIdentifier {
            UserDefaults.standard.removePersistentDomain(forName: bundleID)
        }
    }
    
    func isTutorialShown() -> Bool {
        return self.bool(forKey: kIsTutorialAlreadyShown)
    }
    
    func setTutorialShownStatus(tutorialShown: Bool) {
        self.set(tutorialShown, forKey: kIsTutorialAlreadyShown)
        self.synchronize()
    }
    
    func isUserLoggedIn() -> Bool {
        return self.bool(forKey: kIsUserLoggedIn)
    }
    
    func setUserLoggedIn(userLoggedIn: Bool) {
        self.set(userLoggedIn, forKey: kIsUserLoggedIn)
        self.synchronize()
    }
    
    func isAppInstalled() -> Bool {
        return self.bool(forKey: kIsAppInstalled)
    }
    
    func setAppInstalled(installed: Bool) {
        self.set(installed, forKey: kIsAppInstalled)
        self.synchronize()
    }

    func setLoggedInAccessToken(loggedInAccessToken: String) {
        self.set(loggedInAccessToken, forKey: kLoggedInAccessToken)
        self.set(true,forKey: kIsLogin)
        self.synchronize()
    }
    
    func getLoggedInAccessToken() -> String {
        return String.getString(self.string(forKey: kLoggedInAccessToken))
    }


    func getLoggedInUserDetails() -> Dictionary<String, Any> {
        guard let dataUser = self.object(forKey: kLoggedInUserDetails) else {
            return ["":""]
        }
        
        guard let userData = dataUser as? Data else {
            return ["":""]
        }
        
        let unarchiver = NSKeyedUnarchiver(forReadingWith: userData)
        guard let userLoggedInDetails = unarchiver.decodeObject(forKey: kLoggedInUserDetails) as? Dictionary <String, Any> else {
            unarchiver.finishDecoding()
            return ["":""]
        }
        unarchiver.finishDecoding()
        return userLoggedInDetails
    }
    
    func setLoggedInUserDetails(loggedInUserDetails: Dictionary<String, Any>) {
        if loggedInUserDetails.isEmpty {
            self.set(nil, forKey: kLoggedInUserDetails)
            self.synchronize()
            return
        }
        
        let userData = NSMutableData()
        let archiver = NSKeyedArchiver(forWritingWith: userData)
        archiver.encode(loggedInUserDetails, forKey: kLoggedInUserDetails)
        archiver.finishEncoding()
        self.set(userData, forKey: kLoggedInUserDetails)
        self.synchronize()
    }
    
    func setDeviceToken(deviceToken: String) {
        self.set(deviceToken, forKey: kDeviceToken)
        self.synchronize()
    }
    
    func getDeviceToken() -> String {
        return String.getString(self.string(forKey: kDeviceToken))
    }
}
    
//    //For audio/video call
//    func setChennalName(chennalName: String)
//    {
//        self.set(chennalName, forKey:CallIdentifiers.kChannelName)
//        self.synchronize()
//    }
//
//    func getChennalName() -> String
//    {
//        return String.getString(self.string(forKey: CallIdentifiers.kChannelName))
//    }
//
//    func setCallerId(name: String) {
//        self.set(name, forKey:CallIdentifiers.kCallerId)
//        self.synchronize()
//    }
//
//    func getCallerId() -> String {
//        return String.getString(self.string(forKey:CallIdentifiers.kCallerId))
//    }
//
//    func setAppointmentId(name: String) {
//        self.set(name, forKey:CallIdentifiers.bookingID)
//        self.synchronize()
//    }
//
//    func getAppointmentId() -> String {
//        return String.getString(self.string(forKey:CallIdentifiers.bookingID))
//    }
//
//    func setCallId(name: String) {
//        self.set(name, forKey:CallIdentifiers.kCallId)
//        self.synchronize()
//    }
//
//    func getCallId() -> String {
//        return String.getString(self.string(forKey:CallIdentifiers.kCallId))
//    }
//
//    func setCallerName(name: String)
//    {
//        self.set(name, forKey:CallIdentifiers.kCallerName)
//        self.synchronize()
//    }
//
//    func getCallerName() -> String
//    {
//        return String.getString(self.string(forKey: CallIdentifiers.kCallerName))
//    }
//
//    func setProfileImg(name: String)
//    {
//        self.set(name, forKey:CallIdentifiers.kProfileImg)
//        self.synchronize()
//    }
//
//    func getProfileImg() -> String
//    {
//        return String.getString(self.string(forKey: CallIdentifiers.kProfileImg))
//    }
//
//}
