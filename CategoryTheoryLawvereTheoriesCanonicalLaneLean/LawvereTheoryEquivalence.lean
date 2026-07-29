import canonicalLaneMathlib.AdmissibleClass
import canonicalLaneMathlib.MathlibObjects
import Mathlib.CategoryTheory.Adjunction.Basic

namespace HautevilleHouse
namespace CategoryTheoryLawvereTheoriesCanonicalLaneLean

open CategoryTheory

structure LawvereTheoryEquivalencePackage where
  sourceTheory : LawvereTheory
  targetTheory : LawvereTheory
  forwardMorphism : LawvereTheoryMorphism sourceTheory targetTheory
  backwardMorphism : LawvereTheoryMorphism targetTheory sourceTheory
  adjunction : Adjunction forwardMorphism backwardMorphism
  naturalIsomorphisms : (forwardMorphism ⋙ backwardMorphism) ≅ 𝟭 sourceTheory.category ∧
    (backwardMorphism ⋙ forwardMorphism) ≅ 𝟭 targetTheory.category

structure LawvereTheoryEquivalenceEvidence (P : LawvereTheoryEquivalencePackage) where
  adjunctionClosed : P.adjunction
  naturalIsomorphismsClosed : P.naturalIsomorphisms

def LawvereTheoryEquivalenceClosed (P : LawvereTheoryEquivalencePackage) : Prop :=
  P.adjunction ∧ P.naturalIsomorphisms

theorem lawvere_theory_equivalence_closed_from_evidence
    (P : LawvereTheoryEquivalencePackage) (E : LawvereTheoryEquivalenceEvidence P) :
    LawvereTheoryEquivalenceClosed P := by
  exact And.intro E.adjunctionClosed E.naturalIsomorphismsClosed

end CategoryTheoryLawvereTheoriesCanonicalLaneLean
end HautevilleHouse