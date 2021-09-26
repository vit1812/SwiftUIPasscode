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
        VStack(spacing: 40) {
            VStack(spacing: 8) {
                if passcodeInput.title != nil {
                    Text(passcodeInput.title!)
                }
                
                if passcodeInput.subTitle != nil {
                    Text(passcodeInput.subTitle!)
                        .foregroundColor(.secondary)
                }
            }
            
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

    static let input = PasscodeInput(
        passcodeLength: 6,
        title: "Title",
        subTitle: "Subtitle",
        completeHandler: nil
    )
    
    static var previews: some View {
        SwiftUIPasscode(input: input)
    }

}
