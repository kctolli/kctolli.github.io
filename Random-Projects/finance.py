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

# Global Arrays
base = []
tax = []
amount = []
bracket = [9875, 40125, 85523, 163300, 207350, 518400, math.inf]
percent = [.1, .12, .22, .24, .32, .35, .37]

# Main Function

def main():

    salary = int(input("What is your Salary: $"))
    retirement = int(input("How much percent of you salary do you contribute to your retirement: "))
    health = int(input("How much do you pay for health insurance a month: $"))
    fsa = int(input("How much do you put in the flex savings for health care: $"))

    base.insert(0, roundhundredth(int(salary - ((salary * (todecimal(retirement))) + year(health) + fsa))))

    for i in range(7):
        tax.insert(i, taxcalc(base[i], bracket[i], percent[i]))
        base.insert(i + 1, carry(bracket[i]))

    tithing = roundhundredth(salary * .1)
    full_tax = roundhundredth(sum(tax) + (salary * .049))
    post_tax = roundhundredth(base[0] - full_tax - tithing)

    print("You will pay {} in taxes a year. You will pay {} in tithing a year.".format(roundhundredth(full_tax), tithing))
    print("You would have {} after taxes, tithing, retirement, and health insurance.".format(post_tax))

    housing = int(input("How much do you spend on housing a month: $"))
    car = int(input("How much do spend to pay off your car loan a month: $"))
    car_insurance = int(input("How much do spend on car insurance a month: $"))
    food = int(input("How much do you spend a month on food: $"))

    post_expenses = post_tax - (year(housing) + year(car + car_insurance) + year(food))

    print("You will have {} a year after expenses!".format(post_expenses))
    savings = int(input("Let's put money in savings! What percent do you want to save: "))

    if savings > 0:
        rate = float(input("What is the interest rate of your savings (APY): "))
        save = roundhundredth(post_expenses * (todecimal(savings)))
        for x in range(6):
            amount.insert(x, roundhundredth(save * (1 + (month(todecimal(rate)))) ** (year(x))))
            if x == 0:
                print("You will put {} in savings a year.".format(save))
            else:
                delta = amount[x] - amount[x-1]
                if x == 1:
                    print("After a year you will have {} in your account. Your account increased by {} this year.".format(amount[x], roundhundredth(delta)))
                else:
                    print("After {} years you will have {} in your account. Your account increased by {} this year.".format(x, amount[x], roundhundredth(delta)))                

    final = roundhundredth(post_expenses * (1 - todecimal(savings)))

    if month(final) <= 200:
        print("You don't have much spending money move expenses around")
    else:
        print("You have {} for spending money a year. So you have {} a month.".format(final, roundhundredth(month(final))))
    
if __name__ == "__main__":
    # execute only if run as a script
    main()    