using JuMP
using GLPK


#Binary Knapsack Problem
model = Model(GLPK.Optimizer)

@variable(model, green, Bin)
@variable(model, blue, Bin)
@variable(model, orange, Bin)
@variable(model, yellow, Bin)
@variable(model, gray, Bin)

@constraint(model, weight,green*12 +orange*1+yellow*4+blue*2+gray*1<=15.0)

@objective(model, Max, green*4+blue*2+orange*1+yellow*10+gray*2)

optimize!(model)

boxes = [green, blue, orange, yellow, gray]

for box in boxes
    println(value(box))
end



#Multi Knapsack Problem
model = Model(GLPK.Optimizer)

@variable(model, green>=0, Int)
@variable(model, blue>=0, Int)
@variable(model, orange>=0, Int)
@variable(model, yellow>=0, Int)
@variable(model, gray>=0, Int)

@constraint(model, weight,
    green * 12 + blue * 2 + orange * 1 + yellow * 4 + gray * 1 <= 15
)
@objective(model, Max,
    green * 4 + blue * 2 + orange * 1 + yellow * 10 + gray * 2
)
optimize!(model)

boxes = [green, blue, orange, yellow, gray]

for box in boxes
    println(value(box))
end