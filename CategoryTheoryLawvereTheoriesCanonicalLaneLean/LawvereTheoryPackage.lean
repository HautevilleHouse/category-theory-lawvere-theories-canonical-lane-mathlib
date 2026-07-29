import canonicalLaneMathlib.AdmissibleClass
open HautevilleHouse.CategoryTheoryLawvereTheoriesCanonicalLaneLean

/-!
# Lawvere Theory Package
-/

namespace HautevilleHouse
namespace CategoryTheoryLawvereTheoriesCanonicalLaneLean

structure LawvereTheoryPackage where
  baseCategory : Type u
  finiteProducts : Prop
  modelsCategory : Type v
  syntacticPresentation : Prop
  modelFunctor : modelsCategory → Set (baseCategory → Type w)

structure LawvereTheoryEvidence (L : LawvereTheoryPackage) where
  finiteProductsClosed : L.finiteProducts
  syntacticPresentationClosed : L.syntacticPresentation
  modelFunctorClosed : ∀ M : L.modelsCategory, L.modelFunctor M ≠ ∅

def LawvereTheoryClosed (L : LawvereTheoryPackage) : Prop :=
  L.finiteProducts ∧ L.syntacticPresentation ∧
  (∀ M : L.modelsCategory, L.modelFunctor M ≠ ∅)

theorem lawvere_theory_closed_from_evidence (L : LawvereTheoryPackage)
    (E : LawvereTheoryEvidence L) : LawvereTheoryClosed L := by
  exact And.intro E.finiteProductsClosed
    (And.intro E.syntacticPresentationClosed E.modelFunctorClosed)

end CategoryTheoryLawvereTheoriesCanonicalLaneLean
end HautevilleHouse
