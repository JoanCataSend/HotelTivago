namespace HotelTivago.Classes
{
    public class Client : User
    {
        public int ID { get; set; }
        public string Name { get; set; }
        public string DOB { get; set; }
        public string Address { get; set; }
        public string Mobile { get; set; }

        public Client()
        {
            Profile = "client";
        }

        public Client(int id, string username, string name, string dob, string address, string mobile)
        {
            ID = id;
            Username = username;
            Name = name;
            DOB = dob;
            Address = address;
            Mobile = mobile;
            Profile = "client";
        }
    }
}
