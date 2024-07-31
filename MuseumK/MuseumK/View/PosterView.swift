import SwiftUI
import RealityKit
import RealityKitContent


struct PosterView: View {
    @Environment(\.openImmersiveSpace) var openImmersiveSpace
    @Environment(\.dismissImmersiveSpace) var dismissImmersiveSpace
    @Environment(\.openWindow) private var openWindow
    @Environment(\.dismissWindow) private var dismissWindow

    @State private var selectedMenuItem: MenuItem? = nil
    @State private var navigateToRoom = false
    @State private var showImmersiveSpace = false
    @State private var immersiveSpaceIsShown = false

    @EnvironmentObject var model: SelectedRoomModel

    var body: some View {
        NavigationStack {
            VStack {
                ExhibitionHeader()
                scrollView()
            }
            .padding(.horizontal, 28)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .padding(.bottom, 50)
            .onChange(of: immersiveSpaceIsShown) { _, newValue in
                Task {
                    if model.isImmersiveOn == true {
                        await dismissImmersiveSpace()
                    }
                    model.isImmersiveOn = true
                    await openImmersiveSpace(id: "ImmersiveSpace")
                }
            }
        }
    }

    private func ExhibitionHeader() -> some View {
        HStack {
            VStack(alignment: .leading, spacing: 0) {
                Text("Exhibition")
                    .font(.system(size: 34))
                    .fontWeight(.bold)
                    .padding(.bottom, 8)
                Text("Recently Updated")
                    .font(.system(size: 24))
                    .fontWeight(.bold)
                    .opacity(0.6)
            }
            .padding(.top, 30)
            .padding(.leading, 16)
            Spacer()
        }
    }

    private func scrollView() -> some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack(spacing: 16) {
                ForEach(rooms, id: \.id) { room in
                    posterView(for: room)
                }
            }
        }
        .padding(.top, 16)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
    private func posterView(for room: Room) -> some View {
        VStack {
            Button(action: {
                if model.isImmersiveOn == true {
                    if model.roomName != room.immersiveName {
                        DispatchQueue.main.async {
                            model.roomName = room.immersiveName
                        }
                        immersiveSpaceIsShown.toggle()
                    }
                } else {
                    DispatchQueue.main.async {
                        model.roomName = room.immersiveName
                    }
                    immersiveSpaceIsShown.toggle()
                }
            }) {
                ZStack(alignment: .bottom) {
                    posterBackground(for: room)
                    posterOverlay(for: room)
                }
            }
            .buttonStyle(.plain)
            .buttonBorderShape(.roundedRectangle(radius: 10))
            .disabled(room.isLocked)
        }
    }

    private func posterBackground(for room: Room) -> some View {
        Group {
            if room.isLocked {
                ZStack() {
                    Rectangle()
                        .fill(Color.black)
                        .opacity(0.1)
                        .frame(width: 327, height: 388)
                        .cornerRadius(17)
                    Image(room.imageName)
                        .resizable()
                        .frame(width: 90, height: 97)
                        .opacity(0.1)
                }
            } else {
                Image(room.imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 327, height: 388)
                    .clipShape(RoundedRectangle(cornerRadius: 17))
            }
        }
    }

    private func posterOverlay(for room: Room) -> some View {
        ZStack {
            Rectangle()
                .fill(Color.black)
                .opacity(0.3)
                .frame(width: 327, height: 100)
                .cornerRadius(17)
            Text(room.title)
                .font(.system(size: 24))
                .fontWeight(.bold)
                .foregroundColor(.white)
                .padding(.vertical, 8)
                .opacity(0.8)
        }
    }
}

