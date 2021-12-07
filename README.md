
# Foundations of Computational Economics

This is a repository where I translate the code of Fedor Iskhakov's [Foundations of Computational Economics](https://fedor.iskh.me/compecon) from Python to Julia. I will try and journal progress as far as possible. This is very much a side project, so it will probably take longer than anticipated.  

## Session 1

The general idea for this process is to gain an understanding of the key differences between Python and Julia, while also learning some new computational methods along the way. I will also try and track my hours for this, so that I don't spend too much time solving problems.  

- Mostly done with the replication of the Lecture 30 on the cake eating problem. **TODO**: Plotting.
- Learned about the **getindex** function and how to use in combination with **argmax**.
- Learned how to create a mask with respect to arrays, quite useful. 
- Finished the numbers exercise (Lecture 3) and learned about the [Decimals.jl](https://github.com/JuliaMath/Decimals.jl) package.
- Read through the lecture on types (Lecture 4). All of this is pretty standard and easy to implement in Julia. have worked through this type of material before, so nothing surprising. 
- The **!** operator works on Booleans, functions and missing values. Similar to **not** in Python when it comes to Boolean values. Its operation on functions is mutation, if I remember correctly. 

## Session 2

Started with the session on function approximation. Have worked through much of this material in other courses before. 

- Learned how to construct helper functions for plotting.
- Learned about the different types of interpolation packages in Julia, which includes [Interpolations.jl](https://github.com/JuliaMath/Interpolations.jl). 

## Session 3

Started with the session on the cake eating problem with discretized choice (Lecture 32)

- Learned about the Julia implementation of `np.newaxis`. In the creation of the consumption matrix, only had to broadcast on the transpose of the matrix. Much easier than the previous way that I tried to do this in Lecture 30.
- Basic structure of Lecture 32 laid out. TODO: Complete Lecture 32.
- Started with Lecture 35, skipped Lecture 33 and 34 for now. However, will come back to these.  

## Session 4

Trying to cover some of the earlier sessions. Most of the first few sessions are quite easy. There are many similarities between Python and Julia. Should not conceptually be difficult for someone to switch between the languages. 


