using System.Data.SQLite;

namespace HotelTivago.Classes
{
    public class DatabaseManager
    {
        private readonly string connectionString;

        public DatabaseManager(string dbPath)
        {
            connectionString = "Data Source=" + dbPath + ";Version=3;";
        }

        public SQLiteConnection GetConnection()
        {
            return new SQLiteConnection(connectionString);
        }
    }
}
