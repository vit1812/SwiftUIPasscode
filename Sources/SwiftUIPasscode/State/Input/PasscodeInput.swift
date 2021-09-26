//
//  PasscodeInput.swift
//  SwiftUIPasscode
//
//  Created by Vadim Zhilinkov on 12.03.2020.
//  Copyright © 2020 dreadct. All rights reserved.
//

import Foundation

/// A passcode input.
public struct PasscodeInput {

    // MARK: - Properties

    private var input: String = "" {
        didSet {
            guard isComplete else { return }
            
            completeHandler?(input)
        }
    }

    /// Indicates whether the input is complete.
    var isComplete: Bool {
        return inputLength == passcodeLength
    }

    /// Indicates whether the input is empty.
    var isEmpty: Bool {
        return inputLength == 0
    }

    /// A number of entered characters.
    var inputLength: Int {
        return input.count
    }

    /// A maximum passcode input length.
    public let passcodeLength: Int
    
    public typealias CompletionHandler = (String) -> Void
    
    public let completeHandler: CompletionHandler?
    
    public let title: String?
    
    public let subTitle: String?

    // MARK: - Initializers

    /// Creates a new `PasscodeInput` with
    /// a specified passcode length.
    ///
    /// - Parameter passcodeLength: A desired passcode length to use.
    ///                             By default a passcode length
    ///                             of 4 characters is used.
    ///                             All values lower than 1 will be
    ///                             ignored and replaced with 1 instead.
    public init(
        passcodeLength: Int = 4,
        title: String? = nil,
        subTitle: String? = nil,
        completeHandler: CompletionHandler? = nil
    ) {
        self.passcodeLength = max(1, passcodeLength)
        
        self.completeHandler = completeHandler
        
        self.title = title
        self.subTitle = subTitle
    }

}

// MARK: - Public methods

extension PasscodeInput {

    /// Clears all input.
    mutating func clear() {
        input.removeAll()
    }

    /// Enters one more character to the input if possible.
    ///
    /// - Parameters:
    ///   - character: A character to enter.
    /// - Returns: Returns `true` in case input
    ///            succeeded or `false` otherwise.
    @discardableResult
    mutating func enter(character: Character) -> Bool {
        // ensure we have a space for one more character
        guard inputLength < passcodeLength else {
            // otherwise return `false`
            return false
        }

        // append the character to the input string
        input += String(character)

        return true
    }

    /// Erases the last entered character.
    mutating func erase() {
        if input.isEmpty {
            return
        }
        input.removeLast(1)
    }

}
