
#=

LECTURE 36: Part 1

Simulations

@author: Dawie van Lill <dvanlill@sun.ac.za>

@date: 2021-11-29

=#

using Distributions
using Random

function game(p = 0.5; nsteps = 10)

    i, tails, heads, balance = 1, 0, 0, [0.]

    while true

        coin = rand() > p

        tails = ifelse(coin, tails + 1, 0)
        heads = ifelse(!coin, heads + 1, 0)

        i += 1

        if tails == 3 | heads == 3
            increment = ifelse(tails == 3, 10, -10)
            append!(balance, balance[end] + increment)
            heads, tails = 0, 0
        else
            append!(balance, balance[end])
        end

        if nsteps & i ≥ nsteps
            break
        end

    end
    return balance[end], balance, i
end

data = [game(nsteps = 250) for i in 1:10]

# Something not exactly right with the function. Needs work. 