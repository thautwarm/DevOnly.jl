using MLStyle

f(x) = @match x begin
        1 => :one
        _ => :other
end
