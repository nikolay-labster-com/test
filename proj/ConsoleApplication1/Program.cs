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
            // change 2

            // dumb change

            var test = new MyTestClass();
            Console.WriteLine(test.SuperFunction());

            // let's call my first procedure
            MyTestSub1();

            // something very important here
            var dup = new Duplicate();

            var wow = new WowClass();
            wow.Wow();
        }

        private static void MyTestSub1()
        {
            // i will write some here later
        }

        private class MyTestClass
        {
            public string SuperFunction()
            {
                return "GO!";
            }
        }

        private class WowClass
        {
            public void Wow()
            {

            }
			public void Test2()
			{

			}
			public void MyCoolMethod()
			{

			}
        }

        private class Duplicate
        {

        }
    }
}
