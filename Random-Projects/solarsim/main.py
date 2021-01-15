"""
    Solar Sim - main.py
    
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
# Imports

import math
import pandas as pd

# Variables

R = 8.3145 # universal gas constant
Na = 6.0221e23 # Avogadro's number
kj = 1.38066e23 # Boltzmann constant
kev = 8.617385e-5 # Boltzmann constant

## Tempatures in fahrenheit

Tmax = 149
Tmin = 59
Tpeak = 77

# Datawork - Thermal Conductivity 

therm = pd.read_csv("Kappa.csv")
therm = therm.dropna()
therm.head()

#kappa = therm['']
#print(kappa)

# Functions

def getmaterial():
    barrier = input("Enter what the material of the barrier is: ")
    barrier = str(barrier)
    return therm.loc[therm['Material'] == barrier]

def conduction():
    
    #Q = t * kappa / 
    
    pass

# Main Function

def main():
    
    kappa = getmaterial()
    print(kappa)

if __name__ == "__main__":
    # execute only if run as a script
    main()    