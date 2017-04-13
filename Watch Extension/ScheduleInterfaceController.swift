//
//  ScheduleInterfaceController.swift
//  AirAber
//
//  Created by Özgün Emre Zor on 11/04/2017.
//  Copyright © 2017 Mic Pringle. All rights reserved.
//

import WatchKit
import Foundation


class ScheduleInterfaceController: WKInterfaceController {

    @IBOutlet var flightTable: WKInterfaceTable!
    
    var flights = Flight.allFlights()
    
    var selectedIndex = 0
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        flightTable.setNumberOfRows(flights.count, withRowType: "FlightRow")
        
        for index in 0..<flightTable.numberOfRows {
            if let controller = flightTable.rowController(at: index) as? FlightRowController {
                controller.flight = flights[index]
            }
        }
        
    }
    
    override func didAppear() {
        super.didAppear()
        if flights[selectedIndex].checkedIn, let controller = flightTable.rowController(at: selectedIndex) as? FlightRowController {
            animate(withDuration: 0.35, animations: { 
                controller.updateForCheckIn()
            })
        }
    }
    
    override func table(_ table: WKInterfaceTable, didSelectRowAt rowIndex: Int) {
        let flight = flights[rowIndex]

        if flight.checkedIn {
            let controllers = ["Flight", "BoardingPass"]
            presentController(withNames: controllers, contexts: [flight,flight])
        } else {
            let controllers = ["Flight", "CheckIn"]
            presentController(withNames: controllers, contexts: [flight,flight])
        }
        selectedIndex = rowIndex
        
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
