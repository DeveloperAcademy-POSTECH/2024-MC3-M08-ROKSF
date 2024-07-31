import SwiftUI
import RealityKit
import RealityKitContent

struct VolumeView: View {
    @Environment(\.openWindow) private var openWindow
    @Environment(\.dismissWindow) private var dismissWindow

    @State var objectVolumeName: String

    var body: some View {
        ZStack {
            RealityView { content in
                if let scene = try? await Entity(named: objectVolumeName, in: realityKitContentBundle) {
                    content.add(scene)

                    guard let resource = try? await EnvironmentResource(named: "ImageBasedLight") else { return }
                    let iblComponent = ImageBasedLightComponent(source: .single(resource), intensityExponent: 0.25)
                    scene.components.set(iblComponent)
                    scene.components.set(ImageBasedLightReceiverComponent(imageBasedLight: scene))
                }
            } update: { content in
            }
            .installGestures()
            .offset(y: 500)

            VolumeControlView()
                .offset(y: 550)
        }
    }
}
