//
//  AppDelegate.swift
//  AmplitudeDemo
//
//  Created by Roushil Singla on 08/09/23.
//

import Cocoa
import Amplitude

@main
class AppDelegate: NSObject, NSApplicationDelegate {

    @IBOutlet var window: NSWindow!


    func applicationDidFinishLaunching(_ aNotification: Notification) {
        
        Amplitude.instance().defaultTracking = AMPDefaultTrackingOptions.initWithAllEnabled()
        //Amplitude.instance().defaultTracking.sessions = true
        Amplitude.instance().initializeApiKey("5e2b12a5c1466b7a7ffd353cf063598b")
        Amplitude.instance().setUserId("Roushil \(getMacSerialNumber())")
        Amplitude.instance().logEvent("app_start")
        
        window.contentViewController = StartupController()
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }

    func applicationSupportsSecureRestorableState(_ app: NSApplication) -> Bool {
        return true
    }


    public func getMacSerialNumber() -> String {
        var serialNumber: String? {
            let platformExpert = IOServiceGetMatchingService(kIOMainPortDefault, IOServiceMatching("IOPlatformExpertDevice") )
            
            guard platformExpert > 0 else {
                return nil
            }
            
            guard let serialNumber = (IORegistryEntryCreateCFProperty(platformExpert, kIOPlatformSerialNumberKey as CFString, kCFAllocatorDefault, 0).takeUnretainedValue() as? String)?.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines) else {
                return nil
            }
            
            IOObjectRelease(platformExpert)
            
            return serialNumber
        }
        
        return serialNumber ?? "Unknown"
    }
}

