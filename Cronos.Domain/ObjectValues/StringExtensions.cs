﻿using System;
using System.Collections.Generic;
using System.Text;

namespace Cronos.Domain.ObjectValues
{
    public static class StringExtensions
    {
        public static string ConvertToMD5(this string passWord)
        {
            if (String.IsNullOrEmpty(passWord)) return "";

            var password = (passWord += "|2d331cca-f6c0-40c0-bb43-6e32989c2881|");
            var md5 = System.Security.Cryptography.MD5.Create();
            var data = md5.ComputeHash(Encoding.Default.GetBytes(password));
            var sbString = new StringBuilder();
            foreach (var t in data)
                sbString.Append(t.ToString("x4"));

            return sbString.ToString();
        }
    }
}
