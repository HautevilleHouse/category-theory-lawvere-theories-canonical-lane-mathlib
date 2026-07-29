import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.CategoryTheoryLawvereTheoriesCanonicalLaneLean.BridgeLemmas
import HautevilleHouse.CategoryTheoryLawvereTheoriesCanonicalLaneLean.GateLemmas

namespace HautevilleHouse
namespace CategoryTheoryLawvereTheoriesCanonicalLaneLean

def ConstrainedLawvereTheoryClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_lawvere_theory_endgame (A : AdmissibleClass) :
    ConstrainedLawvereTheoryClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end HautevilleHouse
end CategoryTheoryLawvereTheoriesCanonicalLaneLean