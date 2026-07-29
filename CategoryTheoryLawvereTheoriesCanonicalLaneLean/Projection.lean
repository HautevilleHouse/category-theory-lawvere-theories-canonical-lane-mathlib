import HautevilleHouse.CategoryTheoryLawvereTheoriesCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryLawvereTheoriesCanonicalLaneLean

open HautevilleHouse.CanonicalLaneMathlibCore

def lawvereProjection : Projection LawvereEndgameState := {
  toFun := fun x => x,
  idempotent := by intro x; rfl
}

theorem lawvere_projection_idempotent (x : LawvereEndgameState) :
    lawvereProjection.toFun (lawvereProjection.toFun x) = lawvereProjection.toFun x := by
  exact lawvereProjection.idempotent x

end CategoryTheoryLawvereTheoriesCanonicalLaneLean
end HautevilleHouse
