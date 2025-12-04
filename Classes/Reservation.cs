namespace HotelTivago.Classes
{
    public class Reservation
    {
        public int ID { get; set; }
        public string Username { get; set; }
        public string Arrival { get; set; }
        public string Departure { get; set; }
        public string RoomType { get; set; }

        public Reservation() { }

        public Reservation(string username, string arrival, string departure, string roomType)
        {
            Username = username;
            Arrival = arrival;
            Departure = departure;
            RoomType = roomType;
        }
    }
}
