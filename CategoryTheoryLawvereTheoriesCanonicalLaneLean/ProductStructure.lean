import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.CategoryTheoryLawvereTheoriesCanonicalLaneLean.LawvereTheorySyntax

namespace HautevilleHouse
namespace CategoryTheoryLawvereTheoriesCanonicalLaneLean

structure ProductStructure (S : LawvereTheorySignature) where
  productObjects : S.objectTypes -> S.objectTypes -> S.objectTypes
  projectionMorphisms : (A B : S.objectTypes) -> S.morphismTypes
  pairingMorphism : (A B C : S.objectTypes) -> S.morphismTypes -> S.morphismTypes -> S.morphismTypes
  productUniversalProperty : Prop
  productDiagramsCommute : Prop
  productUniversalPropertyTerm : productUniversalProperty
  productDiagramsCommuteTerm : productDiagramsCommute

structure ProductStructureEvidence (S : LawvereTheorySignature)
    (P : ProductStructure S) where
  productUniversalPropertyClosed : P.productUniversalProperty
  productDiagramsCommuteClosed : P.productDiagramsCommute

def ProductStructureClosed (S : LawvereTheorySignature)
    (P : ProductStructure S) : Prop :=
  P.productUniversalProperty ∧ P.productDiagramsCommute

theorem product_structure_closed_from_evidence
    (S : LawvereTheorySignature) (P : ProductStructure S)
    (E : ProductStructureEvidence S P) : ProductStructureClosed S P := by
  exact And.intro E.productUniversalPropertyClosed E.productDiagramsCommuteClosed

end CategoryTheoryLawvereTheoriesCanonicalLaneLean
end HautevilleHouse