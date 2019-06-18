using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Used for Encryption and Decryption Purpose
/// </summary>
public class Encryption
{
    private String pass, user;
    private String encrypt, decrypt;
    public Encryption(String u, String p)
    {
        pass = p;
        user = u;
    }
    public Encryption(String u, String e, int n)
    {
        user = u;
        encrypt = e;
    }
    private void Form()
    {
        String s = "";
        char[] c = pass.ToCharArray();
        int i = 0;
        for (; i < c.Length; i++)
        {
            if ((i % user.Length) == 0)
            {
                s = s + user;
            }
            s = s + c[i];
        }
        while ((i % user.Length) != 0)
        {
            s = s + " ";
            i++;
        }
        s = s + user;
        encrypt = s;
    }
    private void Encrypt()
    {
        Form();
        String s="";
        char[] c = encrypt.ToCharArray();
        for (int i = 0; i < c.Length; i++)
        {
            int temp = (int)c[i];
           temp = 257 - temp;
            int q = temp / 28;
            int r = temp % 28;
            r = r + 97;
            s = s + q;
            char x = (char)r;
            s = s + x;
        }
        encrypt = s;
    }
    public String Get_Encrypted_Value()
    {
        Encrypt();
        return encrypt;
    }
    private void Decrypt()
    {
        char[] c = encrypt.ToCharArray();
        String s = "";
        for (int i = 0; i < c.Length; i++)
        {
            int q = (int)c[i];
            q = q - 48;
            i++;
            int r = (int)c[i];
            r = r - 97;
            int temp = (q * 28) + r;
            temp = 257 - temp;
            char c1 = (char)temp;
            s = s + c1;
        }
        decrypt = s;
        Construct();
    }
    private void Construct()
    {
        String s = "";
        char[] c = decrypt.ToCharArray();
        for (int i = 0; i < c.Length; i++)
        {
            if ((i % user.Length) == 0)
            {
                i++;
                while ((i % user.Length) != 0)
                    i++;
            }
            if (i >= c.Length)
                break;
            else if (c[i] == ' ')
                continue;
            else if(i<c.Length)
                s = s + c[i];
        }
        decrypt = s;
    }
    public String Get_Decrypted_Value()
    {
        Decrypt();
        return decrypt;
    }
}