//
//  TodayViewModel.swift
//  Weather
//
//  Created by Onur Torna on 4.11.2018.
//  Copyright © 2018 Onur Torna. All rights reserved.
//

import Foundation

final class TodayState {

    enum Change {
        case loading(Bool)
        case error(message: String?)
        case dataFetch
    }

    var onChange: ((TodayState.Change) -> Void)?
}

final class TodayViewModel {

    private var state = TodayState()

    var stateChangeHandler: ((TodayState.Change) -> Void)? {
        get {
            return state.onChange
        }

        set {
            state.onChange = newValue
        }
    }
}
