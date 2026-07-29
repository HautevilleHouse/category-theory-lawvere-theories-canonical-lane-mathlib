import HautevilleHouse.CategoryTheoryLawvereTheoriesCanonicalLaneLean.LawvereTheoryPackage

namespace HautevilleHouse
namespace CategoryTheoryLawvereTheoriesCanonicalLaneLean

structure LimitsPackage (L : LawvereTheory) where
  hasProducts : Prop
  hasEqualizers : Prop
  hasPullbacks : Prop
  limitsProof : hasProducts ∧ hasEqualizers ∧ hasPullbacks

structure LimitsEvidence (L : LawvereTheory) (P : LimitsPackage L) where
  productsClosed : P.hasProducts
  equalizersClosed : P.hasEqualizers
  pullbacksClosed : P.hasPullbacks

def LimitsClosed (L : LawvereTheory) (P : LimitsPackage L) : Prop :=
  P.hasProducts ∧ P.hasEqualizers ∧ P.hasPullbacks

theorem limits_closed_from_evidence (L : LawvereTheory) (P : LimitsPackage L) (E : LimitsEvidence L P) :
    LimitsClosed L P := by
  exact And.intro E.productsClosed (And.intro E.equalizersClosed E.pullbacksClosed)

structure ColimitsPackage (L : LawvereTheory) where
  hasCoproducts : Prop
  hasCoequalizers : Prop
  hasPushouts : Prop
  colimitsProof : hasCoproducts ∧ hasCoequalizers ∧ hasPushouts

structure ColimitsEvidence (L : LawvereTheory) (P : ColimitsPackage L) where
  coproductsClosed : P.hasCoproducts
  coequalizersClosed : P.hasCoequalizers
  pushoutsClosed : P.hasPushouts

def ColimitsClosed (L : LawvereTheory) (P : ColimitsPackage L) : Prop :=
  P.hasCoproducts ∧ P.hasCoequalizers ∧ P.hasPushouts

theorem colimits_closed_from_evidence (L : LawvereTheory) (P : ColimitsPackage L) (E : ColimitsEvidence L P) :
    ColimitsClosed L P := by
  exact And.intro E.coproductsClosed (And.intro E.coequalizersClosed E.pushoutsClosed)

end CategoryTheoryLawvereTheoriesCanonicalLaneLean
end HautevilleHouse
