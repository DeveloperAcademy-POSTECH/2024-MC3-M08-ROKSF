import SwiftUI
import RealityKit
import RealityKitContent

struct CommentaryView: View {
    @Environment(\.openWindow) var openWindow
    @Environment(\.dismissWindow) var dismissWindow

    @Binding var isObjectShowing: Bool
    @Binding var isSoundPlaying: Bool
    @State var object: ROKObjectModel
    @State private var showVideoWindow = false
    @State private var isImmersiveSoundOn = false
    @State private var isDocentOpen = false

    private let soundManager = SoundManager.instance
    var body: some View {
        VStack {
            Spacer()

            HStack {
                Spacer()

                ZStack() {
                    Image("\(object.mainPhotoName)")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 460, height: 460)
                        .cornerRadius(20)
                    VStack() {
                        Spacer()

                        HStack() {
                            Spacer()

                            Toggle(isOn: $isObjectShowing) {
                                Image(systemName: "rotate.3d.fill")
                                    .font(.title)
                                    .padding(.leading, 11)
                                Text("3D Object")
                                    .font(.system(size: 20))
                                    .fontWeight(.bold)
                                    .padding(17)
                                    .clipShape(Capsule())
                            }
                            .onChange(of: isObjectShowing) { _, newValue in
                                if newValue {
                                    dismissWindow(id: "Volume")
                                    openWindow(id: "Volume")
                                } else {
                                    dismissWindow(id: "Volume")
                                }
                            }
                            .toggleStyle(.button)

                            Toggle(isOn: $isSoundPlaying) {
                                Image(systemName: "headphones")
                                    .font(.title)
                                    .padding(.leading, 11)
                                Text("Sounds")
                                    .font(.system(size: 20))
                                    .fontWeight(.bold)
                                    .padding(17)
                                    .clipShape(Capsule())
                            }
                            .onChange(of: isSoundPlaying) { _, newValue in
                                if newValue {
                                    soundManager.playSound(sound: object.soundName)
                                } else {
                                    soundManager.soundOff()
                                }
                            }
                            .toggleStyle(.button)

                            Spacer()
                        }
                        .padding(.bottom, 22.55)
                    }
                    .frame(width: 460, height: 460)
                }

                VStack(alignment: .leading){
                    HStack() {
                        VStack(alignment: .leading) {
                            Text("\(object.name)")
                                .font(.system(size: 34))
                                .fontWeight(.bold)
                            Text("\(object.anotherName)")
                                .font(.system(size: 20))
                                .fontWeight(.light)
                        }

                        Spacer()

                    }
                    .padding(.bottom, 53)

                    Text("지정문화유산")
                        .font(.system(size: 25))
                        .fontWeight(.bold)
                    Text("\(object.culturalHeritage)")
                        .font(.system(size: 20))
                        .fontWeight(.light)
                        .padding(.bottom, 24)

                    Text("국적/시대")
                        .font(.system(size: 25))
                        .fontWeight(.bold)
                    Text("\(object.nationality)")
                        .font(.system(size: 20))
                        .fontWeight(.light)
                        .padding(.bottom, 24)

                    Text("재질")
                        .font(.system(size: 25))
                        .fontWeight(.bold)
                    Text("\(object.material)")
                        .font(.system(size: 20))
                        .fontWeight(.light)
                        .padding(.bottom, 24)

                    Text("분류")
                        .font(.system(size: 25))
                        .fontWeight(.bold)
                    Text("\(object.category)")
                        .font(.system(size: 20))
                        .fontWeight(.light)
                }
                .foregroundColor(.white)
                .padding(20) // Adjust padding as needed

                Spacer()
            }
            .padding(.vertical, 10) // Adjust padding as needed

            Spacer()
        }
        .padding(.horizontal, 20) // Adjust padding as needed
    }
}
