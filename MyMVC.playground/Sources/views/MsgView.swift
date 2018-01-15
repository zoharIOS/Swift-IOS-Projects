class MsgView {
    func showInbox(user: String, msgs: [Message]) {
        print("***** inbox of \(user) *****")
        for m in msgs {
            print("\(m.txt) from: \(m.sender)")
        }
    }
}
