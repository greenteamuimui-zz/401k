Captain401: Code Challenge
=================================

Hi there!  We're very happy that you're interested in working for Captain401's engineering team.  To get a better idea of your current development skills, we'd like for you to complete a code challenge - build a program according to a set of requirements. Please time box this to 2 hours.

The actual business requirements are linked below, but here are the general tech requirements:

1. Write your code using whatever language or framework you feel most comfortable in.
1. It doesn't matter if you build this as a front-end app, a service, a command line program, etc.
1. Make sure your solution is runnable on Mac OS X or Linux.
1. Do not require any for-pay software.
1. Include instructions for setting up and running your program.
1. Make sure you write some tests (100% coverage is not required).

Feel free to email me at [paul@captain401.com](paul@captain401.com) if you have any questions.

## Submission Instructions

1. Create (and switch to) a new branch in your local repository:

  ```bash
  % git checkout -b new-branch-name
  ```

1. Complete the project as described below within your local repository. Please commit as often as you can.
1. Zip up this entire directory
  ```bash
  % cd ..
  % zip -r skipper401.zip skipper401
  ```

1. Email the .zip file to [paul@captain401.com](paul@captain401.com).

If you have any questions about this submission process, feel free to email me.

## The Problem

### Overview

Captain401 is a 401(k) provider. We receive two files from our customers (or their HR system): a census (person, salary, settings) and a payroll journal every time their employees are paid (person, amount paid, etc).

The way that 401(k)'s work is: every time you are paid, a certain % of your pay is diverted to a different account. This is your "contribution rate". Your employer is encouraged to match your contributions up to a certain percentage of your pay, to encourage you to contribute at least that amount.

These funds are then used to buy shares in market-based assets like stocks and mutual funds. The particular assets, and how many are bought, are either chosen by the employee, or like in our system, are determined by a "risk profile".

### Requirements

Write a simple program that does the following:

### Phase 1:
1. Read the payroll file `payroll_631fa526.csv`, and the census file `census_1498456690.csv`.
1. Output the amount of money contributed by each person for this payroll. (Note the `contribution_rate_pct` column in the census file)

### Phase 2:
1. Output the employer match dollar amount (Note `match_rate_pct` in census), and then sum the amount matched by the company for all the employees (so we know how much to charge them).

### Phase 3:
1. For each participant's risk setting (in the census), buy the appropriate shares of funds using `risk_symbol.csv` and `symbol_price.csv` with the funds from this payroll (and the company matched funds!)
1. Output the shares, money amount, % bought of the funds, and the participant's portfolio value.

Things we care about:

* Noticing and documenting edge cases
* What approach you take to testing
* Documenting the method for setting up and running your application
* Fulfilling the basic requirements
* Breaking the problem into smaller parts and clearly connecting each part (separating your concerns)
* How you organize your code
* What you would do differently if this was for real (no time constraints, etc.)

We don't care about:

* Working through all of the edge cases
* Lots of features or anything impressive
* Creating something beautifully styled and aesthetically pleasing
