"""
    Financial Planner - main.py
    
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

import financial as fin

# Main Function

def main():
    
    print("DISCLAIMER: This is an estimate for values. This will only give you an idea of what your expenses are and where your money goes.")
    print("WARNING: The state tax is set for Utah's tax rate which is 4.95%.")
    print("CAUTION: This is set for a single individual.")
    
    salary = fin.getsalary()
    fin.gethealth(salary)
    full_tax = fin.gettax(salary)
    post_tax = fin.gettithing(full_tax, salary)
    post_expenses = fin.getexpenses(post_tax)
    final = fin.getsavings(post_expenses)
    fin.getspending(final)
    
    
if __name__ == "__main__":
    # execute only if run as a script
    main()    