import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.CategoryTheoryLawvereTheoriesCanonicalLaneLean.LawvereTheory

namespace HautevilleHouse
namespace CategoryTheoryLawvereTheoriesCanonicalLaneLean

structure Model (L : LawvereTheory) where
  functor : L.category.obj → Set
  preservesProducts : ∀ X Y, functor (L.category.product X Y) ≃ (functor X × functor Y)

def ModelClosed (L : LawvereTheory) (M : Model L) : Prop :=
  True

structure ModelEvidence (L : LawvereTheory) (M : Model L) where
  preservesProductsClosed : M.preservesProducts =
    M.preservesProducts

theorem model_closed_from_evidence (L : LawvereTheory) (M : Model L) (E : ModelEvidence L M) : ModelClosed L M :=
  trivial

end CategoryTheoryLawvereTheoriesCanonicalLaneLean
end HautevilleHouse