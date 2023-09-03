function pmt(r, N,P)
    c = r * P / (1-(1+r)^-N)
end

r = 3.92/100/12
N = 30*12
P = 100000

c = pmt(r,N,P)

total = c*N;

function pmt_table(APR, years, amount)
    r = APR/ 100/12
    N = years*12
    P = amount
    c = pmt(r,N,P)

    B = P 
    A = r*B
    S = c
    E = B+A-S
    data = [B,A,S,E]
    for i in 1:(N-1)
        B = E
        A = r*B
        S = c
        E = B+A-S
        push!(data, B,A,S,E)
    end
    wide = reshape(data, 4,N)
    tall = transpose(wide)
    tallArray = Array(tall)
    return tallArray
end

APR = 3.92
years = 30
amount = 100000

data = pmt_table(APR, years,amount)

vscodedisplay(data)

using DelimitedFiles

writedlm("pmt_tale.csv",data, ',')

interest = data[:,2]
payment = data[:,3]

p_pmt = payment-interest

using CairoMakie

f = Figure(resolution=(750,325))
f

ax = Axis(f[1,1],title="Monthly Payments", xlabel="Months",ylabel="Dollars",
    xlabelsize=10, xticklabelsize=9,ylabelsize=10, yticksize=3,
    yticklabelsize=9,ytickformat="\${:d}",xticksize=3, titlesize=12)

f

lineobj1 = lines!(ax,p_pmt, linewidth=1,color=:blue)
lineobj2 = lines!(ax,interest, linewidth=1,color=:red)
lineobj3 = lines!(ax,payment, linewidth=1,color=:green)
f

leg = Legend(f[1,1], [lineobj1, lineobj2,lineobj3], ["Principal", "Interest","Total_Payment"],halign=:right,valign=:center,tellheight=false, tellwidth=false,margin=(10,10,10,10),labelsize=10,linewidth=1, padding=(10,10,5,5),patchsize=(15,5))
f

function total_p_ptm(p_pmt)
    runningtotal = p_pmt[1]
    data = [runningtotal]
    for i in 2:length(p_pmt)
        runningtotal = runningtotal+p_pmt[i]
        push!(data, runningtotal)
    end
    return data
end

p_pmt_sum = total_p_ptm(p_pmt)
vscodedisplay(p_pmt_sum)

function total_int(interest)
    runningtotal = interest[1]
    data = [runningtotal]
    for i in 2: length(interest)
        runningtotal = runningtotal+interest[i]
        push!(data, runningtotal)
    end
    return data
end

intsum = total_int(interest)
vscodedisplay(intsum)

ax2 = Axis(f[1,2],title="Cumalative Payments", xlabel="Months",
    xlabelsize=10, xticklabelsize=9, yticksize=3,
    yticklabelsize=7,ytickformat="\${:d}",xticksize=3, titlesize=12)

f

lineobj4 = lines!(ax2,p_pmt_sum, linewidth=1,color=:blue)
lineobj5 = lines!(ax2,intsum, linewidth=1,color=:red)
f

leg = Legend(f[1,2], [lineobj4, lineobj5], ["Principal", "Interest",],halign=:center,valign=:top,tellheight=false, tellwidth=false,margin=(10,10,10,10),labelsize=10,linewidth=1, padding=(10,10,5,5),patchsize=(15,5))
f

save("mortgage-calculator.png", f)

f