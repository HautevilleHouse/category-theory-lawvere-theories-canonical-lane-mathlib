import canonicalLaneMathlib.AdmissibleClass
open HautevilleHouse.CategoryTheoryLawvereTheoriesCanonicalLaneLean

/-!
# Yoneda Lemma Package
-/

namespace HautevilleHouse
namespace CategoryTheoryLawvereTheoriesCanonicalLaneLean

structure YonedaLemmaPackage (C : Type u) [CategoryStruct.{v} C] where
  yonedaEmbedding : C → (Cᵒᵖ → Type v)
  fullyFaithful : Prop
  naturalIso : ∀ (X : C) (F : Cᵒᵖ → Type v),
    (yonedaEmbedding X ⟹ F) ≃ F.obj (Opposite.op X)

structure YonedaLemmaEvidence {C : Type u} [CategoryStruct.{v} C]
    (Y : YonedaLemmaPackage C) where
  fullyFaithfulClosed : Y.fullyFaithful
  naturalIsoClosed : ∀ (X : C) (F : Cᵒᵖ → Type v),
    (Y.yonedaEmbedding X ⟹ F) ≃ F.obj (Opposite.op X)

def YonedaLemmaClosed {C : Type u} [CategoryStruct.{v} C]
    (Y : YonedaLemmaPackage C) : Prop :=
  Y.fullyFaithful ∧
  (∀ (X : C) (F : Cᵒᵖ → Type v), (Y.yonedaEmbedding X ⟹ F) ≃ F.obj (Opposite.op X))

theorem yoneda_lemma_closed_from_evidence {C : Type u} [CategoryStruct.{v} C]
    (Y : YonedaLemmaPackage C) (E : YonedaLemmaEvidence Y) :
    YonedaLemmaClosed Y := by
  exact And.intro E.fullyFaithfulClosed E.naturalIsoClosed

end CategoryTheoryLawvereTheoriesCanonicalLaneLean
end HautevilleHouse
