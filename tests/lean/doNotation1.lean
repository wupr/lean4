new_frontend

def f1 (x : Nat) : IO Nat := do
y := 1  -- error 'y' cannot be reassigned

def f2 (xs : List (Nat × Nat)) : List (Nat × Nat) := do
for (x, y) in xs do
  (y, x) := (x, y) -- error 'y' (and 'x') cannot be reassigned

def f3 (xs : List (Nat × Nat)) : List (Nat × Nat) := do
for p in xs do
  p := (p.2, p.1) -- works. `forInMap` requires a variable

inductive Vector (α : Type) : Nat → Type
| nil  : Vector α 0
| cons : α → {n : Nat} → Vector α n → Vector α (n+1)

def f4 (b : Bool) (n : Nat) (v : Vector Nat n) : Vector Nat (n+1) := do
if b then
  v := Vector.cons 1 v
Vector.cons 1 v

def f5 (xs : List Nat) : List Bool := do
for x in xs do
  x := true -- invalid reassigned

def f6 (xs : List Nat) : IO (List Nat) := do
for x in xs do -- type error
  IO.println x

def f7 (xs : List Nat) : IO Unit := do
unless xs.isEmpty do
  break -- error must be inside 'for'

def f8 (xs : List Nat) : IO Unit := do
unless xs.isEmpty do
  continue -- error must be inside 'for'

def f9 (xs : List Nat) : IO Unit := do
return xs -- error, must be last element in the sequence
return xs

def f10 (x : Nat) : IO Unit := do
IO.println x

#print f10 -- we do not generate an unnecessary bind
