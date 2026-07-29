import HautevilleHouse.CategoryTheoryLawvereTheoriesCanonicalLaneLean.CategoryOfTheories

namespace HautevilleHouse
namespace CategoryTheoryLawvereTheoriesCanonicalLaneLean

structure LimitClosurePackage {C : CategoryOfTheories} (D : CategoryTheory.Diagram C) where
  limitExists : CategoryTheory.Limits.HasLimit D
  limitIsLawvereTheory : LawvereTheoryClosed (CategoryTheory.Limits.limit D)

structure LimitClosureEvidence {C : CategoryOfTheories} {D : CategoryTheory.Diagram C} (L : LimitClosurePackage D) where
  limitExistsClosed : L.limitExists
  limitIsLawvereTheoryClosed : L.limitIsLawvereTheory

def LimitClosureClosed {C : CategoryOfTheories} {D : CategoryTheory.Diagram C} (L : LimitClosurePackage D) : Prop :=
  L.limitExists ∧ L.limitIsLawvereTheory

theorem limit_closure_closed_from_evidence {C : CategoryOfTheories} {D : CategoryTheory.Diagram C} (L : LimitClosurePackage D) (E : LimitClosureEvidence L) :
    LimitClosureClosed L := by
  exact And.intro E.limitExistsClosed E.limitIsLawvereTheoryClosed

end CategoryTheoryLawvereTheoriesCanonicalLaneLean
end HautevilleHouse