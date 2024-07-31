import SwiftUI
import RealityKit
import RealityKitContent

struct VolumeView: View {
    @Environment(\.openWindow) private var openWindow
    @Environment(\.dismissWindow) private var dismissWindow

    var scale: Float = 1
    var position: SIMD3<Float> = .zero

    @State var objectVolumeName: String

    var body: some View {
        RealityView { content in
            // Load the 3D object from a Reality file or a USDZ file
            if let scene = try? await Entity(named: objectVolumeName, in: realityKitContentBundle) {
                content.add(scene)
            }
        } update: { content in
        }
        .installGestures()
    }
}
