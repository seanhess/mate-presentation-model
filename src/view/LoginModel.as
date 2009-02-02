package view
{
    import events.LoginEvent;
    
    import flash.events.IEventDispatcher;
    
    [Bindable]
    public class LoginModel
    {
    	public var dispatcher:IEventDispatcher;
    	
        public var allowLogin:Boolean = false;
        public var authenticated:Boolean = false;
        protected var username:String;
        protected var password:String; 
        
        public function updateUsername(username:String):void
        {
            this.username = username;
            validate();
        }
        
        public function updatePassword(password:String):void
        {
            this.password = password;
            validate();
        }
        
        protected function validate():void
        {
            allowLogin = (username && username != "" && password && password != "");
        }
        
        public function authenticate():void
        {
            var event:LoginEvent = new LoginEvent(LoginEvent.AUTHENTICATE);
                event.username = username;
                event.password = password;
                
            dispatcher.dispatchEvent(event);
        }
    }
}