import SwiftUI

struct ChatView: View {
    @StateObject var messagesManager = MessagesManager()
    var guide: Guide
    
    var body: some View {
        VStack{
            VStack{
                
                ChatTitleRowView(guide: guide)
                
                ScrollViewReader { proxy in
                    ScrollView {
                        
                        ForEach(messagesManager.messages, id:\.id) { message in MessageBubble(message: message)
                        }
                    }.padding(.top, 10)
                        .background(.white)
                        .onChange(of: messagesManager.lastMessageId) { id in
                            withAnimation {
                                proxy.scrollTo(id, anchor: .bottom)
                            }
                        }
                }
            }
            .background(Color(.black))
            
            MessageField()
                .environmentObject(messagesManager)
        }
    }
}
