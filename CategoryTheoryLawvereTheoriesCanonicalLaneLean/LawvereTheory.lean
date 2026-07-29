import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryLawvereTheoriesCanonicalLaneLean

structure LawvereTheoryPackage where
  baseCategory : Type u
  finiteProducts : Prop
  theoryMorphism : Type v
  modelsInCategory : Type w
  completenessTheorem : Prop

structure LawvereTheoryEvidence (L : LawvereTheoryPackage) where
  finiteProductsClosed : L.finiteProducts
  completenessTheoremClosed : L.completenessTheorem

def LawvereTheoryClosed (L : LawvereTheoryPackage) : Prop :=
  L.finiteProducts ∧ L.completenessTheorem

theorem lawvere_theory_closed_from_evidence (L : LawvereTheoryPackage) (E : LawvereTheoryEvidence L) :
    LawvereTheoryClosed L := by
  exact And.intro E.finiteProductsClosed E.completenessTheoremClosed

structure ModelPackage (L : LawvereTheoryPackage) where
  underlyingCategory : Type u
  productPreservingFunctor : Prop
  modelCategoryFiniteLimits : Prop

def ModelClosed (M : ModelPackage L) : Prop :=
  M.productPreservingFunctor ∧ M.modelCategoryFiniteLimits

end CategoryTheoryLawvereTheoriesCanonicalLaneLean
end HautevilleHouse
