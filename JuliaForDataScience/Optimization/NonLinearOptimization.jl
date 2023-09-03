#=
Given 100 feet of total fencing material, enclose a rectangular yard
along a stone wall, using 3 sides of fencing, that maximizes the area
of that yard. =#

using Ipopt
using JuMP

model = Model(Ipopt.Optimizer)

@variable(model, x>=0, start=0)
@variable(model, y>=0, start=0)

@NLconstraint(model, x+2y == 100)   

@NLobjective(model,Max,x*y)

optimize!(model)

value(x)

value(y)

objective_value(model)

using Plots

plotlyjs(size=(550,500))

x = 0:100

area(x) = x*(100-x)/2

p = plot(x, area,title = "Maximize Area", xlabel = "Lenght",ylabel = "Area")

#=There is a race that involves runnnig east on a beach and swimming
North to an island. Measuring along the beach, a racer would have to run
6 miles to be directly south of the island. The island is 2 miles long
North of that point on the beach. The racer can run at 8mph and can swim at 3mph. 
The racer can enter the water at any point on the beach to begin swimming 
to the island.At what point should the racer enter the water to minimize the
total travel time to the island =#

model = Model(Ipopt.Optimizer)

@variable(model, 0<=x<=6, start=0)

@NLobjective(model, Min,x/8 + sqrt(x^2-12*x+40)/3)

optimize!(model)

value(x)

objective_value(model)


