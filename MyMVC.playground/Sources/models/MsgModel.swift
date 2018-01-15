class MsgModel {
    //add message to DB
    func addMessage(receiver: Int, sender: Int, txt: String){
        let msg = Message(receiver: receiver,
                          sender: sender,
                          txt: txt)
        Data.messages.append(msg)
    }
    
    //get all message for certain user
    func getInbox(forUser receiver: Int) -> [Message] {
        var msgs:[Message] = []
        
        //query Data
        for m in Data.messages {
            if m.receiver == receiver {
                msgs.append(m)
            }
        }
        
        return msgs
    }
}










