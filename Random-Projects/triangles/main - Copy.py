"""
    Triangles - main.py
    
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
    
"""
# Import libaries
import math

# Global Variables
angle = []
side = []
valid = ["Not A Valid Triangle!", "A Valid Triangle!"]

half_pi = math.pi / 2

# Functions
def rad2degree(rad): return rad * 180/math.pi
def degree2rad(degree): return degree * math.pi/180

def tri(array):
    if array[0] == array[1] and array[0] == array[2] and array[1] == array[2]:
        print("This valid triangle is a equilateral triangle")
    elif array[0] == array[1] or array[0] == array[2] or array[1] == array[2]:
        print("This valid triangle is a isosceles triangle")
    else:
        print("This valid triangle is a scalene triangle")     

def angles():
    angle.insert(0, float(input("Enter your first angle: ")))
    angle.insert(1, float(input("Enter your second angle: ")))
    angle.insert(2, float(input("Enter your third angle: ")))
    print("The angles produce:")
    
    if angle[0] <= 0 or angle[1] <= 0 or angle[2] <= 0:
        return math.inf
    else:
        return sum(angle)

def getangletriangle():
    check = ""
    
    while not(check == "degree" or check == "degrees" or check == "radian" or check == "radians"):
        check = input("Are you angles in degrees or radians: ")
        check = check.lower()
        
        if check == "degree" or check == "degrees":
            triangle = angles()
            if triangle == 180:
                print(valid[1])
                tri(angle)
                if angle[0] == 90 or angle[1] == 90 or angle[2] == 90:
                    print("This valid triangle is a right triangle")
                elif angle[0] >= 90 or angle[1] >= 90 or angle[2] >= 90:
                    print("This valid triangle is a obtuse triangle")
                elif angle[0] <= 90 or angle[1] <= 90 or angle[2] <= 90:
                    print("This valid triangle is a acute triangle")    
            else:
                print(valid[0])
        elif check == "radian" or check == "radians":
            triangle = angles()
            if triangle == math.pi:
                print(valid[1])
                tri(angle)
                if angle[0] == half_pi or angle[1] == half_pi or angle[2] == half_pi:
                    print("This valid triangle is a right triangle")
                elif angle[0] >= half_pi or angle[1] >= half_pi or angle[2] >= half_pi:
                    print("This valid triangle is a obtuse triangle")
                elif angle[0] <= half_pi or angle[1] <= half_pi or angle[2] <= half_pi:
                    print("This valid triangle is a acute triangle")    
            else:
                print(valid[0])
        else:
            print("Please enter what the angle type you are using. (Degrees or Radians)")

def getsidetriangle():
    side.insert(0, float(input("Enter your first side length: ")))
    side.insert(1, float(input("Enter your second side length: ")))
    side.insert(2, float(input("Enter your third side length: ")))
    print("The sides produce:")
    
    if side[0] <= 0 or side[1] <= 0 or side[2] <= 0:
        print(valid[0])
    elif side[0] + side[1] > side[2] and side[0] + side[2] > side[1] and side[1] + side[2] > side[2]:
        print(valid[1])
        tri(side)
        squared = [i ** 2 for i in sorted(side)]
        if squared[0] + squared[1] == squared[2]: print("This valid triangle is a right triangle") 
    else: 
        print(valid[0])

## Main Functions
def main():
    check = ""
    
    while not(check == "side" or check == "sides" or check == "angle" or check == "angles"):
        check = input("Are you describing triangle with angles or sides: ")
        check = check.lower()
    
        if check == "side" or check == "sides":
            getsidetriangle()
        elif check == "angle" or check == "angles":
            getangletriangle()
        
    
if __name__ == "__main__":
    # execute only if run as a script
    main()        