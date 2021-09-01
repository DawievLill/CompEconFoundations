#=

LECTURE 3

Numbers

@author: Dawie van Lill <dvanlill@sun.ac.za>

@date: 2021-09-01

=#

struct params
    interest
    compounding
    investment
    t
end

p1 = params(0.04, 365, 1000, 10)
p2 = params(0.04, 354 * 24, 10e9, 100)

function compound_interest(p::params)

    daily = 1 + p.interest / p.compounding
    dsum = p.investment * (daily ^ (p.compounding) * p.t)

    return dsum

end

