import canonicalLaneMathlib.AdmissibleClass
open HautevilleHouse.CategoryTheoryLawvereTheoriesCanonicalLaneLean

/-!
# Adjunction Package
-/

namespace HautevilleHouse
namespace CategoryTheoryLawvereTheoriesCanonicalLaneLean

structure AdjunctionPackage (L : LawvereTheoryPackage) where
  leftAdj : Type u → Type v
  rightAdj : Type v → Type u
  unitNat : Prop
  counitNat : Prop
  triangleIdentities : Prop

structure AdjunctionEvidence {L : LawvereTheoryPackage}
    (A : AdjunctionPackage L) where
  unitNatClosed : A.unitNat
  counitNatClosed : A.counitNat
  triangleIdentitiesClosed : A.triangleIdentities
  adjunctionIso : ∀ (X : Type u) (Y : Type v),
    (A.leftAdj X → Y) ≃ (X → A.rightAdj Y)

def AdjunctionClosed {L : LawvereTheoryPackage}
    (A : AdjunctionPackage L) : Prop :=
  A.unitNat ∧ A.counitNat ∧ A.triangleIdentities ∧
  (∀ (X : Type u) (Y : Type v), (A.leftAdj X → Y) ≃ (X → A.rightAdj Y))

theorem adjunction_closed_from_evidence {L : LawvereTheoryPackage}
    (A : AdjunctionPackage L) (E : AdjunctionEvidence A) :
    AdjunctionClosed A := by
  exact And.intro E.unitNatClosed
    (And.intro E.counitNatClosed
      (And.intro E.triangleIdentitiesClosed E.adjunctionIso))

end CategoryTheoryLawvereTheoriesCanonicalLaneLean
end HautevilleHouse
