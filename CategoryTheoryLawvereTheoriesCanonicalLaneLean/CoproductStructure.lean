import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.CategoryTheoryLawvereTheoriesCanonicalLaneLean.LawvereTheorySyntax

namespace HautevilleHouse
namespace CategoryTheoryLawvereTheoriesCanonicalLaneLean

structure CoproductStructure (S : LawvereTheorySignature) where
  coproductObjects : S.objectTypes -> S.objectTypes -> S.objectTypes
  injectionMorphisms : (A B : S.objectTypes) -> S.morphismTypes
  coPairingMorphism : (A B C : S.objectTypes) -> S.morphismTypes -> S.morphismTypes -> S.morphismTypes
  coproductUniversalProperty : Prop
  coproductDiagramsCommute : Prop
  coproductUniversalPropertyTerm : coproductUniversalProperty
  coproductDiagramsCommuteTerm : coproductDiagramsCommute

structure CoproductStructureEvidence (S : LawvereTheorySignature)
    (C : CoproductStructure S) where
  coproductUniversalPropertyClosed : C.coproductUniversalProperty
  coproductDiagramsCommuteClosed : C.coproductDiagramsCommute

def CoproductStructureClosed (S : LawvereTheorySignature)
    (C : CoproductStructure S) : Prop :=
  C.coproductUniversalProperty ∧ C.coproductDiagramsCommute

theorem coproduct_structure_closed_from_evidence
    (S : LawvereTheorySignature) (C : CoproductStructure S)
    (E : CoproductStructureEvidence S C) : CoproductStructureClosed S C := by
  exact And.intro E.coproductUniversalPropertyClosed E.coproductDiagramsCommuteClosed

end CategoryTheoryLawvereTheoriesCanonicalLaneLean
end HautevilleHouse