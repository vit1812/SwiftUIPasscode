import SwiftUI

public struct SwiftUIPasscode {
    
    // MARK: - Properties

    @State private var passcodeInput: PasscodeInput
    
    public init(
        input: PasscodeInput = PasscodeInput()
    ) {
        _passcodeInput = State(initialValue: input)
    }
}

// MARK: - View

extension SwiftUIPasscode: View {

    public var body: some View {
        VStack(spacing: 40.0) {
            PasscodeInputIndicatorView(PasscodeInput: $passcodeInput)
            
            ZStack(alignment: .bottomTrailing) {
                PasscodeKeyboardView(PasscodeInput: $passcodeInput)
                
                Button(action: {
                    withAnimation {
                        self.eraseOrCancel()
                    }
                }, label: {
                    Image(systemName: "delete.backward.fill")
                        .foregroundColor(.secondary)
                        .font(.title)
                })
                .offset(x: -20, y: -20)
            }
        }
    }

}

// MARK: - Private methods

extension SwiftUIPasscode {

    private func cancelInput() {
        // TODO: do something already!
    }

    private func eraseOrCancel() {
        if passcodeInput.isEmpty {
            cancelInput()
            return
        }
        passcodeInput.erase()
    }

}

// MARK: - Preview

struct SwiftUIPasscode_Previews: PreviewProvider {

    static var previews: some View {
        SwiftUIPasscode()
    }

}
