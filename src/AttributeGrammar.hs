

{-# LANGUAGE LambdaCase #-}
-- UUAGC 0.9.42.3 (AttributeGrammar)
module AttributeGrammar where
-- B -----------------------------------------------------------
data B = Bin (B) (B)
       | One
       | Zero
       deriving ( Show)
-- cata
sem_B :: B ->
         T_B
sem_B (Bin _b1 _b2) =
    (sem_B_Bin (sem_B _b1) (sem_B _b2))
sem_B (One) =
    (sem_B_One)
sem_B (Zero) =
    (sem_B_Zero)
-- semantic domain
type T_B = ( B,( Int ))
data Inh_B = Inh_B {}
data Syn_B = Syn_B {copy_Syn_B :: B,decimal_Syn_B :: ( Int )}
wrap_B :: T_B ->
          Inh_B ->
          Syn_B
wrap_B sem (Inh_B) =
    (let ( _lhsOcopy,_lhsOdecimal) = sem
     in  (Syn_B _lhsOcopy _lhsOdecimal))
sem_B_Bin :: T_B ->
             T_B ->
             T_B
sem_B_Bin b1_ b2_ =
    (let _lhsOdecimal :: ( Int )
         _lhsOcopy :: B
         _b1Icopy :: B
         _b1Idecimal :: ( Int )
         _b2Icopy :: B
         _b2Idecimal :: ( Int )
         _lhsOdecimal =
             ({-# LINE 37 "./AttributeGrammar.ag" #-}
              _b1Idecimal * _b1Idecimal + _b2Idecimal
              {-# LINE 44 "AttributeGrammar.hs" #-}
              )
         _copy =
             ({-# LINE 29 "./AttributeGrammar.ag" #-}
              Bin _b1Icopy _b2Icopy
              {-# LINE 49 "AttributeGrammar.hs" #-}
              )
         _lhsOcopy =
             ({-# LINE 29 "./AttributeGrammar.ag" #-}
              _copy
              {-# LINE 54 "AttributeGrammar.hs" #-}
              )
         ( _b1Icopy,_b1Idecimal) =
             b1_
         ( _b2Icopy,_b2Idecimal) =
             b2_
     in  ( _lhsOcopy,_lhsOdecimal))
sem_B_One :: T_B
sem_B_One =
    (let _lhsOdecimal :: ( Int )
         _lhsOcopy :: B
         _lhsOdecimal =
             ({-# LINE 36 "./AttributeGrammar.ag" #-}
              1
              {-# LINE 68 "AttributeGrammar.hs" #-}
              )
         _copy =
             ({-# LINE 29 "./AttributeGrammar.ag" #-}
              One
              {-# LINE 73 "AttributeGrammar.hs" #-}
              )
         _lhsOcopy =
             ({-# LINE 29 "./AttributeGrammar.ag" #-}
              _copy
              {-# LINE 78 "AttributeGrammar.hs" #-}
              )
     in  ( _lhsOcopy,_lhsOdecimal))
sem_B_Zero :: T_B
sem_B_Zero =
    (let _lhsOdecimal :: ( Int )
         _lhsOcopy :: B
         _lhsOdecimal =
             ({-# LINE 35 "./AttributeGrammar.ag" #-}
              0
              {-# LINE 88 "AttributeGrammar.hs" #-}
              )
         _copy =
             ({-# LINE 29 "./AttributeGrammar.ag" #-}
              Zero
              {-# LINE 93 "AttributeGrammar.hs" #-}
              )
         _lhsOcopy =
             ({-# LINE 29 "./AttributeGrammar.ag" #-}
              _copy
              {-# LINE 98 "AttributeGrammar.hs" #-}
              )
     in  ( _lhsOcopy,_lhsOdecimal))
-- E -----------------------------------------------------------
data E = Add (B) (B)
       | Leaf (B)
       | Split (E) (E)
       deriving ( Show)
-- cata
sem_E :: E ->
         T_E
sem_E (Add _b1 _b2) =
    (sem_E_Add (sem_B _b1) (sem_B _b2))
sem_E (Leaf _b) =
    (sem_E_Leaf (sem_B _b))
sem_E (Split _e1 _e2) =
    (sem_E_Split (sem_E _e1) (sem_E _e2))
-- semantic domain
type T_E = ( E)
data Inh_E = Inh_E {}
data Syn_E = Syn_E {copy_Syn_E :: E}
wrap_E :: T_E ->
          Inh_E ->
          Syn_E
wrap_E sem (Inh_E) =
    (let ( _lhsOcopy) = sem
     in  (Syn_E _lhsOcopy))
sem_E_Add :: T_B ->
             T_B ->
             T_E
sem_E_Add b1_ b2_ =
    (let _lhsOcopy :: E
         _b1Icopy :: B
         _b1Idecimal :: ( Int )
         _b2Icopy :: B
         _b2Idecimal :: ( Int )
         _copy =
             ({-# LINE 29 "./AttributeGrammar.ag" #-}
              Add _b1Icopy _b2Icopy
              {-# LINE 137 "AttributeGrammar.hs" #-}
              )
         _lhsOcopy =
             ({-# LINE 29 "./AttributeGrammar.ag" #-}
              _copy
              {-# LINE 142 "AttributeGrammar.hs" #-}
              )
         ( _b1Icopy,_b1Idecimal) =
             b1_
         ( _b2Icopy,_b2Idecimal) =
             b2_
     in  ( _lhsOcopy))
sem_E_Leaf :: T_B ->
              T_E
sem_E_Leaf b_ =
    (let _lhsOcopy :: E
         _bIcopy :: B
         _bIdecimal :: ( Int )
         _copy =
             ({-# LINE 29 "./AttributeGrammar.ag" #-}
              Leaf _bIcopy
              {-# LINE 158 "AttributeGrammar.hs" #-}
              )
         _lhsOcopy =
             ({-# LINE 29 "./AttributeGrammar.ag" #-}
              _copy
              {-# LINE 163 "AttributeGrammar.hs" #-}
              )
         ( _bIcopy,_bIdecimal) =
             b_
     in  ( _lhsOcopy))
sem_E_Split :: T_E ->
               T_E ->
               T_E
sem_E_Split e1_ e2_ =
    (let _lhsOcopy :: E
         _e1Icopy :: E
         _e2Icopy :: E
         _copy =
             ({-# LINE 29 "./AttributeGrammar.ag" #-}
              Split _e1Icopy _e2Icopy
              {-# LINE 178 "AttributeGrammar.hs" #-}
              )
         _lhsOcopy =
             ({-# LINE 29 "./AttributeGrammar.ag" #-}
              _copy
              {-# LINE 183 "AttributeGrammar.hs" #-}
              )
         ( _e1Icopy) =
             e1_
         ( _e2Icopy) =
             e2_
     in  ( _lhsOcopy))
-- R -----------------------------------------------------------
data R = Root (E)
       deriving ( Show)
-- cata
sem_R :: R ->
         T_R
sem_R (Root _e) =
    (sem_R_Root (sem_E _e))
-- semantic domain
type T_R = ( R)
data Inh_R = Inh_R {}
data Syn_R = Syn_R {copy_Syn_R :: R}
wrap_R :: T_R ->
          Inh_R ->
          Syn_R
wrap_R sem (Inh_R) =
    (let ( _lhsOcopy) = sem
     in  (Syn_R _lhsOcopy))
sem_R_Root :: T_E ->
              T_R
sem_R_Root e_ =
    (let _lhsOcopy :: R
         _eIcopy :: E
         _copy =
             ({-# LINE 29 "./AttributeGrammar.ag" #-}
              Root _eIcopy
              {-# LINE 216 "AttributeGrammar.hs" #-}
              )
         _lhsOcopy =
             ({-# LINE 29 "./AttributeGrammar.ag" #-}
              _copy
              {-# LINE 221 "AttributeGrammar.hs" #-}
              )
         ( _eIcopy) =
             e_
     in  ( _lhsOcopy))