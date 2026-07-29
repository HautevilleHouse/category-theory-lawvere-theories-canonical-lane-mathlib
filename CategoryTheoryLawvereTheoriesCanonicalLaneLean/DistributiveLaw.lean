import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.CategoryTheoryLawvereTheoriesCanonicalLaneLean.LawvereTheorySyntax
import HautevilleHouse.CategoryTheoryLawvereTheoriesCanonicalLaneLean.ProductStructure
import HautevilleHouse.CategoryTheoryLawvereTheoriesCanonicalLaneLean.CoproductStructure

namespace HautevilleHouse
namespace CategoryTheoryLawvereTheoriesCanonicalLaneLean

structure DistributiveLaw (S : LawvereTheorySignature)
    (P : ProductStructure S) (C : CoproductStructure S) where
  distributivityIso : (A B Cobj : S.objectTypes) -> S.morphismTypes
  distributivityCommutative : Prop
  distributivityNatural : Prop
  distributivityCommutativeTerm : distributivityCommutative
  distributivityNaturalTerm : distributivityNatural

structure DistributiveLawEvidence (S : LawvereTheorySignature)
    (P : ProductStructure S) (C : CoproductStructure S)
    (D : DistributiveLaw S P C) where
  distributivityCommutativeClosed : D.distributivityCommutative
  distributivityNaturalClosed : D.distributivityNatural

def DistributiveLawClosed (S : LawvereTheorySignature)
    (P : ProductStructure S) (C : CoproductStructure S)
    (D : DistributiveLaw S P C) : Prop :=
  D.distributivityCommutative ∧ D.distributivityNatural

theorem distributive_law_closed_from_evidence
    (S : LawvereTheorySignature) (P : ProductStructure S)
    (C : CoproductStructure S) (D : DistributiveLaw S P C)
    (E : DistributiveLawEvidence S P C D) : DistributiveLawClosed S P C D := by
  exact And.intro E.distributivityCommutativeClosed E.distributivityNaturalClosed

end CategoryTheoryLawvereTheoriesCanonicalLaneLean
end HautevilleHouse