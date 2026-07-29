import CategoryTheoryLawvereTheoriesCanonicalLaneLean.LawvereTheory

namespace HautevilleHouse
namespace CategoryTheoryLawvereTheoriesCanonicalLaneLean

structure LimitsPackage (L : LawvereTheory) where
  hasLimits : Prop
  hasColimits : Prop
  limitPreservingModels : Prop
  colimitPreservingModels : Prop

structure LimitsEvidence (L : LawvereTheory) (P : LimitsPackage L) where
  hasLimitsClosed : P.hasLimits
  hasColimitsClosed : P.hasColimits
  limitPreservingModelsClosed : P.limitPreservingModels
  colimitPreservingModelsClosed : P.colimitPreservingModels

def LimitsClosed (L : LawvereTheory) (P : LimitsPackage L) : Prop :=
  P.hasLimits ∧ P.hasColimits ∧ P.limitPreservingModels ∧ P.colimitPreservingModels

theorem limits_closed_from_evidence (L : LawvereTheory) (P : LimitsPackage L)
    (E : LimitsEvidence L P) : LimitsClosed L P := by
  exact And.intro E.hasLimitsClosed (And.intro E.hasColimitsClosed
    (And.intro E.limitPreservingModelsClosed E.colimitPreservingModelsClosed))

end CategoryTheoryLawvereTheoriesCanonicalLaneLean
end HautevilleHouse