import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.CategoryTheoryLawvereTheoriesCanonicalLaneLean.LawvereTheoryPackage

namespace HautevilleHouse
namespace CategoryTheoryLawvereTheoriesCanonicalLaneLean

structure ModelCategoryPackage {L : LawvereTheoryPackage} where
  category : Type u
  productPreservingFunctors : Prop
  naturalTransformations : Prop
  modelStructure : Prop

structure ModelCategoryEvidence {L : LawvereTheoryPackage} (M : ModelCategoryPackage L) where
  productPreservingFunctorsClosed : M.productPreservingFunctors
  naturalTransformationsClosed : M.naturalTransformations
  modelStructureClosed : M.modelStructure

def ModelCategoryClosed {L : LawvereTheoryPackage} (M : ModelCategoryPackage L) : Prop :=
  M.productPreservingFunctors ∧ M.naturalTransformations ∧ M.modelStructure

theorem model_category_closed_from_evidence {L : LawvereTheoryPackage} (M : ModelCategoryPackage L) (E : ModelCategoryEvidence M) :
    ModelCategoryClosed M := by
  exact And.intro E.productPreservingFunctorsClosed (And.intro E.naturalTransformationsClosed E.modelStructureClosed)

end CategoryTheoryLawvereTheoriesCanonicalLaneLean
end HautevilleHouse