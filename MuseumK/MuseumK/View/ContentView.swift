import SwiftUI
import RealityKit
import RealityKitContent

struct ContentView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                backgroundView()
                titleView()
                enterButton()
            }
        }
    }

    // 바탕이미지
    private func backgroundView() -> some View {
        Image("TitleImage")
            .resizable()
            .scaledToFit()
            .opacity(0.6)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .clipped()
    }

    // 타이틀
    private func titleView() -> some View {
        HStack(alignment: .top){
            VStack(alignment: .leading) {
                Text("Museum K")
                    .font(.system(size: 74.91))
                    .bold()
                    .padding(.top, 200)

                Text("Experience the Korean Traditional Museum")
                    .font(.system(size: 25))
                    .fontWeight(.medium)
                    .opacity(0.6)
            }
            .padding(.leading, 58)
            .padding(.bottom, 100)
            .padding(.trailing, 300)
            Spacer()
        }

    }

    // Enter Button --> PosterView로 넘어가야함
    private func enterButton() -> some View {
        VStack {
            NavigationLink(destination: PosterView()) {
                Text("Enter")
                    .font(.system(size: 20))
                    .padding()
                    .foregroundColor(.white)
                    .cornerRadius(30)
            }
            .padding(.top, 500)
            .padding(.bottom, 50)
            .frame(maxWidth: 1260, maxHeight: 554)
            .padding(.top, 300)
            .padding(.bottom, 200)
        }
    }
}

#Preview(windowStyle: .automatic) {
    ContentView()
}
