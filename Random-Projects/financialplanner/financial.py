"""
    Financial Planner - financial.py
    
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

# Global Functions
def carry(x): return base[0] - x
def year(x): return x * 12
def month(x): return x / 12
def todecimal(x): return float(x / 100)
def roundhundredth(x): return float(math.ceil(x * 100) / 100)
def interest(x, y, z): return roundhundredth(x * (1 + (month(todecimal(y)))) ** (year(z)))

def taxcalc(start, group, rate):
    tax = start * rate if start < group else group * rate
    return tax if tax > 0 else 0

def gettax():
    for i in range(7):
        tax.insert(i, taxcalc(base[i], bracket[i], percent[i]))
        base.insert(i + 1, carry(bracket[i]))
    tax.append(salary * .049)    
    return roundhundredth(sum(tax))

def getsalary():
    global salary
    check = ""
    
    while not(check == "hourly" or check == "salary"):
        check = input("Are you hourly or salary: ")
        check = check.lower()
        if check == "hourly":
            hourly = float(input("What do you make per hour: $"))
            salary = hourly * 40 * 50
            print("Your estimated salary is {:.2f}".format(salary))
        elif check == "salary":
            salary = float(input("What is your Salary: $"))
            print("Your estimated hourly wage is {:.2f}".format(salary / 40 / 50))
        else:
            print("Please input either hourly or salary.")
    int(salary)    

def pretax():
    check = ""
    fsa = math.inf
    hsa = math.inf
    
    retirement = int(input("How much percent of you salary do you contribute to your retirement: "))
    health = int(input("How much do you pay for health insurance a month: $"))
    
    while not(check == "hsa" or check == "health" or check == "health savings" or check == "fsa" or check == "flex" or check == "flex savings" or check == "none" or check == "na" or check == "no"):
        check = input("Do you have health savings(hsa) or flex savings(fsa): ")
        check = check.lower()
        if check == "hsa" or check == "health" or check == "health savings":
            while hsa >= 3550:
                hsa = int(input("How much do you put in the hsa savings for health care: $"))
                if hsa > 3550:
                    print("That value is too high")
                else:
                    base.insert(0, roundhundredth(int(salary - ((salary * (todecimal(retirement))) + year(health) + hsa))))
        elif check == "fsa" or check == "flex" or check == "flex savings":
            while fsa >= 2750:
                fsa = int(input("How much do you put in the flex savings for health care: $"))
                if fsa > 2750:
                    print("That value is too high")
                else:
                    base.insert(0, roundhundredth(int(salary - ((salary * (todecimal(retirement))) + year(health) + fsa)))) 
        elif check == "none" or check == "na" or check == "no":
            base.insert(0, roundhundredth(int(salary - ((salary * (todecimal(retirement))) + year(health)))))
        else:
            print("Please input either health savings(hsa) or flex savings(fsa).")   

def gettithing(full_tax):
    check = ""
    
    while not(check == "yes" or check == "y" or check == "no" or check == "n" ):
        check = input("Do you pay Tithing? (yes/no) ")
        check = check.lower()
        if check == "yes"or check == "y":
            tithing = roundhundredth(salary * .1)
            post_tax =  roundhundredth(base[0] - full_tax - tithing)   
            print("You will pay {:.2f} in taxes a year. You will pay {:.2f} in tithing a year.".format(full_tax, tithing))
            print("You would have {:.2f} after taxes, tithing, retirement, and health insurance.".format(post_tax))
            return int(post_tax)
        elif check == "no" or check == "n":
            post_tax =  roundhundredth(base[0] - full_tax)   
            print("You will pay {:.2f} in taxes a year.".format(full_tax))
            print("You would have {:.2f} after taxes, retirement, and health insurance.".format(post_tax))
            return int(post_tax)
        elif check == "na" or check == "help" or check == "n/a":
            print("Tithing is the donation of one-tenth of one’s income to God’s Church. This commandment has been known since Old Testament times.")
            print("It is done by the Church of Jesus Christ of Latter-Days Saints. (learn more at https://www.churchofjesuschrist.org/)")
            print("Now please pick yes or no.")
        else:
            print("Please input either yes or no.")

def gettransportation():
    check = ""
    
    while not(check == "car" or check == "public" or check == "train" or check == "bus" or check == "bike" or check == "foot" or check == "walking" or check == "other"):
        check = input("What is your mode of transportation? (car/train/bus/bike/foot/other) ")
        check = check.lower()
        if check == "car":
            car = []
            car.append(float(input("How much do spend to pay off your car loan a month: $")))
            car.append(float(input("How much do spend on car insurance a month: $")))
            car.append(float(input("How much do spend on gas a month: $")))
            return year(int(sum(car)))
        elif check == "public transportation" or check == "train" or check == "bus":
            public = float(input("How much do spend on public transportation a month: $"))
            return year(int(public))
        elif check == "bike":
            return 175
        elif check == "walking" or check == "foot":
            return 0
        elif check == "other":
            other = float(input("How much do spend on transportation a month: $"))
            return year(int(other))
        else:
            print("Please input either car, train, bus, bike, foot.")
            
def getexpenses(post):
    expenses = []
    expenses.append(year(float(input("How much do you spend on housing a month: $"))))
    expenses.append(gettransportation())
    expenses.append(year(float(input("How much do you spend a month on food: $"))))
    expenses.append(year(float(input("How much do you spend on utilities a month: $"))))
    expense = sum(expenses)
    post_expenses = post - expense
    print("You will have {:.2f} a year after expenses (${:.2f})!".format(post_expenses, expense))
    return int(post_expenses)

def getsavings(post):
    savings = math.inf
    while (savings > 100 or savings < 0):
        savings = float(input("Let's put money in savings! What percent do you want to save: "))
        if savings > 0 and savings <= 100:
            rate = float(input("What is the interest rate of your savings (APY): "))
            save = roundhundredth(post * (todecimal(savings)))
            for x in range(6):
                amount.insert(x, interest(save, rate, x))
                if x == 0:
                    print("You will put {:.2f} in savings a year.".format(save))
                else:
                    delta = amount[x] - amount[x-1]
                    if x == 1:
                        print("After a year you will have {:.2f} in your account. Your account increased by {:.2f} this year.".format(amount[x], roundhundredth(delta)))
                    else:
                        print("After {} years you will have {:.2f} in your account. Your account increased by {:.2f} this year.".format(x, amount[x], roundhundredth(delta)))
            return roundhundredth(post * (1 - todecimal(savings)))
        elif savings == 0:
            print("No savings I see.")
            return post
        else:
            print("Invalid percent to save")

def getspending(final):
    if month(final) <= 200:
        print("You don't have much spending money move expenses around")
    else:
        print("You have {:.2f} for spending money a year. So you have {:.2f} a month.".format(final, roundhundredth(month(final))))

# Global Arrays
base = []
tax = []
amount = []
bracket = [9875, 40125, 85523, 163300, 207350, 518400, math.inf]
percent = [.1, .12, .22, .24, .32, .35, .37]