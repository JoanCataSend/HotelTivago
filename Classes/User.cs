namespace HotelTivago.Classes
{
    public class User
    {
        public string Username { get; set; }
        public string PasswordHash { get; set; }
        public string Profile { get; set; }

        public User() { }

        public User(string username, string passwordHash, string profile)
        {
            Username = username;
            PasswordHash = passwordHash;
            Profile = profile;
        }
    }
}
