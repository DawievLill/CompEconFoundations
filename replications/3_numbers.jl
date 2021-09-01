#=

LECTURE 3

Numbers

@author: Dawie van Lill <dvanlill@sun.ac.za>

@date: 2021-09-01

=#
using Decimals

function compound_interest(interest, compounding, investment, t)

    daily = 1 + interest / compounding
    dsum = investment * (daily ^ (compounding) * t)

    return dsum

end

p1 = compound_interest(0.04, 365, 1000, 10)
p2 = compound_interest(0.04, 365 * 24, 10e9, 100)
p3 = compound_interest(Decimal(0.04), 365 * 24, Decimal(10e9), 100)

diff = number(p3) - p2