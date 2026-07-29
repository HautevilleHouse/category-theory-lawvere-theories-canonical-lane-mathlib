import categoricalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryLawvereTheoriesCanonicalLaneLean

structure LimitColimitPackage where
  diagramShape : Type u
  limitExists : Prop
  colimitExists : Prop
  universalProperties : Prop

structure LimitColimitEvidence (P : LimitColimitPackage) where
  limitExistsClosed : P.limitExists
  colimitExistsClosed : P.colimitExists
  universalPropertiesClosed : P.universalProperties

def LimitColimitClosed (P : LimitColimitPackage) : Prop :=
  P.limitExists ∧ P.colimitExists ∧ P.universalProperties

theorem limit_colimit_closed_from_evidence (P : LimitColimitPackage)
    (E : LimitColimitEvidence P) : LimitColimitClosed P := by
  exact And.intro E.limitExistsClosed
    (And.intro E.colimitExistsClosed E.universalPropertiesClosed)

end CategoryTheoryLawvereTheoriesCanonicalLaneLean
end HautevilleHouse
