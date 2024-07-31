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

    var body: some View {
        NavigationStack {
            VStack {
                ExhibitionHeader()
                scrollView()
            }
            .padding(.horizontal, 16)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .padding(.bottom, 50)
        }
    }

    // Header
    private func ExhibitionHeader() -> some View {
        HStack {
            VStack(alignment: .leading) {
                Text("Exhibition")
                    .font(.system(size: 34))
                    .fontWeight(.bold)
                    .padding(.bottom, 8)
                Text("Recently Updated")
                    .font(.system(size: 24))
                    .fontWeight(.bold)
                    .opacity(0.6)
            }
            .padding(.top, 50)
            .padding(.leading, 16)
            Spacer()
        }
    }

    // Scroll View
    private func scrollView() -> some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 16) {
                ForEach(rooms) { room in
                    posterView(for: room)
                }
            }
        }
        .padding(.top, 16)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }

    // Poster Item View
    private func posterView(for room: Room) -> some View {
        VStack {
            Button(action: {
                showImmersiveSpace.toggle()
            }) {
                ZStack(alignment: .bottom) {
                    posterBackground(for: room)
                    posterOverlay(for: room)
                }
            }
            .buttonStyle(.plain)
            .buttonBorderShape(.roundedRectangle(radius: 10))
            .disabled(room.isLocked)  // 비활성화된 방은 클릭할 수 없도록 설정
            Text(room.name)
                .font(.system(size: 24, weight: .bold))
                .opacity(0.5)
                .padding(.top, 8)
        }
        .onChange(of: showImmersiveSpace) { _, newValue in
            Task {
                if newValue {
                    switch await openImmersiveSpace(id: "ImmersiveSpace") {
                    case .opened:
                        dismissWindow(id: "Content")
                        immersiveSpaceIsShown = true
                    case .error, .userCancelled:
                        fallthrough
                    @unknown default:
                        immersiveSpaceIsShown = false
                        showImmersiveSpace = false
                    }
                } else if immersiveSpaceIsShown {
                    await dismissImmersiveSpace()
                    immersiveSpaceIsShown = false
                }
            }
        }
    }

    // Poster Background
    private func posterBackground(for room: Room) -> some View {
        Group {
            if room.isLocked {
                ZStack {
                    Rectangle()
                        .fill(Color.black)
                        .opacity(0.1)
                        .frame(width: 327, height: 388)
                        .cornerRadius(10)
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
                    .cornerRadius(10)
            }
        }
    }

    // Poster Overlay
    private func posterOverlay(for room: Room) -> some View {
        ZStack {
            Rectangle()
                .fill(Color.black)
                .opacity(0.3)
                .frame(width: 327, height: 100)
                .cornerRadius(10)
            Text(room.title)
                .font(.system(size: 24))
                .foregroundColor(.white)
                .padding(.vertical, 8)
                .opacity(0.8)
        }
    }
}


// Preview
#Preview {
    PosterView()
}
