import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.CategoryTheoryLawvereTheoriesCanonicalLaneLean.LawvereTheory

namespace HautevilleHouse
namespace CategoryTheoryLawvereTheoriesCanonicalLaneLean

structure SyntacticPresentation (L : LawvereTheory) where
  signature : Type u
  equations : List (signature → L.category.obj)
  presentationClosed : Prop
  presentationClosedTerm : presentationClosed

def SyntacticPresentationClosed (L : LawvereTheory) (P : SyntacticPresentation L) : Prop :=
  P.presentationClosed

theorem syntactic_presentation_closed_from_evidence (L : LawvereTheory) (P : SyntacticPresentation L) (E : P.presentationClosed) : SyntacticPresentationClosed L P :=
  E

end CategoryTheoryLawvereTheoriesCanonicalLaneLean
end HautevilleHouse