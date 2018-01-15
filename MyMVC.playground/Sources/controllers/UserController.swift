public class UserController {
    //UserController HAS Models & Views
    private var uModel: UserModel
    private var uView: UserView
    private var mModel: MsgModel
    private var mView: MsgView
    
    //initialize models & views once created
    public init() {
        self.uModel = UserModel()
        self.uView = UserView()
        self.mModel = MsgModel()
        self.mView = MsgView()
    }
    
    //caller interact throuth following method
    public func set(name: String){
        uModel.name = name //set value with property
    }
    
    public func set(id: Int){
        uModel.id = id //set value with property
    }
    
    //show my views
    public func reloadView() {
        //present user view
        uView.show(uId: uModel.id, uName: uModel.name) //present user model on view
        
        //present message view
        mView.showInbox(user: uModel.name,
                        msgs: mModel.getInbox(forUser: uModel.id))
    }
    
    //send message to user's inbox
    public func send(_ msg: String, to receiver: Int){
        mModel.addMessage(receiver: receiver,
                          sender: uModel.id,
                          txt: msg)
    }
}
