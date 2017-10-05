using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ConsoleApplication1
{
    class Program
    {
        static void Main(string[] args)
        {
            //change 1

            var test = new MyTestClass();
            Console.WriteLine(test.SuperFunction());
        }

        private class MyTestClass
        {
            public string SuperFunction()
            {
                return "GO!";
            }
        }
    }
}
