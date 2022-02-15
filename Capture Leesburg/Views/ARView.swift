import SwiftUI
import RealityKit
import ARKit

struct arView: View {

    var body: some View {
        return VStack {

            ARViewContainer().edgesIgnoringSafeArea(.all)

        }
    }
}

struct ARViewContainer: UIViewRepresentable {

    func makeUIView(context: Context) -> ARView{

        let arView = ARView(frame:.zero)

        let bellAnchor = try! BellTest.loadScene()

        arView.scene.addAnchor(bellAnchor)


        return arView
    }

    func updateUIView(_ uiView: ARView, context: Context) {

    }
    
        func tapOnEntity(_: Entity?) {
            NavigationLink("", destination: LandingView())
            }
    
}
