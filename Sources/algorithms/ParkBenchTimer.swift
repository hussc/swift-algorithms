//
//  File.swift
//  
//
//  Created by Hussein on 24/07/2022.
//

import Foundation

class ParkBenchTimer {
    let startTime: CFAbsoluteTime
    var endTime: CFAbsoluteTime?

    init() {
        startTime = CFAbsoluteTimeGetCurrent()
    }

    func stop() -> CFAbsoluteTime {
        endTime = CFAbsoluteTimeGetCurrent()

        return duration!
    }

    var duration: CFAbsoluteTime? {
        if let endTime = endTime {
            return endTime - startTime
        } else {
            return nil
        }
    }
}
