"""
    Triangles - triangle.py
    
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
import numpy as np

# Global Variables
angle = []
side = []
valid = ["not valid", "valid"]

half_pi = math.pi / 2

# Functions
def square(x): return pow(x,2)

## Trig Functions
def rad2degree(rad): return rad * 180/math.pi
def degree2rad(degree): return degree * math.pi/180

def lawcosines(a, b, c):
    lawcos = (square(a) + square(b) - square(c)) / (2 * a * b)
    if lawcos < -1 or lawcos > 1:
        return 0
    else:
        return rad2degree(math.acos(lawcos)) ## arccos returns radians

## Get Triangle Type
def validangles():
    if angle[0] == 90 or angle[1] == 90 or angle[2] == 90:
        return "right"
    elif angle[0] >= 90 or angle[1] >= 90 or angle[2] >= 90:
        return "obtuse"
    elif angle[0] <= 90 or angle[1] <= 90 or angle[2] <= 90:
        return "acute"
    else:
        return ""

def tri(array):
    if array[0] == array[1] and array[0] == array[2] and array[1] == array[2]:
        return "equilateral"
    elif array[0] == array[1] or array[0] == array[2] or array[1] == array[2]:
        return "isosceles"
    else:
        return "scalene"   

## Get Triangle from Angles
def getangletriangle():
    check = ""
    class_side = ""
    class_angle = ""
    
    while not(check == "degree" or check == "degrees" or check == "radian" or check == "radians"):
        check = input("Are you angles in degrees or radians: ")
        check = check.lower()
        
        if check == "radian" or check == "radians":
            radian = []
            radian.append(float(input("Enter your first angle: ")))
            radian.append(float(input("Enter your second angle: ")))
            radian.append(float(input("Enter your third angle: ")))
            for i in radian:
                angle.append(rad2degree(i))
        elif check == "degree" or check == "degrees":
            degree = []
            degree.append(float(input("Enter your first angle: ")))
            degree.append(float(input("Enter your second angle: ")))
            degree.append(float(input("Enter your third angle: ")))
            for i in degree:
                angle.append(i) 
            
    if angle[0] <= 0 or angle[1] <= 0 or angle[2] <= 0:
        correct = valid[0]
    elif sum(angle) == 180:
        correct = valid[1]
        class_angle = validangles()
    else:
        correct = valid[0]
        
    class_side = tri(angle)
    
    return correct, class_angle, class_side         

## Get Triangle from Sides
def getsidetriangle():
    class_side = ""
    class_angle = ""
    
    side.insert(0, float(input("Enter your first side length: ")))
    side.insert(1, float(input("Enter your second side length: ")))
    side.insert(2, float(input("Enter your third side length: ")))
    
    squared = [square(i) for i in sorted(side)]

    if side[0] <= 0 or side[1] <= 0 or side[2] <= 0:
        correct = valid[0]   
    elif side[0] + side[1] > side[2] and side[0] + side[2] > side[1] and side[1] + side[2] > side[2]:
        class_side = tri(side)
        correct = valid[1]
        if class_side == "equilateral":
            class_angle = "acute"
            for i in range(3):
                angle.append(60)
        else: # not equilateral
            angle.insert(0, lawcosines(side[0], side[1], side[2]))
            angle.insert(1, lawcosines(side[1], side[2], side[0]))
            angle.insert(2, lawcosines(side[2], side[0], side[1]))
            if angle[0] <= 0 or angle[1] <= 0 or angle[2] <= 0:
                correct = valid[0]
            elif squared[0] + squared[1] == squared[2]:
                class_angle = "right"
            else:
                class_angle = validangles()
    else: 
        correct = valid[0]
    
    return correct, class_angle, class_side