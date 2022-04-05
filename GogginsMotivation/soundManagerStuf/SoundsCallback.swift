//
//  SoundsCallback.swift
//  GogginsMotivation
//
//  Created by Martynas Brazionis on 2022-04-04.
//

import Foundation
protocol SoundsCallback {
    func enablePreviousButton(enable: Bool)
    func enableNextButton(enable: Bool)
    func setMainText(text: String)
}
