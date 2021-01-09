"""
    Financial Planner
    
    main: finance.py
    
    libraries used: math - from python standard library
    
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

## Calculation Functions

def getsalary():
    check = ""
    salary = 0
    
    while not(check == "hourly" or check == "salary"):
        check = input("Are you hourly or salary: ")
        check = check.lower()
        if check == "hourly":
            hourly = float(input("What do you make per hour: $"))
            salary = hourly * 40 * 50
            print("Your estimated salary is {}".format(salary))
        elif check == "salary":
            salary = float(input("What is your Salary: $"))
        else:
            print("Please input either hourly or salary.")
            
    retirement = int(input("How much percent of you salary do you contribute to your retirement: "))
    health = int(input("How much do you pay for health insurance a month: $"))
    fsa = int(input("How much do you put in the flex savings for health care: $"))
    base.insert(0, roundhundredth(int(salary - ((salary * (todecimal(retirement))) + year(health) + fsa))))   
    
    return int(salary)

def taxcalc(start, group, rate):
    tax = start * rate if start < group else group * rate
    return tax if tax > 0 else 0

def gettax(salary):
    check = ""
    
    for i in range(7):
        tax.insert(i, taxcalc(base[i], bracket[i], percent[i]))
        base.insert(i + 1, carry(bracket[i]))
    
    full_tax = roundhundredth(sum(tax) + (salary * .049))
    
    while not(check == "yes" or check == "y" or check == "no" or check == "n" ):
        check = input("Do you pay Tithing? (yes/no)")
        check = check.lower()
        if check == "yes"or check == "y":
            tithing = roundhundredth(salary * .1)
            post_tax =  roundhundredth(base[0] - full_tax - tithing)   
            print("You will pay {} in taxes a year. You will pay {} in tithing a year.".format(full_tax, tithing))
            print("You would have {} after taxes, tithing, retirement, and health insurance.".format(post_tax))
            return int(post_tax)
        elif check == "no" or check == "n":
            post_tax =  roundhundredth(base[0] - full_tax)   
            print("You will pay {} in taxes a year.".format(full_tax))
            print("You would have {} after taxes, retirement, and health insurance.".format(post_tax))
            return int(post_tax)
        elif check == "na" or check == "help" or check == "n/a":
            print("Tithing is the donation of one-tenth of one’s income to God’s Church. This commandment has been known since Old Testament times.")
            print("It is done by the Church of Jesus Christ of Latter-Days Saints. (learn more at https://www.churchofjesuschrist.org/)")
            print("Now please pick yes or no.")
        else:
            print("Please input either yes or no.")

def getexpenses(tax):
    housing = int(input("How much do you spend on housing a month: $"))
    car = int(input("How much do spend to pay off your car loan a month: $"))
    car_insurance = int(input("How much do spend on car insurance a month: $"))
    food = int(input("How much do you spend a month on food: $"))
    post_expenses = tax - (year(housing) + year(car + car_insurance) + year(food))
    print("You will have {} a year after expenses!".format(post_expenses))
    if post_expenses <= tax * 2 / 3: print("Your expenses are high")
    return post_expenses

def getsavings(post):
    savings = int(input("Let's put money in savings! What percent do you want to save: "))
    if savings > 0:
        rate = float(input("What is the interest rate of your savings (APY): "))
        save = roundhundredth(post * (todecimal(savings)))
        for x in range(6):
            amount.insert(x, interest(save, rate, x))
            if x == 0:
                print("You will put {} in savings a year.".format(save))
            else:
                delta = amount[x] - amount[x-1]
                if x == 1:
                    print("After a year you will have {} in your account. Your account increased by {} this year.".format(amount[x], roundhundredth(delta)))
                else:
                    print("After {} years you will have {} in your account. Your account increased by {} this year.".format(x, amount[x], roundhundredth(delta)))
    return roundhundredth(post * (1 - todecimal(savings)))

def getspending(final):
    if month(final) <= 200:
        print("You don't have much spending money move expenses around")
    else:
        print("You have {} for spending money a year. So you have {} a month.".format(final, roundhundredth(month(final))))

# Global Arrays
base = []
tax = []
amount = []
bracket = [9875, 40125, 85523, 163300, 207350, 518400, math.inf]
percent = [.1, .12, .22, .24, .32, .35, .37]

# Main Function

def main():
    
    print("DISCLAIMER: This is an estimate for values. This will only give you an idea of what your expenses are and where your money goes.")
    print("WARNING: The state tax is set for Utah's tax rate which is 4.95%")
    
    salary = getsalary()
    post_tax = gettax(salary)
    post_expenses = getexpenses(post_tax)
    final = getsavings(post_expenses)
    getspending(final)
    
    
if __name__ == "__main__":
    # execute only if run as a script
    main()    