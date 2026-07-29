import HautevilleHouse.CategoryTheoryLawvereTheoriesCanonicalLaneLean.BridgeLemmas

namespace HautevilleHouse
namespace CategoryTheoryLawvereTheoriesCanonicalLaneLean

structure LimitsPackage where
  category : Type u
  [cat : Category category]
  hasSmallLimits : HasLimitsOfSize.{w, w} category
  limitPreservingFunctors : Set (category ⥤ category)
  limitCreationCondition : Prop

structure LimitsEvidence (L : LimitsPackage) where
  hasSmallLimitsClosed : L.hasSmallLimits
  limitCreationConditionClosed : L.limitCreationCondition

def LimitsClosed (L : LimitsPackage) : Prop :=
  L.hasSmallLimits ∧ L.limitCreationCondition

theorem limits_closed_from_evidence (L : LimitsPackage) (E : LimitsEvidence L) :
    LimitsClosed L := by
  exact And.intro E.hasSmallLimitsClosed E.limitCreationConditionClosed

structure ColimitsPackage where
  category : Type u
  [cat : Category category]
  hasSmallColimits : HasColimitsOfSize.{w, w} category
  colimitPreservingFunctors : Set (category ⥤ category)
  colimitCreationCondition : Prop

structure ColimitsEvidence (C : ColimitsPackage) where
  hasSmallColimitsClosed : C.hasSmallColimits
  colimitCreationConditionClosed : C.colimitCreationCondition

def ColimitsClosed (C : ColimitsPackage) : Prop :=
  C.hasSmallColimits ∧ C.colimitCreationCondition

theorem colimits_closed_from_evidence (C : ColimitsPackage) (E : ColimitsEvidence C) :
    ColimitsClosed C := by
  exact And.intro E.hasSmallColimitsClosed E.colimitCreationConditionClosed

theorem limits_and_colimits_bridge (L : LimitsPackage) (LE : LimitsEvidence L) (C : ColimitsPackage) (CE : ColimitsEvidence C) (A : AdmissibleClass) :
    bridgeClosed A := by
  exact bridge_from_admissible_class A

end CategoryTheoryLawvereTheoriesCanonicalLaneLean
end HautevilleHouse
