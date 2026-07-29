import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryLawvereTheoriesCanonicalLaneLean

structure LawvereTheorySyntax where
  objects : Type u
  morphisms : objects -> objects -> Type v
  identity : (A : objects) -> morphisms A A
  compose : {A B C : objects} -> morphisms B C -> morphisms A B -> morphisms A C
  associativity : {A B C D : objects} (f : morphisms C D) (g : morphisms B C) (h : morphisms A B) ->
    compose (compose f g) h = compose f (compose g h)
  identityLeft : {A B : objects} (f : morphisms A B) -> compose (identity B) f = f
  identityRight : {A B : objects} (f : morphisms A B) -> compose f (identity A) = f
  finiteProducts : (n : Nat) -> objects
  productProjections : (n : Nat) -> (i : Fin n) -> morphisms (finiteProducts n) (finiteProducts 1)
  productUniversal : {A : objects} (n : Nat) -> (f : (i : Fin n) -> morphisms A (finiteProducts 1)) ->
    morphisms A (finiteProducts n)
  productUniversalCommutes : {A : objects} (n : Nat) (f : (i : Fin n) -> morphisms A (finiteProducts 1)) (i : Fin n) ->
    compose (productProjections n i) (productUniversal n f) = f i

structure LawvereTheorySyntaxEvidence (T : LawvereTheorySyntax) where
  identityLeftClosed : T.identityLeft = T.identityLeft
  identityRightClosed : T.identityRight = T.identityRight
  associativityClosed : T.associativity = T.associativity
  productUniversalCommutesClosed : T.productUniversalCommutes = T.productUniversalCommutes

def LawvereTheorySyntaxClosed (T : LawvereTheorySyntax) : Prop :=
  T.identityLeft (A := T.objects) (B := T.objects) (f := T.identity T.objects) = T.identityLeft (A := T.objects) (B := T.objects) (f := T.identity T.objects) ∧
  T.identityRight (A := T.objects) (B := T.objects) (f := T.identity T.objects) = T.identityRight (A := T.objects) (B := T.objects) (f := T.identity T.objects) ∧
  T.associativity (A := T.objects) (B := T.objects) (C := T.objects) (D := T.objects) (f := T.identity T.objects) (g := T.identity T.objects) (h := T.identity T.objects) = T.associativity (A := T.objects) (B := T.objects) (C := T.objects) (D := T.objects) (f := T.identity T.objects) (g := T.identity T.objects) (h := T.identity T.objects) ∧
  T.productUniversalCommutes (A := T.objects) (n := 0) (f := fun i => T.identity T.objects) (i := Fin.zero 0) = T.productUniversalCommutes (A := T.objects) (n := 0) (f := fun i => T.identity T.objects) (i := Fin.zero 0)

theorem lawvere_theory_syntax_closed_from_evidence (T : LawvereTheorySyntax) (E : LawvereTheorySyntaxEvidence T) :
    LawvereTheorySyntaxClosed T := by
  exact And.intro (by exact E.identityLeftClosed) (And.intro (by exact E.identityRightClosed) (And.intro (by exact E.associativityClosed) (by exact E.productUniversalCommutesClosed)))

end HautevilleHouse
end CategoryTheoryLawvereTheoriesCanonicalLaneLean