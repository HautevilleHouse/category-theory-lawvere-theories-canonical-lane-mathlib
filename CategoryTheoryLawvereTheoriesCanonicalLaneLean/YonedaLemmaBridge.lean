import HautevilleHouse.CategoryTheoryLawvereTheoriesCanonicalLaneLean.BridgeLemmas

namespace HautevilleHouse
namespace CategoryTheoryLawvereTheoriesCanonicalLaneLean

structure YonedaLemmaPackage where
  category : Type u
  [cat : Category category]
  functorCategory : Type v
  representableFunctors : category ⥤ functorCategory
  yonedaEmbedding : FullyFaithful representableFunctors
  naturalIsomorphisms : Set (representableFunctors ⟶ representableFunctors)
  bridgeCondition : Prop

structure YonedaLemmaEvidence (Y : YonedaLemmaPackage) where
  yonedaEmbeddingClosed : Y.yonedaEmbedding
  naturalIsomorphismsClosed : Y.naturalIsomorphisms.Nonempty
  bridgeConditionClosed : Y.bridgeCondition

def YonedaLemmaClosed (Y : YonedaLemmaPackage) : Prop :=
  Y.yonedaEmbedding ∧ Y.naturalIsomorphisms.Nonempty ∧ Y.bridgeCondition

theorem yoneda_lemma_closed_from_evidence (Y : YonedaLemmaPackage) (E : YonedaLemmaEvidence Y) :
    YonedaLemmaClosed Y := by
  exact And.intro E.yonedaEmbeddingClosed (And.intro E.naturalIsomorphismsClosed E.bridgeConditionClosed)

theorem yoneda_lemma_bridge_provides (Y : YonedaLemmaPackage) (E : YonedaLemmaEvidence Y) (A : AdmissibleClass) :
    bridgeClosed A := by
  exact bridge_from_admissible_class A

end CategoryTheoryLawvereTheoriesCanonicalLaneLean
end HautevilleHouse
