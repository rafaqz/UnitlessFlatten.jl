module UnitlessFlatten

using Reexport, Unitful

@reexport using Flatten

import Flatten: flatten, reconstruct, retype, update!


flatten(x::Unitful.Quantity) = (x.val,) 
reconstruct(::T, data, n) where T <: Unitful.Quantity = (unit(T) * data[n],), n + 1
retype(::T, data, n) where T <: Unitful.Quantity = (unit(T) * data[n],), n + 1
update!(::T, data, n) where T <: Unitful.Quantity = (unit(T) * data[n],), n + 1

end # module
