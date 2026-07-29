import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryLawvereTheoriesCanonicalLaneLean

structure AdjointFunctorPackage where
  leftFunctor : Type u
  rightFunctor : Type v
  unitNaturalTransformation : Prop
  counitNaturalTransformation : Prop
  triangleIdentities : Prop

structure AdjointFunctorEvidence (A : AdjointFunctorPackage) where
  unitNaturalTransformationClosed : A.unitNaturalTransformation
  counitNaturalTransformationClosed : A.counitNaturalTransformation
  triangleIdentitiesClosed : A.triangleIdentities

def AdjointFunctorClosed (A : AdjointFunctorPackage) : Prop :=
  A.unitNaturalTransformation ∧ A.counitNaturalTransformation ∧ A.triangleIdentities

theorem adjoint_functor_closed_from_evidence (A : AdjointFunctorPackage) (E : AdjointFunctorEvidence A) :
    AdjointFunctorClosed A := by
  exact And.intro E.unitNaturalTransformationClosed
    (And.intro E.counitNaturalTransformationClosed E.triangleIdentitiesClosed)

end CategoryTheoryLawvereTheoriesCanonicalLaneLean
end HautevilleHouse
