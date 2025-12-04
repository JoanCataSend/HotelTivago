using System.Text.RegularExpressions;

namespace HotelTivago.Classes
{
    public static class ValidationRules
    {
        public const string UsernamePattern = @"^[A-Za-z0-9_]{3,20}$";
        public const string NamePattern = @"^[A-Za-zÁÉÍÓÚÜÑáéíóúüñ\s]{2,50}$";
        public const string DatePattern = @"^(0[1-9]|[12][0-9]|3[01])/(0[1-9]|1[0-2])/[0-9]{4}$";
        public const string AddressPattern = @"^[A-Za-z0-9ÁÉÍÓÚÜÑáéíóúüñ\s\.,\-]{5,80}$";
        public const string MobilePattern = @"^[679][0-9]{8}$";
        public const string EmailPattern = @"^[^@\s]+@[^@\s]+\.[^@\s]+$";

        public static bool IsValidUsername(string username) => Regex.IsMatch(username, UsernamePattern);
        public static bool IsValidName(string name) => Regex.IsMatch(name, NamePattern);
        public static bool IsValidDate(string date) => Regex.IsMatch(date, DatePattern);
        public static bool IsValidAddress(string address) => Regex.IsMatch(address, AddressPattern);
        public static bool IsValidMobile(string mobile) => Regex.IsMatch(mobile, MobilePattern);
        public static bool IsValidEmail(string email) => Regex.IsMatch(email, EmailPattern);
    }
}
