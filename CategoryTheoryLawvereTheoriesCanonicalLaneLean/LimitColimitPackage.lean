import canonicalLaneMathlib.AdmissibleClass
open HautevilleHouse.CategoryTheoryLawvereTheoriesCanonicalLaneLean

/-!
# Limit and Colimit Package
-/

namespace HautevilleHouse
namespace CategoryTheoryLawvereTheoriesCanonicalLaneLean

structure LimitColimitPackage (C : Type u) [CategoryStruct.{v} C] where
  hasLimits : Prop
  hasColimits : Prop
  limitConstruction : (J : Type w) → [CategoryStruct.{max u v} J] → (J → C) → C
  colimitConstruction : (J : Type w) → [CategoryStruct.{max u v} J] → (J → C) → C
  universalProperty : Prop

structure LimitColimitEvidence {C : Type u} [CategoryStruct.{v} C]
    (L : LimitColimitPackage C) where
  hasLimitsClosed : L.hasLimits
  hasColimitsClosed : L.hasColimits
  universalPropertyClosed : L.universalProperty
  limitConstructionClosed : ∀ (J : Type w) [CategoryStruct.{max u v} J] (D : J → C),
    L.limitConstruction J D ≅ limit D
  colimitConstructionClosed : ∀ (J : Type w) [CategoryStruct.{max u v} J] (D : J → C),
    L.colimitConstruction J D ≅ colimit D

def LimitColimitClosed {C : Type u} [CategoryStruct.{v} C]
    (L : LimitColimitPackage C) : Prop :=
  L.hasLimits ∧ L.hasColimits ∧ L.universalProperty ∧
  (∀ (J : Type w) [CategoryStruct.{max u v} J] (D : J → C),
    L.limitConstruction J D ≅ limit D) ∧
  (∀ (J : Type w) [CategoryStruct.{max u v} J] (D : J → C),
    L.colimitConstruction J D ≅ colimit D)

theorem limit_colimit_closed_from_evidence {C : Type u} [CategoryStruct.{v} C]
    (L : LimitColimitPackage C) (E : LimitColimitEvidence L) :
    LimitColimitClosed L := by
  exact And.intro E.hasLimitsClosed
    (And.intro E.hasColimitsClosed
      (And.intro E.universalPropertyClosed
        (And.intro E.limitConstructionClosed E.colimitConstructionClosed)))

end CategoryTheoryLawvereTheoriesCanonicalLaneLean
end HautevilleHouse
