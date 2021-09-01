
#=

LECTURE 5

Control flow, user defined functions. 

@author: Dawie van Lill <dvanlill@sun.ac.za>

@date: 2021-09-01

=#

# If-then-else in Julia (wrapped in functions)

function ifelse_1()

    x = 2
    y = 2.0
    z = [1 2.1 3.0 0.0]

    if y == 2 && z[end] ≥ 0.0
        println("Condition 1")
    elseif y < 2
        println("Condition 2")
    else 
        println("Condition 3")
    end
end

function ifelse_2()

    x = true
    y = false

    if x && y
        println("Condition 1")
    elseif x && !(y)
        println("Condition 2")
    elseif !(x) && y
        println("Condition 3")
    elseif !(x) && !(y)
        println("Condition 4")
    else
        println("Condition 5")
    end
end

ifelse_2()