import canonicalLaneMathlib.AdmissibleClass
import canonicalLaneMathlib.MathlibObjects
import Mathlib.CategoryTheory.Yoneda

namespace HautevilleHouse
namespace CategoryTheoryLawvereTheoriesCanonicalLaneLean

open CategoryTheory

structure YonedaLemmaPackage where
  theory : LawvereTheory
  object : theory.category
  functor : theory.category ⥤ Type u
  yonedaNaturality : (yonedaPairing theory.category).obj (object, functor) ≅
    (functor.obj object)
  isIso : IsIso yonedaNaturality

structure YonedaLemmaEvidence (P : YonedaLemmaPackage) where
  yonedaNaturalityClosed : P.yonedaNaturality
  isIsoClosed : P.isIso

def YonedaLemmaClosed (P : YonedaLemmaPackage) : Prop :=
  P.yonedaNaturality ∧ P.isIso

theorem yoneda_lemma_closed_from_evidence
    (P : YonedaLemmaPackage) (E : YonedaLemmaEvidence P) :
    YonedaLemmaClosed P := by
  exact And.intro E.yonedaNaturalityClosed E.isIsoClosed

end CategoryTheoryLawvereTheoriesCanonicalLaneLean
end HautevilleHouse