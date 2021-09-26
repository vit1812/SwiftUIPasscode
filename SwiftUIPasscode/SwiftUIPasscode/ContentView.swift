//
//  ContentView.swift
//  SwiftUIPasscode
//
//  Created by luongvinh on 25/09/2021.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        SwiftUIPasscode(
            input: PasscodeInput(
                passcodeLength: 6,
                completeHandler: { passcode in
                    print(passcode)
                })
        )
    }
    
}

struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        ContentView()
    }
    
}
