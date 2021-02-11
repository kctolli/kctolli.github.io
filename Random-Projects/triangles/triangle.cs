using System;

namespace MyApp
{
  class Triangle
  { 
    public string correct = "not valid"; 
    public double[] side = new double[3];
    public double[] angle = new double[3];
    public string class_side = ""; 
    public string class_angle = "";
    const double pi = 3.141592f;
  
    static double square(double x) {return x * x;}
    static double rad2degree(double rad) {return rad * 180/pi;}
    static double degree2rad(double degree) {return degree * pi/180;}
    static double lawcosines(double a, double b, double c)
    {
        double lawcos = (square(a) + square(b) - square(c)) / (2 * a * b);
        if (lawcos < -1 || lawcos > 1) {return 0;}
        else {return rad2degree(Math.Acos(lawcos));}// arccos returns radians
        
    }
    static string validangles()
    {
        if (angle[0] == 90 || angle[1] == 90 || angle[2] == 90){return "right";}
        else if (angle[0] > 90 || angle[1] > 90 || angle[2] > 90) {return "obtuse";}
        else {return "acute";}
    }
    static string triside()
    {
        if (side[0] == side[1] && side[0] == side[2] && side[1] == side[2]){return "equilateral";}
        else if (side[0] == side[1] || array[0] == side[2] || side[1] == side[2]){return "isosceles";}
        else {return "scalene";}
    }
    
    static void getsidetriangle()
    { 
        double[] squared = new string[3];
    
        //side.insert(0, float(input("Enter your first side length: ")))
        //side.insert(1, float(input("Enter your second side length: ")))
        //side.insert(2, float(input("Enter your third side length: ")))
        
        //angle.insert(0, lawcosines(side[0], side[1], side[2]))
        //angle.insert(1, lawcosines(side[1], side[2], side[0]))
        //angle.insert(2, lawcosines(side[2], side[0], side[1]))
        
        //Array.Sort(side);
        
        //foreach double i in side {double[] squared =  new double[] square(side);}

        if (side[0] <= 0 || side[1] <= 0 || side[2] <= 0){correct = "not valid";}
        else if (angle[0] <= 0 || angle[1] <= 0 || angle[2] <= 0) {correct = "not valid";}
        else if (sum(angle) != 180) {correct = "not valid";}
        else if (side[0] + side[1] > side[2] && side[0] + side[2] > side[1] && side[1] + side[2] > side[2])
        {
            class_side = triside();
            correct = "valid";
            if (class_side == "equilateral")
            {
                class_angle = "acute";
                for (int i = 0; i < 3; i++) 
                {
                    angle[i] = 60;
                }
            }    
            else {class_angle = validangles(angle);}// not equilateral
        }
        else {correct = "not valid";}
    }
    
    static void Main(string[] args)
    {
        getsidetriangle(); // Get triangle from sides
        if (correct == "not valid") {Console.WriteLine("These values do not produce a valid triangle.");}// Display not valid triangle
        else if (correct == "valid") // Display valid triangle type
        {
             
        }
        else {Console.WriteLine("Error");}
    }
  }
}