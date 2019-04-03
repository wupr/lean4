@[reducible] def Map : Type := RBMap Nat Bool (λ a b, a < b)

def mkMapAux : Nat → Map → Map
| 0 m := m
| (n+1) m := mkMapAux n (m.insert n (n % 10 = 0))

def mkMap (n : Nat) :=
mkMapAux n {}

def main (xs : List String) : IO UInt32 :=
let m := mkMap xs.head.toNat in
let v := m.fold (λ (r : Nat) (k : Nat) (v : Bool), if v then r + 1 else r) 0 in
IO.println (toString v) *>
pure 0
