import SwiftUI
import RealityKit
import RealityKitContent

struct EnteringView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                backgroundView()
                titleView()
                enterButton()
            }
        }
    }

    private func backgroundView() -> some View {
        Image("TitleImage")
            .resizable()
            .scaledToFit()
            .opacity(0.6)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .clipped()
    }

    private func titleView() -> some View {
        HStack(alignment: .top){
            VStack(alignment: .leading) {
                Text("Museum K")
                    .font(.system(size: 74.91))
                    .bold()
                    .padding(.top, 180)

                Text("Experience the Korean Traditional Museum")
                    .font(.system(size: 25))
                    .fontWeight(.medium)
                    .opacity(0.6)
            }
            .padding(.leading, 58)
            .padding(.bottom, 100)
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
