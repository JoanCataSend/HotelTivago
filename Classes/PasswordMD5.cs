using System.Security.Cryptography;
using System.Text;

namespace HotelTivago.Classes
{
    public static class PasswordMD5
    {
        public static string Hash(string input)
        {
            using (MD5 md5 = MD5.Create())
            {
                byte[] inputBytes = Encoding.UTF8.GetBytes(input);
                byte[] hashBytes = md5.ComputeHash(inputBytes);

                StringBuilder sb = new StringBuilder(hashBytes.Length * 2);
                foreach (byte b in hashBytes)
                {
                    sb.Append(b.ToString("x2"));
                }

                return sb.ToString();
            }
        }
    }
}
