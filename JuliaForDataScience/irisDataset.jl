using VegaDatasets
using DataVoyager
using VegaLite

data = dataset("iris")

vscodedisplay(data)

v = Voyager(data)

p = v[]

save("iris_01.png", p)


