import HautevilleHouse.CategoryTheoryLawvereTheoriesCanonicalLaneLean.LawvereTheoryPackage

namespace HautevilleHouse
namespace CategoryTheoryLawvereTheoriesCanonicalLaneLean

structure ModelPackage (L : LawvereTheory) where
  carrier : Type u
  interpret : (o : L.objects) → carrier
  act : {a b : L.objects} → L.morphisms a b → (carrier → carrier)
  identityPreserved : ∀ (o : L.objects), act (L.identity o) = id
  compositionPreserved : ∀ {a b c : L.objects} (f : L.morphisms b c) (g : L.morphisms a b),
    act (L.compose f g) = act f ∘ act g
  productPreserved : L.finiteProducts → Prop
  productPreservedTerm : productPreserved (by exact L.finiteProductsTerm)

structure ModelEvidence (L : LawvereTheory) (M : ModelPackage L) where
  productPreservedClosed : M.productPreserved

def ModelClosed (L : LawvereTheory) (M : ModelPackage L) : Prop :=
  M.productPreserved

theorem model_closed_from_evidence (L : LawvereTheory) (M : ModelPackage L) (E : ModelEvidence L M) :
    ModelClosed L M := by
  exact E.productPreservedClosed

end CategoryTheoryLawvereTheoriesCanonicalLaneLean
end HautevilleHouse
