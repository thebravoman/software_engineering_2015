using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Problem_16
{
    public class Prime
    {
        public static bool IsPrime(int number)
        {
            int i = 2;
            
                for (; i < number; i++)
                {
                    if (number % i == 0)
                    {
                        if (i != number)
                        {
                            return  false;
                        }
                        else
                        {
                            return true;
                        }
                    }
                }
                return true;
            }
    }
}

