package manager
{
    [Bindable]
    public class LoginManager
    {
        public var authenticated:Boolean = false;
        
        public function setAuthenticated(value:Boolean):void
        {
            authenticated = value;
        }
    }
}