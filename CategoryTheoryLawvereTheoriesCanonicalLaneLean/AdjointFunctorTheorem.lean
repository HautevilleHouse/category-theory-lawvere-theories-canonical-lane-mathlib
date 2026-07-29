import canonicalLaneMathlib.AdmissibleClass
import canonicalLaneMathlib.MathlibObjects
import Mathlib.CategoryTheory.Adjunction.Basic

namespace HautevilleHouse
namespace CategoryTheoryLawvereTheoriesCanonicalLaneLean

open CategoryTheory

structure AdjointFunctorTheoremPackage where
  sourceCategory : Type u
  [sourceInst : Category.{v} sourceCategory]
  targetCategory : Type u
  [targetInst : Category.{v} targetCategory]
  functor : sourceCategory ⥤ targetCategory
  cocontinuous : PreservesColimits functor
  solutionSetCondition : SolutionSetCondition functor
  leftAdjointExists : IsLeftAdjoint functor

structure AdjointFunctorTheoremEvidence (P : AdjointFunctorTheoremPackage) where
  cocontinuousClosed : P.cocontinuous
  solutionSetConditionClosed : P.solutionSetCondition
  leftAdjointExistsClosed : P.leftAdjointExists

def AdjointFunctorTheoremClosed (P : AdjointFunctorTheoremPackage) : Prop :=
  P.cocontinuous ∧ P.solutionSetCondition ∧ P.leftAdjointExists

theorem adjoint_functor_theorem_closed_from_evidence
    (P : AdjointFunctorTheoremPackage) (E : AdjointFunctorTheoremEvidence P) :
    AdjointFunctorTheoremClosed P := by
  exact And.intro E.cocontinuousClosed
    (And.intro E.solutionSetConditionClosed E.leftAdjointExistsClosed)

end CategoryTheoryLawvereTheoriesCanonicalLaneLean
end HautevilleHouse