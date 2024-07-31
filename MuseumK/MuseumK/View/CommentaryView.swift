import SwiftUI
import RealityKit
import RealityKitContent


// CommentaryView structure (destination view)
struct CommentaryView: View {
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.openWindow) var openWindow
    @Environment(\.dismissWindow) var dismissWindow

    @State var isObjectShowing = false
    @State var object: ROKObjectModel

    var body: some View {
        GeometryReader { geometry in
            VStack {
                Spacer()
                HStack{
                    Spacer()
                    ComentaryContentImage(geometry: geometry)
                    ComentaryContent(geometry: geometry)
                    Spacer()
                }
                .padding(.vertical, geometry.size.height * 0.01)
                Spacer()
            }
            .padding(.horizontal, geometry.size.width * 0.02)
            .padding(.bottom, geometry.size.height * 0.04)
            //오너먼트 파트 시작
            .ornament(visibility: .visible, attachmentAnchor: .scene(.bottom), contentAlignment: .center) {
                ToolBarView()
            }
        }
    }

    private func ToolBarView() -> some View {
        //오너먼트 안에 버튼들
        ZStack {
            Capsule()
                .fill(.gray)
                .opacity(0.2)
                .glassBackgroundEffect()

            // 버튼 3개
            HStack {
                Button("Video", systemImage: "play.circle.fill") {
                }

                Button("Immersive Sound", systemImage: "headphones") {
                }

                Button("Docent", systemImage: "book.pages.fill") {
                }
            }
            .padding(15)
        }
        .padding(.top, 80)
    }


    private func ComentaryContent(geometry: GeometryProxy) -> some View {
        VStack(alignment: .leading){
            HStack{
                VStack{
                    Text("\(object.name)")
                        .font(.system(size: 34))
                        .fontWeight(.bold)
                    Text("\(object.author)")
                        .font(.system(size: 20))
                        .fontWeight(.light)
                        .opacity(/*@START_MENU_TOKEN@*/0.8/*@END_MENU_TOKEN@*/)
                }

                Spacer()

                ZStack {
                    Toggle(isOn: $isObjectShowing) {
                        Image(systemName: "rotate.3d.fill")
                            .font(.title)
                            .padding(.leading, 11)
                        Text("Close Object View")
                            .font(.system(size: 24))
                            .fontWeight(.bold)
                            .frame(width: 220, height: 62)
                            .foregroundColor(.white)
                            .padding(7)
                            .clipShape(Capsule())
                    }
                    .onChange(of: isObjectShowing) { _, newValue in
                        if newValue {
                            openWindow(id: "Volume")
                        } else {
                            dismissWindow(id: "Volume")
                        }
                    }
                    .toggleStyle(.button)
                }
            }


            Spacer()

            Text("Detail")
                .font(.system(size: 25))
                .fontWeight(.bold)
                .opacity(0.8)
            Text("Height: \(object.height)cm")
                .font(.system(size: 20))
                .fontWeight(.light)
                .opacity(/*@START_MENU_TOKEN@*/0.8/*@END_MENU_TOKEN@*/)

            Spacer()

            Text("\(object.detail)")
                .font(.system(size: geometry.size.width * 0.02, weight: .light))
                .opacity(0.7)


        }
        .foregroundColor(.white)
        .opacity(/*@START_MENU_TOKEN@*/0.8/*@END_MENU_TOKEN@*/)
        .padding(.horizontal, geometry.size.width * 0.02)
        .padding(.vertical, geometry.size.height * 0.06)
    }
    private func ComentaryContentImage(geometry: GeometryProxy) -> some View {
        Group {
            ZStack {
                Image("\(object.mainPhotoName)")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: geometry.size.width * 0.28, height: geometry.size.height * 0.799)
                    .cornerRadius(geometry.size.width * 0.02)
            }
        }
    }
}
