module Main where

import AttributeGrammar

main :: IO ()
main = print binary

testTree :: R
testTree = Root (Leaf Zero)

test :: T_R
test = sem_R testTree

copy :: R
copy = copy_Syn_R (wrap_R test Inh_R)

testBinary :: B
testBinary = Bin (Bin Zero One) (Bin Zero One)

tBinary :: T_B
tBinary = sem_B testBinary

binary :: Int
binary = decimal_Syn_B (wrap_B tBinary Inh_B)