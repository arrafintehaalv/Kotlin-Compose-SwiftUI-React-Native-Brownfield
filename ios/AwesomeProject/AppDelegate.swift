import SwiftUI
import ReactBrownfield

@main
struct MyApp: App {
    init() {
        ReactNativeBrownfield.shared.startReactNative {
            print("React Native loaded.")
        }
    }

    var body: some Scene {
        WindowGroup {
            NavigationView {
                HomeScreen()
            }
            .navigationBarHidden(true) // Hide nav bar at root
        }
    }
}

struct HomeScreen: View {
    @State private var showModal = false

    var body: some View {
        VStack(spacing: 20) {
            Text("React Native Brownfield Example")
                .font(.title)
                .multilineTextAlignment(.center)
                .padding(.top, 40)

            NavigationLink(destination: ReactNativeView(moduleName: "ReactNative")
                            .navigationBarHidden(true)) {
                Text("Push React Native Screen")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }

            Button(action: {
                showModal = true
            }) {
                Text("Present React Native Modally")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
        }
        .padding(20)
        .sheet(isPresented: $showModal) {
            ReactNativeModalView(moduleName: "ReactNative")
        }
    }
}

struct ReactNativeModalView: View {
    var moduleName: String

    var body: some View {
        NavigationView {
            ReactNativeView(moduleName: moduleName)
                .navigationBarHidden(true)
                .edgesIgnoringSafeArea(.all)
        }
    }
}