//
//  StartupController.swift
//  AmplitudeDemo
//
//  Created by Roushil Singla on 08/09/23.
//

import Cocoa
import Amplitude

class StartupController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func onHiClick(_ sender: NSButton) {
        Amplitude.instance().logEvent("Hi Log")
    }
    
    
    @IBAction func onSecondClick(_ sender: NSButton) {
//        let identify = AMPIdentify()
//            .set("gender", value: "female" as NSObject)
//            .set("age",value: NSNumber(value: 20))
//        guard let identify else { return }
//        Amplitude.instance().identify(identify)
        
        Amplitude.instance().logEvent("Button 2")
    }
    
}
