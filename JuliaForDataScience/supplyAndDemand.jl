P_supply(Q) = (Q + 6) / 3
P_demand(Q) = (-Q + 32) / 2

using CairoMakie

f = Figure(resolution=(325,325))

ax = Axis(f[1,1],title="Supply And Demand Curve", xlabel="Quantity",ylabel="Price",
    xlabelsize=10, xticklabelsize=10,ylabelsize=10, yticksize=3,
    yticklabelsize=9,ytickformat="\${:d}",xticksize=3, titlesize=12)

f

Q_range = 1:25

lineObj1 = lines!(ax, Q_range, P_supply,linewidth=1, color=:blue)
f

lineObj2 = lines!(ax, Q_range, P_demand,linewidth=1, color=:red)
f

leg = Legend(f[1,1], [lineObj1, lineObj2], ["Supply", "Demand"],halign=:right,valign=:top,tellheight=false, tellwidth=false,margin=(10,10,10,10),labelsize=7,linewidth=1, padding=(10,10,5,5),patchsize=(20,10))
f

A = [1 -3; 1 2]
b = [-6,32]

using LinearAlgebra

e_Q,e_P = A\b
println(e_Q)
println(e_P)

vlines!(ax, [e_Q], ymax=[0.411], linewidth=1, linestyle=:dash, color=:green)

f

hlines!(ax, [e_P], xmax=[0.645],linewidth=1,linestyle=:dash,color=:green)
f
P_supply(Q) = (Q + 6) / 3
P_demand(Q) = (-Q + 32) / 2

using CairoMakie

f = Figure(resolution=(325,325))

ax = Axis(f[1,1],title="Supply And Demand Curve", xlabel="Quantity",ylabel="Price",
    xlabelsize=10, xticklabelsize=10,ylabelsize=10, yticksize=3,
    yticklabelsize=9,ytickformat="\${:d}",xticksize=3, titlesize=12)

f

Q_range = 1:25

lineObj1 = lines!(ax, Q_range, P_supply,linewidth=1, color=:blue)
f

lineObj2 = lines!(ax, Q_range, P_demand,linewidth=1, color=:red)
f

leg = Legend(f[1,1], [lineObj1, lineObj2], ["Supply", "Demand"],halign=:right,valign=:top,tellheight=false, tellwidth=false,margin=(10,10,10,10),labelsize=7,linewidth=1, padding=(10,10,5,5),patchsize=(20,10))
f

A = [1 -3; 1 2]
b = [-6,32]

using LinearAlgebra

e_Q,e_P = A\b
println(e_Q)
println(e_P)

vlines!(ax, [e_Q], ymax=[0.411], linewidth=1, linestyle=:dash, color=:green)

f

hlines!(ax, [e_P], xmax=[0.645],linewidth=1,linestyle=:dash,color=:green)
f