package view
{
    import events.LoginEvent;
    
    import mx.core.UIComponent;
    
    [Bindable]
    /**
     * Allowing LoginModel to be a UIComponent does 2 things. 1) We can dispatch
     * bubbling event straight from here and they get up to Mate, and 2) We can
     * inject directly to the model without having Mate create the model for us.
     * 
     * Note that I would probably create a baseclass PresentationModel with the 
     * visible and includeInLayout settings in it.
     */
    public class LoginModel extends UIComponent
    {
        /**
         * I would actually put these two lines in a base class called 
         * PresentationModel or something
         */
        public function LoginModel()
        {
            this.visible = false;
            this.includeInLayout = false;
        }
        
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
                
            dispatchEvent(event);
        }
    }
}