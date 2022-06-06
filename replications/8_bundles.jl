

#=

LECTURE 8

Consumer choice model with OOP (using Type system in Julia)

@author: Dawie van Lill <dvanlill@sun.ac.za>

@date: 2022-06-06

=#

# Create the Bundle_good type

struct bundle_good{T<:AbstractString, S<:Number}

    items::Vector{T}
    n::S

end


function repr(x::bundle_good)
        
end

function add(x::bundle_good)
    
end

function sub(x::bundle_good)
    
end

function mul(x::bundle_good)
    
end

function truediv(x::bundle_good)
    
end