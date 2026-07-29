import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryLawvereTheoriesCanonicalLaneLean

structure AdmissibleClass where
  object : LawvereAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  LawvereWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end CategoryTheoryLawvereTheoriesCanonicalLaneLean
end HautevilleHouse