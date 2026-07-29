import canonicalLaneMathlib.AdmissibleClass
import canonicalLaneMathlib.MathlibObjects
import Mathlib.CategoryTheory.Limits.Shapes.Terminal

namespace HautevilleHouse
namespace CategoryTheoryLawvereTheoriesCanonicalLaneLean

open CategoryTheory

structure LimitsColimitsPackage where
  theory : LawvereTheory
  hasTerminal : HasTerminal theory.category
  hasBinaryProducts : HasBinaryProducts theory.category
  hasEqualizers : HasEqualizers theory.category
  hasPushouts : HasPushouts theory.category
  terminalLimitCondition : TerminalIsLimit theory.category
  binaryProductsLimitCondition : (∀ A B : theory.category, IsLimit (binaryProductFan A B))

def LimitsColimitsClosed (P : LimitsColimitsPackage) : Prop :=
  P.hasTerminal ∧ P.hasBinaryProducts ∧ P.hasEqualizers ∧ P.hasPushouts ∧
  P.terminalLimitCondition ∧ P.binaryProductsLimitCondition

theorem limits_colimits_closed_from_existence (P : LimitsColimitsPackage) :
    LimitsColimitsClosed P := by
  exact And.intro P.hasTerminal
    (And.intro P.hasBinaryProducts
      (And.intro P.hasEqualizers
        (And.intro P.hasPushouts
          (And.intro P.terminalLimitCondition P.binaryProductsLimitCondition))))

end CategoryTheoryLawvereTheoriesCanonicalLaneLean
end HautevilleHouse