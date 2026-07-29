import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.CategoryTheoryLawvereTheoriesCanonicalLaneLean.LawvereTheorySyntax

namespace HautevilleHouse
namespace CategoryTheoryLawvereTheoriesCanonicalLaneLean

structure ExponentialStructure (S : LawvereTheorySignature) where
  exponentialObjects : S.objectTypes -> S.objectTypes -> S.objectTypes
  evaluationMorphism : (A B : S.objectTypes) -> S.morphismTypes
  curryingMorphism : (A B C : S.objectTypes) -> S.morphismTypes -> S.morphismTypes
  exponentialUniversalProperty : Prop
  betaReduction : Prop
  etaExpansion : Prop
  exponentialUniversalPropertyTerm : exponentialUniversalProperty
  betaReductionTerm : betaReduction
  etaExpansionTerm : etaExpansion

structure ExponentialStructureEvidence (S : LawvereTheorySignature)
    (E : ExponentialStructure S) where
  exponentialUniversalPropertyClosed : E.exponentialUniversalProperty
  betaReductionClosed : E.betaReduction
  etaExpansionClosed : E.etaExpansion

def ExponentialStructureClosed (S : LawvereTheorySignature)
    (E : ExponentialStructure S) : Prop :=
  E.exponentialUniversalProperty ∧ E.betaReduction ∧ E.etaExpansion

theorem exponential_structure_closed_from_evidence
    (S : LawvereTheorySignature) (E : ExponentialStructure S)
    (Ev : ExponentialStructureEvidence S E) : ExponentialStructureClosed S E := by
  exact And.intro Ev.exponentialUniversalPropertyClosed
    (And.intro Ev.betaReductionClosed Ev.etaExpansionClosed)

end CategoryTheoryLawvereTheoriesCanonicalLaneLean
end HautevilleHouse