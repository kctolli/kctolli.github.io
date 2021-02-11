/*
    Triangles - triangle.cs
    
    Copyright 2021 Kyle Tolliver

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <https://www.gnu.org/licenses/>.
    
*/

using System;

namespace MyApp
{
  class Triangle
  { 
    public static string correct = "not valid"; 
    public static double[] side = new double[3];
    public static double[] angle = new double[3];
    public static string class_side = ""; 
    public static string class_angle = "";
    const double pi = 3.14159265359f;
  
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
        else if (side[0] == side[1] || side[0] == side[2] || side[1] == side[2]){return "isosceles";}
        else {return "scalene";}
    }
    
    static void getsidetriangle()
    { 
        Console.WriteLine("Enter your first side length: ");
        side[0] = Convert.ToDouble(Console.ReadLine());
        
        Console.WriteLine("Enter your second side length: ");
        side[1] = Convert.ToDouble(Console.ReadLine());
        
        Console.WriteLine("Enter your third side length: ");
        side[2] = Convert.ToDouble(Console.ReadLine());

        if (side[0] <= 0 || side[1] <= 0 || side[2] <= 0){correct = "not valid";}
        
        angle[0] = lawcosines(side[0], side[1], side[2]);
        angle[1] = lawcosines(side[1], side[2], side[0]);
        angle[2] = lawcosines(side[2], side[0], side[1]);
        
        if (angle[0] <= 0 || angle[1] <= 0 || angle[2] <= 0) {correct = "not valid";}
        else if (angle[0] + angle[1] + angle[2] != 180) {correct = "not valid";}
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
            else {class_angle = validangles();}// not equilateral
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