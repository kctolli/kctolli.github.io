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
# Import Libaries
import triangle as tri

## Main Functions
def main():
    check = ""
    
    while not(check == "side" or check == "sides" or check == "angle" or check == "angles"):
        check = input("Are you describing the triangle with angles or sides: ")
        check = check.lower()
    
        if check == "side" or check == "sides":
            correct, class_angle, class_side = tri.getsidetriangle() ## Get triangle from angles
            if correct == tri.valid[0]: ## Display not valid triangle
                print("These values do not produce a valid triangle.")
            elif correct == tri.valid[1]: ## Display valid triangle type
                print("These values produce a valid {}, {} triangle.".format(class_angle, class_side))
                print("The angles of the triangle are {:.2f}, {:.2f}, {:.2f}.".format(tri.angle[0], tri.angle[1], tri.angle[2]))
        elif check == "angle" or check == "angles":
            correct, class_angle, class_side = tri.getangletriangle() ## Get triangle from sides
            if correct == tri.valid[0]: ## Display not valid triangle
                print("These values do not produce a valid triangle.")
            elif correct == tri.valid[1]: ## Display valid triangle type
                print("These values produce a valid {}, {} triangle.".format(class_angle, class_side))


        
        
if __name__ == "__main__":
    # execute only if run as a script
    main()        