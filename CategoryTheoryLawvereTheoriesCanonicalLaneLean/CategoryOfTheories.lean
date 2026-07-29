import HautevilleHouse.CategoryTheoryLawvereTheoriesCanonicalLaneLean.LawvereTheory

namespace HautevilleHouse
namespace CategoryTheoryLawvereTheoriesCanonicalLaneLean

structure CategoryOfTheories where
  carrier : Type u
  [cat : CategoryTheory.Category.{v} carrier]
  objects : carrier → LawvereTheory
  morphisms : ∀ (A B : carrier), (objects A) ⟶ (objects B)

structure CategoryOfTheoriesEvidence (C : CategoryOfTheories) where
  carrierCategoryClosed : CategoryTheory.Category.{v} C.carrier
  objectLawvereTheoryClosed : ∀ X : C.carrier, LawvereTheoryClosed (C.objects X)

def CategoryOfTheoriesClosed (C : CategoryOfTheories) : Prop :=
  CategoryTheory.Category.{v} C.carrier ∧
  (∀ X : C.carrier, LawvereTheoryClosed (C.objects X))

theorem category_of_theories_closed_from_evidence (C : CategoryOfTheories) (E : CategoryOfTheoriesEvidence C) :
    CategoryOfTheoriesClosed C := by
  exact And.intro E.carrierCategoryClosed E.objectLawvereTheoryClosed

end CategoryTheoryLawvereTheoriesCanonicalLaneLean
end HautevilleHouse