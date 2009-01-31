package events
{
    import flash.events.Event;
    
    public class LoginEvent extends Event
    {
        public static const AUTHENTICATE:String = "authenticateLoginEvent";
        
        public var username:String;
        public var password:String;
        
        public function LoginEvent(type:String)
        {
            super(type, true);
        }

    }
}