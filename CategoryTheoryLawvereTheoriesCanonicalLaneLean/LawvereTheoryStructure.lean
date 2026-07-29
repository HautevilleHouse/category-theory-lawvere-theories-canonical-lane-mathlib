import categoricalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryLawvereTheoriesCanonicalLaneLean

structure LawvereTheoryStructurePackage where
  underlyingCategory : Type u
  finiteProducts : Prop
  productPreservingFunctors : Prop
  modelsCategory : Type v

structure LawvereTheoryStructureEvidence (P : LawvereTheoryStructurePackage) where
  finiteProductsClosed : P.finiteProducts
  productPreservingFunctorsClosed : P.productPreservingFunctors

def LawvereTheoryStructureClosed (P : LawvereTheoryStructurePackage) : Prop :=
  P.finiteProducts ∧ P.productPreservingFunctors

theorem lawvere_theory_structure_closed_from_evidence
    (P : LawvereTheoryStructurePackage)
    (E : LawvereTheoryStructureEvidence P) : LawvereTheoryStructureClosed P := by
  exact And.intro E.finiteProductsClosed E.productPreservingFunctorsClosed

end CategoryTheoryLawvereTheoriesCanonicalLaneLean
end HautevilleHouse
