# DevOnly.jl

Introduce package dependencies that are only used for development, eliminating "runtime-free" macro packages such as MLStyle.jl.

## Usage

Suppose we have such a module:
```julia
module MyMod

using DevOnly
@devonly using MLStyle

f(x) = @match x begin
    1 => :one
    2 => :two
    _ => :other
end

end
```

Then we create a script by copying `regenerate.jl` to the root directory of the package, and run it:

```bash
> julia regenerate.jl
```

Then we can use `MyMod` without including MLStyle.jl:

```julia
Pkg.activate(".")
using MyMod

# MLStyle is not loaded!
isdefined(MyMod, :MLStyle) # => false

# but the macro works!

f(1) # :one
f(2) # :two
f(3) # :other
```

# Generate Compiled Files Compatible to Early Julia Versions?

Change `regenerate.jl`, set `julia_compiler` to a path to an early Julia version.

```
julia_compiler = "/path/to/julia-1.5"
```

Then run `regenerate.jl` again.
